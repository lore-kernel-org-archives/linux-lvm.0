Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3PL7Iv12839
	for <linux-lvm@redhat.com>; Sun, 25 Apr 2004 17:07:18 -0400
Received: from smtp040.tiscali.dk (smtp040.tiscali.dk [212.54.64.106])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3PL7HKG016069
	for <linux-lvm@redhat.com>; Sun, 25 Apr 2004 17:07:17 -0400
Received: from sneakemail.com (62.79.51.144.adsl.noe.tiscali.dk [62.79.51.144])
	by smtp040.tiscali.dk (8.12.10/8.12.10) with ESMTP id i3PL7EPo011021
	for <linux-lvm@redhat.com>; Sun, 25 Apr 2004 23:07:15 +0200 (MEST)
Message-ID: <408C2883.5080606@sneakemail.com>
Date: Sun, 25 Apr 2004 23:07:15 +0200
From: =?ISO-8859-1?Q?Peter_Valdemar_M=F8rch?= <swp5jhu02@sneakemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] 2.6 upgrade - LVM version ? & root partition access
	problems...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

I wanted to upgrade to a 2.6 kernel, but I seem to be running into
problems getting the new kernel to recognize my LVM root '/' partition
during boot. I also think I have a mixed LVM1 and LVM2 toolset as part
of the upgrade and that this is why I'm failing. Now, I'm even more
concerned with the stability of my system than with the original 2.6
upgrade task.

Sorry for the length of the post, but I think my main problem is that I
don't know what it is that I don't know... Makes it damn hard to Google
or RTFM otherwise. I'll start with the most obvious and move into the
more obscure. Stop if you get bored or see my problem! :-D

I'm running on RH9 with what used to be a pretty standard install except
for a EXT3 LVM root partition and a ReiserFS Software Raid1 /home
partition. (OK so a  LVM '/' partition is a bad idea. I didn't know that
then. I do now!)

I can't boot with my newly compiled 2.6.5 kernel, lvmcreate_initrd
doesn't work for either 2.4 or 2.6 kernels with my current setup and
tools, and "lvm version" gives an error (see below)

In one of the many guides about 2.6 upgrading I was suggested to upgrade
to the *.i386.rpms in http://people.redhat.com/arjanv/2.6/RPMS.kernel/
(The URL seemed to indicate a reputable source for RH9 rpms)
Among others, I installed
lvm-1.0.3-17.i386.rpm
lvm2-2.00.08-2.i386.rpm
device-mapper-1.00.07-3.1.i386.rpm

Now I'm not even sure what LVM version I'm running:
[root@valde root]# lvm version
   LVM version:     2.00.08 (2003-11-14)
   Library version: 1.00.07-ioctl (2003-11-21)
   /dev/mapper/control: open failed: No such file or directory
   Is device-mapper driver missing from kernel?

[root@valde root]# lvm lvs
   /proc/lvm/VGs/Volume00 exists: Is the original LVM driver using this
volume group?
   Can't lock Volume00: skipping

[root@valde new]# lvm pvscan
   PV /dev/hda3   VG Volume00   lvm1 [56.22 GB / 0    free]
   PV /dev/hdc3   VG Volume00   lvm1 [55.83 GB / 4.00 MB free]
   Total: 2 [4.00 MB] / in use: 2 [4.00 MB] / in no VG: 0 [0   ]

`man lvm` mentions /etc/lvm/lvm.conf. I have a /etc/lvm directory but no=20
/etc/lvm/lvm.conf file.

In the output, I'm asked:
"Is device-mapper driver missing from kernel?".
I don't know. Is it? I'm running a stock 2.4.20-20.9 kernel from redhat
with the non-stock bridge-nf patch. If device-mapper driver is missing
from kernel what do I do about that?

FAQ entry: "I get errors about /dev/mapper/control when I try to use the
LVM 2 tools" from http://www.tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html#AEN231
says  "The primary cause of this is not having run the devmap_mknod.sh
script after rebooting into a dm capable kernel."
True. I haven't run devmap_mknod.sh. In fact I don't have it on my
system. It isn't part of any of my lvm* rpms. But am I running "a dm
capable kernel" yet with my RedHat 2.4.20-20.9 kernel?

