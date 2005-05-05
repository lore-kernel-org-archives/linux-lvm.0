Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j45DGkO26663
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 09:16:46 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j45DGirc003508
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 09:16:44 -0400
Received: from 98.red-83-50-136.pooles.rima-tde.net ([83.50.136.98]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DTgDS-0007QG-00
	for <linux-lvm@redhat.com>; Thu, 05 May 2005 15:16:34 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DTgDE-0007hK-00
	for <linux-lvm@redhat.com>; Thu, 05 May 2005 15:16:20 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] help
Date: Thu, 5 May 2005 15:16:19 +0200
Message-Id: <20050505125502.M61440@pk25.com>
In-Reply-To: <427A1103.7030207@ucd.ie>
References: <427A1103.7030207@ucd.ie>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: LVM general discussion and development <linux-lvm@redhat.com>

your first error: don't made backup.

your second error:=20

# From LVM how to

xfs
There is no way to shrink XFS file systems.=20



If your are touch lvm2 you must know that about 250Gx1000 and 233x1024.

try use xfs_repair -n for see the reparis..

I use (but it is only a personal opinion, this is very dangerous)
(use again the first commands).
vgextend my_volume_group /dev/hdc1
lvextend -L250G /dev/HOME_VG/HOME_LV=20
lvscan

In this point use xfs_repair -n
If you see good, use xfs_repair (pray)....
if you don't have luck try xfs_repair -d (after of this reboot) (read man
xfs_repair)
try to mount. (pray again).....

good luck











