Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kA1Md7Mc011194
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 17:39:07 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <6.2.3.4.2.20061101143040.07042530@postoffice.no-ip.com>
References: <6.2.3.4.2.20061031144657.04515d00@postoffice.no-ip.com>
	<64ada94d6aed5e23c5fceabb7a8b0669@redhat.com>
	<6.2.3.4.2.20061101143040.07042530@postoffice.no-ip.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-2--569829822
Message-Id: <c9c75dc7924988c0f8af3da18c9064d3@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] 5 out of 6 Volumes Vanished!
Date: Wed, 1 Nov 2006 16:42:43 -0600
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-2--569829822
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed

What's the output of 'cat /proc/partitions; pvs; vgs; lvs; cat=20
/etc/lvm/backup/Vol01'?

  brassow

On Nov 1, 2006, at 4:31 PM, Mache Creeger wrote:

> I understand about the md issue, but that only addresses Vol05 and=20
> does not address the other volumes that are gone.=A0 Any ideas about=20=

> Vol01 to Vol04?
>
>  -- Mache
>
>  At 09:40 AM 11/1/2006, Jonathan E Brassow wrote:
>> I'm not clear on how your LVM volume groups are mapped to the=20
>> underlying devices; and sadly, I'm not that familiar with md or its=20=

>> terminology.=A0 What does "inactive" mean?=A0 Your first command =
suggest=20
>> that /dev/md0 is active, but the second says it is inactive...=A0 In=20=

>> any case, if the md devices are not available and your LVM volume=20
>> groups are composed of MD devices, that would explain why you are not=20=

>> seeing your volume groups.
>>
>>  You could look are your various LVM backup files (located in=20
>> /etc/lvm/backup/<vg name>), see what devices they are using and check=20=

>> whether the system sees those devices...
>>
>>  =A0brassow
>>
>>  On Oct 31, 2006, at 4:56 PM, Mache Creeger wrote:
>>
>>> =A0Most of my volumes have vanished, except for Vol0.=A0 I had 6 =
volumes=20
>>> set up with lvm.=A0 Vol5 had 600 GB of data running over RAID5 using=20=

>>> XFS.
>>>
>>>  =A0Can anyone help.
>>>
>>>  =A0Here are some diagnostics.
>>>
>>>  =A0-- Mache Creeger
>>>
>>>  # mdadm -A /dev/md0
>>>  =A0mdadm: device /dev/md0 already active - cannot assemble it
>>>
>>>  =A0# cat /proc/mdstat
>>>  =A0Personalities : [raid6] [raid5] [raid4]
>>>  =A0md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2] =
hde1[1]
>>>  =A0=A0=A0=A0=A0=A0 1172151808 blocks
>>>
>>>  =A0unused devices: <none>
>>>
>>>  =A0# more /proc/mdstat
>>>  =A0Personalities : [raid6] [raid5] [raid4]
>>>  =A0md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
>>>  =A0=A0=A0=A0=A0=A0 976791040 blocks
>>>
>>>  =A0# mdadm --detail /dev/md0
>>>  =A0/dev/md0:
>>>  =A0Version : 00.90.03
>>>  =A0Creation Time : Sat Apr=A0 8 10:01:48 2006
>>>  =A0Raid Level : raid5
>>>  =A0Device Size : 195358208 (186.31 GiB 200.05 GB)
>>>  =A0Raid Devices : 6
>>>  =A0Total Devices : 5
>>>  =A0Preferred Minor : 0
>>>  =A0Persistence : Superblock is persistent
>>>
>>>  =A0Update Time : Sat Oct 21 22:30:40 2006
>>>  =A0State : active, degraded
>>>  =A0Active Devices : 5
>>>  =A0Working Devices : 5
>>>  =A0Failed Devices : 0
>>>  =A0Spare Devices : 0
>>>
>>>  =A0Layout : left-symmetric
>>>  =A0Chunk Size : 256K
>>>
>>>  =A0UUID : 0e3284f1:bf1053ea:e580013b:368be46b
>>>  =A0Events : 0.3090999
>>>
>>>  =A0Number=A0=A0 Major=A0=A0 Minor=A0=A0 RaidDevice State
>>>  =A00=A0=A0=A0=A0=A0=A0 3=A0=A0=A0=A0=A0=A0 65=A0=A0=A0=A0=A0=A0=A0 =
0=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hdb1
>>>  =A01=A0=A0=A0=A0=A0 33=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 =
1=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hde1
>>>  =A02=A0=A0=A0=A0=A0 33=A0=A0=A0=A0=A0=A0 65=A0=A0=A0=A0=A0=A0=A0 =
2=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hdf1
>>>  =A03=A0=A0=A0=A0=A0 34=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 =
3=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hdg1
>>>  =A04=A0=A0=A0=A0=A0 34=A0=A0=A0=A0=A0=A0 65=A0=A0=A0=A0=A0=A0=A0 =
4=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hdh1
>>>  =A00=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0 =
0=A0=A0=A0=A0=A0 removed
>>>
>>>  =A0# more /etc/fstab
>>>  =A0/dev/VolGroup00/LogVol00 /=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 1 1
>>>  =A0LABEL=3D/boot=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/boot=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0=20=

