Message-Id: <OFF21038E8.8E1F7C47-ONC1256B3D.006602E0@de.ibm.com>
From: "Martin Petermann" <martin.petermann@de.ibm.com>
MIME-Version: 1.0
Subject: [linux-lvm] read is blocking if reading snapshots with 16k blocks on mp systems
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan 10 12:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I had some performance problems, than I wrote a small program to see where
it was hanging:

-my configuration:

I'm using a SuSE 7.1 and SuSE 7.2 mp system (two processors).
I've created a snapshot in the following way:

   peanuts:root >lvcreate -L 50 -n snapshot -s /dev/zweite_testvg/testfs1

   >lvscan
   ...
   lvscan -- ACTIVE   Original "/dev/develop/400M" [400.00 MB]
   lvscan -- ACTIVE   Snapshot "/dev/develop/snapshot" [31.50 MB] of
   /dev/develop/400M
   ....
   lvscan -- 13 logical volumes with 17.05 GB total in 2 volume groups
   lvscan -- 13 active logical volumes


-small program which simply reads from a snapshot and writes to a file

   #define SIZE 4*4096

   int main(int argc, char **argv)

   {
      struct timeval now,save;
      struct timezone tz;
      char buffer[SIZE];
      ssize_t size,count=SIZE;
      int fd,fd2,counter=0;

      fd=open(argv[1], O_RDONLY, O_NONBLOCK); // filedescriptor for reading
      fd2=open("/BIGFS/file", O_RDWR);        // filedescriptor for writing

      if (fd>0)
      {
         printf("%s opened for reading\n",argv[1]);
         do
         {
            gettimeofday(&save,&tz);
            size= read(fd, (void *) buffer, count);
            gettimeofday(&now,&tz);
            if( now.tv_sec-save.tv_sec > 1 )
               printf("%d: %ld seconds needed for bytes
   %d\n",counter,now.tv_sec-save.tv_sec,(int) size);
            size= write(fd2, (void *) buffer, size);
            counter++;
         } while ( size > 0 );
      }

      close(fd);
      close(fd2);

      return 0;
   }



-output using different values for SIZE (16384, 16383, 16385):

/dev/zweite_testvg/snapshot opened for reading
9704: 11 seconds needed for bytes 16384
12002: 12 seconds needed for bytes 16384
12435: 29 seconds needed for bytes 16384
14661: 7 seconds needed for bytes 16384
14669: 40 seconds needed for bytes 16384
16071: 17 seconds needed for bytes 16384
18456: 11 seconds needed for bytes 16384
/develop/rem/peterman/C/linux

peanuts:root >gcc -o myread myread.cpp
/develop/rem/peterman/C/linux
peanuts:root >./myread /dev/zweite_testvg/snapshot
/dev/zweite_testvg/snapshot opened for reading
7532: 2 seconds needed for bytes 16383
/develop/rem/peterman/C/linux

peanuts:root >gcc -o myread myread.cpp
/develop/rem/peterman/C/linux
peanuts:root >./myread /dev/zweite_testvg/snapshot
/dev/zweite_testvg/snapshot opened for reading
/develop/rem/peterman/C/linux


The maximum time read was hanging was 40 seconds. I detected similar
problems reading 3*4096 bytes.

Regards
   Martin
