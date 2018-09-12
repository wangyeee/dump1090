CFLAGS?=-fPIC -O0 -g -Wall -W $(shell pkg-config --cflags librtlsdr) -I/usr/lib/jvm/java-9-openjdk-amd64/include -I/usr/lib/jvm/java-9-openjdk-amd64/include/linux

LDLIBS+=-lpthread -lm $(shell pkg-config --libs librtlsdr)
CC?=gcc
PROGNAME=dump1090

all: dump1090

%.o: %.c
	$(CC) $(CFLAGS) -c $<

dump1090: dump1090.o anet.o
	$(CC) -shared -g -o libdump1090.so dump1090.o anet.o $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o dump1090 libdump1090.so
