Message-Id: <s847de40.025@pgkvfax>
Date: Fri, 03 Dec 1999 15:13:43 +0100
From: "Stephan Hendl" <Stephan.Hendl@lds.brandenburg.de>
Subject: [linux-lvm] LVM and Compaq Smart Array
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi all,

I tried to set up LVM 0.7 on a Compaq Pro Liant 3000 Server with 2 CPUs =
and a Smart Array Controller 4200 that include 3 9.1 GB SCSI Disks. The =
patch and the new kernel gave no errors, but I can't create a physical =
volume. Here are the outputs of fdisk and pvcreate:

sgate:/dev/ida # fdisk -lu

Disk /dev/ida/c0d0: 255 heads, 32 sectors, 4355 cylinders
Units =3D sectors of 1 * 512 bytes

         Device Boot    Start       End    Blocks   Id  System
/dev/ida/c0d0p1   *     73440   1101599    514080   83  Linux
/dev/ida/c0d0p2       1101600   2154239    526320   82  Linux swap
/dev/ida/c0d0p3            32     73439     36704   12  Compaq diagnostics
/dev/ida/c0d0p4       2154240  35536799  16691280   fe  LANstep

sgate:/dev/ida # pvcreate -v /dev/ida/c0d0p4
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/ida/c0d0p4"
pvcreate -- invalid physical volume name "/dev/ida/c0d0p4"
pvcreate -- unlocking logical volume manager

Does anybody have a Solution. Could it be that the partition is too =
big?=20

Thanks=20
Stephan


--
LDS Brandenburg
Dr. Stephan Hendl
fon: +49-(0)331-39 471
fax: +49-(0)331-27548 1187
EMail: stephan.hendl@lds.brandenburg.de
