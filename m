Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA1MW7oG004866
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 17:32:07 -0500
Received: from sccrmhc13.comcast.net (sccrmhc13.comcast.net [204.127.200.83])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kA1MW1sA029170
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 17:32:01 -0500
Message-Id: <6.2.3.4.2.20061101143040.07042530@postoffice.no-ip.com>
Date: Wed, 01 Nov 2006 14:31:53 -0800
From: Mache Creeger <mache@creeger.com>
Subject: Re: [linux-lvm] 5 out of 6 Volumes Vanished!
In-Reply-To: <64ada94d6aed5e23c5fceabb7a8b0669@redhat.com>
References: <6.2.3.4.2.20061031144657.04515d00@postoffice.no-ip.com>
	<64ada94d6aed5e23c5fceabb7a8b0669@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_601282593==.ALT"
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

--=====================_601282593==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

I understand about the md issue, but that only addresses Vol05 and 
does not address the other volumes that are gone.  Any ideas about 
Vol01 to Vol04?

-- Mache

At 09:40 AM 11/1/2006, Jonathan E Brassow wrote:
>I'm not clear on how your LVM volume groups are mapped to the 
>underlying devices; and sadly, I'm not that familiar with md or its 
>terminology.  What does "inactive" mean?  Your first command suggest 
>that /dev/md0 is active, but the second says it is inactive...  In 
>any case, if the md devices are not available and your LVM volume 
>groups are composed of MD devices, that would explain why you are 
>not seeing your volume groups.
>
>You could look are your various LVM backup files (located in 
>/etc/lvm/backup/<vg name>), see what devices they are using and 
>check whether the system sees those devices...
>
>  brassow
>
>On Oct 31, 2006, at 4:56 PM, Mache Creeger wrote:
>
>>  Most of my volumes have vanished, except for Vol0.  I had 6 
>> volumes set up with lvm.  Vol5 had 600 GB of data running over 
>> RAID5 using XFS.
>>
>>  Can anyone help.
>>
>>  Here are some diagnostics.
>>
>>  -- Mache Creeger
>>
>># mdadm -A /dev/md0
>>  mdadm: device /dev/md0 already active - cannot assemble it
>>
>>  # cat /proc/mdstat
>>  Personalities : [raid6] [raid5] [raid4]
>>  md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
>>        1172151808 blocks
>>
>>  unused devices: <none>
>>
>>  # more /proc/mdstat
>>  Personalities : [raid6] [raid5] [raid4]
>>  md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
>>        976791040 blocks
>>
>>  # mdadm --detail /dev/md0
>>  /dev/md0:
>>  Version : 00.90.03
>>  Creation Time : Sat Apr  8 10:01:48 2006
>>  Raid Level : raid5
>>  Device Size : 195358208 (186.31 GiB 200.05 GB)
>>  Raid Devices : 6
>>  Total Devices : 5
>>  Preferred Minor : 0
>>  Persistence : Superblock is persistent
>>
>>  Update Time : Sat Oct 21 22:30:40 2006
>>  State : active, degraded
>>  Active Devices : 5
>>  Working Devices : 5
>>  Failed Devices : 0
>>  Spare Devices : 0
>>
>>  Layout : left-symmetric
>>  Chunk Size : 256K
>>
>>  UUID : 0e3284f1:bf1053ea:e580013b:368be46b
>>  Events : 0.3090999
>>
>>  Number   Major   Minor   RaidDevice State
>>  0       3       65        0      active sync   /dev/hdb1
>>  1      33        1        1      active sync   /dev/hde1
>>  2      33       65        2      active sync   /dev/hdf1
>>  3      34        1        3      active sync   /dev/hdg1
>>  4      34       65        4      active sync   /dev/hdh1
>>  0       0        0       0      removed
>>
>>  # more /etc/fstab
>>  /dev/VolGroup00/LogVol00 
>> /                       ext3    defaults        1 1
>>  LABEL=/boot             /boot                   ext3    defaults        1 2
>>  devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
>>  tmpfs                   /dev/shm                tmpfs   defaults        0 0
>>  /dev/VolGroup04/LogVol04 
>> /opt                    ext3    defaults        1 2
>>  /dev/VolGroup05/LogVol05 
>> /opt/bigdisk            xfs     defaults        1 2
>>  proc                    /proc                   proc    defaults        0 0
>>  sysfs                   /sys                    sysfs   defaults        0 0
>>  /dev/VolGroup01/LogVol01 
>> /usr                    ext3    defaults        1 2
>>  /dev/VolGroup02/LogVol02 
>> /var                    ext3    defaults        1 2
>>  /dev/VolGroup03/LogVol03 
>> swap                    swap    defaults        0 0
>>
>>  # xfs_repair /dev/VolGroup05/LogVol05
>>  /dev/VolGroup05/LogVol05: No such file or directory
>>
>>  fatal error -- couldn't initialize XFS library
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--=====================_601282593==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
<font size=3>I understand about the md issue, but that only addresses
Vol05 and does not address the other volumes that are gone.&nbsp; Any
ideas about Vol01 to Vol04?<br><br>
-- Mache<br><br>
At 09:40 AM 11/1/2006, Jonathan E Brassow wrote:<br>
<blockquote type=cite class=cite cite="">I'm not clear on how your LVM
volume groups are mapped to the underlying devices; and sadly, I'm not
that familiar with md or its terminology.&nbsp; What does
&quot;inactive&quot; mean?&nbsp; Your first command suggest that /dev/md0
is active, but the second says it is inactive...&nbsp; In any case, if
the md devices are not available and your LVM volume groups are composed
of MD devices, that would explain why you are not seeing your volume
groups.<br><br>
You could look are your various LVM backup files (located in
/etc/lvm/backup/&lt;vg name&gt;), see what devices they are using and
check whether the system sees those devices...<br><br>
&nbsp;brassow<br><br>
On Oct 31, 2006, at 4:56 PM, Mache Creeger wrote:<br><br>
<blockquote type=cite class=cite cite="">&nbsp;Most of my volumes have
vanished, except for Vol0.&nbsp; I had 6 volumes set up with lvm.&nbsp;
Vol5 had 600 GB of data running over RAID5 using XFS. <br><br>
&nbsp;Can anyone help. <br><br>
&nbsp;Here are some diagnostics. <br><br>
&nbsp;-- Mache Creeger<br><br>
# mdadm -A /dev/md0<br>
&nbsp;mdadm: device /dev/md0 already active - cannot assemble it<br><br>
&nbsp;# cat /proc/mdstat<br>
&nbsp;Personalities : [raid6] [raid5] [raid4]<br>
&nbsp;md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2]
hde1[1]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1172151808 blocks<br><br>
&nbsp;unused devices: &lt;none&gt;<br><br>
&nbsp;# more /proc/mdstat<br>
&nbsp;Personalities : [raid6] [raid5] [raid4]<br>
&nbsp;md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 976791040 blocks<br><br>
&nbsp;# mdadm --detail /dev/md0<br>
&nbsp;/dev/md0:<br>
&nbsp;Version : 00.90.03<br>
&nbsp;Creation Time : Sat Apr&nbsp; 8 10:01:48 2006<br>
&nbsp;Raid Level : raid5<br>
&nbsp;Device Size : 195358208 (186.31 GiB 200.05 GB)<br>
&nbsp;Raid Devices : 6<br>
&nbsp;Total Devices : 5<br>
&nbsp;Preferred Minor : 0<br>
&nbsp;Persistence : Superblock is persistent<br><br>
&nbsp;Update Time : Sat Oct 21 22:30:40 2006<br>
&nbsp;State : active, degraded<br>
&nbsp;Active Devices : 5<br>
&nbsp;Working Devices : 5<br>
&nbsp;Failed Devices : 0<br>
&nbsp;Spare Devices : 0<br><br>
&nbsp;Layout : left-symmetric<br>
&nbsp;Chunk Size : 256K<br><br>
&nbsp;UUID : 0e3284f1:bf1053ea:e580013b:368be46b<br>
&nbsp;Events : 0.3090999<br><br>
&nbsp;Number&nbsp;&nbsp; Major&nbsp;&nbsp; Minor&nbsp;&nbsp; RaidDevice
State<br>
&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdb1<br>
&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hde1<br>
&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdf1<br>
&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdg1<br>
&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdh1<br>
&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
removed<br><br>
&nbsp;# more /etc/fstab<br>
&nbsp;/dev/VolGroup00/LogVol00
/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 1<br>
&nbsp;LABEL=/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
&nbsp;devpts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
devpts&nbsp; gid=5,mode=620&nbsp; 0 0<br>
&nbsp;tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tmpfs&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
0<br>
&nbsp;/dev/VolGroup04/LogVol04
/opt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
&nbsp;/dev/VolGroup05/LogVol05
/opt/bigdisk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
xfs&nbsp;&nbsp;&nbsp;&nbsp;
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 2<br>
&nbsp;proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
proc&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 0<br>
&nbsp;sysfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/sys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
sysfs&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
0<br>
&nbsp;/dev/VolGroup01/LogVol01
/usr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
&nbsp;/dev/VolGroup02/LogVol02
/var&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
&nbsp;/dev/VolGroup03/LogVol03
swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
swap&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 0<br><br>
&nbsp;# xfs_repair /dev/VolGroup05/LogVol05<br>
&nbsp;/dev/VolGroup05/LogVol05: No such file or directory<br><br>
&nbsp;fatal error -- couldn't initialize XFS library<br><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" eudora="autourl">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at
<a href="http://tldp.org/HOWTO/LVM-HOWTO/" eudora="autourl">
http://tldp.org/HOWTO/LVM-HOWTO/</a></blockquote><br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" eudora="autourl">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at
<a href="http://tldp.org/HOWTO/LVM-HOWTO/" eudora="autourl">
http://tldp.org/HOWTO/LVM-HOWTO/</a><br><br>
</font></blockquote></body>
</html>

--=====================_601282593==.ALT--
