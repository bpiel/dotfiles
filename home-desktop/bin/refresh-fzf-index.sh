#!/usr/bin/env bash

cd /home/bill/repos/billy-macs/fzf-index
rm *.findex
find /home/bill/ -not -name "*.png" -type f > home.bill.findex
find /etc/ -type f > etc.findex
find /opt/code/ -type f > opt.code.findex
