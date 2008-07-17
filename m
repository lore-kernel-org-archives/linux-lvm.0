Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6HFigG0001646
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 11:44:42 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6HFiVRs013641
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 11:44:31 -0400
Received: by ti-out-0910.google.com with SMTP id 24so3605018tim.7
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 08:44:29 -0700 (PDT)
Message-ID: <d96bd5b70807170844w6d4d445m882e3a00d879f48e@mail.gmail.com>
Date: Thu, 17 Jul 2008 09:44:28 -0600
From: Bo <beowulfnewbee@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2125_31316685.1216309468119"
Subject: [linux-lvm] LVM issue? Checksum warning
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

------=_Part_2125_31316685.1216309468119
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OK, when I boot the system, it shows something like Volume group
"meta..blah" not found. Several messages like this went by fast so I
don't exactly remember.
Can anyone point me to the right direction? The system seem to work
fine. But these messages does not comfort my boss.
Following are some outputs to fdisk and
LVM commands

[root@localhost ~]# fdisk -l
Disk /dev/hda: 40.0 GB, 40020664320 bytes
255 heads, 63 sectors/track, 4865 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1        4864    39070048+   7  HPFS/NTFS

Disk /dev/hdb: 40.0 GB, 40020664320 bytes
255 heads, 63 sectors/track, 4865 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hdb1   *           1          13      104391   83  Linux
/dev/hdb2              14         242     1839442+  82  Linux swap / Solaris
/dev/hdb3             243        4865    37134247+  83  Linux
[root@localhost ~]# lvmdiskscan
  /dev/hda1 [       37.26 GB]
  /dev/hdb1 [      101.94 MB]
  Incorrect metadata area header checksum
  /dev/hdb2 [        1.75 GB] LVM physical volume
  /dev/hdb3 [       35.41 GB]
  0 disks
  3 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume
[root@localhost ~]# pvdisplay
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  --- NEW Physical volume ---
  PV Name               /dev/hdb2
  VG Name
  PV Size               37.17 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               0SmZ7P-44BI-Ls4s-lR2V-Q4Bo-Ah0p-CxWUYe

[root@localhost ~]# lvs
  Incorrect metadata area header checksum
[root@localhost ~]# lvscan
  Incorrect metadata area header checksum
[root@localhost ~]# pvscan
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  PV /dev/hdb2         lvm2 [37.17 GB]
  Total: 1 [37.17 GB] / in use: 0 [0   ] / in no VG: 1 [37.17 GB]
[root@localhost ~]# vgck
  Incorrect metadata area header checksum
[root@localhost ~]# vgdisplay
  Incorrect metadata area header checksum
[root@localhost ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Incorrect metadata area header checksum
[root@localhost ~]#

------=_Part_2125_31316685.1216309468119
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr"><pre>OK, when I boot the system, it shows something like Volume group &quot;meta..blah&quot; not found. Several messages like this went by fast so I don&#39;t exactly remember.<br>Can anyone point me to the right direction? The system seem to work fine. But these messages does not comfort my boss.<br>
Following are some outputs to fdisk and <br>LVM commands<br><br>[root@localhost ~]# fdisk -l<br>Disk /dev/hda: 40.0 GB, 40020664320 bytes<br>255 heads, 63 sectors/track, 4865 cylinders<br>Units = cylinders of 16065 * 512 = 8225280 bytes<br>
<br>   Device Boot      Start         End      Blocks   Id  System<br>/dev/hda1   *           1        4864    39070048+   7  HPFS/NTFS<br><br>Disk /dev/hdb: 40.0 GB, 40020664320 bytes<br>255 heads, 63 sectors/track, 4865 cylinders<br>
Units = cylinders of 16065 * 512 = 8225280 bytes<br><br>   Device Boot      Start         End      Blocks   Id  System<br>/dev/hdb1   *           1          13      104391   83  Linux<br>/dev/hdb2              14         242     1839442+  82  Linux swap / Solaris<br>
/dev/hdb3             243        4865    37134247+  83  Linux<br>[root@localhost ~]# lvmdiskscan<br>  /dev/hda1 [       37.26 GB]<br>  /dev/hdb1 [      101.94 MB]<br>  Incorrect metadata area header checksum<br>  /dev/hdb2 [        1.75 GB] LVM physical volume<br>
  /dev/hdb3 [       35.41 GB]<br>  0 disks<br>  3 partitions<br>  0 LVM physical volume whole disks<br>  1 LVM physical volume<br>[root@localhost ~]# pvdisplay<br>  Incorrect metadata area header checksum<br>  Incorrect metadata area header checksum<br>
  Incorrect metadata area header checksum<br>  Incorrect metadata area header checksum<br>  --- NEW Physical volume ---<br>  PV Name               /dev/hdb2<br>  VG Name<br>  PV Size               37.17 GB<br>  Allocatable           NO<br>
  PE Size (KByte)       0<br>  Total PE              0<br>  Free PE               0<br>  Allocated PE          0<br>  PV UUID               0SmZ7P-44BI-Ls4s-lR2V-Q4Bo-Ah0p-CxWUYe<br><br>[root@localhost ~]# lvs<br>  Incorrect metadata area header checksum<br>
[root@localhost ~]# lvscan<br>  Incorrect metadata area header checksum<br>[root@localhost ~]# pvscan<br>  Incorrect metadata area header checksum<br>  Incorrect metadata area header checksum<br>  Incorrect metadata area header checksum<br>
  PV /dev/hdb2         lvm2 [37.17 GB]<br>  Total: 1 [37.17 GB] / in use: 0 [0   ] / in no VG: 1 [37.17 GB]<br>[root@localhost ~]# vgck<br>  Incorrect metadata area header checksum<br>[root@localhost ~]# vgdisplay<br>  Incorrect metadata area header checksum<br>
[root@localhost ~]# vgscan<br>  Reading all physical volumes.  This may take a while...<br>  Incorrect metadata area header checksum<br>[root@localhost ~]#<br><br></pre></div>

------=_Part_2125_31316685.1216309468119--
