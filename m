Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3EGwHIt011824
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2011 12:58:18 -0400
Received: from eastrmfepo203.cox.net (eastrmfepo203.cox.net [68.230.241.218])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3EGwD6u003579
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2011 12:58:13 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo203.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110414165813.RUOU32702.eastrmfepo203.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2011 12:58:13 -0400
Date: Thu, 14 Apr 2011 12:58:12 -0400 (EDT)
From: borelli@cox.net
Message-ID: <1c63fa5.26fc.12f54f2dc1b.Webtop.0@cox.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_19504_11608163.1302800292849"
Subject: [linux-lvm] Confusion mounting old LVs on new system.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_19504_11608163.1302800292849
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Something that I thought would be simple turned out ta not ta be simple 
at all. What's new.

Anyway, the outputs:

  # df -h
Filesystem            Size  Used Avail Use% Mounted on
rootfs                 20G  9.2G  9.6G  49% /
devtmpfs              1.9G  288K  1.9G   1% /dev
tmpfs                 2.0G  1.3M  2.0G   1% /dev/shm
/dev/mapper/system-root
                        20G  9.2G  9.6G  49% /
/dev/sda1             152M   30M  114M  21% /boot
/dev/mapper/system-home
                       437G   14G  402G   4% /home

  # /sbin/fdisk -l

Disk /dev/sda: 500.1 GB, 500107862016 bytes
255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0009017e

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048      321535      159744   83  Linux
/dev/sda2          321536   976773119   488225792   8e  Linux LVM

Disk /dev/sdb: 1000.2 GB, 1000204886016 bytes
255 heads, 63 sectors/track, 121601 cylinders, total 1953525168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0006e47a

    Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *          63      144584       72261   83  Linux
/dev/sdb2          144585    31599854    15727635   8e  Linux LVM
/dev/sdb3        31599855  1953520064   960960105   8e  Linux LVM

Disk /dev/mapper/system-home: 476.3 GB, 476317745152 bytes
255 heads, 63 sectors/track, 57909 cylinders, total 930308096 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/system-home doesn't contain a valid partition table

Disk /dev/mapper/system-root: 21.5 GB, 21474836480 bytes
255 heads, 63 sectors/track, 2610 cylinders, total 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/system-root doesn't contain a valid partition table

Disk /dev/mapper/system-swap: 2147 MB, 2147483648 bytes
255 heads, 63 sectors/track, 261 cylinders, total 4194304 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/system-swap doesn't contain a valid partition table

Disk /dev/mapper/OLDhdd-OLD: 984.0 GB, 984021467136 bytes
255 heads, 63 sectors/track, 119633 cylinders, total 1921916928 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

Disk /dev/mapper/OLDhdd-OLD doesn't contain a valid partition table

  # cat /proc/partitions
major minor  #blocks  name

    8        0  488386584 sda
    8        1     159744 sda1
    8        2  488225792 sda2
    8       16  976762584 sdb
    8       17      72261 sdb1
    8       18   15727635 sdb2
    8       19  960960105 sdb3
  253        0  465154048 dm-0
  253        1   20971520 dm-1
  253        2    2097152 dm-2
  253        3  960958464 dm-3

  # cat /etc/fstab
/dev/system/swap     swap                 swap       defaults 
0 0
/dev/system/root     /                    ext4       acl,user_xattr 
1 1
/dev/disk/by-id/ata-WDC_WD5000AADS-00S9B0_WD-WCAV9A100021-part1 /boot 
ext4       acl,user_xattr        1 2
/dev/system/home     /home                ext4       acl,user_xattr 
1 2
proc                 /proc                proc       defaults 
0 0
sysfs                /sys                 sysfs      noauto 
0 0
debugfs              /sys/kernel/debug    debugfs    noauto 
0 0
usbfs                /proc/bus/usb        usbfs      noauto 
0 0
devpts               /dev/pts             devpts     mode=0620,gid=5 
0 0

  # mount
