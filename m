Message-Id: <m13Avjj-0000YgC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] [Fwd: boot from lvm volume]
In-Reply-To: <3966E6FA.83BF1347@marxmeier.com> from Michael Marxmeier at "Jul 8, 2000 10:31:54 am"
Date: Sat, 8 Jul 2000 16:37:43 +0200 (MEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com
Cc: corporate@ncincwi.com

Hello,

> Is it yet possible to boot from an LVM volume?
AFAIK no. I use a small partition for the kernel, an initrd image and
the lilo.conf which is later mounted as /boot.
So when the system is up the / filesystem is a logical volume and can
be resized online like all the other filesystems I use.
Lilo boots the kernel from that partition, loads an initial ramdisk
and executes the linuxrc script. In this script the needed modules are
loaded (ide.o or the SCSI modules and the lvm module), the volume group
is activated and by writing the major/minor number of the boot logical
volume ( I use the first logical volume as the root LV ) to
/proc/sys/kernel/real-root-dev the kernel will mount that one as the
new root filesystem.
I use that for five different systems now. My plannings were to use the
boot partition as a rescue system as well but I did it only on one
system (proof of concept, but I found out that rescue floppies are enough
for me).

> I like also mirrored / .
Hmm, that would mean that the master boot record should be mirrored as well,
otherwise you would loose your installed lilo. I haven't tried that yet.

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
