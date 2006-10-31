Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9VMuKc0003248
	for <linux-lvm@redhat.com>; Tue, 31 Oct 2006 17:56:20 -0500
Received: from rwcrmhc12.comcast.net (rwcrmhc12.comcast.net [216.148.227.152])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9VMuIdF030831
	for <linux-lvm@redhat.com>; Tue, 31 Oct 2006 17:56:18 -0500
Message-Id: <6.2.3.4.2.20061031144657.04515d00@postoffice.no-ip.com>
Date: Tue, 31 Oct 2006 14:56:02 -0800
From: Mache Creeger <mache@creeger.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_516327437==.ALT"
Subject: [linux-lvm] 5 out of 6 Volumes Vanished!
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
To: linux-lvm@redhat.com

--=====================_516327437==.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Most of my volumes have vanished, except for Vol0.  I had 6 volumes 
set up with lvm.  Vol5 had 600 GB of data running over RAID5 using XFS.

Can anyone help.

Here are some diagnostics.

-- Mache Creeger

# mdadm -A /dev/md0
mdadm: device /dev/md0 already active - cannot assemble it

# cat /proc/mdstat
Personalities : [raid6] [raid5] [raid4]
md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
       1172151808 blocks

unused devices: <none>

# more /proc/mdstat
Personalities : [raid6] [raid5] [raid4]
md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]
       976791040 blocks

# mdadm --detail /dev/md0
/dev/md0:
Version : 00.90.03
Creation Time : Sat Apr  8 10:01:48 2006
Raid Level : raid5
Device Size : 195358208 (186.31 GiB 200.05 GB)
Raid Devices : 6
Total Devices : 5
Preferred Minor : 0
Persistence : Superblock is persistent

Update Time : Sat Oct 21 22:30:40 2006
State : active, degraded
Active Devices : 5
Working Devices : 5
Failed Devices : 0
Spare Devices : 0

Layout : left-symmetric
Chunk Size : 256K

UUID : 0e3284f1:bf1053ea:e580013b:368be46b
Events : 0.3090999

Number   Major   Minor   RaidDevice State
0       3       65        0      active sync   /dev/hdb1
1      33        1        1      active sync   /dev/hde1
2      33       65        2      active sync   /dev/hdf1
3      34        1        3      active sync   /dev/hdg1
4      34       65        4      active sync   /dev/hdh1
0       0        0       0      removed

# more /etc/fstab
/dev/VolGroup00/LogVol00 /                       ext3    defaults        1 1
LABEL=/boot             /boot                   ext3    defaults        1 2
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
tmpfs                   /dev/shm                tmpfs   defaults        0 0
/dev/VolGroup04/LogVol04 /opt                    ext3    defaults        1 2
/dev/VolGroup05/LogVol05 /opt/bigdisk            xfs     defaults        1 2
proc                    /proc                   proc    defaults        0 0
sysfs                   /sys                    sysfs   defaults        0 0
/dev/VolGroup01/LogVol01 /usr                    ext3    defaults        1 2
/dev/VolGroup02/LogVol02 /var                    ext3    defaults        1 2
/dev/VolGroup03/LogVol03 swap                    swap    defaults        0 0

# xfs_repair /dev/VolGroup05/LogVol05
/dev/VolGroup05/LogVol05: No such file or directory

fatal error -- couldn't initialize XFS library



--=====================_516327437==.ALT
Content-Type: text/html; charset="us-ascii"

<html>
<body>
Most of my volumes have vanished, except for Vol0.&nbsp; I had 6 volumes
set up with lvm.&nbsp; Vol5 had 600 GB of data running over RAID5 using
XFS.&nbsp; <br><br>
Can anyone help.&nbsp; <br><br>
Here are some diagnostics.&nbsp; <br><br>
-- Mache Creeger<br><br>
<font size=3># mdadm -A /dev/md0<br>
mdadm: device /dev/md0 already active - cannot assemble it<br><br>
# cat /proc/mdstat<br>
Personalities : [raid6] [raid5] [raid4]<br>
md0 : inactive hdi1[5](S) hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1172151808 blocks<br><br>
unused devices: &lt;none&gt;<br><br>
# more /proc/mdstat<br>
Personalities : [raid6] [raid5] [raid4]<br>
md0 : inactive hdb1[0] hdh1[4] hdg1[3] hdf1[2] hde1[1]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 976791040 blocks<br><br>
# mdadm --detail /dev/md0<br>
/dev/md0:<br>
Version : 00.90.03<br>
Creation Time : Sat Apr&nbsp; 8 10:01:48 2006<br>
Raid Level : raid5<br>
Device Size : 195358208 (186.31 GiB 200.05 GB)<br>
Raid Devices : 6<br>
Total Devices : 5<br>
Preferred Minor : 0<br>
Persistence : Superblock is persistent<br><br>
Update Time : Sat Oct 21 22:30:40 2006<br>
State : active, degraded<br>
Active Devices : 5<br>
Working Devices : 5<br>
Failed Devices : 0<br>
Spare Devices : 0<br><br>
Layout : left-symmetric<br>
Chunk Size : 256K<br><br>
UUID : 0e3284f1:bf1053ea:e580013b:368be46b<br>
Events : 0.3090999<br><br>
Number&nbsp;&nbsp; Major&nbsp;&nbsp; Minor&nbsp;&nbsp; RaidDevice
State<br>
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdb1<br>
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hde1<br>
2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdf1<br>
3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdg1<br>
4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
65&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active sync&nbsp;&nbsp; /dev/hdh1<br>
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
removed<br><br>
# more /etc/fstab<br>
/dev/VolGroup00/LogVol00
/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 1<br>
LABEL=/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
devpts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/pts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
devpts&nbsp; gid=5,mode=620&nbsp; 0 0<br>
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/shm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tmpfs&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
0<br>
/dev/VolGroup04/LogVol04
/opt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
/dev/VolGroup05/LogVol05
/opt/bigdisk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
xfs&nbsp;&nbsp;&nbsp;&nbsp;
defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 2<br>
proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/proc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
proc&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 0<br>
sysfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/sys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
sysfs&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
0<br>
/dev/VolGroup01/LogVol01
/usr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
/dev/VolGroup02/LogVol02
/var&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ext3&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1 2<br>
/dev/VolGroup03/LogVol03
swap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
swap&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 0<br><br>
# xfs_repair /dev/VolGroup05/LogVol05<br>
/dev/VolGroup05/LogVol05: No such file or directory<br><br>
fatal error -- couldn't initialize XFS library<br><br>
<br>
</font></body>
</html>

--=====================_516327437==.ALT--
