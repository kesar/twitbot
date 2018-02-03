#!/bin/bash
echo 'deploying...'
/home/asini/workspace/eos/build_2/tools/eoscpp -o twitbot.wast twitbot.cpp
/home/asini/workspace/eos/build_2/tools/eoscpp -g twitbot.abi twitbot.hpp
eosc set contract twitbot twitbot.wast twitbot.abi
