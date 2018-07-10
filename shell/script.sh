#!/bin/sh
# 判断文件是否存在
if [ ! -f $foobar ]; then
    exit 5
fi
