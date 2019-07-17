#!/bin/bash
start(){
nohup python /usr/local/ssr/shadowsocks/local.py -c /etc/ssr.json &
source ~/.bashrc
sleep 1
pid=`netstat -anp|grep 1080|awk '{printf $7}'|cut -d/ -f1`
if [ -n "$pid" ];then
echo -e "ssr已开启\n"
else
        echo -e "ssr未开启\n"
fi
echo -e "如果没有设置PAC代理，在系统设置>网络>网络代理>自动>填入 file://home/autoproxy.pac\n"
}

stop(){
    pid1=`netstat -anp|grep 1080|awk '{printf $7}'|cut -d/ -f1`
    if [ -n "$pid1" ];then
        kill -9 $pid1
fi
        echo '已关闭'
}

edit(){
vim /etc/ssr.json
}

restart(){
stop
start
}

echo '      1.开启'
echo '      2.关闭'
echo '      3.重启'
echo '      4.编辑配置文件'
echo '      其他键退出'
echo '请输入:'
read aNum
if [ "$aNum" -eq "1" ];then
start
fi
if [ "$aNum" -eq "2" ];then
stop
fi
if [ "$aNum" -eq "3" ];then
restart
fi
if [ "$aNum" -eq "4" ];then
edit
fi

exit 0


