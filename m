Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBGHFsqa023022
	for <linux-lvm@redhat.com>; Sat, 16 Dec 2006 12:15:54 -0500
Received: from x8.develooper.com (x8.develooper.com [216.52.237.208])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBGHFrGP003669
	for <linux-lvm@redhat.com>; Sat, 16 Dec 2006 12:15:54 -0500
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Message-Id: <E8CF7DA6-A3E9-46A3-B8C5-BF5F3BB08571@develooper.com>
From: =?ISO-8859-1?Q?Ask_Bj=F8rn_Hansen?= <ask@develooper.com>
Date: Sat, 16 Dec 2006 09:15:47 -0800
Subject: [linux-lvm] FC6: pvmove gives "device-mapper: reload ioctl failed:
	Invalid argument"
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I'm trying to use pvmove to move a vg from one pv to another.

This is with whatever is the latest version of the kernel and lvm  
tools on FC6,

[root@zaphod /]# lvm version
   LVM version:     2.02.06 (2006-05-12)
   Library version: 1.02.07 (2006-05-11)
   Driver version:  4.7.0
[root@zaphod /]# uname -a
Linux zaphod 2.6.18-1.2849.fc6 #1 SMP Fri Nov 10 12:34:46 EST 2006  
x86_64 x86_64 x86_64 GNU/Linux

The "rbig" volume group is on both /dev/13 (full) and /dev/md8 (same  
size, empty) and a few others.

[root@zaphod /]# pvmove -v /dev/md13 /dev/md8
     Wiping cache of LVM-capable devices
     Finding volume group "rbig"
     Archiving volume group "rbig" metadata (seqno 53).
     Creating logical volume pvmove0
     Moving 2560 extents of logical volume rbig/mirrors
     Moving 29319 extents of logical volume rbig/backup
     Moving 0 extents of logical volume rbig/video
     Found volume group "rbig"
     Found volume group "rbig"
     Updating volume group metadata
     Creating volume group backup "/etc/lvm/backup/rbig" (seqno 54).
     Found volume group "rbig"
     Found volume group "rbig"
     Suspending rbig-mirrors (253:8)
     Found volume group "rbig"
     Found volume group "rbig"
     Suspending rbig-backup (253:9)
     Found volume group "rbig"
     Creating rbig-pvmove0
     Loading rbig-pvmove0 table
   device-mapper: reload ioctl failed: Invalid argument
   ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
     Found volume group "rbig"
     Loading rbig-pvmove0 table
   device-mapper: reload ioctl failed: Invalid argument
     Loading rbig-mirrors table
   device-mapper: reload ioctl failed: Invalid argument
     Found volume group "rbig"
     Loading rbig-pvmove0 table
   device-mapper: reload ioctl failed: Invalid argument
     Loading rbig-backup table
   device-mapper: reload ioctl failed: Invalid argument

dmesg says:

device-mapper: mirror log: unrecognised sync argument to mirror log: 2
device-mapper: table: 253:10: mirror: Error creating mirror dirty log
device-mapper: ioctl: error adding target to table
device-mapper: mirror log: unrecognised sync argument to mirror log: 2
device-mapper: table: 253:10: mirror: Error creating mirror dirty log
device-mapper: ioctl: error adding target to table
device-mapper: table: device 253:10 too small for target
device-mapper: table: 253:8: linear: dm-linear: Device lookup failed
device-mapper: ioctl: error adding target to table
device-mapper: mirror log: unrecognised sync argument to mirror log: 2
device-mapper: table: 253:10: mirror: Error creating mirror dirty log
device-mapper: ioctl: error adding target to table
device-mapper: table: device 253:10 too small for target
device-mapper: table: 253:9: linear: dm-linear: Device lookup failed
device-mapper: ioctl: error adding target to table


pvmove --abort sometimes locks up the lvm subsystem (or the device- 
mapper, I've no idea how it works) requiring a reboot.  Sometimes it  
seems to work and lets me try the pvmove again.

Any ideas?


   - ask

-- 
http://develooper.com/ - http://askask.com/
