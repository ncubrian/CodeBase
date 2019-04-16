#!/bin/bash
# shell
uname -a
stty -a
cat /proc/cpuinfo
cat /proc/version
lsb_release -a #查看系统版本
grep 'struct timespec' /usr/include/*.h #查看数据类型
grep -E 'model|stepping' /proc/cpuinfo | sort -u
ps -ef|grep nmon #查看进程
du -sh ./* # 查看当前目录下所有文件和文件夹大小
df -h # 查看磁盘空间
nohup command > myout.file 2>&1 &
program &> file
lsof -i tcp:8580 # 查看端口被哪个进程占用
lsof -p 507 # 查看某进程使用的端口
TZ="Asia/Shanghai" date "+%Y%m%d%H%M%S" # /usr/share/zoneinfo/Asia/Shanghai
echo 'a,b,c,d' | awk -F',' '{print $3}' # display c

# tar & zip
tar -ztvf file.tar.gz
tar --exclude='foo/bar/logs' --exclude='./upload/nohup.out' -zcv -f ~/foobar.tar.gz foobar
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
tar xvzf openresty-1.11.2.5.tar.gz openresty-1.11.2.5/bundle/nginx-1.11.2 -C openresty-1.11.2.5/bundle/

zip -re filename.zip filename # 回车，输入2次密码
zip -rP passwork filename.zip filename # passwork是要输入的密码
unzip filename.zip # 按提示输入密码
unzip -P passwork filename.zip # passwork是要解压的密码，这个不会有提示输入密码的操作

cut -f2 -d' ' # 取出空格分隔的第二个string
go test -v -run TestLongLoop -timeout 30m # 指定go test执行时间最大为30分钟

export http_proxy=http://localhost:port
export https_proxy=http://localhost:port # Mac终端当前会话使用代理

sudo ntpdate pool.ntp.org # ubuntu手动时间同步
sudo ntpdate -u time.apple.com # Mac手动时间同步
date +%s.%N # seconds.nanoseconds since 1970-01-01 00:00:00 UTC e.g. 1490666011.288909555
at -f foobar.sh 06:05 # 在06:05执行foobar.sh

tcpdump -i eth0 -vnn dst host 192.168.1.135 and dst port 12306 # 监听指定目的IP和端口
tcpdump -i eth0 -vnnAtttt 'tcp[tcpflags] & (tcp-push) != 0 and dst host 127.0.0.1 and dst port 8080' # 监听发到本地8080端口的tcp push包
tcpdump -i eth0 -vvvs 1024 -l -A src host localhost dst port 8080 # 抓HTTP包

# 将1024以下端口的绑定权限赋给nginx应用即可
sudo  setcap cap_net_bind_service=ep /opt/nginx/sbin/nginx
sudo adduser nginx # 用useradd创建用户会导致/etc/passwd里面没有配置用户的shell
hostname -b MONGO1 # 设置主机名
nc -z host port # 检查网络是否连通

# vi
:%!xxd	   #查看HEX
:%!xxd -r  #reverse上面的操作
d3w        #删除到第三个单词的结尾位置
d0         #删至行首
d$         #删至行尾
D          #删除到某一行的结尾
:%s/localhost/127.0.0.1/g # localhost全部替换为127.0.0.1

rpm -qi glibc #查看glibc库的信息
yum -y update glibc
yum install glibc
yum install man-pages
readelf -h(d / a) filename.so #查看.so文件头信息
ln -sf libncurses.so.5 /usr/lib/libtinfo.so.5
ldd /opt/android-sdk-linux_x86/platform-tools/adb #查看运行adb需要哪些库
find /usr -name 'jni.h' -print #在指定目录查找文件
getconf LONG_BIT
hostname -F /etc/hostname #修改hostname命令显示的内容
pwdx # report current working directory of a process
echo -e '\033[01;31mfoobar\033[0m' # 显示红色foobar
alias ll="ls -l"
sed -i 's/enabled=[0,1]/enabled=1/g' /etc/yum.repos.d/CentOS-Debuginfo.repo
sed -i "s/oldString/newString/g" `grep oldString -rl /path` # 批量替换/path下含oldString的所有文件
sed -n '100,200p' filename # 查看文件的第100行到第200行
cat /etc/passwd|head -n 5|cut -d : -f 1
sed -n '/START./,/STOPPING THREADS/p' t50And500thread.txt | cut -f 1 -d '('
sed -n '/START./,/STOPPING THREADS/p' t50And500thread.txt | cut -d '(' -f -2 | sed 's/\(\,.*\,\)/\,/g'
sed -n '/START./,/STOPPING THREADS/p' t50And500thread.txt | cut -d '(' -f -5 | sed -e 's/([^,]*,/,/g' -e 's/[A-Z\.]//g'
sed -n -e 's/[a-zA-Z0-9]*.png/..\/Resources\/&/g' -e 'w temp.json' Ui_1.json
grep -o -w 'body:\[\w\{24\}\]' alipay.err # 输出一行中的body:[0-9a-zA-Z]
sed -n 's/\(.*",\)\("foobar":"[0-9]*[0-9]"\)\(,".*\)/\2/p' # 输出一行中的","foobar":"123456","
sed -i "/^`tail -n3 test.yml|head -n1`$/s/^/#/" test.yml # 在倒数第三行开头添加'#'
sed -i "/^`tail -n1 test.yml|head -n1`$/s/^.//" test.yml # 删除倒数第一行开头的字符
tr "\n" " " < foo.json | sed -e 's/ //g' # 去除json格式化
# 正则表达式中，[]不需要转义，{}需要转义

find . -name "*.go" | xargs grep -n "Config"
grep -n "Config" `find . -name "*.go"` # 查找当前目录及子目录中所有.go文件中包含Config的行

while read line; do grep "$line" foo; echo; done < bar > stat # 逐行把bar中的内容从foo中grep出来并输出到stat

sort foobar | uniq -dc | sort -k 1nr # 按foobar第一列统计重复并降序排列

#根据时间生成MongoDB的ObjectID
printf "%x0000000000000000\n" `date -d "2016-08-31 05:14:00" +%s`

#将MongoDB的_id中的16进制的时间戳转换成可读时间
date -d @`printf "%d\n" 0x579b7d80` +%Y-%m-%d" "%H:%M:%S

# curl发post请求
curl -i -X POST -H "'Content-type':'application/x-www-form-urlencoded', 'charset':'utf-8', 'Accept': 'text/plain'" -d 'json_data={"a":"aaa","b":"bbb","data":[{"c":"ccc","d":"ddd","keywords":[{"e": "eee", "f":"fff", "g":"ggg"}]}]}' url
curl --data-urlencode "foobar=foo bar" http://localhost:port --user username:password
curl --data "foo=foo&bar=bar" http://localhost:port
curl -H 'Content-type:text/xml' -d'' https://foobar -k # post发送xml，忽略证书

# lftp
lftp -c 'set ftp:charset utf-8; set file:charset utf-8; set ftp:ssl-force true; set ftp:ssl-protect-data true; set ftp:ssl-allow true ; set ssl:verify-certificate no; open -u username,password -e "cd /; ls *; mget *.txt; quit" host:port'

cat /proc/sys/net/ipv4/tcp_max_tw_buckets # ubuntu TIME_WAIT最大数量
vi /etc/sysctl.conf

# 查看某个进程的pid
pgrep sigtest
ps -ef | grep -i sigtest | grep -v "grep" | awk '{print $2}' | xargs kill
pstree -p 12306 # 查看进程12306的所有线程

# 转PKCS8的命令
OpenSSL> pkcs8 -topk8 -inform PEM -in rsa_private_key.pem -outform PEM -nocrypt -out rsa_pr

ndk-build V=1 2>&1 | tee log.txt
ssh-keygen -t rsa -P ''
echo 'IdentityFile ~/.ssh/priv_rsa' > ~/.ssh/config
ssh root@127.0.0.1 -p22

# nginx
./nginx -t -c nginx.conf
./nginx -s reload

# vim
:set ff=unix
:set nu #显示行号

# 环境变量相关
/etc/ld.so.conf
/sbin/ldconfig -v
/etc/bashrc
/etc/profile
source .bashrc
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH

objdump -p libcurl.so | grep SONAME #查看soname
readelf -d libcurl.so #查看soname
objdump -tT libcurl.so |grep generateKey #查看so中的函数名
nm -D libcurl.so |grep generateKey #查看so中的函数名

# inux查看系统的启动时间和运行时间
uptime
cat /proc/uptime
date -d "$(awk -F. '{print $1}' /proc/uptime) second ago" +"%Y-%m-%d %H:%M:%S"
$ cat /proc/uptime| awk -F. '{run_days=$1 / 86400;run_hour=($1 % 86400)/3600;run_minute=($1 % 3600)/60;run_second=$1 % 60;printf("系统已运行：%d天%d时%d分%d秒\n",run_days,run_hour,run_minute,run_second)}'


../glibc-2.7/configure --prefix=/tools \
    --disable-profile --enable-add-ons \
    --with-headers=/tools/include \
    --with-binutils=/tools/bin \
    --without-gd
	
# gcc
-ffunction-sections -Wl,--gc-sections
gcc -fPIC -Wl,--gc-sections -shared -Wl,-soname,libmyprint.so -o libmyprint.so  main.c
gcc -c main.c
ar crv libmyprint.a main.o
gcc -dynamiclib -current_version 1.0 -o libmyprint.dylib main.c # Mac

# gdb
x/16xb buf # 查看hex

$ANDROID_HOME/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/lib/gcc/arm-eabi/4.4.0/
-rpath-link=$ANDROID_HOME/out/target/product/generic/obj/lib
-L$NDK_HOME/build/platforms/android-8/arch-arm/usr/lib

# java
javac -cp /home/cloud/brian/rmq/rabbitmq-client.jar Test.java #指定jar包编译，多个jar包用;号隔开
export CLASSPATH=/home/cloud/brian/rmq/rabbitmq-client.jar:/home/cloud/brian/rmq/test #执行前设置jar包路径和含main方法的class的包路径，这里是package cps
java cps.Test #执行时指定 包.类

# 运行jar文件的方法是：
java -jar xxx.jar

# 但是有时，我们希望运行里面的具体某个类，这时可以通过：
java -cp xxx.jar xxx.com.xxxx
# 其中-cp命令是将xxx.jar加入到classpath，这样java class loader就会在这里面查找匹配的类。
java -Djava.ext.dirs=test test.Foobar # 把依赖的jar包和Foobar.class放到test目录中
mvn package -Dmaven.test.skip=true
