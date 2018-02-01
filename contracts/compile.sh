#!/bin/bash
echo 'deploying...'
eoscpp -o twitbot.wast twitbot.cpp
eoscpp -g twitbot.abi twitbot.hpp
eosc set contract twitbot twitbot.wast twitbot.abi
