From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009010816.CAA05108@lynx.turbolabs.com>
Subject: Re: [linux-lvm] ERROR -241 getting size of physical volume "/dev/hdd2"
Date: Fri, 1 Sep 2000 02:16:46 -0600 (MDT)
In-Reply-To: <Pine.A41.4.21.0008302002520.33560-100000@gigue.dlib.indiana.edu> from "John Marquart" at Aug 30, 2000 08:19:38 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: John Marquart <jomarqua@indiana.edu>
Cc: linux-lvm@msede.com

John Marquart, you write:
> However, I was attempting to add an extra physical device to my machine,
> and add it to an existing VG.  When I ran "pvcreate /dev/hdd2" it gave me
> the following error:
> 
> pvcreate -- ERROR -241 getting size of physical volume "/dev/hdd2"  
> 
> and when I run lvmscandisk it does only pics up 1 disk (not /dev/hdd).

It looks like you have the (well known) bug which happens if you add a
kernel patch which adds fields to /proc/partitions, and then the LVM
code screws up.  There is a fix in the "BUGS" file at lvm.msede.com,
which looks something like this (for lvm_dir_cache.c):

   char procline[127];

 [snip]

   if ( ( proc = fopen ( "/proc/partitions", "r")) != NULL) {
       while ( !feof ( proc)) {
           fgets (procline, 127, proc) ;
           sscanf (procline, " %s %s %s %s\n", major, minor, blocks, devname);
           if ( atoi ( major) > 0 && atoi ( major) != LVM_BLK_MAJOR) {
               lvm_add_dir_cache ( "/dev", devname);
           }
       }
       fclose ( proc);
   }

Why there is not a new release of the LVM tools that fixes these bugs,
nobody knows...

Cheers, Andreas
