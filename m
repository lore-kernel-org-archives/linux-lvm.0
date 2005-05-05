Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j45CQoO13493
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 08:26:50 -0400
Received: from cali.ucd.ie (cali.ucd.ie [193.1.169.37])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j45CQi3n024254
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 08:26:44 -0400
Received: from conversion-daemon.cali.ucd.ie by cali.ucd.ie
	(Sun Java System Messaging Server 6.1 HotFix 0.04 (built Sep 29 2004))
	id <0IG000B01NDENQ00@cali.ucd.ie> (original mail from
	colm.connolly@ucd.ie)
	for linux-lvm@redhat.com; Thu, 05 May 2005 13:26:44 +0100 (IST)
Received: from [193.1.133.25] by cali.ucd.ie
	(Sun Java System Messaging Server 6.1 HotFix 0.04 (built Sep 29 2004))
	with ESMTPSA id <0IG000BHRNWJCE80@cali.ucd.ie> for linux-lvm@redhat.com;
	Thu, 05 May 2005 13:26:44 +0100 (IST)
Date: Thu, 05 May 2005 13:26:43 +0100
From: "Colm G. Connolly" <colm.connolly@ucd.ie>
Message-id: <427A1103.7030207@ucd.ie>
MIME-version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] help
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi all,

I've just got a new 250G hard drive and have been trying to add it to an=20
  exitiing lvm2 setup on my system. However, I've screwed something up=20
and now I can't mount the volume which is /dev/HOME_VG/HOME_LV and=20
contains an XFS file system.

My question is this: how I can I restore the original configuration so=20
that I can see the contents of the logical volume?

I've included a transcript of the commands I've run to make this mess.

I'm running

# lvm version
   LVM version:     2.01.04 (2005-02-09)
   Library version: 1.01.00-ioctl (2005-01-17)
   Driver version:  4.4.0

on Linux 2.6.11.7 SMP i686 on a Debian/testing system

The transcript of commands I've run is as follows

   461  pvcreate /dev/hdd
   462  pvscan
   463  mount
   464  vgextend HOME_VG /dev/hdd
   465  pvscan
   466  man xfs_growfs
   467  df -h
   468  xfs_growfs /home

468 didn't work since I hadn't extended the  logical volume.

   469  df -h
   470  pvscan
   471  man pvscan
   472  pvscan -v
   473  pvscan -vv
   474  lvscan
   475  man lvextend
   476  man lvextend
   477  mount
   478  lvextend /dev/HOME_VG/HOME_LV /dev/hdd
   479  lvextend /dev/HOME_VG/HOME_LV
   480  lvextend -L250G /dev/HOME_VG/HOME_LV
   481  lvscan
   482  mount
   483  df -h

At this point I got a bit concerned that I had added 250G to the logical=20
volume but pvdisplay only reported a capicity of 232.88G even though hdd=20
is a 250G hard drive. So I started to try to remove the

   484  lvreduce -L250G /dev/HOME_VG/HOME_LV
   485  lvreduce -L-250G /dev/HOME_VG/HOME_LV

None of these reduction attempts worked. lvreduce complained that it was=20
unable to reduce below 1 extent.

   486  pvdisplay
   487  lvdisplay
   488  lvscan
   489  vgreduce /dev/HOME_VG/HOME_LV /dev/hdd
   490  vgreduce /dev/HOME_VG /dev/hdd
   491  ls /var/lock/lvm/
   492  lvscan
   493  lvdisplay
   494  lvresize
   495  lvresize -L-250G /dev/HOME_VG/HOME_LV
   496  lvreduce -L-250G /dev/HOME_VG/HOME_LV

Neither of these commands worked either.

   497  man lvmchange
   498  man lvs
   499  lvs
   500  pvs
   501  lvmdiskscan
   502  lvmreduce -L -250G /dev/HOME_VG/HOME_LV
   503  /sbin/lvmreduce -L -250G /dev/HOME_VG/HOME_LV
   504  which lvmreduce
   505  which lvm
   506  ls /sbin/lvm*
   507  ls -l /sbin/lvm*
   508  lvreduce -L -250G /dev/HOME_VG/HOME_LV
   509  lvscan
   510  lvmdiskscan
   511  pvdisplay
   512  pvdisplay /dev/hdd
   513  man pvmove
   514  pvmove -v /dev/hdd
   515  man lvchange
   516  lvscan
   517  lvscan -vv
   518  lvreduce -L-250G /dev/HOME_VG/HOME_LV
   519  mount -oro /home
   520  mount
   521  df -h
   522  umount /home
   523  lvscan
   524  lvdisplay
   525  pvdisplay

