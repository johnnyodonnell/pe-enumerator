#!/bin/bash

# From PWK pdf (p. 531)
echo "----- Find all writable files  -----"
find /usr -writable -type d 2>/dev/null
echo ""

# From PWK pdf (p. 536)
echo "----- Find all files with setuid flag set -----"
find /usr -perm -u=s -type f 2>/dev/null
echo ""

# Based on setuid search
echo "----- Find all files with setgid flag set -----"
find /usr -perm -g=s -type f 2>/dev/null
echo ""

# From https://github.com/johnnyodonnell/notes-on-oscp-lab-machines/blob/master/10.11.1.217/notes.txt
echo "----- \`sudo -l\` -----"
sudo -l
echo ""

# Based on `sudo -l` search
echo "----- \`sudo -ll\` -----"
sudo -ll
echo ""

