Date: Fri, 15 Oct 1999 14:24:02 -0500 (EST)
From: theodore russell wickell <twickell@indiana.edu>
Subject: [linux-lvm] lvmcreate_initrd
Message-ID: <Pine.HPP.3.96.991015141634.18374A-100000@falstaff.ucs.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

I finally got my system to boot except for one problem. My ramdisk is too
big! The lvmcreate_initrd tries to crete an initrd image of size 8192K but
my ramdisks such as /dev/ram1 is only 4096K I believe. The library file
libc.so.6 alone is 4017K. Am I doing something wrong? I have been trying
to cut things out of my image to that It all will fit in the ramdisk at
bootup. I trimmed out alot the device files that REdhat comes with by
default which were in the lvmcreate_initrd script, but still it is around
5002K. Anyone know how to make a ramdisk such as /dev/ram1 which is size
8192? 

The ramdisk image sizes I quoted are before gzip'ing because I figured
that was what had to be able to fit in ram at bootup. It zips down to 1.8M
but when unzipped at boot-time it overflows my ramdisk device.


Thanks,
Rusty



----------------------------------------------------------------------------
Rusty Wickell					200 S. Jordan Ave.
Digital Library Sytem Administrator		Simon 060
Indiana University				Bloomington IN 
812-856-5174					47405
----------------------------------------------------------------------------