>>> defaults=A0=A0=A0=A0=A0=A0=A0 1 2
>>>  =A0devpts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/dev/pts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 devpts=A0=20
>>> gid=3D5,mode=3D620=A0 0 0
>>>  =A0tmpfs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/dev/shm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tmpfs=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 0 0
>>>  =A0/dev/VolGroup04/LogVol04 /opt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 1 2
>>>  =A0/dev/VolGroup05/LogVol05 /opt/bigdisk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 xfs=A0=A0=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 1 2
>>>  =A0proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 proc=A0=A0=A0=20=

>>> defaults=A0=A0=A0=A0=A0=A0=A0 0 0
>>>  =A0sysfs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/sys=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysfs=A0=A0=20=

>>> defaults=A0=A0=A0=A0=A0=A0=A0 0 0
>>>  =A0/dev/VolGroup01/LogVol01 /usr=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 1 2
>>>  =A0/dev/VolGroup02/LogVol02 /var=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 1 2
>>>  =A0/dev/VolGroup03/LogVol03 swap=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 swap=A0=A0=A0=20
>>> defaults=A0=A0=A0=A0=A0=A0=A0 0 0
>>>
>>>  =A0# xfs_repair /dev/VolGroup05/LogVol05
>>>  =A0/dev/VolGroup05/LogVol05: No such file or directory
>>>
>>>  =A0fatal error -- couldn't initialize XFS library
>>>
>>>
>>>  _______________________________________________
>>>  linux-lvm mailing list
>>>  linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>  _______________________________________________
>>  linux-lvm mailing list
>>  linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=

--Apple-Mail-2--569829822
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1

What's the output of 'cat /proc/partitions; pvs; vgs; lvs; cat
/etc/lvm/backup/Vol01'?


 brassow


On Nov 1, 2006, at 4:31 PM, Mache Creeger wrote:


<excerpt>I understand about the md issue, but that only addresses
Vol05 and does not address the other volumes that are gone.=A0 Any ideas
about Vol01 to Vol04?


 -- Mache


 At 09:40 AM 11/1/2006, Jonathan E Brassow wrote:

<excerpt>I'm not clear on how your LVM volume groups are mapped to the
underlying devices; and sadly, I'm not that familiar with md or its
terminology.=A0 What does "inactive" mean?=A0 Your first command suggest
that /dev/md0 is active, but the second says it is inactive...=A0 In any
case, if the md devices are not available and your LVM volume groups
are composed of MD devices, that would explain why you are not seeing
your volume groups.


 You could look are your various LVM backup files (located in
/etc/lvm/backup/<<vg name>), see what devices they are using and check
whether the system sees those devices...


 =A0brassow


 On Oct 31, 2006, at 4:56 PM, Mache Creeger wrote:


