#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdlib.h>
#include<errno.h>
#include<string.h>
#include<unistd.h>
#include<stdio.h>
int main(int argc, char *argv[])
{
    int src,dest;
    int byteread,bytewrite;
    char buffer[1024];
    char *ptr;

    if(argc != 3)       //命令行参数不是三个，显示参数错误
    {
        printf("parameter fault");
        exit(1);
    }
    if((src = open(argv[1],O_RDONLY)) == -1)      //原文件打开错误
    {
        printf("fail to open source file");
        exit(1);
    }
    if((dest = open(argv[2],O_WRONLY|O_CREAT,S_IWUSR)) == -1)    //新文件创建错误
    {
        printf("fail to create target file");
        exit(1);
    }

    while(byteread = read(src,buffer,1024))   //每次读取1024比特
    {
        if((byteread == -1)&&(errno != EINTR)) break;       //读取错误
        else if(byteread > 0)             //把读到的写入另一个文件
        {
            ptr = buffer;
            while(bytewrite = write(dest,ptr,byteread))
            {
                if((bytewrite == -1)&&(errno != EINTR)) break;   //写入错误
                else if(bytewrite == byteread) break;
                else if(bytewrite > 0)
                {
                    ptr = ptr + bytewrite;
                    byteread = byteread - bytewrite;
                }
            }
            if(bytewrite == -1) break;

        }
    }
    close(src);
    close(dest);
    exit(0);
}