On Thu, 05 May 2005 13:26:43 +0100, Colm G. Connolly wrote
> Hi all,
>=20
> I've just got a new 250G hard drive and have been trying to add it=20
> to an   exitiing lvm2 setup on my system. However, I've screwed=20
> something up and now I can't mount the volume which is=20
> /dev/HOME_VG/HOME_LV and contains an XFS file system.
>=20
> My question is this: how I can I restore the original configuration=20
> so that I can see the contents of the logical volume?
>=20
> I've included a transcript of the commands I've run to make this mess.
>=20
> I'm running
>=20
> # lvm version
>    LVM version:     2.01.04 (2005-02-09)
>    Library version: 1.01.00-ioctl (2005-01-17)
>    Driver version:  4.4.0
>=20
> on Linux 2.6.11.7 SMP i686 on a Debian/testing system
>=20
> The transcript of commands I've run is as follows
>=20
>    461  pvcreate /dev/hdd
>    462  pvscan
>    463  mount
>    464  vgextend HOME_VG /dev/hdd
>    465  pvscan
>    466  man xfs_growfs
>    467  df -h
>    468  xfs_growfs /home
>=20
> 468 didn't work since I hadn't extended the  logical volume.
>=20
>    469  df -h
>    470  pvscan
>    471  man pvscan
>    472  pvscan -v
>    473  pvscan -vv
>    474  lvscan
>    475  man lvextend
>    476  man lvextend
>    477  mount
>    478  lvextend /dev/HOME_VG/HOME_LV /dev/hdd
>    479  lvextend /dev/HOME_VG/HOME_LV
>    480  lvextend -L250G /dev/HOME_VG/HOME_LV
>    481  lvscan
>    482  mount
>    483  df -h
>=20
> At this point I got a bit concerned that I had added 250G to the=20
> logical volume but pvdisplay only reported a capicity of 232.88G=20
> even though hdd is a 250G hard drive. So I started to try to remove the
>=20
>    484  lvreduce -L250G /dev/HOME_VG/HOME_LV
>    485  lvreduce -L-250G /dev/HOME_VG/HOME_LV
>=20
> None of these reduction attempts worked. lvreduce complained that it=20
> was unable to reduce below 1 extent.
>=20
>    486  pvdisplay
>    487  lvdisplay
>    488  lvscan
>    489  vgreduce /dev/HOME_VG/HOME_LV /dev/hdd
>    490  vgreduce /dev/HOME_VG /dev/hdd
>    491  ls /var/lock/lvm/
>    492  lvscan
>    493  lvdisplay
>    494  lvresize
>    495  lvresize -L-250G /dev/HOME_VG/HOME_LV
>    496  lvreduce -L-250G /dev/HOME_VG/HOME_LV
>=20
> Neither of these commands worked either.
>=20
>    497  man lvmchange
>    498  man lvs
>    499  lvs
>    500  pvs
>    501  lvmdiskscan
>    502  lvmreduce -L -250G /dev/HOME_VG/HOME_LV
>    503  /sbin/lvmreduce -L -250G /dev/HOME_VG/HOME_LV
>    504  which lvmreduce
>    505  which lvm
>    506  ls /sbin/lvm*
>    507  ls -l /sbin/lvm*
>    508  lvreduce -L -250G /dev/HOME_VG/HOME_LV
>    509  lvscan
>    510  lvmdiskscan
>    511  pvdisplay
>    512  pvdisplay /dev/hdd
>    513  man pvmove
>    514  pvmove -v /dev/hdd
>    515  man lvchange
>    516  lvscan
>    517  lvscan -vv
>    518  lvreduce -L-250G /dev/HOME_VG/HOME_LV
>    519  mount -oro /home
>    520  mount
>    521  df -h
>    522  umount /home
>    523  lvscan
>    524  lvdisplay
>    525  pvdisplay
>=20
> Up to this point I could mount /dev/HOME_VG/HOME_LV on /home no problem
>=20
>    526  lvreduce -L -232.88G /dev/HOME_VG/HOME_LV
>=20
> This command worked and the volume group was reduced. But from now=20
> this point on I can no longer mount the volume group
>=20
>    527  lvscan
>    528  lvdisplay
>    529  mount -oro /home
>    530  lvscan
>    531  lvmdiskscan
>    532  pvscan
>    533  man xfs_repair
>    534  man xfs_check
>    535  xfs_check /dev/HOME_VG/HOME_LV
>=20
> can't seek in filesystem at bb 36633600
> can't read superblock for ag 30
> can't seek in filesystem at bb 37854720
> can't read superblock for ag 31
>=20
>    536  h|grep mount
>    537  mount -oro /home
>=20
> This command reports
> mount: /dev/mapper/HOME_VG-HOME_LV: can't read superblock
>=20
>    538  man vgcfgrestore
>    539  cd /etc/lvm/
>    540  sl
>    541  cd backup/
>    542  ls
>    543  less HOME_VG
>    544  less HOME_VG
>    545  man vgcfgrestore
>    546  vgcfgrestore -v HOME_VG
>    547  mount -o ro /home/
>=20
> This command reports
> mount: /dev/mapper/HOME_VG-HOME_LV: can't read superblock
>=20
> At this point I've stopped. I can't figure out how to undo the=20
> damage I've done. And I really need to recover the original setup.=20
> There is stuff on the logical volume for which I have no backup. How=20
> I wish I'd taken my own advice and backed the important stuff up.
>=20
> Right now pvscan reports
>    PV /dev/hdc1   VG HOME_VG   lvm2 [9.32 GB / 0    free]
>    PV /dev/hda5   VG HOME_VG   lvm2 [8.82 GB / 1.01 GB free]
>    PV /dev/hdd    VG HOME_VG   lvm2 [232.88 GB / 232.88 GB free]
>    Total: 3 [251.02 GB] / in use: 3 [251.02 GB] / in no VG: 0 [0   ]
>=20
> and
>=20
> # lvmdiskscan
>    /dev/hda1 [       47.03 MB]
>    /dev/hdc1 [        9.32 GB] LVM physical volume
>    /dev/hda2 [        8.79 GB]
>    /dev/hda3 [     1019.75 MB]
>    /dev/hda5 [        8.82 GB] LVM physical volume
>    /dev/hdd  [      232.89 GB] LVM physical volume
>    /dev/hdb1 [        6.01 GB]
>    0 disks
>    4 partitions
>    1 LVM physical volume whole disk
>    2 LVM physical volumes
> root@darwin:/etc/lvm/backup# lvs
> lvs     lvscan
> root@darwin:/etc/lvm/backup# lvscan
>    ACTIVE            '/dev/HOME_VG/HOME_LV' [17.12 GB] inherit
>=20
> root@darwin:/etc/lvm/backup# pvdisplay
>    --- Physical volume ---
>    PV Name               /dev/hdc1
>    VG Name               HOME_VG
>    PV Size               9.32 GB / not usable 0
>    Allocatable           yes (but full)
>    PE Size (KByte)       4096
>    Total PE              2385
>    Free PE               0
>    Allocated PE          2385
>    PV UUID               XzBfoB-cV7O-hIzQ-3Tjn-jam0-IBXw-MJKV5W
>=20
>    --- Physical volume ---
>    PV Name               /dev/hda5
>    VG Name               HOME_VG
>    PV Size               8.82 GB / not usable 0
>    Allocatable           yes
>    PE Size (KByte)       4096
>    Total PE              2257
>    Free PE               259
>    Allocated PE          1998
>    PV UUID               NIO6ey-B8gt-APxD-BEOP-cmpd-UCBf-KY2rLB
>=20
>    --- Physical volume ---
>    PV Name               /dev/hdd
>    VG Name               HOME_VG
>    PV Size               232.88 GB / not usable 0
>    Allocatable           yes
>    PE Size (KByte)       4096
>    Total PE              59618
>    Free PE               59618
>    Allocated PE          0
>    PV UUID               2hYdvL-9I7I-tz01-Rhza-ZLyp-tsTp-niP5pJ
>=20
> Any help most gratefully appreciated.
>=20
> Thanks in advance,
>=20
> --=20
> Colm G. Connolly,		Tel: +353-1-716-2855
> Dept. of Computer Science,	Fax: +353-1-269-7262
> University College Dublin,	MSN: colmconn@hotmail.com
> Belfield, Dublin 4, =EF=BF=BDire.	Web: http://inismor.ucd.ie/~colmconn/
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
El otro regalo de los viejos.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
