Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0RIPNr6024921
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 13:25:23 -0500
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0RIPE0m020710
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 13:25:15 -0500
Received: from pool-96-249-243-151.nrflva.fios.verizon.net ([96.249.243.151]
	helo=titan)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <lvm@lakedaemon.net>) id 1PiWWw-0009Ag-DH
	for linux-lvm@redhat.com; Thu, 27 Jan 2011 18:25:14 +0000
Received: from [10.16.5.73] (triton.lakedaemon.net [10.16.5.73])
	by titan (Postfix) with ESMTP id 6ABF5166420
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 13:25:12 -0500 (EST)
Message-ID: <4D41B887.2050507@lakedaemon.net>
Date: Thu, 27 Jan 2011 18:25:11 +0000
From: Jason <lvm@lakedaemon.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] guruplug 2.6.37 lvm2 problem
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

All,

I have a small problem that's I've been beating my head against for two 
days.

I've installed debian onto an sdcard according to [1].  This required a 
new U-boot [2].  For grins, I chose encrypted LVM.  It works fine with 
the 2.6.33.3flipflip kernel [3].  However, I'm trying to get 2.6.37 
vanilla to work.

I think I'm almost there except that lvm2 segfaults every time right 
after I enter the password.  So, I jumped into initramfs and ran 'lvm 
pvscan -v -v -v -v' for both kernels.  Here's the output:

### 'lvm pvscan -v -v -v -v' on 2.6.33.3flipflip #######################
(initramfs) lvm pvscan -v -v -v -v
#lvmcmdline.c:1035         Processing: pvscan -v -v -v -v
#lvmcmdline.c:1038         O_DIRECT will be used
#config/config.c:987       Setting global/locking_type to 1
#config/config.c:987       Setting global/wait_for_locks to 1
#locking/locking.c:240       File-based locking selected.
#config/config.c:964       Setting global/locking_dir to /var/lock/lvm
#locking/file_locking.c:235       Locking /var/lock/lvm/P_global WB
#locking/file_locking.c:141         _do_flock /var/lock/lvm/P_global:aux WB
#locking/file_locking.c:141         _do_flock /var/lock/lvm/P_global WB
#locking/file_locking.c:51         _undo_flock /var/lock/lvm/P_global:aux
#filters/filter-persistent.c:56     Wiping cache of LVM-capable devices
#device/dev-cache.c:247         /dev/block/1:0: Already in device cache

...snip...

#device/dev-io.c:487         Opened /dev/dm-0 RO
#device/dev-io.c:260       /dev/dm-0: size is 30820344 sectors
#device/dev-io.c:533         Closed /dev/dm-0
#device/dev-io.c:260       /dev/dm-0: size is 30820344 sectors
#device/dev-io.c:487         Opened /dev/dm-0 RO O_DIRECT
#device/dev-io.c:134         /dev/dm-0: block size is 4096 bytes
#device/dev-io.c:533         Closed /dev/dm-0
#filters/filter-composite.c:31         Using /dev/dm-0
#device/dev-io.c:487         Opened /dev/dm-0 RO O_DIRECT
#device/dev-io.c:134         /dev/dm-0: block size is 4096 bytes
#label/label.c:160       /dev/dm-0: lvm2 label detected
#cache/lvmcache.c:1136         lvmcache: /dev/dm-0: now in VG 
#orphans_lvm2 (#orphans_lvm2)
#format_text/format-text.c:1137         /dev/dm-0: Found metadata at 
6656 size 1158 (in area at 4096 size 192512) for debian (UUID_WAS_HERE)
#cache/lvmcache.c:1136         lvmcache: /dev/dm-0: now in VG debian 
with 1 mdas
#cache/lvmcache.c:923         lvmcache: /dev/dm-0: setting debian VGID 
to UUID_WAS_HERE
#cache/lvmcache.c:1173         lvmcache: /dev/dm-0: VG debian: Set 
creation host to debian.
#device/dev-io.c:533         Closed /dev/dm-0
#device/dev-io.c:487         Opened /dev/ram1 RO

...snip...

