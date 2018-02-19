twitbot is an open-source node.js Twitter bot for tipping for EOS based in https://github.com/Crowndev/Twitter-Tip

# Instalation
To install twitbot simply clone this repo and install dependencies:
```bash
git clone https://github.com/kesar/twitbot
cd twitbot/app
npm install
```
After installation proceed to the configuration.

## log
Logging settings.
* **file** - file to log to. Set to `false` to disable logging to file.

## rpc
JSON RPC API connection info.
* **host** - Daemon hostname(127.0.0.1 if hosted on the same machine)
* **port** - Daemon RPC port (by default 8888)
* **private_key** - Daemon RPC private key
* **account** - account of the smart contract

## twitter
* **username** - Your twitter username that the bot is running on.
* **consumer_key** - Create an app on twitter to get your keys https://apps.twitter.com/
* **consumer_secret** - Create an app on twitter to get your keys https://apps.twitter.com/
* **access_token** - Create an app on twitter to get your keys https://apps.twitter.com/
* **access_token_secret** - Create an app on twitter to get your keys https://apps.twitter.com/

# How does it work?
Every Twitter username has it's own account in your wallet. When tipping sending or withdrawing, bot checks if user is registered and identified with Twitter. If so, he moves the money from one account to another, or when withdrawing, transfers coins to other wallet.

# How to run it?
To run the bot simply use `node twitter` or `npm start`.

## Commands
Commands are executed by messaging the bot on twitter.

| **Command** | **Arguments**     | **Description**
|-------------|-------------------|--------------------------------------------------------------------
| `balance`   |                      | displays your current wallet balance
| `help`      |                      | displays configured help message (by default similiar to this one)
| `tip`       | `<nick> <amount>`    | sends the specified amount of coins to the specified nickname
| `withdraw`  | `<address>`          | withdraws your whole wallet balance to specified address