devtmpfs on /dev type devtmpfs 
(rw,relatime,size=1985000k,nr_inodes=496250,mode=755)
tmpfs on /dev/shm type tmpfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=000)
/dev/mapper/system-root on / type ext4 
(rw,relatime,user_xattr,acl,barrier=1,data=ordered)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
/dev/sda1 on /boot type ext4 
(rw,relatime,user_xattr,acl,barrier=1,data=ordered)
/dev/mapper/system-home on /home type ext4 
(rw,relatime,user_xattr,acl,barrier=1,data=ordered)
securityfs on /sys/kernel/security type securityfs (rw,relatime)
nfsd on /proc/fs/nfsd type nfsd (rw,relatime)
rpc_pipefs on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw,relatime)
gvfs-fuse-daemon on /home/borelli/.gvfs type fuse.gvfs-fuse-daemon 
(rw,nosuid,nodev,relatime,user_id=1000,group_id=100)
fusectl on /sys/fs/fuse/connections type fusectl (rw,relatime)

  # pvscan
   /dev/sdc: open failed: No medium found
   /dev/sdc: open failed: No medium found
   Couldn't find device with uuid 
CSGXpY-YEJ7-4qsf-KtdC-ft1u-IOaN-QSecuY.
   PV /dev/sdb3        VG OLDhdd   lvm2 [916.44 GiB / 0    free]
   PV /dev/sdb2        VG system   lvm2 [15.00 GiB / 0    free]
   PV unknown device   VG system   lvm2 [916.44 GiB / 0    free]
   PV /dev/sda2        VG system   lvm2 [465.61 GiB / 0    free]
   Total: 4 [2.26 TiB] / in use: 4 [2.26 TiB] / in no VG: 0 [0   ]

  # vgscan
   Reading all physical volumes.  This may take a while...
   /dev/sdc: open failed: No medium found
   Found volume group "OLDhdd" using metadata type lvm2
   /dev/sdc: open failed: No medium found
   Couldn't find device with uuid 
CSGXpY-YEJ7-4qsf-KtdC-ft1u-IOaN-QSecuY.
   Found volume group "system" using metadata type lvm2
   Found volume group "system" using metadata type lvm2

  # lvscan
   ACTIVE            '/dev/OLDhdd/OLD' [916.44 GiB] inherit
   /dev/sdc: open failed: No medium found
   Couldn't find device with uuid 
CSGXpY-YEJ7-4qsf-KtdC-ft1u-IOaN-QSecuY.
   inactive          '/dev/system/home' [895.00 GiB] inherit
   inactive          '/dev/system/root' [34.44 GiB] inherit
   inactive          '/dev/system/swap' [2.00 GiB] inherit

I thought I was doing a simple install to a new disk. I use openSUSE and 
I thougt that I could install with the old disk unplugged then plug in 
the old disk and boot the new system then access the old home partition 
to retrieve my data, settings, etc.

The Partitoiner in Yast tells me that it will not mount a partition with 
unknown or non-existent file system. I'm pretty sure the filesystem is 
still there and I want to be careful to keep it intact. I'm not 
practiced enough to go it on my own.

/sda is my new disk 500 Gib it is working correctly as far as I can 
tell.
/sdb is my old disk and /sdb3 is the partition I want to mount.
in pvscan there is a mistake where there is only 1.5 Tib disk space in 
my machine.
I used Yast Partitioner to change the Volume Group names I think.
I'm still a little unclear about the distinction between PVs and LVs and 
VGs, but I'm starting to get it.
I'm paranoid to try anything else lest I lose my data.

Anyway, whatever help I can get would be greatly appreciated.
Thanks,
AARON

------=_Part_19504_11608163.1302800292849
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LET=
TERSPACING=3D"0" KERNING=3D"0">Something that I thought would be simple tur=
ned out ta not ta be simple at all. What's new.</FONT></DIV><FONT FACE=3D"V=
erdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br>=
</FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#0000=
00" LETTERSPACING=3D"0" KERNING=3D"0">Anyway, the outputs:</FONT></DIV><FON=
T FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COL=
OR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;# df -h</FONT></DIV>=
<DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LET=
TERSPACING=3D"0" KERNING=3D"0">Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Avail Use% Mounted on</FON=
T></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000=
000" LETTERSPACING=3D"0" KERNING=3D"0">rootfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20G&nbsp=
; 9.2G&nbsp; 9.6G&nbsp; 49% /</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D=
"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">de=
vtmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 1.9G&nbsp; 288K&nbsp; 1.9G&nbsp;&nbsp; 1% /dev</FONT></DIV><DIV A=
LIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPA=
CING=3D"0" KERNING=3D"0">tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.0G&nbsp; 1.3M&nbsp; 2=
.0G&nbsp;&nbsp; 1% /dev/shm</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"V=
erdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev=
/mapper/system-root</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" =
SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20G&nbsp; 9.2G&nbsp; 9.6G&nbs=
p; 49% /</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" =
COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/sda1&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 152M&nbsp;&nbsp;=
 30M&nbsp; 114M&nbsp; 21% /boot</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=
