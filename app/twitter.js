var Twitter = require("twit");
var coin = require("node-altcoin"); // TODO: user our
var yaml = require("js-yaml");
var winston = require("winston");
var fs = require("fs");

// check if the config file exists
if (!fs.existsSync("./twitter.yml")) {
    winston.error("Configuration file doesn't exist! Please read the README.md file first.");
    process.exit(1);
}

// load settings
var settings = yaml.load(fs.readFileSync("./twitter.yml", "utf-8"));

// load winston's cli defaults
winston.cli();

// write logs to file
if (settings.log.file) {
    winston.add(winston.transports.File, {
        filename: settings.log.file,
        level: settings.log.level
    });
}

// connect to coin daemon
winston.info("Connecting to " + settings.coin.full_name + "d...");
var coin = coin({
    host: settings.rpc.host,
    port: settings.rpc.port,
    private_key: settings.rpc.private_key
});
coin.getBalance(function(err, balance) {
    if (err) {
        winston.error("Could not connect to %s RPC API! ", settings.coin.full_name, err);
        process.exit(1);
        return;
    }
    var balance = typeof(balance) == "object" ? balance.result : balance;
    winston.info("Connected to JSON RPC API. Current total balance is %d " + settings.coin.short_name, balance);
});

// connect to twitter
var client = new Twitter({
    consumer_key: settings.twitter.consumer_key,
    consumer_secret: settings.twitter.consumer_secret,
    access_token: settings.twitter.access_token,
    access_token_secret: settings.twitter.access_token_secret
});

