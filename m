Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6HJSrs0007768
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 15:28:53 -0400
Received: from weber.sscnet.ucla.edu (weber.sscnet.ucla.edu [128.97.42.3])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6HJRpUq006781
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 15:28:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by weber.sscnet.ucla.edu (8.14.2/8.14.2) with ESMTP id m6HJRpUY002210
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 12:27:51 -0700 (PDT)
Received: from weber.sscnet.ucla.edu ([127.0.0.1])
	by localhost (weber [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 29467-02 for <linux-lvm@redhat.com>;
	Thu, 17 Jul 2008 12:27:51 -0700 (PDT)
Received: from TimTi-2.local (ip8061f541.host.ucla.edu [128.97.245.65])
	by weber.sscnet.ucla.edu (8.14.2/8.14.2) with ESMTP id m6HJRnRG002083
	for <linux-lvm@redhat.com>; Thu, 17 Jul 2008 12:27:50 -0700 (PDT)
Message-ID: <487F9D36.9080901@cogweb.net>
Date: Thu, 17 Jul 2008 12:27:50 -0700
From: David Liontooth <liontooth@cogweb.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RHEL server 5.2 x86_64 installed to mirrored drive
 fails establish LV
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

In the BIOS of an ASUS DSEB-DG/SAS Intel 5400 Serverboard, I have IDE
set to RAID, and before grub I see the controller reporting the two 80GB
SAS drives function as mirrored drives for /boot and an LVM drive that
will contain root (/) and swap.

During installation of RHEL 5.2 from DVD I select default configuration,
and it gets installed to /dev/mapper/VolGroup00-LogVol00.

On reboot, first thing after grub, I get the "duplicate PV" error
described in http://kbase.redhat.com/faq/FAQ_96_11252.shtm

This means the mirrored drive doesn't actually mirror, so when I install
a new kernel, it gets installed to one of the two mirrored drives. On
reboot, the system may stop at grub> or see only the old kernel.

Booting into Knoppix and recreating the LVM that contains the OS shows a
pristine OS, untouched by my updates.

The mirrored boot partitions are both labeled /boot, but only one of
them gets mounted. RH support says to change the fstab to /dev/sdb1, but
that would seem to defeat the whole purpose of a mirrored drive.

Having booted, I get this on vgscan (verbose below):

#cache/lvmcache.c:799 Found duplicate PV
vcFZMnN4VZzcpn2e24xXVq6EDVvQHLbi: using /dev/sdc2 not /dev/sdb2

I attempted to create a filter, but don't have a /dev/mpath --
suggestions?  This basically renders the system either unupgradable or
unbootable, pick your poison.

Dave

oot@roma:~# l /dev/mapper
total 0
crw------- 1 root root  10, 63 Jul 17 01:03 control
brw-rw---- 1 root disk 253,  0 Jul 17 01:03 VolGroup00-LogVol00
brw-rw---- 1 root disk 253,  1 Jul 17 01:03 VolGroup00-LogVol01

root@roma:~# l /dev/VolGroup00
total 0
lrwxrwxrwx 1 root root 31 Jul 17 01:03 LogVol00 ->
/dev/mapper/VolGroup00-LogVol00
lrwxrwxrwx 1 root root 31 Jul 17 01:03 LogVol01 ->
/dev/mapper/VolGroup00-LogVol01

vgscan -vvvv and grep /dev/sd:

#device/dev-io.c:445 Opened /dev/sdb1 RW O_DIRECT
#device/dev-io.c:134 /dev/sdb1: block size is 1024 bytes
#label/label.c:185 /dev/sdb1: No label detected
#device/dev-io.c:491 Closed /dev/sdb1
#device/dev-io.c:445 Opened /dev/sdb2 RO
#device/dev-io.c:264 /dev/sdb2: size is 156071475 sectors
#device/dev-io.c:491 Closed /dev/sdb2
#device/dev-io.c:264 /dev/sdb2: size is 156071475 sectors
#device/dev-io.c:445 Opened /dev/sdb2 RW O_DIRECT
#device/dev-io.c:134 /dev/sdb2: block size is 512 bytes
#device/dev-io.c:491 Closed /dev/sdb2
#filters/filter-composite.c:31 Using /dev/sdb2
#device/dev-io.c:445 Opened /dev/sdb2 RW O_DIRECT
#device/dev-io.c:134 /dev/sdb2: block size is 512 bytes
#label/label.c:162 /dev/sdb2: lvm2 label detected
#cache/lvmcache.c:655 lvmcache: /dev/sdb2: now orphaned
#format_text/format-text.c:1132 /dev/sdb2: Found metadata at 6656 size
1177 (in area at 4096 size 192512) for VolGroup00
(QFpntF-bLLR-O7OJ-dSkU-H4PV-eeLk-bHvPcu)
#cache/lvmcache.c:655 lvmcache: /dev/sdb2: now in VG VolGroup00
#cache/lvmcache.c:468 lvmcache: /dev/sdb2: setting VolGroup00 VGID to
QFpntFbLLRO7OJdSkUH4PVeeLkbHvPcu
#cache/lvmcache.c:690 lvmcache: /dev/sdb2: VG VolGroup00: Set creation
host to localhost.localdomain.
#device/dev-io.c:491 Closed /dev/sdb2
#device/dev-io.c:445 Opened /dev/sdc RO
#device/dev-io.c:264 /dev/sdc: size is 156301488 sectors
#device/dev-io.c:344 WARNING: /dev/sdc already opened read-only
#device/dev-io.c:521 /dev/sdc: Immediate close attempt while still
referenced
#device/dev-io.c:491 Closed /dev/sdc
#device/dev-io.c:445 Opened /dev/sdc RW O_DIRECT
#device/dev-io.c:134 /dev/sdc: block size is 4096 bytes
#filters/filter.c:123 /dev/sdc: Skipping: Partition table signature found
#device/dev-io.c:491 Closed /dev/sdc
#device/dev-io.c:445 Opened /dev/sdc1 RO
#device/dev-io.c:264 /dev/sdc1: size is 208782 sectors
#device/dev-io.c:491 Closed /dev/sdc1
#device/dev-io.c:264 /dev/sdc1: size is 208782 sectors
#device/dev-io.c:445 Opened /dev/sdc1 RW O_DIRECT
#device/dev-io.c:134 /dev/sdc1: block size is 1024 bytes
#device/dev-io.c:491 Closed /dev/sdc1
#filters/filter-composite.c:31 Using /dev/sdc1
#device/dev-io.c:445 Opened /dev/sdc1 RW O_DIRECT
#device/dev-io.c:134 /dev/sdc1: block size is 1024 bytes
#label/label.c:185 /dev/sdc1: No label detected
#device/dev-io.c:491 Closed /dev/sdc1
#device/dev-io.c:445 Opened /dev/sdc2 RO
#device/dev-io.c:264 /dev/sdc2: size is 156071475 sectors
#device/dev-io.c:491 Closed /dev/sdc2
#device/dev-io.c:264 /dev/sdc2: size is 156071475 sectors
#device/dev-io.c:445 Opened /dev/sdc2 RW O_DIRECT
#device/dev-io.c:134 /dev/sdc2: block size is 512 bytes
#device/dev-io.c:491 Closed /dev/sdc2
#filters/filter-composite.c:31 Using /dev/sdc2
#device/dev-io.c:445 Opened /dev/sdc2 RW O_DIRECT
#device/dev-io.c:134 /dev/sdc2: block size is 512 bytes
#label/label.c:162 /dev/sdc2: lvm2 label detected
#cache/lvmcache.c:799 Found duplicate PV
vcFZMnN4VZzcpn2e24xXVq6EDVvQHLbi: using /dev/sdc2 not /dev/sdb2
#format_text/format-text.c:1132 /dev/sdc2: Found metadata at 6656 size
1177 (in area at 4096 size 192512) for VolGroup00
(QFpntF-bLLR-O7OJ-dSkU-H4PV-eeLk-bHvPcu)
#device/dev-io.c:491 Closed /dev/sdc2
#device/dev-io.c:445 Opened /dev/sdc2 RW O_DIRECT
#device/dev-io.c:134 /dev/sdc2: block size is 512 bytes
#label/label.c:162 /dev/sdc2: lvm2 label detected
#format_text/format-text.c:1132 /dev/sdc2: Found metadata at 6656 size
1177 (in area at 4096 size 192512) for VolGroup00
(QFpntF-bLLR-O7OJ-dSkU-H4PV-eeLk-bHvPcu)
#label/label.c:162 /dev/sdc2: lvm2 label detected
#format_text/format-text.c:1132 /dev/sdc2: Found metadata at 6656 size
1177 (in area at 4096 size 192512) for VolGroup00
(QFpntF-bLLR-O7OJ-dSkU-H4PV-eeLk-bHvPcu)
#format_text/format-text.c:493 Read VolGroup00 metadata (3) from
/dev/sdc2 at 6656 size 1177
#metadata/pv_manip.c:284 /dev/sdc2 0: 0 2319: LogVol00(0:0)
#metadata/pv_manip.c:284 /dev/sdc2 1: 2319 62: LogVol01(0:0)
#device/dev-io.c:491 Closed /dev/sdc2
