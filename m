Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6G1UlLQ023908
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2007 21:30:47 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.247])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6G1Ugo0005680
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2007 21:30:42 -0400
Received: by an-out-0708.google.com with SMTP id c31so239474ana
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2007 18:30:42 -0700 (PDT)
Message-ID: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
Date: Sun, 15 Jul 2007 20:30:40 -0500
From: "Allan Wolfe" <allan.wolfe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_54603_25531434.1184549440830"
Subject: [linux-lvm] disk recovery - mounting external USB lvm2 volume
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

------=_Part_54603_25531434.1184549440830
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I had a motherboard start to throw hardware errors, so I pulled the disk
with FC6 loaded and did away with the computer.  I have installed the disk
in a USB drive enclosure and am trying to mount it as a usb drive to pull
the data off onto a new computer.   I get the following error when mounting
it:

$ sudo mount -t ext3 /dev/sdb2 /media/other
mount: wrong fs type, bad option, bad superblock on /dev/sdb2,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

$ dmesg | tail
 sdb: sdb1 sdb2
sd 5:0:0:0: Attached scsi disk sdb
sd 5:0:0:0: Attached scsi generic sg2 type 0
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sdb1, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Can't find ext3 filesystem on dev sdb2.
VFS: Can't find ext3 filesystem on dev sdb2.

$ sudo fdisk -l -u /dev/sdb

Disk /dev/sdb: 40.0 GB, 40007761920 bytes
255 heads, 63 sectors/track, 4864 cylinders, total 78140160 sectors
Units = sectors of 1 * 512 = 512 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *          63      208844      104391   83  Linux
/dev/sdb2          208845    78140159    38965657+  8e  Linux LVM


hald can automatically assisted in mounting /dev/sdb1  (/boot).

 I could use some help in understanding how to get the drive mounted since
it was originally an lvm2 volume with ext3 filesystem laid on top of it.
Thanks in advance.

------=_Part_54603_25531434.1184549440830
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I had a motherboard start to throw hardware errors, so I pulled the disk with FC6 loaded and did away with the computer.&nbsp; I have installed the disk in a USB drive enclosure and am trying to mount it as a usb drive to pull the data off onto a new computer. &nbsp; I get the following error when mounting it:
<br><br>$ sudo mount -t ext3 /dev/sdb2 /media/other<br>mount: wrong fs type, bad option, bad superblock on /dev/sdb2,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; missing codepage or other error<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In some cases useful info is found in syslog - try<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dmesg | tail&nbsp; or so<br><br>$ dmesg | tail<br>&nbsp;sdb: sdb1 sdb2<br>sd 5:0:0:0: Attached scsi disk sdb<br>sd 5:0:0:0: Attached scsi generic sg2 type 0<br>kjournald starting.&nbsp; Commit interval 5 seconds<br>EXT3 FS on sdb1, internal journal
<br>EXT3-fs: mounted filesystem with ordered data mode.<br>VFS: Can&#39;t find ext3 filesystem on dev sdb2.<br>VFS: Can&#39;t find ext3 filesystem on dev sdb2.<br><br>$ sudo fdisk -l -u /dev/sdb<br><br>Disk /dev/sdb: 40.0
 GB, 40007761920 bytes<br>255 heads, 63 sectors/track, 4864 cylinders, total 78140160 sectors<br>Units = sectors of 1 * 512 = 512 bytes<br><br>&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<br>/dev/sdb1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 63&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 208844&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 104391&nbsp;&nbsp; 83&nbsp; Linux
<br>/dev/sdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 208845&nbsp;&nbsp;&nbsp; 78140159&nbsp;&nbsp;&nbsp; 38965657+&nbsp; 8e&nbsp; Linux LVM<br><br><br>hald can automatically assisted in mounting /dev/sdb1&nbsp; (/boot).&nbsp; <br><br>&nbsp;I could use some help in understanding how to get the drive mounted since it was originally an lvm2 volume with ext3 filesystem laid on top of it.&nbsp; Thanks in advance.
<br><br>

------=_Part_54603_25531434.1184549440830--
