#define _POSIX_C_SOURCE 200112L

#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>

void getparams(int argc, char **argv, size_t *buflen, char **inname,
                             char **outname);

void getfilehandles(char *inname, char *outname, int *infd, int *outfd);

void copy(int infd, int outfd, size_t buflen);

int main(int argc, char **argv)
{

    char *inname;
    char *outname;
    size_t buflen;
    int infd;
    int outfd;

    getparams(argc, argv, &buflen, &inname, &outname);
    getfilehandles(inname, outname, &infd, &outfd);

    copy(infd, outfd, buflen);

    if (close(outfd) == -1) {
        perror("Fehler beim Schließen der Ausgabedatei");
        exit(EXIT_FAILURE);
    }

    if (close(infd) == -1) {
        perror("Fehler beim Schließen der Eingabedatei");
        exit(EXIT_FAILURE);
    }

    return EXIT_SUCCESS;
}

void getparams(int argc, char **argv, size_t *buflen, char **inname,
                             char **outname)
{
    int opterrflag = 0;
    int opt;
    intmax_t buflenreq;

    /* Standard-Wert */
    *buflen = 1;

    /* Kommandozeilenoptionen verarbeiten */
    while ((opt = getopt(argc, argv, "b:")) != -1) {
        switch (opt) {
        case 'b':
            opterrflag = sscanf(optarg, "%jd", &buflenreq) != 1 || (buflenreq <= 0);
            break;
        case '?':
            opterrflag = 1;
            break;
        }
    }

    if (optind < argc) {
        *inname = argv[optind++];
    } else {
        opterrflag = 1;
    }

    if (optind < argc) {
        *outname = argv[optind];
    } else {
        opterrflag = 1;
    }

    if (opterrflag) {
        fprintf(stderr,
                        "Benutzung:\n"
                        "\n"
                        "  %s [-b n] <Eingabedatei> <Ausgabedatei>\n"
                        "\n" "b[=1]: Puffergröße n > 0\n"
                        "       Das obere Limit von n ist systemabhängig, mindestens %u.\n"
                        "       Zu große Werte werden auf das Maximum gekappt.\n",
                        argv[0], _POSIX_SSIZE_MAX);
        exit(EXIT_FAILURE);
    }

    *buflen = (buflenreq > SSIZE_MAX)? SSIZE_MAX : buflenreq;
}

void getfilehandles(char *inname, char *outname, int *infd, int *outfd)
{
    // get source filehandle
    if((infd = open(inname,O_RDONLY)) == -1) { //原文件打开错误
        printf("fail to open source file");
        exit(1);
    }
    // get copyed filehandle
    if((outfd = open(outname,O_WRONLY|O_CREAT,S_IWUSR)) == -1)
    {
        printf("fail to create target file");
        exit(1);
    }
}

void copy(int infd, int outfd, size_t buflen)
{
    int byteread,bytewrite;
    char buffer[1024];
    char *ptr;

    while(byteread = read(infd,buffer,1024)) //每次读取1024比特
    {
        if((byteread==-1) && (errno!=EINTR)) {
            break;       //读取错误
        }
        else if(byteread > 0) { //把读到的写入另一个文件
            ptr = buffer;
            while(bytewrite = write(outfd,ptr,byteread))
            {
                if((bytewrite==-1) && (errno!=EINTR)) {
                    break;   //写入错误
                } else if(bytewrite == byteread) {
                    break;
                } else if(bytewrite > 0) {
                    ptr = ptr+bytewrite;
                    byteread = byteread-bytewrite;
                }
            }
            if(bytewrite == -1) {
                break;
            }
        }
    }
}
