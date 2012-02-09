Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q19M062F026216
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2012 17:00:06 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q19M05Jj012691
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2012 17:00:05 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Rvc27-0006eR-JR
	for linux-lvm@redhat.com; Thu, 09 Feb 2012 23:00:03 +0100
Received: from 128.177.18.254 ([128.177.18.254])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 09 Feb 2012 23:00:03 +0100
Received: from pdavies by 128.177.18.254 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 09 Feb 2012 23:00:03 +0100
From: Peter Davies <pdavies@dynazine.com>
Date: Thu, 9 Feb 2012 21:47:33 +0000 (UTC)
Message-ID: <loom.20120209T222900-775@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM locked on md raid with removed disks
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I have md raid 5 which I tried to stop, but that failed.  I pulled the drives
off the SATA bus and re-initialized.  I realized the initial failure to stop
was likely LVM, which I forgot to remove.  LVM is no longer usable on the
system and LVM processes (vgdisplay, vgscan and lvmremove) are so hung they
will not obey a kill -9.  LVM appears deadlocked on /var/lock/lvm/V_vg-raid1.
I really don't want to reboot as it is a KVM virtual host.  Is there any
way to fix this?

lsof | grep md127:[/B]

md127_rai  1419      root  cwd       DIR              253,0        4096
          2 /
md127_rai  1419      root  rtd       DIR              253,0        4096
          2 /
md127_rai  1419      root  txt   unknown                  
          /proc/1419/exe
vgdisplay 26178      root    4r      BLK              9,127         0t0 
     12181 /dev/md127
vgscan    26297      root    4r      BLK              9,127         0t0
      12181 /dev/md127
lvremove  30269      root    4r      BLK              9,127         0t0
      12181 /dev/md127
vgs       30677      root    4r      BLK              9,127         0t0
      12181 /dev/md127

vgreduce -vvvv --removemissing /dev/mapper/vg--raid1:[/B]

#lvmcmdline.c:1045
Processing: vgreduce -vvvv --removemissing /dev/mapper/vg--raid1
#lvmcmdline.c:1048         O_DIRECT will be used
#config/config.c:996       Setting global/locking_type to 1
#config/config.c:996       Setting global/wait_for_locks to 1
#locking/locking.c:242       File-based locking selected.
#config/config.c:973       Setting global/locking_dir to /var/lock/lvm
#libdm-common.c:462         Preparing SELinux context for /var/lock/lvm to
system_u:object_r:lvm_lock_t:s0.
#libdm-common.c:465         Resetting SELinux context to default value.
#vgreduce.c:246     Finding volume group "vg-raid1"
#locking/file_locking.c:235       Locking /var/lock/lvm/V_vg-raid1 WB
#libdm-common.c:462         Preparing SELinux context for 
/var/lock/lvm/V_vg-raid1 to system_u:object_r:lvm_lock_t:s0.
#locking/file_locking.c:141         _do_flock 
/var/lock/lvm/V_vg-raid1:aux WB
#locking/file_locking.c:141         _do_flock /var/lock/lvm/V_vg-raid1 
WB
^C#locking/file_locking.c:118   CTRL-c detected: giving up waiting for
 lock
#locking/file_locking.c:163   /var/lock/lvm/V_vg-raid1: flock 
failed: Interrupted system call
#locking/file_locking.c:51         _undo_flock /var/lock/lvm/V_vg-raid1:aux
#libdm-common.c:465         Resetting SELinux context to default value.
#locking/file_locking.c:249 <backtrace>
#locking/file_locking.c:290 <backtrace>
#locking/locking.c:396 <backtrace>
#locking/locking.c:465 <backtrace>
#metadata/metadata.c:3927   Can't get lock for vg-raid1
#metadata/vg.c:53         Allocated VG (null) at 0x29d5c90.
#metadata/vg.c:68         Freeing VG (null) at 0x29d5c90.
#vgreduce.c:272     Trying to open VG vg-raid1 for recovery...
#locking/file_locking.c:235       Locking /var/lock/lvm/V_vg-raid1 WB
#libdm-common.c:462         Preparing SELinux context for 
/var/lock/lvm/V_vg-raid1 to
system_u:object_r:lvm_lock_t:s0.
#locking/file_locking.c:141         _do_flock /var/lock/lvm/V_vg-raid1:aux
 WB
#locking/file_locking.c:141         _do_flock /var/lock/lvm/V_vg-raid1
 WB
^C#locking/file_locking.c:118   CTRL-c detected: giving up waiting for
 lock
#locking/file_locking.c:163   /var/lock/lvm/V_vg-raid1: flock failed:
 Interrupted system call
#locking/file_locking.c:51         _undo_flock 
/var/lock/lvm/V_vg-raid1:aux
#libdm-common.c:465         Resetting SELinux context to default value.
#locking/file_locking.c:249 <backtrace>
#locking/file_locking.c:290 <backtrace>
#locking/locking.c:396 <backtrace>
#locking/locking.c:465 <backtrace>
#metadata/metadata.c:3927   Can't get lock for vg-raid1
#metadata/vg.c:53         Allocated VG (null) at 0x29d5f80.
#vgreduce.c:280 <backtrace>
#mm/memlock.c:389
Unlock: Memlock counters: locked:0 critical:0 daemon:0 suspended:0
#activate/fs.c:486         Syncing device names
#locking/file_locking.c:290 <backtrace>
#locking/locking.c:396 <backtrace>
#cache/lvmcache.c:328   Internal error: Attempt to unlock unlocked
VG vg-raid1.
#locking/locking.c:465 <backtrace>
#metadata/vg.c:68         Freeing VG (null) at 0x29d5f80.
