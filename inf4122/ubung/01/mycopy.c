#define _POSIX_C_SOURCE 200112L

#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
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

  /* Standard-Wert */
  *buflen = 1;

  /* Kommandozeilenoptionen verarbeiten */
  while ((opt = getopt(argc, argv, "b:")) != -1) {
    switch (opt) {
    case 'b':
      opterrflag = sscanf(optarg, "%zu", buflen) != 1 || *buflen <= 0
        || *buflen >= 1024 * 1024;
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
            "\n" "b[=1]: Puffergröße mit 0 < n <= 1024^2\n", argv[0]);
    exit(EXIT_FAILURE);
  }
}

void getfilehandles(char *inname, char *outname, int *infd, int *outfd)
{
  // get source filehandle
  printf("enter getfilehandles ---->\n");
  // printf("begin to get inname\n");
  *infd = open(inname, O_RDONLY);
  if(infd == -1) { // offenungsfehler
    printf("fail to open source file");
    exit(1);
  }
  // get copyed filehandle
  // printf("begin to get outname\n");
  *outfd = open(outname, O_WRONLY|O_CREAT, S_IWUSR);
  if(outfd == -1)
  {
    printf("fail to create target file");
    exit(1);
  }

  printf("infd: %d, outfd: %d\n", *infd, *outfd);
  printf("leave getfilehandles <----\n");
  // assert(0);
}

void copy(int infd, int outfd, size_t buflen)
{
  int byteread, bytewrite;
  char *buffer=(char*)malloc(sizeof(char)*buflen);
  char *ptr;

  printf("copy enter ----->\n");
  printf("infd: %d, outfd: %d, buffer[%lu]: %lu\n", infd, outfd, buflen, sizeof(*buffer));
  // assert(0);
  // jedes mal bekommen Datei, die Groess buflen ist, zu Puffer zu schreiben.
  while(byteread = read(infd,buffer,buflen))
  {
    if((byteread==-1) && (errno!=EINTR)) {
      printf("this is a error while reading infd\n");
      break;       // read error
    } else if(byteread > 0) { // write
      ptr = buffer;
      // printf("ready to write to another file\n");
      while(bytewrite = write(outfd,ptr,byteread))
      {
        if((bytewrite==-1) && (errno!=EINTR)) {
          printf("there is a write error.\n");
          break;   // write error
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
    }else{
      printf("donnot know..\n");
    }
  }
  free(buffer);
  printf("leave copy <----\n");
}
