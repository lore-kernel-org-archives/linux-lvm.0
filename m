Message-Id: <m11cXuW-0000YHC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] which kernel for lvm + devfs
In-Reply-To: <19991014142018.A2878@redneck.sk.oracle.com> from Adrien Farkas at "Oct 14, 1999  2:20:18 pm"
Date: Sat, 16 Oct 1999 19:46:27 +0200 (MEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> I'm using adaptec 2940uw and aha152x with LVM and devfs, with no problems. kernel version 2.2.12, devfs 0.99.5 and LVM 0.7. you have to apply LVM at first, then devfs patch, the problems are lessened. there is only one rejected file, which is quite okay I assume (when you patch it by hand)

You're right, it was very easy then, thanks.

Now there is only one problem remaining :
After executing linuxrc the kernel cannot find my root lv.
The activation worked, but it says it cannot mount /dev/rootvg/rootlv
or 0:0.
My lilo.conf reads:
image=/boot/zImage.2212
append="root=/dev/rootvg/rootlv"
root=/dev/rootvg/rootlv
initrd=/boot/lvmboot.gz
label=2212

/boot is a partition based file system on its own, rootlv is accessible
while booting with my old root partition.

What am I missing ?

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
