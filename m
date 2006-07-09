Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k697OghR006730
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 03:24:42 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.172])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k697OfQB004403
	for <linux-lvm@redhat.com>; Sun, 9 Jul 2006 03:24:42 -0400
Received: by ug-out-1314.google.com with SMTP id o2so653208uge
	for <linux-lvm@redhat.com>; Sun, 09 Jul 2006 00:24:41 -0700 (PDT)
Message-ID: <212696550607090024x3733187fx8b3a2f26b692e020@mail.gmail.com>
Date: Sun, 9 Jul 2006 15:24:41 +0800
From: "zhihang wang" <zhihang.wang@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_522_26300970.1152429881373"
Subject: [linux-lvm] why can create the volumn group by vgcreate ?
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

------=_Part_522_26300970.1152429881373
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The partition of my hard disk is as follows:
Disk /dev/hda: 60.0 GB, 60011642880 bytes
255 heads, 63 sectors/track, 7296 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1        3825    30724281    c  W95 FAT32 (LBA)
/dev/hda2            3826        6938    25005172+  8e  Linux LVM
/dev/hda3            7210        7296      698827+   5  Extended
/dev/hda4            6939        7209     2176807+  83  Linux
/dev/hda5            7210        7296      698796   82  Linux swap / Solaris

Partition table entries are not in disk order


I use the pvcreate /dev/hda2 command to create a phyisical volumn
and use pvdisplay /dev/hda2 to display the physical volumn information

sudo pvdisplay /dev/hda2
  --- NEW Physical volume ---
  PV Name               /dev/evms/hda2
  VG Name
  PV Size               23.85 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               kQba0Y-02Lk-VLB8-XhhV-GY1Z-RXEg-J8OXR9


But when I use the *sudo vgcreate test /dev/hda2* command to create a
volumn group, an error occure.
the error message is:
 No physical volume label read from /dev/hda2
  /dev/hda2 not identified as an existing physical volume
  Unable to add physical volume '/dev/hda2' to volume group 'test'.


Why can't find physical volume label from /dev/hda2?


-- 
Best Regards
zhihang wang

------=_Part_522_26300970.1152429881373
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The partition of my hard disk is as follows:<br>Disk /dev/hda: 60.0 GB, 60011642880 bytes<br>255 heads, 63 sectors/track, 7296 cylinders<br>Units = cylinders of 16065 * 512 = 8225280 bytes<br><br>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System
<br>/dev/hda1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3825&nbsp;&nbsp;&nbsp; 30724281&nbsp;&nbsp;&nbsp; c&nbsp; W95 FAT32 (LBA)<br>/dev/hda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3826&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6938&nbsp;&nbsp;&nbsp; 25005172+&nbsp; 8e&nbsp; Linux LVM<br>/dev/hda3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7210&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7296&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 698827+&nbsp;&nbsp; 5&nbsp; Extended<br>/dev/hda4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6939&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7209&nbsp;&nbsp;&nbsp;&nbsp; 2176807+&nbsp; 83&nbsp; Linux
<br>/dev/hda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7210&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7296&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 698796&nbsp;&nbsp; 82&nbsp; Linux swap / Solaris<br><br>Partition table entries are not in disk order<br><br><br>I use the pvcreate /dev/hda2 command to create a phyisical volumn<br>and use pvdisplay /dev/hda2 to display the physical volumn information
<br><br>sudo pvdisplay /dev/hda2<br>&nbsp; --- NEW Physical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/evms/hda2<br>&nbsp; VG Name<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 23.85 GB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0
<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kQba0Y-02Lk-VLB8-XhhV-GY1Z-RXEg-J8OXR9<br><br><br>But when I use the *sudo vgcreate test /dev/hda2* command to create a&nbsp; volumn group, an error occure.
<br>the error message is:<br>&nbsp;No physical volume label read from /dev/hda2<br>&nbsp; /dev/hda2 not identified as an existing physical volume<br>&nbsp; Unable to add physical volume '/dev/hda2' to volume group 'test'.<br><br><br>Why can't find physical volume label from /dev/hda2?
<br><br clear="all"><br>-- <br>Best Regards<br>zhihang wang

------=_Part_522_26300970.1152429881373--