=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"=
>/dev/mapper/system-home</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verd=
ana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 437G&nbsp;&nbsp; 14G&nbsp; 402=
G&nbsp;&nbsp; 4% /home</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEF=
T"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" =
KERNING=3D"0">&nbsp;# /sbin/fdisk -l</FONT></DIV><FONT FACE=3D"Verdana" SIZ=
E=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV=
 ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERS=
PACING=3D"0" KERNING=3D"0">Disk /dev/sda: 500.1 GB, 500107862016 bytes</FON=
T></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000=
000" LETTERSPACING=3D"0" KERNING=3D"0">255 heads, 63 sectors/track, 60801 c=
ylinders, total 976773168 sectors</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FAC=
E=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0=
">Units =3D sectors of 1 * 512 =3D 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT=
"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" K=
ERNING=3D"0">Sector size (logical/physical): 512 bytes / 512 bytes</FONT></=
DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000"=
 LETTERSPACING=3D"0" KERNING=3D"0">I/O size (minimum/optimal): 512 bytes / =
512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2"=
 COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk identifier: 0x000=
9017e</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTE=
RSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"V=
erdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbs=
p;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp=
;&nbsp; Id&nbsp; System</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verda=
na" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/sda=
1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2048&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 321535&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 159744&nbsp;&nbsp; 8=
3&nbsp; Linux</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/sda2&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 321536&nbsp;&nbsp; 97677311=
9&nbsp;&nbsp; 488225792&nbsp;&nbsp; 8e&nbsp; Linux LVM</FONT></DIV><FONT FA=
CE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"=
0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk /dev/sdb: 1000.2 GB, 10=
00204886016 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SI=
ZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">255 heads, 63 =
sectors/track, 121601 cylinders, total 1953525168 sectors</FONT></DIV><DIV =
ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSP=
ACING=3D"0" KERNING=3D"0">Units =3D sectors of 1 * 512 =3D 512 bytes</FONT>=
</DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#00000=
0" LETTERSPACING=3D"0" KERNING=3D"0">Sector size (logical/physical): 512 by=
tes / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">I/O size (minimu=
m/optimal): 512 bytes / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FAC=
E=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0=
">Disk identifier: 0x0006e47a</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2"=
 COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=
=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=
=3D"0" KERNING=3D"0">&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System</FONT></DIV><DIV ALIGN=3D"=
LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"=
0" KERNING=3D"0">/dev/sdb1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 63&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 144584&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 72261&nbsp;&nbsp; 83&nbsp; Linux</FONT></DIV><DIV ALIG=
N=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACIN=
G=3D"0" KERNING=3D"0">/dev/sdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 144585&nbsp;&nbsp;&nbsp; 31599854&nbsp;&nbsp;&nbsp; 15727635&nbs=
p;&nbsp; 8e&nbsp; Linux LVM</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"V=
erdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev=
/sdb3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 31599855&nbsp; 1953520064&n=
bsp;&nbsp; 960960105&nbsp;&nbsp; 8e&nbsp; Linux LVM</FONT></DIV><FONT FACE=
=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"=
><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"=
#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk /dev/mapper/system-home: 47=
6.3 GB, 476317745152 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Ve=
rdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">255 h=
eads, 63 sectors/track, 57909 cylinders, total 930308096 sectors</FONT></DI=
V><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" L=
ETTERSPACING=3D"0" KERNING=3D"0">Units =3D sectors of 1 * 512 =3D 512 bytes=
</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D=
"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Sector size (logical/physical):=
 512 bytes / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdan=
a" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">I/O size =
(minimum/optimal): 512 bytes / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><F=
ONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNI=
NG=3D"0">Disk identifier: 0x00000000</FONT></DIV><FONT FACE=3D"Verdana" SIZ=
E=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV=
 ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERS=