// tipbot
var stream = client.stream("statuses/filter", {track: ["@" + settings.twitter.username]})
stream.on("tweet", function(tweet) {
    from = tweet.user.screen_name;
    from = from.toLowerCase();
    var message = tweet.text;
    // if message is from username ignore
    if (from == settings.twtter.username.toLowerCase())
        return;
    var random = Math.random().toFixed(2);
    if(message.indexOf(settings.twtter.username + " ") != -1){
        var message = message.substr(message.indexOf(settings.twtter.username + " ") + 13);
    }
    if(message.indexOf(settings.twtter.username.toLowerCase() + " ") != -1){
        var message = message.substr(message.indexOf(settings.twtter.username.toLowerCase() + " ") + 13);
    }
    var match = message.match(/^(!)(\S+)/);
    if (match === null) return;
    var prefix = match[1];
    var command = match[2];
    tweetid = tweet.id_str;
    winston.info("New Tweet from " + from + " with TweetId: "+ tweetid)
    // if command doesnt match return
    if (!settings.commands[command]) {
        client.post("statuses/update", {
            status: "@" + from + " I'm sorry, I don't recognize that command (R+=" + random + ")",
            in_reply_to_status_id: tweetid
        },  function(error, tweet, response){
            winston.info("sending reply to @" + from + " from tweet id " + tweetid);
        });
        return;
    }

    //commands
    switch (command) {
        case "balance":
            coin.getBalance(from, 3, function(err, balance) {
                if (err) {
                    client.post("statuses/update", {
                        status: "Could not get balance for @" + from + " (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.error("Error in !balance command", err);
                        return;
                    });
                }
                var balance = typeof(balance) == "object" ? balance.result : balance;
                winston.info(from + "'s Balance is " + balance);

                coin.getBalance(from, 0, function(err, unconfirmed_balance) {
                    if (err) {
                        client.post("statuses/update", {
                            status: "Could not get balance for @" + from + " (R+=" + random + ")",
                            in_reply_to_status_id: tweetid
                        },  function(error, tweet, response){
                            winston.error("Error in !balance command", err);
                            return;
                        });
                    }
                    var unconfirmed_balance = typeof(unconfirmed_balance) == "object" ? unconfirmed_balance.result : unconfirmed_balance - balance;
                    client.post("statuses/update", {
                        status: "@" + from + ", Your current balance  is " + balance + " $" + settings.coin.short_name + ". ( Unconfirmed: " + unconfirmed_balance + " ) (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        return;
                    });
                });
            });
            break;

        case "address":
            winston.debug("Requesting address for %s", from);
            coin.send("getaccountaddress", from, function(err, address) {
                if (err) {
                    client.post("statuses/update", {
                        status: "@" + from + " I'm sorry, something went wrong while getting the address. (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.error("Something went wrong while getting " + from + "'s address.", err);
                        return;
                    });
                }

                client.post("statuses/update", {
                    status: "@" + from + ", Your deposit address is " + address + " (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    winston.info("Sending address to "+from);
                    return;
                });
            });
            break;

        case "tip":
            var match = message.match(/^.?tip (\S+) ([\d\.]+)/);
            if (match === null || match.length < 3) {
                client.post("statuses/update", {
                    status: "Usage: !tip <nickname> <amount> @" + settings.twitter.username + " (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    return;
                });
            }
            var to = match[1];
            to = to.toLowerCase().replace("@","");
            var amount = Number(match[2]);
            winston.info("from: " + from + " to: " + to + " amount: " + amount.toFixed(8));

            // check amount being sent is valid
            if (!amount || amount == 0 || amount == null) {
                client.post("statuses/update", {
                    status: "@" + from + ", " + amount.toFixed(8) + " is an invalid amount (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    winston.warn(from + " tried to send an invalid amount ");
                    return;
                });
            }

            // check the user isn't sending to themselves.
            if (to.toLowerCase() == from.toLowerCase()) {
                client.post("statuses/update", {
                    status: "@" + from + " I'm sorry, You cant tip yourself ! (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    winston.warn(from + " tried to send to themselves.");
                    return;
                });
            }

            // check amount is larger than minimum tip amount
            if (amount < settings.coin.min_tip) {
                client.post("statuses/update", {
                    status: "@" + from + " I'm sorry, your tip to @" + to + " (" + amount.toFixed(8) + " $" + settings.coin.short_name + ") is too small (min. 0.1 " + settings.coin.short_name + ") (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    winston.warn(from + " tried to send too small of a tip.");
                    return;
                });
            }

            // check balance with min. 5 confirmations
            coin.getBalance(from.toLowerCase(), 3, function(err, balance) {
                if (err) {
                    client.post("statuses/update", {
                        status: "Could not get balance for @" + from + " (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.error("Error while checking balance for " + from, err);
                        return;
                    });
                }
                var balance = typeof(balance) == "object" ? balance.result : balance;

                if (balance >= amount) {
                    coin.send("move", from, to, amount, function(err, reply) {
                        if (err || !reply) {
                            client.post("statuses/update", {
                                status: "Could not move coins from @" + from + " to @" + to + " (R+=" + random + ")",
                                in_reply_to_status_id: tweetid
                            },  function(error, tweet, response){
                                winston.error("Error while moving coins from " + from + " to " + to, err);
                                return;
                            });
                        }

                        client.post("statuses/update", {
                            status: "@" + from + " tipped @" + to + " " + amount.toFixed(8) + " $" + settings.coin.short_name + " Tweet @" + settings.twitter.username + " !help to claim your tip ! (R+=" + random + ")",
                            in_reply_to_status_id: tweetid
                        },  function(error, tweet, response){
                            winston.info("%s tipped %s %d %s", from.toLowerCase(), to.toLowerCase(), amount.toFixed(8), settings.coin.short_name);
                        });
                    });
                } else {
                    var short = amount - balance;
                    client.post("statuses/update", {
                        status: "@" + from + "I'm sorry, you dont have enough funds (you are short " + short.toFixed(8) + " $" + settings.coin.short_name + ") (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.error("%s tried to tip %s %d, but has only %d", from, to, amount.toFixed(8), balance);
                        return;
                    });
                }
            });
            break;
        case "withdraw":
            var match = message.match(/^.?withdraw (\S+)$/);
            if (match === null) {
                client.post("statuses/update", {
                    status: "@" + from + " Usage: <@" + settings.twitter.username + " !withdraw [" + settings.coin.full_name + " address]> (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    return;
                });
            }
            var address = match[1];

            coin.validateAddress(address, function(err, reply) {
                if (err) {
                    client.post("statuses/update", {
                        status: "@" + from + " I'm sorry, something went wrong with the address validation. (R+=" + random +  ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.error("Error in !withdraw command", err);
                        return;
                    });
                }

                if (reply.isvalid) {
                    coin.getBalance(from.toLowerCase(), settings.coin.min_confirmations, function(err, balance) {
                        if (err) {
                            client.post("statuses/update", {
                                status: "@" + from + ", I'm sorry I could not get your balance (R+=" + random + ")",
                                in_reply_to_status_id: tweetid
                            },  function(error, tweet, response){
                                return;
                            });
                        }
                        var balance = typeof(balance) == "object" ? balance.result : balance;
                        var short = 5 - balance ;
                        var fee = balance - settings.coin.withdrawal_fee
                        if (balance < settings.coin.min_withdraw) {
                            client.post("statuses/update", {
                                status: "@" + from + " I'm sorry, the minimum withdrawal amount is 5 $" + settings.coin.short_name + " you are short "+short.toFixed(8)+" $" + settings.coin.short_name + " (R+=" + random + ")",
                                in_reply_to_status_id: tweetid
                            },  function(error, tweet, response){
                                winston.warn("%s tried to withdraw %d, but min is set to %d", from, balance, settings.coin.min_withdraw);
                                return;
                            });
                        }

                        coin.sendFrom(from.toLowerCase(), address, fee, function(err, reply) {
                            if (err) {
                                client.post("statuses/update", {
                                    status: "Could not move coins from @" + from + " to " + address + " (R+=" + random + ")",
                                    in_reply_to_status_id: tweetid
                                },  function(error, tweet, response){
                                    winston.error("Error in !withdraw command", err);
                                    return;
                                });
                            }

                            client.post("statuses/update", {
                                status: "@" + from + ": " + fee + " $" + settings.coin.short_name + " has been withdrawn from your account to " + address,
                                in_reply_to_status_id: tweetid
                            },  function(error, tweet, response){
                                winston.info("Sending "+ fee + " " + settings.coin.full_name + " to " + address + " for @" + from);
                            });

                            // transfer the rest (usually withdrawal fee - txfee) to bots wallet
                            coin.getBalance(from.toLowerCase(), function(err, balance) {
                                if (err) {
                                    winston.error("Something went wrong while transferring fees", err);
                                    return;
                                }

                                var balance = typeof(balance) == "object" ? balance.result : balance;
                                // moves the rest to bot's wallet
                                coin.move(from.toLowerCase(), settings.twitter.username.toLowerCase(), balance);
                            });
                        });
                    });
                } else {
                    client.post("statuses/update", {
                        status: "@" + from + " I'm sorry, " + address + " is invalid. (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.warn("%s tried to withdraw to an invalid address", from);
                        return;
                    });
                }
            });
            break;
        case "send":
            var match = message.match(/^.?send (\S+) ([\d\.]+)/);
            if (match === null) {
                client.post("statuses/update", {
                    status: "@" + from + " Usage: <@" + settings.twitter.username + " !send [" + settings.coin.full_name + " address] [Amount]> (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    return;
                });
            }
            var address = match[1];
            var amount = Number(match[2]);
            if (!amount || amount == 0 || amount == null) {
                client.post("statuses/update", {
                    status: "@" + from + ", " + amount + " is an invalid amount (R+=" + random + ")",
                    in_reply_to_status_id: tweetid
                },  function(error, tweet, response){
                    return;
                });
            }

            coin.validateAddress(address, function(err, reply) {
                if (err) {
                    client.post("statuses/update", {
                        status: "@" + from + " I'm sorry, something went wrong with the address validation. (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.error("Error in !send command", err);
                        return;
                    });
                }

                if (reply.isvalid) {
                    coin.getBalance(from.toLowerCase(), settings.coin.min_confirmations, function(err, balance) {
                        if (err) {
                            client.post("statuses/update", {
                                status: "@" + from + ", I'm sorry I could not get your balance (R+=" + random + ")",
                                in_reply_to_status_id: tweetid
                            },  function(error, tweet, response){
                                return;
                            });
                        }
                        var balance = typeof(balance) == "object" ? balance.result : balance;
                        var fee = amount - settings.coin.withdrawal_fee
                        if (balance >= amount + settings.coin.withdrawal_fee) {
                            if (amount > settings.coin.min_withdraw) {
                                coin.sendFrom(from.toLowerCase(), address, fee, function(err, reply) {
                                    if (err) {
                                        client.post("statuses/update", {
                                            status: "Could not move coins from @" + from + " to " + address + " (R+=" + random + ")",
                                            in_reply_to_status_id: tweetid
                                        },  function(error, tweet, response){
                                            winston.error("Error in !send command", err);
                                            return;
                                        });
                                    }

                                    client.post("statuses/update", {
                                        status: "@" + from + ": " + fee + " $" + settings.coin.short_name + " has been sent from your account to " + address,
                                        in_reply_to_status_id: tweetid
                                    },  function(error, tweet, response){
                                        winston.info("Sending " + fee.toFixed(8) + " " + settings.coin.full_name + " to " + address + " for @"  + from);
                                        return;
                                    });

                                    // transfer the withdrawal fee (usually withdrawal fee - txfee) to bots wallet
                                    coin.getBalance(from.toLowerCase(), function(err, balance) {
                                        if (err) {
                                            winston.error("Something went wrong while transferring fees", err);
                                            return;
                                        }
                                        // moves the fee to bot's wallet
                                        coin.move(from.toLowerCase(), "Infernobot", 1);
                                    });
                                });
                            } else {
                                var short = 5 - balance;
                                client.post("statuses/update", {
                                    status: "@"+from+" I'm sorry, the minimum amount is 5 $" + settings.coin.short_name + " you are short "+short.toFixed(8)+" $" + settings.coin.short_name + " (R+="+random+")",
                                    in_reply_to_status_id: tweetid
                                },  function(error, tweet, response){
                                    winston.warn("%s tried to send %d, but min is set to %d", from, balance, settings.coin.min_withdraw);
                                    return;
                                });
                            }
                        } else {
                            var short = amount - balance;
                            client.post("statuses/update", {
                                status: "@" + from + "I'm sorry, you dont have enough funds (you are short " + short.toFixed(8) + " $" + settings.coin.short_name + ") (R+=" + random + ")",
                                in_reply_to_status_id: tweetid
                            },  function(error, tweet, response){
                                winston.warn("%s tried to send %d to %s, but has only %d", from, amount.toFixed(8), to, balance);
                                return;
                            });
                        }
                    });
                } else {
                    client.post("statuses/update", {
                        status: "@" + from + " I'm sorry, " + address + " is invalid. (R+=" + random + ")",
                        in_reply_to_status_id: tweetid
                    },  function(error, tweet, response){
                        winston.warn("%s tried to send to an invalid address", from);
                        return;
                    });
                }
            });
            break;
        case "help":
            client.post("statuses/update", {
                in_reply_to_status_id: tweetid,
                status: "@" + from + " Here is a list of commands: !balance !send !tip !withdraw !address (R+=" + random + ")"
            },  function(error, tweet, response){
                return;
            });
            break;
    }
});
stream.on("error", function(error) {
    winston.error( error );
});
stream.on("connect", function (request) {
    winston.info("Connecting TipBot to Twitter.....");
});
stream.on("connected", function (response) {
    winston.info("Connected TipBot to Twitter.");
});
stream.on("disconnect", function (disconnectMessage) {
    winston.error("Disconnected TipBot from Twitter.\n"+disconnectMessage);
    winston.info("Trying to reconnect.....");
});