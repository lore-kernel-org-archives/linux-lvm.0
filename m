Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28MbS821549
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 17:37:28 -0500
From: "David Spear" <dspear@telus.net>
Message-ID: <003701c4055e$255af840$6401a8c0@downstairs>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----=_NextPart_000_0038_01C4051B.1737B840"
Subject: [linux-lvm] cannot mount snapshot volumes
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  9 16:48:23 2004
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@sistina.com

This is a multi-part message in MIME format...

------=_NextPart_000_0038_01C4051B.1737B840
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I posted this to comp.os.linux.misc with no takers:
 
I'm running RH9, kernel 2.4.25, LVM 1.0.8.  I have the following disk
setup

4 x 18Gb Compaq  7200rpm SCSI disks, configured as a 100MB software
RAID-1 /boot partition
and a 33Gb software RAID-5 array.  I have one volume group built on the
RAID-5 array, same size.
 
Athlon 2400+ XP CPU
Asus A7N-266 MB
Adaptec 2940UW SCSI adaptor
D-Link G-520 wireless NIC

My logical volumes are as follows:

# lvscan

lvscan -- ACTIVE            "/dev/Volume00/RootVol" [10 GB]
lvscan -- ACTIVE            "/dev/Volume00/SwapVol" [1 GB]
lvscan -- ACTIVE            "/dev/Volume00/HomeVol" [10 GB]
lvscan -- 3 logical volumes with 21 GB total in 1 volume group
lvscan -- 3 active logical volumes

I want to use lvm's snapshot capability to do backups, and have these
backups or a subset thereof available as mounted online volumes.  So I
use:

# lvcreate -s -L 1g -n SnapVol /dev/Volume00/RootVol
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/Volume00/SnapVol"
lvcreate -- doing automatic backup of "Volume00"
lvcreate -- logical volume "/dev/Volume00/SnapVol" successfully created

# lvscan
lvscan -- ACTIVE   Original "/dev/Volume00/RootVol" [10 GB]
lvscan -- ACTIVE            "/dev/Volume00/SwapVol" [1 GB]
lvscan -- ACTIVE            "/dev/Volume00/HomeVol" [10 GB]
lvscan -- ACTIVE   Snapshot "/dev/Volume00/SnapVol" [1008 MB] of
/dev/Volume00/RootVol
lvscan -- 4 logical volumes with 21.98 GB total in 1 volume group
lvscan -- 4 active logical volumes

It all looks good so far.  In fact I can run a "dump 0uf /dev/rmt/0
/dev/Volume00/SnapVol" and it seems to work.  However, I can't seem to
mount
my volume:

# mount /dev/Volume00/Snapvol /tmp/snapvol
mount: block device /dev/Volume00/SnapVol is write-protected, mounting
read-only
mount: wrong fs type, bad option, bad superblock on
/dev/Volume00/SnapVol,
       or too many mounted file systems

Doesn't seem to matter what "-t" option I give, still won't mount.  Root
(/)
is an ext3 journaling filesystem; I've seen posts which indicate
potential
problems with trying to mount snapshots of journaled filesystems but no
definitive answers and/or solutions.
 
Also, every time I use a lv* command I get the following line in
/var/log/messages:
 
Mar  8 13:39:57 explorer modprobe: modprobe: Can't locate module
block-major-43
Mar  8 13:43:53 explorer last message repeated 64 times
 
I faithfully followed the install instructions, built a patch for my
kernel and installed it, recompiled and installed new kernel, compiled
and installed new lvm binaries.
 
Lastly, I seem to see an awful lot of 
 
RAID5: switching cache buffer size, 0 --> 4096
RAID5: switching cache buffer size, 4096 --> 1024
RAID5: switching cache buffer size, 1024 --> 4096
 
ad nauseum in my logfile whenever I have an active snapshot volume.
 
Any assistance greatly appreciated. this system IS working well with the
exception of mounting snapshots.  Thanks for your hard work.
 
Dave

------=_NextPart_000_0038_01C4051B.1737B840--
