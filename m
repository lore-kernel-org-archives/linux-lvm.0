Message-Id: <s84be24c.019@pgkvfax>
Date: Mon, 06 Dec 1999 16:19:58 +0100
From: "Stephan Hendl" <Stephan.Hendl@lds.brandenburg.de>
Subject: [linux-lvm] LVM and Compaq Smart Array - oncemore
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi all,

after patching the source code with the code from Dirk I got another =
error:

root@sgate:/usr/src/LVM/0.7 > pvcreate -v /dev/ida/c0d0p4
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/ida/c0d0p4"
pvcreate -- getting physical volume size
pvcreate -- partition "/dev/ida/c0d0p4" doesn't exist
pvcreate -- unlocking logical volume manager

Now it seems that the partition doesn't exist - but it exist, really!!!

root@sgate:/usr/src/LVM/0.7 > fdisk -lu

Disk /dev/ida/c0d0: 255 heads, 32 sectors, 4355 cylinders
Units =3D sectors of 1 * 512 bytes

         Device Boot    Start       End    Blocks   Id  System
/dev/ida/c0d0p1   *     73440   1101599    514080   83  Linux
/dev/ida/c0d0p2       1101600   2154239    526320   82  Linux swap
/dev/ida/c0d0p3            32     73439     36704   12  Compaq diagnostics
/dev/ida/c0d0p4       2154240  35536799  16691280   fe  LANstep

Thanks in advance for helping oncemore! :-))

Stephan


--
LDS Brandenburg
Dr. Stephan Hendl
fon: +49-(0)331-39 471
fax: +49-(0)331-27548 1187
EMail: stephan.hendl@lds.brandenburg.de
