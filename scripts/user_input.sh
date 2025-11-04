#!/bin/bash

echo "Hello! Waht is your name?"

read name

echo "Nice to meet you, $name!"
echo "What is your favourite linux command?"
read cmd

echo "Cool! Let's see what $cmd does:"

man $cmd | head -n 5

