var Twitter = require("twit");
var Eos = require("eosjs");
var yaml = require("js-yaml");
var winston = require("winston");
var fs = require("fs");

if (!fs.existsSync("./twitter.yml")) {
    winston.error("Configuration file doesn't exist! Please read the README.md file first.");
    process.exit(1);
}

var settings = yaml.load(fs.readFileSync("./twitter.yml", "utf-8"));

winston.cli();

if (settings.log.file) {
    winston.add(winston.transports.File, {
        filename: settings.log.file,
        level: settings.log.level
    });
}

node = Eos.Localnet({
    httpEndpoint: 'http://' + settings.rpc.host + ':' + settings.rpc.port,
    keyProvider: settings.rpc.private_key
});

winston.info("Connecting to " + settings.rpc.host + ":" + settings.rpc.port);

node.getAccount(settings.rpc.account).then(function (result) {
    winston.info(result);
});

var client = new Twitter({
    consumer_key: settings.twitter.consumer_key,
    consumer_secret: settings.twitter.consumer_secret,
    access_token: settings.twitter.access_token,
    access_token_secret: settings.twitter.access_token_secret
});

var stream = client.stream("statuses/filter", {track: ["@" + settings.twitter.username]});

stream.on("tweet", function (tweet) {
    var from = tweet.user.screen_name.toLowerCase();
    var message = tweet.text;
    if (from === settings.twitter.username.toLowerCase()) {
        return;
    }
    var random = Math.random().toFixed(2);
    if (message.indexOf(settings.twitter.username + " ") !== -1) {
        message = message.substr(message.indexOf(settings.twitter.username + " ") + 13);
    }
    if (message.indexOf(settings.twitter.username.toLowerCase() + " ") !== -1) {
        message = message.substr(message.indexOf(settings.twitter.username.toLowerCase() + " ") + 13);
    }
    match = message.match(/^(!)(\S+)/);
    if (match === null) return;
    var command = match[2];
    var tweetId = tweet.id_str;
    winston.info("New Tweet from " + from + " with TweetId: " + tweetId + " with command " + command);

    if (!settings.commands[command]) {
        client.post("statuses/update", {
            status: "@" + from + " I'm sorry, I don't recognize that command",
            in_reply_to_status_id: tweetId
        }, function (error, tweet, response) {
            winston.info("sending reply to @" + from + " from tweet id " + tweetId);
        });
        return;
    }

    //commands
    switch (command) {

        case "balance":
            node.getTableRows({
                "json": true,
                "scope": settings.rpc.account,
                "code": settings.rpc.account,
                "table": "account",
                "limit": 500 // TODO: do proper filter
            }).then(function (result) {
                var balance = 0;
                for (var i = 0, len = result.rows.length; i < len; i++) {
                    if (result.rows[i].twitter_account === from) {
                        balance = result.rows[i].balance;
                        break;
                    }
                }

                client.post("statuses/update", {
                    status: "@" + from + " Your current balance is " + balance / 10000 + " EOS",
                    in_reply_to_status_id: tweetId
                }, function (error, tweet, response) {
                    return;
                });
            });
            break;

        case "tip":
            match = message.match(/^.?tip (\S+) ([\d\.]+)/);
            if (match === null || match.length < 3) {
                client.post("statuses/update", {
                    status: "Usage: !tip <nickname> <amount> @" + settings.twitter.username,
                    in_reply_to_status_id: tweetId
                }, function (error, tweet, response) {
                    return;
                });
            }
            var to = match[1];
            to = to.toLowerCase().replace("@", "");
            var amount = Number(match[2]);
            winston.info("from: " + from + " to: " + to + " amount: " + amount.toFixed(8));

            if (!amount || amount === 0 || amount == null) {
                client.post("statuses/update", {
                    status: "@" + from + ", " + amount.toFixed(8) + " is an invalid amount",
                    in_reply_to_status_id: tweetId
                }, function (error, tweet, response) {
                    winston.warn(from + " tried to send an invalid amount ");
                    return;
                });
            }

            if (to.toLowerCase() === from.toLowerCase()) {
                client.post("statuses/update", {
                    status: "@" + from + " I'm sorry, You cant tip yourself!",
                    in_reply_to_status_id: tweetId
                }, function (error, tweet, response) {
                    winston.warn(from + " tried to send to themselves.");
                    return;
                });
            }

            //eosioc push action twitbot tip '{"from_twitter": "inita", "to_twitter": "kesarito", "quantity": 5000}' --permission twitbot@active

            var options = {
                broadcast: true,
                sign: true,
                scope: ['inita', settings.rpc.account],
                messages: [
                    {
                        code: settings.rpc.account,
                        type: 'tip',
                        authorization: [{
                            account: settings.rpc.account,
                            permission: 'active'
                        }],
                        data: {
                            from_twitter: from,
                            to_twitter: to,
                            quantity: amount
                        }
                    }
                ]
            };

            node.contract(settings.rpc.account, options).then(function (result) {
                winston.info(result);
            }).catch(function(error) {
                winston.error(error);
            });
            break;

        case "withdraw":
            var match = message.match(/^.?withdraw (\S+)/);
            if (match === null) {
                client.post("statuses/update", {
                    status: "@" + from + " Usage: !withdraw <your_eos_account> @ " + settings.twitter.username,
                    in_reply_to_status_id: tweetId
                }, function (error, tweet, response) {
                    return;
                });
            }

            // eosioc push action twitbot withdraw '{"to_eos": "inita", "from_twitter": "inita"}' --permission twitbot@active

            var address = match[1];

            var options = {
                broadcast: true,
                sign: true,
                scope: ['inita', settings.rpc.account],
                messages: [
                    {
                        code: settings.rpc.account,
                        type: 'withdraw',
                        authorization: [{
                            account: settings.rpc.account,
                            permission: 'active'
                        }],
                        data: {
                            to_eos: address,
                            from_twitter: from
                        }
                    }
                ]
            };

            node.contract(settings.rpc.account, options).then(function (result) {
                winston.info(result);
            }).catch(function (error) {
                winston.error(error);
            });
            break;

        case "help":
            client.post("statuses/update", {
                in_reply_to_status_id: tweetId,
                status: "@" + from + " Here is a list of commands: !balance !tip !withdraw"
            }, function (error, tweet, response) {
                return;
            });
            break;
    }
});
stream.on("error", function (error) {
    winston.error(error);
});
stream.on("connect", function () {
    winston.info("Connecting TipBot to Twitter.....");
});
stream.on("connected", function () {
    winston.info("Connected TipBot to Twitter.");
});
stream.on("disconnect", function (disconnectMessage) {
    winston.error("Disconnected TipBot from Twitter.\n" + disconnectMessage);
    winston.info("Trying to reconnect.....");
});