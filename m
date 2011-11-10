Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAAG1JUP008566
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2011 11:01:19 -0500
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAAG19Fb006045
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2011 11:01:19 -0500
Received: by mail-wy0-f174.google.com with SMTP id 15so4027676wyh.33
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2011 08:01:18 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 10 Nov 2011 11:01:18 -0500
Message-ID: <CAHkvJJ+dsg3NZcBQWA35D606UhLsQPZqzruzP7N1t2xG8XFL=Q@mail.gmail.com>
From: Hal Martin <hal.martin@gmail.com>
Subject: [linux-lvm] clvmd: activating local vg in cluster fails
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello all,

I have a two node pacemaker/corosync cluster running clvmd. The two
nodes have both local and SAN storage available to them. With DLM and
clvmd running I can activate or deactivate LVs on the SAN VG, but not
on local VG. LVM2 version 2.02.88, lvm.conf locking_type = 3

  --- Volume group ---
  VG Name               system
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  12
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               1.36 TiB
  PE Size               4.00 MiB
  Total PE              356514
  Alloc PE / Size       10752 / 42.00 GiB
  Free  PE / Size       345762 / 1.32 TiB
  VG UUID               hJPs2O-3cMP-B0N4-6MrM-JwTp-K6BZ-3b6qAm

$: vgchange -ay system
  Error locking on node 7c1a14ac: device-mapper: reload ioctl failed:
Invalid argument
  Error locking on node 7c1a14ac: device-mapper: reload ioctl failed:
Invalid argument
  Error locking on node 7c1a14ac: device-mapper: reload ioctl failed:
Invalid argument
  3 logical volume(s) in volume group "system" now active

However I cannot access the logical volumes through
/dev/system/$lvname or /dev/mapper/system-$lvname

lvchange also fails:

$: lvchange -ay /dev/system/swap -vvvv
#lvmcmdline.c:1045         Processing: lvchange -ay /dev/system/swap -vvvv
#config/config.c:996       Setting global/locking_type to 3
#config/config.c:1001       global/wait_for_locks not found in config:
defaulting to 1
#locking/locking.c:271       Cluster locking selected.
#toollib.c:214     Using logical volume(s) on command line
#locking/cluster_locking.c:497       Locking VG V_system CR (VG) (0x1)

...

#metadata/pv_manip.c:327         /dev/sda2 0:      0   5120: host_os(0:0)
#metadata/pv_manip.c:327         /dev/sda2 1:   5120    512: swap(0:0)
#metadata/pv_manip.c:327         /dev/sda2 2:   5632   5120:
backoffice_images(0:0)
#metadata/pv_manip.c:327         /dev/sda2 3:  10752 345762: NULL(0:0)
#lvchange.c:150     Activating logical volume "swap"
#locking/cluster_locking.c:497       Locking LV
hJPs2O3cMPB0N46MrMJwTpK6BZ3b6qAmjwl1xCX0xbNn4vbg4XzQ1lZumelnNf8Y CR
(LV|NONBLOCK) (0x19)
#locking/cluster_locking.c:387   Error locking on node 7c1a14ac:
device-mapper: reload ioctl failed: Invalid argument
#locking/locking.c:396         <backtrace>
#locking/locking.c:465         <backtrace>
#lvchange.c:152         <backtrace>
#lvchange.c:671         <backtrace>
#toollib.c:355         <backtrace>
#mm/memlock.c:389         Unlock: Memlock counters: locked:0
critical:0 daemon:0 suspended:0
#locking/cluster_locking.c:419       Requesting sync names.
#locking/cluster_locking.c:497       Locking VG V_system UN (VG) (0x6)
#cache/lvmcache.c:92         Metadata cache: VG system wiped.
#device/dev-io.c:588         Closed /dev/sda2
#metadata/vg.c:68         Freeing VG system at 0x6fa660.

Thanks,
Hal Martin