It seems I'm now in a chicken-and-egg situation. I can't get
lvmcreate_initrd to work until I update the kernel to a dm kernel. I
can't boot into one until I have lvmcreate_initrd (or mkinitrd) working.
   Hmm...

So: Should I
*) Get, compile, install and run "a dm capable kernel." Which one?
*) Accept that installing the lvm2 rpm was a bad idea and install lvm2
from tarball to get and run devmap_mknod.sh? Anything to watch out for here?
*) Upgrade my /dev/Volume00/LogVol00 to LVM2 somehow?
*) Turn my '/' into a non-LVM volume? How?
*) Backup all my 90 GB somewhere, reinstall with a fresh 2.6 kernel
distro and get all my apps & setup working again from scratch? (YIKES!)
*) Some other option I'm missing?

***************************
    Boot disk creation?
***************************
I also don't have a good boot disk around with the LVM access. How do I
create one, now that my tools are messed up but before I loose my system
forever? Once I have it, how do I test that its working and not
accessing the lvm tools from the / partition in some sneaky fashion?
Are all the LVM access tools already in /boot/initrd-2.4.20-20.9.img (It
does contain e.g. /bin/vgchange)? Am I fine as long as I leave an entry
for this 2.4.20-20.9 kernel in grub.conf?

***************************
    lvmcreate_initrd
    seems to not work for me
***************************
OK, so then I thought I'd just put MD, RAID1, EXT3 and REISERFS into the
kernel instead of as modules and follow the
http://www.tldp.org/HOWTO/LVM-HOWTO/
on how to run "lvmcreate_initrd 2.6.5" to create the initrd-lvm file. I
have not yet succeeded in running lvmcreate_initrd successfully. I
always get approx 2000 "cpio: No space left on device" errors that
finish with
lvmcreate_initrd -- ERROR cpio to ram disk
(Because of messed up lvm tools?)

Even with a fresh 2.4.20 kernel build with the above modules directly in
the kernel (that works fine with all the above as modules using
mkinitrd) I can't get lvmcreate_initrd to work. When running
lvmcreate_initrd with a parameter indicating a 2.4 kernel (other than
the one currently running), I get the same many may "No space left on
device" errors in addition to "depmod: *** Unresolved symbols in
/lib/modules/2.4.<snip>" errors. It also fails with "ERROR cpio to ram
disk".

Going to another machine, running Fedora Core 1 and 2.4.22 with a
gazillion patches (for "myth"), I get the same "depmod: *** Unresolved
symbols in /lib/modules/2.4.<snip>" errors, but it does finish by
creating /boot/initrd-lvm-2.4.22-1.2115.nptl.gz. Are the depmod errors
normal and to be expected as part of normal behavior?

***************************
    mkinitrd woes with
    device-mapper-1.00.07-3.1.i386.rpm
***************************
Among others, I installed device-mapper-1.00.07-3.1.i386.rpm from the
above location. With it, mkinitrd (also "new" & from above) doesn't
work. Removing it and reinstating the original /lib/libdevmapper.so.1.00
makes mkinitrd work, but "lvm version" and "lvm lvs" doesn't work with
either of them. (Even after rebooting after changing it).

***************************
   Running my 2.6.5 kernel
   anyway
***************************
If I ignore all of this, and create a 2.6.5 kernel with RAID1, EXT3, LVM
and REISERFS as modules, and mkinitrd, then when I try to boot it I get:

RAMDISK: Compressed image found at block 0
RAMDISK: incomplete write (-28 !=3D 32768) 4194304
VFS: Cannot open root device "Volume00/LogVol00" or unknown-block(0,0)
Please append a correct "root=3D" boot option
Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0

Help! I don't know what to do now!

Peter

--=20
Peter Valdemar M=EF=BF=BDrch
http://www.morch.com
