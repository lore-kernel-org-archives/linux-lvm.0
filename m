Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0HCTfZo016151
	for <linux-lvm@redhat.com>; Wed, 17 Jan 2007 07:29:41 -0500
Received: from aa013msr.fastwebnet.it (aa013msr.fastwebnet.it [85.18.95.73])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0HCTd9C024967
	for <linux-lvm@redhat.com>; Wed, 17 Jan 2007 07:29:39 -0500
Received: from pr004msr (10.31.174.233) by aa013msr.fastwebnet.it (7.3.105.6)
	id 45A526630058DD65 for linux-lvm@redhat.com;
	Wed, 17 Jan 2007 13:29:32 +0100
Message-ID: <24326319.2035461169036972730.JavaMail.defaultUser@defaultHost>
Date: Wed, 17 Jan 2007 13:29:32 +0100 (CET)
From: <antonio_cecere@fastwebnet.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] (no subject)
Reply-To: antonio_cecere@fastwebnet.it,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi list,

I have a motherboard Intel multicore i686 on fc6Xen. I would want to mount a 
SCSI HDD identical to mine. fdisk -l message:

[root@localhost ~]# fdisk -l

Disk /dev/sda: 80.0 GB, 80026361856 bytes
255 heads, 63 sectors/track, 9729 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   83  Linux
/dev/sda2              14        9729    78043770   8e  Linux LVM

Disk /dev/sdb: 80.0 GB, 80026361856 bytes
255 heads, 63 sectors/track, 9729 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1          13      104391   83  Linux
/dev/sdb2              14        9729    78043770   8e  Linux LVM
[root@localhost ~]# 

What I must write in order to mount the partition sdb2 in /etc/fstab? This is 
the mine /etc/fstab whit the line that I have added, but doesn't work.

/dev/VolGroup00/LogVol00 /                       ext3    defaults        1 1
LABEL=/boot             /boot                   ext3    defaults        1 2
devpts                  /dev/pts                devpts  gid=5,mode=620  0 0
tmpfs                   /dev/shm                tmpfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
sysfs                   /sys                    sysfs   defaults        0 0
/dev/VolGroup00/LogVol01 swap                    swap    defaults        0 0
#This
/dev/sdb2		/mnt/Stefano		ext3 	defaults,user,rw,exec	0 0

Any idea?

Thanks
Antonio
