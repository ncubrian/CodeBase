#!/bin/bash
function read_dir() {
    username=$1
    file=$2
    while read line
    do
        if [ "$line" != "" ]; then
            head=`echo $line|awk '{print $1}'`
            if [ "$head" == "ssh-rsa" ]; then
                authuser=`echo $line|awk '{print $3}'`
                if [ ! $authuser ]; then
                    authuser='unknown'
                fi
                pubkey=`echo $line|awk '{print $2}'`
                echo $username,$authuser,$pubkey
                else
                    echo $line
                fi
             fi
     done < $file
}

if [ -f .ssh/authorized_keys ]; then
    read_dir "root" ".ssh/authorized_keys"
fi

cd /home
for dir in `ls`
do
    if [ -d $dir ]; then
        if [ -f $dir/.ssh/authorized_keys ]; then
            read_dir "$dir" "$dir/.ssh/authorized_keys"
        fi
    fi
done