PACING=3D"0" KERNING=3D"0">Disk /dev/mapper/system-home doesn't contain a v=
alid partition table</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D=
"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT">=
<FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KER=
NING=3D"0">Disk /dev/mapper/system-root: 21.5 GB, 21474836480 bytes</FONT><=
/DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000=
" LETTERSPACING=3D"0" KERNING=3D"0">255 heads, 63 sectors/track, 2610 cylin=
ders, total 41943040 sectors</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"=
Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Uni=
ts =3D sectors of 1 * 512 =3D 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FO=
NT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNIN=
G=3D"0">Sector size (logical/physical): 512 bytes / 512 bytes</FONT></DIV><=
DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETT=
ERSPACING=3D"0" KERNING=3D"0">I/O size (minimum/optimal): 512 bytes / 512 b=
ytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLO=
R=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk identifier: 0x00000000=
</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPAC=
ING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdan=
a" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk /dev=
/mapper/system-root doesn't contain a valid partition table</FONT></DIV><FO=
NT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNIN=
G=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" CO=
LOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk /dev/mapper/system-s=
wap: 2147 MB, 2147483648 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=
=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"=
>255 heads, 63 sectors/track, 261 cylinders, total 4194304 sectors</FONT></=
DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000"=
 LETTERSPACING=3D"0" KERNING=3D"0">Units =3D sectors of 1 * 512 =3D 512 byt=
es</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Sector size (logical/physica=
l): 512 bytes / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Ver=
dana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">I/O si=
ze (minimum/optimal): 512 bytes / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"=
><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KE=
RNING=3D"0">Disk identifier: 0x00000000</FONT></DIV><FONT FACE=3D"Verdana" =
SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><=
DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETT=
ERSPACING=3D"0" KERNING=3D"0">Disk /dev/mapper/system-swap doesn't contain =
a valid partition table</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEF=
T"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" =
KERNING=3D"0">Disk /dev/mapper/OLDhdd-OLD: 984.0 GB, 984021467136 bytes</FO=
NT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#00=
0000" LETTERSPACING=3D"0" KERNING=3D"0">255 heads, 63 sectors/track, 119633=
 cylinders, total 1921916928 sectors</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT =
FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">Units =3D sectors of 1 * 512 =3D 512 bytes</FONT></DIV><DIV ALIGN=3D=
"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D=
"0" KERNING=3D"0">Sector size (logical/physical): 512 bytes / 512 bytes</FO=
NT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#00=
0000" LETTERSPACING=3D"0" KERNING=3D"0">I/O size (minimum/optimal): 512 byt=
es / 512 bytes</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Disk identifier:=
 0x00000000</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000"=
 LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FAC=
E=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0=
">Disk /dev/mapper/OLDhdd-OLD doesn't contain a valid partition table</FONT=
></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D=
"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZ=
E=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;# cat /pr=
oc/partitions</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">major minor&nbsp=
; #blocks&nbsp; name</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D=
"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT">=
<FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KER=
NING=3D"0">&nbsp;&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;=
 488386584 sda</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;&nbsp; 8&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp; 159744 s=
da1</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;&nbsp; 8&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; 488225792 sda2</FONT></DIV><DIV ALIGN=
=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=
=3D"0" KERNING=3D"0">&nbsp;&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16&=
nbsp; 976762584 sdb</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" =
SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;&nbsp;=
 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 722=
61 sdb1</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" C=
OLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;&nbsp; 8&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 18&nbsp;&nbsp; 15727635 sdb2</FONT></DIV><DIV AL=
IGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPAC=
ING=3D"0" KERNING=3D"0">&nbsp;&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
19&nbsp; 960960105 sdb3</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verda=
na" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;25=
3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 465154048 dm-0</FONT></=
DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000"=
 LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 1&nbsp;&nbsp; 20971520 dm-1</FONT></DIV><DIV ALIGN=3D"LEFT"><FO=
