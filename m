Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kA1HaADm002894
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 12:36:10 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <6.2.3.4.2.20061031144657.04515d00@postoffice.no-ip.com>
References: <6.2.3.4.2.20061031144657.04515d00@postoffice.no-ip.com>
Message-Id: <64ada94d6aed5e23c5fceabb7a8b0669@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] 5 out of 6 Volumes Vanished!
Date: Wed, 1 Nov 2006 11:40:00 -0600
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm not clear on how your LVM volume groups are mapped to the 
underlying devices; and sadly, I'm not that familiar with md or its 
terminology.  What does "inactive" mean?  Your first command suggest 
that /dev/md0 is active, but the second says it is inactive...  In any 
case, if the md devices are not available and your LVM volume groups 
are composed of MD devices, that would explain why you are not seeing 
your volume groups.

You could look are your various LVM backup files (located in 
/etc/lvm/backup/<vg name>), see what devices they are using and check 
whether the system sees those devices...

  brassow

On Oct 31, 2006, at 4:56 PM, Mache Creeger wrote:

>  Most of my volumes have vanished, except for Vol0.� I had 6 volumes 
> set up with lvm.� Vol5 had 600 GB of data running over RAID5 using 
> XFS.�
>
>  Can anyone help.�
>
>  Here are some diagnostics.�
>
>  -- Mache Creeger
>
> # mdadm -A /dev/md0
>  mdadm: device /dev/md0 already active - cannot assemble it
>
>  # cat /proc/mdstat
>  Personalities : [raid6] [raid5] [raid4]
>  md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
>  ����� 1172151808 blocks
>
>  unused devices: <none>
>
>  # more /proc/mdstat
>  Personalities : [raid6] [raid5] [raid4]
>  md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
>  ����� 976791040 blocks
>
>  # mdadm --detail /dev/md0
>  /dev/md0:
>  Version : 00.90.03
>  Creation Time : Sat Apr� 8 10:01:48 2006
>  Raid Level : raid5
>  Device Size : 195358208 (186.31 GiB 200.05 GB)
>  Raid Devices : 6
>  Total Devices : 5
>  Preferred Minor : 0
>  Persistence : Superblock is persistent
>
>  Update Time : Sat Oct 21 22:30:40 2006
>  State : active, degraded
>  Active Devices : 5
>  Working Devices : 5
>  Failed Devices : 0
>  Spare Devices : 0
>
>  Layout : left-symmetric
>  Chunk Size : 256K
>
>  UUID : 0e3284f1:bf1053ea:e580013b:368be46b
>  Events : 0.3090999
>
>  Number�� Major�� Minor�� RaidDevice State
>  0������ 3������ 65������� 0����� active sync�� /dev/hdb1
>  1����� 33������� 1������� 1����� active sync�� /dev/hde1
>  2����� 33������ 65������� 2����� active sync�� /dev/hdf1
>  3����� 34������� 1������� 3����� active sync�� /dev/hdg1
>  4����� 34������ 65������� 4����� active sync�� /dev/hdh1
>  0������ 0������� 0������ 0����� removed
>
>  # more /etc/fstab
>  /dev/VolGroup00/LogVol00 /���������������������� ext3��� 
> defaults������� 1 1
>  LABEL=/boot������������ /boot������������������ ext3��� 
> defaults������� 1 2
>  devpts����������������� /dev/pts��������������� devpts� 
> gid=5,mode=620� 0 0
>  tmpfs������������������ /dev/shm��������������� tmpfs�� 
> defaults������� 0 0
>  /dev/VolGroup04/LogVol04 /opt������������������� ext3��� 
> defaults������� 1 2
>  /dev/VolGroup05/LogVol05 /opt/bigdisk����������� xfs���� 
> defaults������� 1 2
>  proc������������������� /proc������������������ proc��� 
> defaults������� 0 0
>  sysfs������������������ /sys������������������� sysfs�� 
> defaults������� 0 0
>  /dev/VolGroup01/LogVol01 /usr������������������� ext3��� 
> defaults������� 1 2
>  /dev/VolGroup02/LogVol02 /var������������������� ext3��� 
> defaults������� 1 2
>  /dev/VolGroup03/LogVol03 swap������������������� swap��� 
> defaults������� 0 0
>
>  # xfs_repair /dev/VolGroup05/LogVol05
>  /dev/VolGroup05/LogVol05: No such file or directory
>
>  fatal error -- couldn't initialize XFS library
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