Up to this point I could mount /dev/HOME_VG/HOME_LV on /home no problem

   526  lvreduce -L -232.88G /dev/HOME_VG/HOME_LV

This command worked and the volume group was reduced. But from now this=20
point on I can no longer mount the volume group

   527  lvscan
   528  lvdisplay
   529  mount -oro /home
   530  lvscan
   531  lvmdiskscan
   532  pvscan
   533  man xfs_repair
   534  man xfs_check
   535  xfs_check /dev/HOME_VG/HOME_LV

can't seek in filesystem at bb 36633600
can't read superblock for ag 30
can't seek in filesystem at bb 37854720
can't read superblock for ag 31

   536  h|grep mount
   537  mount -oro /home

This command reports
mount: /dev/mapper/HOME_VG-HOME_LV: can't read superblock

   538  man vgcfgrestore
   539  cd /etc/lvm/
   540  sl
   541  cd backup/
   542  ls
   543  less HOME_VG
   544  less HOME_VG
   545  man vgcfgrestore
   546  vgcfgrestore -v HOME_VG
   547  mount -o ro /home/

This command reports
mount: /dev/mapper/HOME_VG-HOME_LV: can't read superblock

At this point I've stopped. I can't figure out how to undo the damage=20
I've done. And I really need to recover the original setup. There is=20
stuff on the logical volume for which I have no backup. How I wish I'd=20
taken my own advice and backed the important stuff up.

Right now pvscan reports
   PV /dev/hdc1   VG HOME_VG   lvm2 [9.32 GB / 0    free]
   PV /dev/hda5   VG HOME_VG   lvm2 [8.82 GB / 1.01 GB free]
   PV /dev/hdd    VG HOME_VG   lvm2 [232.88 GB / 232.88 GB free]
   Total: 3 [251.02 GB] / in use: 3 [251.02 GB] / in no VG: 0 [0   ]

and

# lvmdiskscan
   /dev/hda1 [       47.03 MB]
   /dev/hdc1 [        9.32 GB] LVM physical volume
   /dev/hda2 [        8.79 GB]
   /dev/hda3 [     1019.75 MB]
   /dev/hda5 [        8.82 GB] LVM physical volume
   /dev/hdd  [      232.89 GB] LVM physical volume
   /dev/hdb1 [        6.01 GB]
   0 disks
   4 partitions
   1 LVM physical volume whole disk
   2 LVM physical volumes
root@darwin:/etc/lvm/backup# lvs
lvs     lvscan
root@darwin:/etc/lvm/backup# lvscan
   ACTIVE            '/dev/HOME_VG/HOME_LV' [17.12 GB] inherit

root@darwin:/etc/lvm/backup# pvdisplay
   --- Physical volume ---
   PV Name               /dev/hdc1
   VG Name               HOME_VG
   PV Size               9.32 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              2385
   Free PE               0
   Allocated PE          2385
   PV UUID               XzBfoB-cV7O-hIzQ-3Tjn-jam0-IBXw-MJKV5W

   --- Physical volume ---
   PV Name               /dev/hda5
   VG Name               HOME_VG
   PV Size               8.82 GB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              2257
   Free PE               259
   Allocated PE          1998
   PV UUID               NIO6ey-B8gt-APxD-BEOP-cmpd-UCBf-KY2rLB

   --- Physical volume ---
   PV Name               /dev/hdd
   VG Name               HOME_VG
   PV Size               232.88 GB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              59618
   Free PE               59618
   Allocated PE          0
   PV UUID               2hYdvL-9I7I-tz01-Rhza-ZLyp-tsTp-niP5pJ

Any help most gratefully appreciated.

Thanks in advance,

--=20
Colm G. Connolly,		Tel: +353-1-716-2855
Dept. of Computer Science,	Fax: +353-1-269-7262
University College Dublin,	MSN: colmconn@hotmail.com
Belfield, Dublin 4, =EF=BF=BDire.	Web: http://inismor.ucd.ie/~colmconn/