NT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNIN=
G=3D"0">&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&n=
bsp; 2097152 dm-2</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SI=
ZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;253&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; 960958464 dm-3</FONT></DIV><F=
ONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNI=
NG=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" C=
OLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;# cat /etc/fstab</=
FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#=
000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/system/swap&nbsp;&nbsp;&nbsp=
;&nbsp; swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 0 0</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/system/root=
&nbsp;&nbsp;&nbsp;&nbsp; /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext4&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl,user_xattr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 1 1</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SI=
ZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/disk/by-i=
d/ata-WDC_WD5000AADS-00S9B0_WD-WCAV9A100021-part1 /boot&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext4=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl,user_xattr&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 1 2</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdan=
a" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/syst=
em/home&nbsp;&nbsp;&nbsp;&nbsp; /home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ext4&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; acl,user_xattr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1 2</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLO=
R=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">proc&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 =
0</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">sysfs&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; sysfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; noauto&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 0 0</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COL=
OR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">debugfs&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys/kernel/deb=
ug&nbsp;&nbsp;&nbsp; debugfs&nbsp;&nbsp;&nbsp; noauto&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0</F=
ONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#0=
00000" LETTERSPACING=3D"0" KERNING=3D"0">usbfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /proc/bus/usb=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usbfs&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; noauto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 0 0</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D=
"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">de=
vpts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; devpts&nbsp;&nbsp;&nbsp;&nbsp; mode=3D0620,gid=3D5&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0</FONT></DIV><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV =
ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSP=
ACING=3D"0" KERNING=3D"0">&nbsp;# mount</FONT></DIV><DIV ALIGN=3D"LEFT"><FO=
NT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNIN=
G=3D"0">devtmpfs on /dev type devtmpfs (rw,relatime,size=3D1985000k,nr_inod=
es=3D496250,mode=3D755)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verda=
na" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">tmpfs on=
 /dev/shm type tmpfs (rw,relatime)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FA=
CE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"=
0">devpts on /dev/pts type devpts (rw,relatime,gid=3D5,mode=3D620,ptmxmode=
=3D000)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" C=
OLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/mapper/system-root =
on / type ext4 (rw,relatime,user_xattr,acl,barrier=3D1,data=3Dordered)</FON=
T></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000=
000" LETTERSPACING=3D"0" KERNING=3D"0">proc on /proc type proc (rw,relatime=
)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">sysfs on /sys type sysfs (rw=
,relatime)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2=
" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">debugfs on /sys/kerne=
l/debug type debugfs (rw,relatime)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FA=
CE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"=
0">/dev/sda1 on /boot type ext4 (rw,relatime,user_xattr,acl,barrier=3D1,dat=
a=3Dordered)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D=
"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/dev/mapper/system-=
home on /home type ext4 (rw,relatime,user_xattr,acl,barrier=3D1,data=3Dorde=
red)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLO=
R=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">securityfs on /sys/kernel/s=
ecurity type securityfs (rw,relatime)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT=
 FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">nfsd on /proc/fs/nfsd type nfsd (rw,relatime)</FONT></DIV><DIV ALIGN=
=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=
=3D"0" KERNING=3D"0">rpc_pipefs on /var/lib/nfs/rpc_pipefs type rpc_pipefs =
(rw,relatime)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">gvfs-fuse-daemon=
 on /home/borelli/.gvfs type fuse.gvfs-fuse-daemon (rw,nosuid,nodev,relatim=
e,user_id=3D1000,group_id=3D100)</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=
=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"=
>fusectl on /sys/fs/fuse/connections type fusectl (rw,relatime)</FONT></DIV=
><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KE=
RNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2=
" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp;# pvscan </FONT=
></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#0000=
00" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; /dev/sdc: open failed: No medi=
um found</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" =
COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; /dev/sdc: open f=
ailed: No medium found</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdan=
a" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; Co=
uldn't find device with uuid CSGXpY-YEJ7-4qsf-KtdC-ft1u-IOaN-QSecuY.</FONT>=
</DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#00000=
0" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; PV /dev/sdb3&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; VG OLDhdd&nbsp;&nbsp; lvm2 [916.44 GiB / 0&nbsp;&nb=
sp;&nbsp; free]</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; PV /dev/s=
db2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG system&nbsp;&nbsp; lvm2 [1=
5.00 GiB / 0&nbsp;&nbsp;&nbsp; free]</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT =
FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">&nbsp; PV unknown device&nbsp;&nbsp; VG system&nbsp;&nbsp; lvm2 [916=
.44 GiB / 0&nbsp;&nbsp;&nbsp; free]</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT F=
ACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D=
"0">&nbsp; PV /dev/sda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG system=
&nbsp;&nbsp; lvm2 [465.61 GiB / 0&nbsp;&nbsp;&nbsp; free]</FONT></DIV><DIV =
ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSP=
ACING=3D"0" KERNING=3D"0">&nbsp; Total: 4 [2.26 TiB] / in use: 4 [2.26 TiB]=
 / in no VG: 0 [0&nbsp;&nbsp; ]</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"=
