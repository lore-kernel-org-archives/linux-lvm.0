Message-ID: <39AB63C5.C58D15F8@twc.de>
Date: Tue, 29 Aug 2000 09:18:29 +0200
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: [linux-lvm] Strange...
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

Hi!

I just wanted to resize /home/ftp...

Here is what happened:

(root@kira:/0)~# mount
/dev/hda2 on / type ext2 (rw,errors=3Dremount-ro)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=3D5,mode=3D620)
/dev/hda1 on /boot type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/tmp on /tmp type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/usr on /usr type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/var on /var type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/opt on /opt type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/home on /home type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/ftp on /home/ftp type ext2 (ro,errors=3Dremount-ro)
/dev/vgkira/install on /home/ftp/install type ext2
(rw,errors=3Dremount-ro)
/dev/vgkira/ftp2 on /home/ftp2 type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/sys on /sys type ext2 (rw,errors=3Dremount-ro)
(root@kira:/0)~# umount /home/ftp/install/
(root@kira:/0)~# umount /home/ftp
(root@kira:/0)~# e2fsadm -L+1G /dev/vgkira/ftp
e2fsadm -- ERROR: "/dev/vgkira/ftp" is mounted on "/home/ftp2"
e2fsadm -- please umount it to resize

(root@kira:/0)~# mount
/dev/hda2 on / type ext2 (rw,errors=3Dremount-ro)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=3D5,mode=3D620)
/dev/hda1 on /boot type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/tmp on /tmp type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/usr on /usr type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/var on /var type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/opt on /opt type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/home on /home type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/ftp2 on /home/ftp2 type ext2 (rw,errors=3Dremount-ro)
/dev/vgkira/sys on /sys type ext2 (rw,errors=3Dremount-ro)
(root@kira:/0)~#

This happened using lvm-0.7 on a 2.2.13 kernel...

Since the last successfull resize operations, I merged 2 VGs. Formerly
my LVs were spread accross 2 PVs, one per harddisk...

...I see this behaviour for the first time now...
...I retried it after a reboot, but the effect is the same...

...or is it too early in the morning and I=EF=BF=BDd better get some cups of
coffee??? ;-)

Bye for now...

	Ulf.
