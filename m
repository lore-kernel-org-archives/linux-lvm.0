Message-ID: <396F14D9.8568BA69@marxmeier.com>
Date: Fri, 14 Jul 2000 15:25:45 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [Fwd: boot from lvm volume] Is ther
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@marxmeier.com

Forwarded message from Rolf Jakob (rjakob@duffy1.franken.de) ...

-------- Original Message --------
Message-Id: <m13CqwY-0001aXC@duffy1.franken.de>
Subject: Re: [linux-lvm] [Fwd: boot from lvm volume] Is ther
In-Reply-To: <396B8B3D.88BD3F73@libertysurf.fr> from =?iso-8859-1?Q?PhilippeLef=E8vre?= at "Jul 11, 2000  5: 1:49 pm"
To: ph.l@libertysurf.fr (=?iso-8859-1?Q?PhilippeLef=E8vre?=)
Date: Thu, 13 Jul 2000 23:52:41 +0200 (MEST)
Sender: rjakob@duffy1.franken.de

Hello,

> I understood that you use the initrd way to getting up your first VG but before
> that, how can you do to put /var /usr /sbin etc... under LVM. I mean, changing
> the filesystem tag (-> 0x8e) then creating PV, VG and LVs will distroy all
> datas on disk !!
Correct. I don't have a click'n'go solution. Once I migrated an existing
conventionally installed system to LVM by simply using another partition as a
PV, put everything I needed into LVs, made sure it will boot using initrd
and finally added the first old partition as another PV. So I ended up with
two PVs on one physical disk. I wouldn't really recommend that way over a clean
installation but it works.

> Is there any way to create LVs before installing my RH distribution ?
That's the preferred way. I have a collection of all necessary packages, so I
don't use one of the available distributions and can only tell you the basics.
You need a boot disk with an lvm enabled kernel (compiled in or module) and
you need access to the disk before your installation routine starts installing
packages. I don't know about the RH install procedure so you have to try on
your own. What I do to install a lvm system, is :
Boot a kernel from floppy and read a ramdisk image from a second floppy.
In this ramdisk I put all the necessary tools to create partitions (fdisk),
set up lvm (modprobe,lvm.o, vgscan, vgchange, pvcreate, etc.). Then the work
starts as I don't have a handy install script for that. I create two partitions,
one small one for the kernel, ramdisk and the lilo files and one that will
become my PV. In the VG I create all the LVs and filesystems I want to have
and mount the root LV under /newroot, usr LV under /newroot/usr and so on.
Then I start my very simple install script that will setup a small system
in /newroot. The kernel, lilo configuration and what is needed plus the ramdisk
is put on the small partition and lilo gets installed. After that the system
is ready to boot and more packages get installed.
So you see, if you want to have your RH system installed in a similar way
you need a possibility to create the VG, LVs and the file systems and then
return to the setup program and install in the prepared place.
I use ext2prepare on each file system and leave some space free for future
resizes.

> NB: LVM is integrated into my kernel and is not a module.
You have to use an initrd anyway, so the integration just saves the
modprobe lvm. I have that in my linuxrc of the ramdisk.

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
