#!/bin/bash
scp -2 src/cat/s21_cat casper@172.24.116.8:~/
scp -2 src/grep/s21_grep casper@172.24.116.8:~/
ssh casper@172.24.116.8 "echo "123" | mv s21_cat s21_grep /usr/local/bin"