<excerpt>=A0Most of my volumes have vanished, except for Vol0.=A0 I had =
6
volumes set up with lvm.=A0 Vol5 had 600 GB of data running over RAID5
using XFS.


 =A0Can anyone help.


 =A0Here are some diagnostics.


 =A0-- Mache Creeger


 # mdadm -A /dev/md0

 =A0mdadm: device /dev/md0 already active - cannot assemble it


 =A0# cat /proc/mdstat

 =A0Personalities : [raid6] [raid5] [raid4]

 =A0md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]

 =A0=A0=A0=A0=A0=A0 1172151808 blocks


 =A0unused devices: <<none>


 =A0# more /proc/mdstat

 =A0Personalities : [raid6] [raid5] [raid4]

 =A0md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]

 =A0=A0=A0=A0=A0=A0 976791040 blocks


 =A0# mdadm --detail /dev/md0

 =A0/dev/md0:

 =A0Version : 00.90.03

 =A0Creation Time : Sat Apr=A0 8 10:01:48 2006

 =A0Raid Level : raid5

 =A0Device Size : 195358208 (186.31 GiB 200.05 GB)

 =A0Raid Devices : 6

 =A0Total Devices : 5

 =A0Preferred Minor : 0

 =A0Persistence : Superblock is persistent


 =A0Update Time : Sat Oct 21 22:30:40 2006

 =A0State : active, degraded

 =A0Active Devices : 5

 =A0Working Devices : 5

 =A0Failed Devices : 0

 =A0Spare Devices : 0


 =A0Layout : left-symmetric

 =A0Chunk Size : 256K


 =A0UUID : 0e3284f1:bf1053ea:e580013b:368be46b

 =A0Events : 0.3090999


 =A0Number=A0=A0 Major=A0=A0 Minor=A0=A0 RaidDevice State

 =A00=A0=A0=A0=A0=A0=A0 3=A0=A0=A0=A0=A0=A0 65=A0=A0=A0=A0=A0=A0=A0 =
0=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hdb1

 =A01=A0=A0=A0=A0=A0 33=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 =
1=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hde1

 =A02=A0=A0=A0=A0=A0 33=A0=A0=A0=A0=A0=A0 65=A0=A0=A0=A0=A0=A0=A0 2=A0=A0=A0=
=A0=A0 active sync=A0=A0 /dev/hdf1

 =A03=A0=A0=A0=A0=A0 34=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0 =
3=A0=A0=A0=A0=A0 active sync=A0=A0 /dev/hdg1

 =A04=A0=A0=A0=A0=A0 34=A0=A0=A0=A0=A0=A0 65=A0=A0=A0=A0=A0=A0=A0 4=A0=A0=A0=
=A0=A0 active sync=A0=A0 /dev/hdh1

 =A00=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0 =
0=A0=A0=A0=A0=A0 removed


 =A0# more /etc/fstab

 =A0/dev/VolGroup00/LogVol00 /=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 1 1

 =A0LABEL=3D/boot=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/boot=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 1 2

 =A0devpts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/dev/pts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 devpts=A0
gid=3D5,mode=3D620=A0 0 0

 =A0tmpfs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/dev/shm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tmpfs=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 0 0

 =A0/dev/VolGroup04/LogVol04 /opt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 ext3=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 1 2

 =A0/dev/VolGroup05/LogVol05 /opt/bigdisk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 xfs=A0=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 1 2

 =A0proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 proc=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 0 0

 =A0sysfs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/sys=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysfs=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 0 0

 =A0/dev/VolGroup01/LogVol01 /usr=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 ext3=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 1 2

 =A0/dev/VolGroup02/LogVol02 /var=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 ext3=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 1 2

 =A0/dev/VolGroup03/LogVol03 swap=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 swap=A0=A0=A0
defaults=A0=A0=A0=A0=A0=A0=A0 0 0


 =A0# xfs_repair /dev/VolGroup05/LogVol05

 =A0/dev/VolGroup05/LogVol05: No such file or directory


 =A0fatal error -- couldn't initialize XFS library



 _______________________________________________

 linux-lvm mailing list

 linux-lvm@redhat.com

=
<color><param>0000,0000,EEEE</param>https://www.redhat.com/mailman/listinf=
o/linux-lvm</color>

 read the LVM HOW-TO at
=
<color><param>0000,0000,EEEE</param>http://tldp.org/HOWTO/LVM-HOWTO/</colo=
r>

</excerpt> _______________________________________________

 linux-lvm mailing list

 linux-lvm@redhat.com

=
<color><param>0000,0000,EEEE</param>https://www.redhat.com/mailman/listinf=
o/linux-lvm</color>

 read the LVM HOW-TO at
=
<color><param>0000,0000,EEEE</param>http://tldp.org/HOWTO/LVM-HOWTO/</colo=
r>


</excerpt>_______________________________________________

linux-lvm mailing list

linux-lvm@redhat.com

https://www.redhat.com/mailman/listinfo/linux-lvm

read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</excerpt>=

--Apple-Mail-2--569829822--
