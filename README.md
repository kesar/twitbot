🦉 twitBot
========================

twitBot is a simple bot in node to tip users in twitter. ( https://twitter.com/EosTwitbot )

📌 Getting Started
------------

```bash
$ git clone git@github.com:kesar/twitbot.git
$ cd twitbot/app
$ npm install
```

📌 Configuration
------------

Copy twitter.yml.dist into twitter.yml and change your information.

📌 Contracts
------------

Under folder contracts/ you will find the contracts that the bot is using.


📌 Call examples with cleos
------------

```
cleos get table twitbot twitbot accounts
cleos push action eosio.token transfer '[ "eosio", "twitbot", "0.1000 EOS", "kesarito" ]' -p eosio
cleos push action twitbot tip '{"from_twitter": "kesarito", "to_twitter": "kesarito2", "quantity": 5}' -p twitbot
cleos push action twitbot claim '{"from_twitter": "kesarito", "to_eos": "eosio"}' -p twitbot
cleos push action twitbot withdraw '{"from_twitter": "kesarito", "to_eos": "kesarito"}' -p twitbot
```