2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIG=
N=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACIN=
G=3D"0" KERNING=3D"0">&nbsp;# vgscan </FONT></DIV><DIV ALIGN=3D"LEFT"><FONT=
 FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">&nbsp; Reading all physical volumes.&nbsp; This may take a while...<=
/FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"=
#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; /dev/sdc: open failed: No=
 medium found</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; Found vol=
ume group &quot;OLDhdd&quot; using metadata type lvm2</FONT></DIV><DIV ALIG=
N=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACIN=
G=3D"0" KERNING=3D"0">&nbsp; /dev/sdc: open failed: No medium found</FONT><=
/DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000=
" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; Couldn't find device with uuid C=
SGXpY-YEJ7-4qsf-KtdC-ft1u-IOaN-QSecuY.</FONT></DIV><DIV ALIGN=3D"LEFT"><FON=
T FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">&nbsp; Found volume group &quot;system&quot; using metadata type lvm=
2</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; Found volume group &q=
uot;system&quot; using metadata type lvm2</FONT></DIV><FONT FACE=3D"Verdana=
" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"><br></FONT=
><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LE=
TTERSPACING=3D"0" KERNING=3D"0">&nbsp;# lvscan </FONT></DIV><DIV ALIGN=3D"L=
EFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0=
" KERNING=3D"0">&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; '/dev/OLDhdd/OLD' [916.44 GiB] inherit</FONT></DIV><DI=
V ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTER=
SPACING=3D"0" KERNING=3D"0">&nbsp; /dev/sdc: open failed: No medium found</=
FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#=
000000" LETTERSPACING=3D"0" KERNING=3D"0">&nbsp; Couldn't find device with =
uuid CSGXpY-YEJ7-4qsf-KtdC-ft1u-IOaN-QSecuY.</FONT></DIV><DIV ALIGN=3D"LEFT=
"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" K=
ERNING=3D"0">&nbsp; inactive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; '/dev/system/home' [895.00 GiB] inherit</FONT></DIV><DIV ALIGN=3D"L=
EFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0=
" KERNING=3D"0">&nbsp; inactive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; '/dev/system/root' [34.44 GiB] inherit</FONT></DIV><DIV ALIGN=3D=
"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D=
"0" KERNING=3D"0">&nbsp; inactive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; '/dev/system/swap' [2.00 GiB] inherit</FONT></DIV><FONT FACE=
=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0"=
><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"=
#000000" LETTERSPACING=3D"0" KERNING=3D"0">I thought I was doing a simple i=
nstall to a new disk. I use openSUSE and I thougt that I could install with=
 the old disk unplugged then plug in the old disk and boot the new system t=
hen access the old home partition to retrieve my data, settings, etc.</FONT=
></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D=
"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZ=
E=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">The Partitoiner=
 in Yast tells me that it will not mount a partition with unknown or non-ex=
istent file system. I'm pretty sure the filesystem is still there and I wan=
t to be careful to keep it intact. I'm not practiced enough to go it on my =
own.</FONT></DIV><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTER=
SPACING=3D"0" KERNING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Ve=
rdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">/sda =
is my new disk 500 Gib it is working correctly as far as I can tell.</FONT>=
</DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#00000=
0" LETTERSPACING=3D"0" KERNING=3D"0">/sdb is my old disk and /sdb3 is the p=
artition I want to mount.</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Ver=
dana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">in pvs=
can there is a mistake where there is only 1.5 Tib disk space in my machine=
.</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=
=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">I used Yast Partitioner to c=
hange the Volume Group names I think.</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT=
 FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">I'm still a little unclear about the distinction between PVs and LVs=
 and VGs, but I'm starting to get it.</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT=
 FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">I'm paranoid to try anything else lest I lose my data.</FONT></DIV><=
FONT FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERN=
ING=3D"0"><br></FONT><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=3D"2" =
COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">Anyway, whatever help I=
 can get would be greatly appreciated.</FONT></DIV><DIV ALIGN=3D"LEFT"><FON=
T FACE=3D"Verdana" SIZE=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=
=3D"0">Thanks,</FONT></DIV><DIV ALIGN=3D"LEFT"><FONT FACE=3D"Verdana" SIZE=
=3D"2" COLOR=3D"#000000" LETTERSPACING=3D"0" KERNING=3D"0">AARON</FONT></DI=
V>
------=_Part_19504_11608163.1302800292849--
