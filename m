Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i537Fd002995
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 03:15:39 -0400
Received: from smtp805.mail.sc5.yahoo.com (smtp805.mail.sc5.yahoo.com
	[66.163.168.184])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i537Fci5031145
	for <linux-lvm@redhat.com>; Thu, 3 Jun 2004 03:15:39 -0400
From: "Tim Harvey" <tharvey@alumni.calpoly.edu>
Date: Thu, 3 Jun 2004 00:15:30 -0700
Message-ID: <000a01c4493a$8dc78310$7001a8c0@darwin>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Troubling activating and mounting a volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Greetings,

I'm trying to recover data from a couple of RAID arrays that were
created in a system that has died.  The arrays themselves are intact.

I've been able to assemble the arrays and find logical volumes on them,
but I'm not sure how to activate the LG's and mount the volumes.

I've assembled the arrays with 3 out of the 4 disks, which should be
enough to access the data in a RAID1/5 array if I understand things
correctly without allowing RAID reconstruction.  Here is some data from
my progress so far:

[root@masterbackend root]# more /proc/mdstat
Personalities : [raid1] [raid5]
read_ahead 1024 sectors
md1 : active raid1 hdb2[1] hdd2[3] hdc2[2]
      513984 blocks [4/3] [_UUU]

md0 : active raid5 hdb1[1] hdd1[3] hdc1[2]
      872738880 blocks level 5, 32k chunk, algorithm 2 [4/3] [_UUU]

unused devices: <none>

md0 is a RAID5 array which has a VG called 'vgroup00' and an LV called
'storage1'.  md1 is a RAID1 array which as a VG called 'logdev'. 

[root@masterbackend root]# vgdisplay -D
--- Volume group ---
VG Name               vgroup00
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               832.28 GB
PE Size               16 MB
Total PE              53266
Alloc PE / Size       53266 / 832.28 GB
Free  PE / Size       0 / 0
VG UUID               oizRKm-JFUq-hMiZ-rN6F-1M7u-mRDc-vqqy1p

--- Volume group ---
VG Name               logdev
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                2
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               1.46 GB
PE Size               4 MB
Total PE              375
Alloc PE / Size       138 / 552 MB
Free  PE / Size       237 / 948 MB
VG UUID               nCpyXh-5bn4-Qh2W-UlAc-3dyh-zQOT-i33ow8

So far I'm not understanding how to make the VG Status 'available' and
how to mount them.  I now have the following devices:

/dev/vgroup00/storage1 block special (58/2)
/dev/vgroup00/group character special (109/0)
/dev/logdev/storage1 block special (58/1) 
/dev/logdev/syslog block special (58/0) 
/dev/logdev/group character special (109/1)

I believe these are XFS but I still can't mount them via:

[root@masterbackend root]# mount /dev/vgroup00/storage1 /mnt/array/ -t
xfs
mount: wrong fs type, bad option, bad superblock on
/dev/vgroup00/storage1,
       or too many mounted file systems

Any ideas?  I'm not familiar with LVM, but have been googling it.

Thanks for any help,

Tim
