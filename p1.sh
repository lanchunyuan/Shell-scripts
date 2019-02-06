#!/bin/sh
function a_sub {
    sleep 2;
    endtime=`date +%s`
    sumtime=$[$endtime-$starttime]
    date
    echo "我是$i,运行了2秒,整个脚本已经执行了$sumtime秒"
}

starttime=`date +%s`
export starttime
##其中$$为该进程的pid
tmp_fifofile="/tmp/$$.fifo"
##创建命名管道
mkfifo $tmp_fifofile
##把文件描述符6和FIFO进行绑定
exec 6<>$tmp_fifofile
##绑定后，该文件就可以删除了
rm -f $tmp_fifofile

##并发量为3，用这个数字来控制并发数
thread=3
for ((i=0;i<$thread;i++));
do
    ##写一个空行到管道里，因为管道文件的读取以行为单位
    echo >&6
done

##循环10次，相当于要备份100个库
for ((i=0;i<10;i++))
do
    ##读取管道中的一行,每次读取后，管道都会少一行
    read -u6
    {
        a_sub || {echo "a_sub is failed"}
        ##每次执行完a_sub函数后，再增加一个空行，这样下面的进程才可以继续执行
        echo >&6
    } & ##这里要放入后台去，否则并发实现不了
done

##这里的wait意思是，需要等待以上所有操作（包括后台的进程）都结束后，再往下执行。
wait

##关闭文件描述符6的写
exec 6>&-