Message-Id: <m11cEEB-0000YPC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] lvmcreate_initrd
In-Reply-To: <Pine.HPP.3.96.991015141634.18374A-100000@falstaff.ucs.indiana.edu> from theodore russell wickell at "Oct 15, 1999  2:24: 2 pm"
Date: Fri, 15 Oct 1999 22:45:26 +0200 (MEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

> I finally got my system to boot except for one problem. My ramdisk is too
> big! The lvmcreate_initrd tries to crete an initrd image of size 8192K but
> my ramdisks such as /dev/ram1 is only 4096K I believe. The library file
> libc.so.6 alone is 4017K. Am I doing something wrong? I have been trying

If you want to stay below the 4096 you may copy a stripped version of the
libc and the other needed libraries. This means you cannot read debug
information from the libc, but you don't need that in your initrd.

I created an initial ramdisk (just copied a script that created boot/root
disks) and mine is 1781KB including lvm tools, ash and some modules.

But you can also increase the ram disk size.

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