#label/label.c:270         Using cached label for /dev/dm-0
#device/dev-io.c:487         Opened /dev/dm-0 RO O_DIRECT
#device/dev-io.c:134         /dev/dm-0: block size is 4096 bytes
#label/label.c:270         Using cached label for /dev/dm-0
#format_text/format-text.c:498         Read debian metadata (3) from 
/dev/dm-0 at 6656 size 1158
#device/dev-io.c:533         Closed /dev/dm-0
#metadata/pv_manip.c:296         /dev/dm-0 0:      0   3592: root(0:0)
#metadata/pv_manip.c:296         /dev/dm-0 1:   3592    170: swap_1(0:0)
   PV /dev/dm-0   VG debian   lvm2 [14.70 GiB / 0    free]
   Total: 1 [14.70 GiB] / in use: 1 [14.70 GiB] / in no VG: 0 [0   ]
#locking/file_locking.c:74       Unlocking /var/lock/lvm/P_global
#locking/file_locking.c:51         _undo_flock /var/lock/lvm/P_global
(initramfs)
########################################################################

And then the failure:

### 'lvm pvscan -v -v -v -v' on 2.6.37 #################################
(initramfs) lvm pvscan -v -v -v -v
#lvmcmdline.c:1035         Processing: pvscan -v -v -v -v
#lvmcmdline.c:1038         O_DIRECT will be used
#config/config.c:987       Setting global/locking_type to 1
#config/config.c:987       Setting global/wait_for_locks to 1
#locking/locking.c:240       File-based locking selected.
#config/config.c:964       Setting global/locking_dir to /var/lock/lvm
#locking/file_locking.c:235       Locking /var/lock/lvm/P_global WB
#locking/file_locking.c:141         _do_flock /var/lock/lvm/P_global:aux WB
#locking/file_locking.c:141         _do_flock /var/lock/lvm/P_global WB
#locking/file_locking.c:51         _undo_flock /var/lock/lvm/P_global:aux
#filters/filter-persistent.c:56     Wiping cache of LVM-capable devices
#device/dev-cache.c:262         /dev/block/253:0: Added to device cache

...snip...

#pvscan.c:134     Walking through all physical volumes
#device/dev-io.c:443         /dev/sda: open failed: No medium found
#filters/filter.c:143         /dev/sda: Skipping: open failed
#device/dev-io.c:487         Opened /dev/dm-0 RO
#device/dev-io.c:260       /dev/dm-0: size is 30820344 sectors
#device/dev-io.c:533         Closed /dev/dm-0
#device/dev-io.c:260       /dev/dm-0: size is 30820344 sectors
#device/dev-io.c:487         Opened /dev/dm-0 RO O_DIRECT
#device/dev-io.c:134         /dev/dm-0: block size is 4096 bytes
#device/dev-io.c:533         Closed /dev/dm-0
#filters/filter-composite.c:31         Using /dev/dm-0
#device/dev-io.c:487         Opened /dev/dm-0 RO O_DIRECT
#device/dev-io.c:134         /dev/dm-0: block size is 4096 bytes
Segmentation fault
(initramfs)
########################################################################

/dev/dm-0 is the decrypted device containing the LVM.

### Versions ###########################################################
(initramfs) lvm version
   LVM version:     2.02.66(2) (2010-05-20)
   Library version: 1.02.48 (2010-05-20)
   Driver version:  4.17.0
(initramfs)
########################################################################

Based on a Gentoo bug [4] and a Debian bug [5], I'm not the first to 
encounter this.  I have tried all combinations of 
CONFIG_SYSFS_DEPRECATED and CONFIG_SYSFS_DEPRECATED_V2, without luck. 
I've also tried --sysinit and --ignorelockingfailure with similar results.

Tracing the lvm2 code, it looks like the segfault may lie in 
lib/label/label.c:107 _find_labeller().  Probably after line 120, 
dev_read() and before line 160, log_very_verbose()...

As I'm fairly new to embedded debian, what's the easiest path to fix 
this?  I'm running out of ideas.  I'd _really_ prefer to keep 2.6.37, 
it's a bragging rights thing...  ;-)

Does anyone know where exactly the error is coming from?  Is there a 
missing sysfs entry?  My desktop (Ubuntu 10.04) runs 2.6.37 fine, but 
with an older lvm2 (2.02.54(1), lib 1.02.39, driver 4.18.0).  Getting a 
coredump out of the initrd is proving difficult...

thanks for any input,

Jason.


[1] 
http://bzed.de/posts/2010/05/installing_debian_on_the_guruplug_server_plus/
[2] http://oinkzwurgl.org/guruplug_uboot
[3] http://oinkzwurgl.org/guruplug_kernel
[4] http://bugs.gentoo.org/show_bug.cgi?id=292833
[5] 
http://www.mail-archive.com/debian-bugs-rc@lists.debian.org/msg221947.html
