From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008291622.KAA02929@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Dazed & Confused
Date: Tue, 29 Aug 2000 10:22:06 -0600 (MDT)
In-Reply-To: <39AB63C5.C58D15F8@twc.de> from "Ulf Bartelt" at Aug 29, 2000 09:18:29 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ulf Bartelt <ulf@twc.de>
Cc: linux-lvm@msede.com, "Paul Jakma"@lynx.turbolabs.com, paul@clubi.ie, "Brian Poole"@lynx.turbolabs.com, raj@cerias.purdue.edu, "David Mallette"@lynx.turbolabs.com, malletted@transcontinental.ca

Ulf Bartelt writes:
> /dev/vgkira/ftp on /home/ftp type ext2 (ro,errors=remount-ro)
> /dev/vgkira/ftp2 on /home/ftp2 type ext2 (rw,errors=remount-ro)
> 
> (root@kira:/0)~# e2fsadm -L+1G /dev/vgkira/ftp
> e2fsadm -- ERROR: "/dev/vgkira/ftp" is mounted on "/home/ftp2"
> e2fsadm -- please umount it to resize

This is a bug in how e2fsadm checks to see if a filesystem is mounted.
I have fixed this in my version of e2fsadm, as well as adding support
for ext2resize and ext2online, so you don't even need to unmount the
filesystem to resize it (if you have the ext2online kernel patch).

See ftp.lustre.org:/pub/adilger for an SRPM which has a patch to fix
all known LVM user-tools bugs, as well as a kernel patch for 0.8final
on 2.2.16.  I was told by Les Hazelton that my LVM kernel patch will
apply cleanly to kernel-source-2.2.17-0.16mdk.i586.rpm, from the
mandrake cooker section on rpmfind.net.

Cheers, Andreas
