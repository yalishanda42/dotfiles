#!/bin/bash

git checkout master && git pull origin master && rm -rf ${ZSH} && ./INSTALL.sh < <(echo nn)
