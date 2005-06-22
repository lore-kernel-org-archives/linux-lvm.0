Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5M7kmu29758
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 03:46:48 -0400
Received: from wavehammer.waldi.eu.org (postfix@wavehammer.waldi.eu.org
	[82.139.196.55])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5M7kcFW022802
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 03:46:38 -0400
Date: Wed, 22 Jun 2005 09:46:27 +0200
From: Bastian Blank <waldi@debian.org>
Message-ID: <20050622074627.GA1892@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
Subject: [linux-lvm] lvm2 2.01.12 fails to read lvm1 metadata
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


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks

I got three reports that lvm 2.01.12 can't read lvm1 metadata.

Bastian

----- Forwarded message from Manoj Srivastava <srivasta@debian.org> -----

=46rom: Manoj Srivastava <srivasta@debian.org>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Cc: waldi@debian.org
Subject: lvm2: Fails to recognize physical volumes, causes the whole system=
 to fail
Date: Tue, 21 Jun 2005 11:59:10 -0500
X-Spam-Status: No, score=3D-1.5 required=3D5.0 tests=3DAWL,BAYES_00 autolea=
rn=3Dham=20
	version=3D3.0.4

Package: lvm2
Version: 2.01.12-1
Severity: critical

Hi,

        pvscan fails to recognize lvm1 metadata, causing an unbootable
 system. I have 2 LVM partitions, sending data for each, along with
 detaild pvscan output.

        manoj




Content-Description: pvscan -d -vvvv output
File descriptor 4 left open
File descriptor 5 left open
#lvmcmdline.c:836         Processing: pvscan -d -vvvv
#lvmcmdline.c:839         O_DIRECT will be used
#config/config.c:773       Setting global/locking_type to 1
#config/config.c:758       Setting global/locking_dir to /var/lock/lvm
#locking/locking.c:139       File-based locking enabled.
#filters/filter-persistent.c:56     Wiping cache of LVM-capable devices
#device/dev-cache.c:402         /dev/MAKEDEV: Not a block device
#device/dev-cache.c:402         /dev/adsp: Not a block device
#device/dev-cache.c:402         /dev/agpgart: Not a block device
#device/dev-cache.c:402         /dev/arpd: Not a block device
#device/dev-cache.c:402         /dev/audio: Not a block device
#device/dev-cache.c:228         /dev/backup_vg/backup: Added to device cache
#device/dev-cache.c:228         /dev/backup_vg/scratch: Added to device cac=
he
#device/dev-cache.c:228         /dev/cdrom: Added to device cache
#device/dev-cache.c:225         /dev/cdrw: Aliased to /dev/cdrom in device =
cache
#device/dev-cache.c:402         /dev/console: Not a block device
#device/dev-cache.c:402         /dev/core: Not a block device
#device/dev-cache.c:402         /dev/cpu/0/msr: Not a block device
#device/dev-cache.c:402         /dev/cpu/1/msr: Not a block device
#device/dev-cache.c:402         /dev/dnrtmsg: Not a block device
#device/dev-cache.c:402         /dev/dri/card0: Not a block device
#device/dev-cache.c:402         /dev/dsp: Not a block device
#device/dev-cache.c:225         /dev/dvd: Aliased to /dev/cdrom in device c=
ache
#device/dev-cache.c:225         /dev/dvdrw: Aliased to /dev/cdrom in device=
 cache
#device/dev-cache.c:402         /dev/fb0: Not a block device
#device/dev-cache.c:393         /dev/fd: Symbolic link to directory
#device/dev-cache.c:228         /dev/fd0: Added to device cache
#device/dev-cache.c:402         /dev/full: Not a block device
#device/dev-cache.c:402         /dev/fwmonitor: Not a block device
#device/dev-cache.c:402         /dev/gpmctl: Not a block device
#device/dev-cache.c:402         /dev/gpmdata: Not a block device
#device/dev-cache.c:228         /dev/hda: Added to device cache
#device/dev-cache.c:211         /dev/hda1: Already in device cache
#device/dev-cache.c:211         /dev/hda2: Already in device cache
#device/dev-cache.c:211         /dev/hda3: Already in device cache
#device/dev-cache.c:228         /dev/hda4: Added to device cache
#device/dev-cache.c:211         /dev/hda5: Already in device cache
#device/dev-cache.c:211         /dev/hda6: Already in device cache
#device/dev-cache.c:225         /dev/hdc: Aliased to /dev/cdrom in device c=
ache
#device/dev-cache.c:402         /dev/hpet: Not a block device
#device/dev-cache.c:402         /dev/hwrng: Not a block device
#device/dev-cache.c:402         /dev/i2c-0: Not a block device
#device/dev-cache.c:402         /dev/i2c-1: Not a block device
#device/dev-cache.c:402         /dev/i2c-2: Not a block device
#device/dev-cache.c:402         /dev/i2c-3: Not a block device
#device/dev-cache.c:402         /dev/initctl: Not a block device
#device/dev-cache.c:402         /dev/input/event0: Not a block device
#device/dev-cache.c:402         /dev/input/event1: Not a block device
#device/dev-cache.c:402         /dev/input/event2: Not a block device
#device/dev-cache.c:402         /dev/input/mice: Not a block device
#device/dev-cache.c:402         /dev/input/mouse0: Not a block device
#device/dev-cache.c:402         /dev/ip6_fw: Not a block device
#device/dev-cache.c:402         /dev/kmem: Not a block device
#device/dev-cache.c:402         /dev/kmsg: Not a block device
#device/dev-cache.c:402         /dev/log: Not a block device
#device/dev-cache.c:211         /dev/loop/0: Already in device cache
#device/dev-cache.c:211         /dev/loop0: Already in device cache
#device/dev-cache.c:211         /dev/loop1: Already in device cache
#device/dev-cache.c:228         /dev/loop2: Added to device cache
#device/dev-cache.c:228         /dev/loop3: Added to device cache
#device/dev-cache.c:228         /dev/loop4: Added to device cache
#device/dev-cache.c:228         /dev/loop5: Added to device cache
#device/dev-cache.c:228         /dev/loop6: Added to device cache
#device/dev-cache.c:228         /dev/loop7: Added to device cache
#device/dev-cache.c:402         /dev/lp0: Not a block device
#device/dev-cache.c:402         /dev/lvm: Not a block device
#device/dev-cache.c:228         /dev/main_vg/home_lv: Added to device cache
#device/dev-cache.c:228         /dev/main_vg/spool_lv: Added to device cache
#device/dev-cache.c:228         /dev/main_vg/ulocal_lv: Added to device cac=
he
#device/dev-cache.c:228         /dev/main_vg/usr_lv: Added to device cache
#device/dev-cache.c:228         /dev/main_vg/var_lv: Added to device cache
#device/dev-cache.c:225         /dev/mapper/backup_vg-backup: Aliased to /d=
ev/backup_vg/backup in device cache
#device/dev-cache.c:225         /dev/mapper/backup_vg-scratch: Aliased to /=
dev/backup_vg/scratch in device cache
#device/dev-cache.c:402         /dev/mapper/control: Not a block device
#device/dev-cache.c:225         /dev/mapper/main_vg-home_lv: Aliased to /de=
v/main_vg/home_lv in device cache
#device/dev-cache.c:225         /dev/mapper/main_vg-spool_lv: Aliased to /d=
ev/main_vg/spool_lv in device cache
#device/dev-cache.c:225         /dev/mapper/main_vg-ulocal_lv: Aliased to /=
dev/main_vg/ulocal_lv in device cache
#device/dev-cache.c:225         /dev/mapper/main_vg-usr_lv: Aliased to /dev=
/main_vg/usr_lv in device cache
#device/dev-cache.c:225         /dev/mapper/main_vg-var_lv: Aliased to /dev=
/main_vg/var_lv in device cache
#device/dev-cache.c:402         /dev/mem: Not a block device
#device/dev-cache.c:402         /dev/mixer: Not a block device
#device/dev-cache.c:402         /dev/net/tap0: Not a block device
#device/dev-cache.c:402         /dev/net/tap1: Not a block device
#device/dev-cache.c:402         /dev/net/tap10: Not a block device
#device/dev-cache.c:402         /dev/net/tap11: Not a block device
#device/dev-cache.c:402         /dev/net/tap12: Not a block device
#device/dev-cache.c:402         /dev/net/tap13: Not a block device
#device/dev-cache.c:402         /dev/net/tap14: Not a block device
#device/dev-cache.c:402         /dev/net/tap15: Not a block device
#device/dev-cache.c:402         /dev/net/tap2: Not a block device
#device/dev-cache.c:402         /dev/net/tap3: Not a block device
#device/dev-cache.c:402         /dev/net/tap4: Not a block device
#device/dev-cache.c:402         /dev/net/tap5: Not a block device
#device/dev-cache.c:402         /dev/net/tap6: Not a block device
#device/dev-cache.c:402         /dev/net/tap7: Not a block device
#device/dev-cache.c:402         /dev/net/tap8: Not a block device
#device/dev-cache.c:402         /dev/net/tap9: Not a block device
#device/dev-cache.c:402         /dev/net/tun: Not a block device
#device/dev-cache.c:402         /dev/nflog: Not a block device
#device/dev-cache.c:402         /dev/null: Not a block device
#device/dev-cache.c:402         /dev/port: Not a block device
#device/dev-cache.c:402         /dev/ppp: Not a block device
#device/dev-cache.c:402         /dev/psaux: Not a block device
#device/dev-cache.c:402         /dev/ptmx: Not a block device
#device/dev-cache.c:402         /dev/pts/1: Not a block device
#device/dev-cache.c:402         /dev/pts/10: Not a block device
#device/dev-cache.c:402         /dev/pts/12: Not a block device
#device/dev-cache.c:402         /dev/pts/2: Not a block device
#device/dev-cache.c:402         /dev/pts/3: Not a block device
#device/dev-cache.c:402         /dev/pts/4: Not a block device
#device/dev-cache.c:402         /dev/pts/6: Not a block device
#device/dev-cache.c:211         /dev/ram0: Already in device cache
#device/dev-cache.c:211         /dev/ram1: Already in device cache
#device/dev-cache.c:211         /dev/ram10: Already in device cache
#device/dev-cache.c:211         /dev/ram11: Already in device cache
#device/dev-cache.c:211         /dev/ram12: Already in device cache
#device/dev-cache.c:211         /dev/ram13: Already in device cache
#device/dev-cache.c:211         /dev/ram14: Already in device cache
#device/dev-cache.c:211         /dev/ram15: Already in device cache
#device/dev-cache.c:211         /dev/ram2: Already in device cache
#device/dev-cache.c:211         /dev/ram3: Already in device cache
#device/dev-cache.c:211         /dev/ram4: Already in device cache
#device/dev-cache.c:211         /dev/ram5: Already in device cache
#device/dev-cache.c:211         /dev/ram6: Already in device cache
#device/dev-cache.c:211         /dev/ram7: Already in device cache
#device/dev-cache.c:211         /dev/ram8: Already in device cache
#device/dev-cache.c:211         /dev/ram9: Already in device cache
#device/dev-cache.c:402         /dev/random: Not a block device
#device/dev-cache.c:402         /dev/route: Not a block device
#device/dev-cache.c:402         /dev/route6: Not a block device
#device/dev-cache.c:402         /dev/rtc: Not a block device
#device/dev-cache.c:228         /dev/sda: Added to device cache
#device/dev-cache.c:211         /dev/sda1: Already in device cache
#device/dev-cache.c:402         /dev/shm/network/ifstate: Not a block device
#device/dev-cache.c:402         /dev/skip: Not a block device
#device/dev-cache.c:402         /dev/snd/controlC0: Not a block device
#device/dev-cache.c:402         /dev/snd/pcmC0D0c: Not a block device
#device/dev-cache.c:402         /dev/snd/pcmC0D0p: Not a block device
#device/dev-cache.c:402         /dev/snd/pcmC0D1p: Not a block device
#device/dev-cache.c:402         /dev/snd/pcmC0D2c: Not a block device
#device/dev-cache.c:402         /dev/snd/pcmC0D2p: Not a block device
#device/dev-cache.c:402         /dev/snd/timer: Not a block device
#device/dev-cache.c:402         /dev/sndstat: Not a block device
#device/dev-cache.c:402         /dev/stderr: Not a block device
#device/dev-cache.c:402         /dev/stdin: Not a block device
#device/dev-cache.c:402         /dev/stdout: Not a block device
#device/dev-cache.c:402         /dev/tcpdiag: Not a block device
#device/dev-cache.c:402         /dev/tty: Not a block device
#device/dev-cache.c:402         /dev/tty0: Not a block device
#device/dev-cache.c:402         /dev/tty1: Not a block device
#device/dev-cache.c:402         /dev/tty10: Not a block device
#device/dev-cache.c:402         /dev/tty11: Not a block device
#device/dev-cache.c:402         /dev/tty12: Not a block device
#device/dev-cache.c:402         /dev/tty13: Not a block device
#device/dev-cache.c:402         /dev/tty14: Not a block device
#device/dev-cache.c:402         /dev/tty15: Not a block device
#device/dev-cache.c:402         /dev/tty16: Not a block device
#device/dev-cache.c:402         /dev/tty17: Not a block device
#device/dev-cache.c:402         /dev/tty18: Not a block device
#device/dev-cache.c:402         /dev/tty19: Not a block device
#device/dev-cache.c:402         /dev/tty2: Not a block device
#device/dev-cache.c:402         /dev/tty20: Not a block device
#device/dev-cache.c:402         /dev/tty21: Not a block device
#device/dev-cache.c:402         /dev/tty22: Not a block device
#device/dev-cache.c:402         /dev/tty23: Not a block device
#device/dev-cache.c:402         /dev/tty24: Not a block device
#device/dev-cache.c:402         /dev/tty25: Not a block device
#device/dev-cache.c:402         /dev/tty26: Not a block device
#device/dev-cache.c:402         /dev/tty27: Not a block device
#device/dev-cache.c:402         /dev/tty28: Not a block device
#device/dev-cache.c:402         /dev/tty29: Not a block device
#device/dev-cache.c:402         /dev/tty3: Not a block device
#device/dev-cache.c:402         /dev/tty30: Not a block device
#device/dev-cache.c:402         /dev/tty31: Not a block device
#device/dev-cache.c:402         /dev/tty32: Not a block device
#device/dev-cache.c:402         /dev/tty33: Not a block device
#device/dev-cache.c:402         /dev/tty34: Not a block device
#device/dev-cache.c:402         /dev/tty35: Not a block device
#device/dev-cache.c:402         /dev/tty36: Not a block device
#device/dev-cache.c:402         /dev/tty37: Not a block device
#device/dev-cache.c:402         /dev/tty38: Not a block device
#device/dev-cache.c:402         /dev/tty39: Not a block device
#device/dev-cache.c:402         /dev/tty4: Not a block device
#device/dev-cache.c:402         /dev/tty40: Not a block device
#device/dev-cache.c:402         /dev/tty41: Not a block device
#device/dev-cache.c:402         /dev/tty42: Not a block device
#device/dev-cache.c:402         /dev/tty43: Not a block device
#device/dev-cache.c:402         /dev/tty44: Not a block device
#device/dev-cache.c:402         /dev/tty45: Not a block device
#device/dev-cache.c:402         /dev/tty46: Not a block device
#device/dev-cache.c:402         /dev/tty47: Not a block device
#device/dev-cache.c:402         /dev/tty48: Not a block device
#device/dev-cache.c:402         /dev/tty49: Not a block device
#device/dev-cache.c:402         /dev/tty5: Not a block device
#device/dev-cache.c:402         /dev/tty50: Not a block device
#device/dev-cache.c:402         /dev/tty51: Not a block device
#device/dev-cache.c:402         /dev/tty52: Not a block device
#device/dev-cache.c:402         /dev/tty53: Not a block device
#device/dev-cache.c:402         /dev/tty54: Not a block device
#device/dev-cache.c:402         /dev/tty55: Not a block device
#device/dev-cache.c:402         /dev/tty56: Not a block device
#device/dev-cache.c:402         /dev/tty57: Not a block device
#device/dev-cache.c:402         /dev/tty58: Not a block device
#device/dev-cache.c:402         /dev/tty59: Not a block device
#device/dev-cache.c:402         /dev/tty6: Not a block device
#device/dev-cache.c:402         /dev/tty60: Not a block device
#device/dev-cache.c:402         /dev/tty61: Not a block device
#device/dev-cache.c:402         /dev/tty62: Not a block device
#device/dev-cache.c:402         /dev/tty63: Not a block device
#device/dev-cache.c:402         /dev/tty7: Not a block device
#device/dev-cache.c:402         /dev/tty8: Not a block device
#device/dev-cache.c:402         /dev/tty9: Not a block device
#device/dev-cache.c:402         /dev/ttyS0: Not a block device
#device/dev-cache.c:402         /dev/ttyS1: Not a block device
#device/dev-cache.c:402         /dev/ttyS2: Not a block device
#device/dev-cache.c:402         /dev/ttyS3: Not a block device
#device/dev-cache.c:402         /dev/ttyS4: Not a block device
#device/dev-cache.c:402         /dev/ttyS5: Not a block device
#device/dev-cache.c:402         /dev/ttyS6: Not a block device
#device/dev-cache.c:402         /dev/ttyS7: Not a block device
#device/dev-cache.c:402         /dev/urandom: Not a block device
#device/dev-cache.c:402         /dev/usersock: Not a block device
#device/dev-cache.c:402         /dev/vcs: Not a block device
#device/dev-cache.c:402         /dev/vcs1: Not a block device
#device/dev-cache.c:402         /dev/vcs2: Not a block device
#device/dev-cache.c:402         /dev/vcs3: Not a block device
#device/dev-cache.c:402         /dev/vcs4: Not a block device
#device/dev-cache.c:402         /dev/vcs5: Not a block device
#device/dev-cache.c:402         /dev/vcs6: Not a block device
#device/dev-cache.c:402         /dev/vcs7: Not a block device
#device/dev-cache.c:402         /dev/vcs8: Not a block device
#device/dev-cache.c:402         /dev/vcsa: Not a block device
#device/dev-cache.c:402         /dev/vcsa1: Not a block device
#device/dev-cache.c:402         /dev/vcsa2: Not a block device
#device/dev-cache.c:402         /dev/vcsa3: Not a block device
#device/dev-cache.c:402         /dev/vcsa4: Not a block device
#device/dev-cache.c:402         /dev/vcsa5: Not a block device
#device/dev-cache.c:402         /dev/vcsa6: Not a block device
#device/dev-cache.c:402         /dev/vcsa7: Not a block device
#device/dev-cache.c:402         /dev/vcsa8: Not a block device
#device/dev-cache.c:402         /dev/xconsole: Not a block device
#device/dev-cache.c:402         /dev/xfrm: Not a block device
#device/dev-cache.c:402         /dev/zero: Not a block device
#cache/lvmcache.c:574     Wiping internal VG cache
#pvscan.c:129     Walking through all physical volumes
#device/dev-io.c:427         Opened /dev/ram0 RO
#device/dev-io.c:264       /dev/ram0: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram0
#filters/filter-composite.c:31         Using /dev/ram0
#device/dev-io.c:382         /dev/ram0: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram0 RO
#device/dev-io.c:134         /dev/ram0: block size is 1024 bytes
#label/label.c:189       /dev/ram0: No label detected
#device/dev-io.c:458         Closed /dev/ram0
#label/label.c:279         <backtrace>
#filters/filter.c:87         /dev/fd0: Skipping: Unrecognised LVM device ty=
pe 2
#device/dev-io.c:427         Opened /dev/hda RO
#device/dev-io.c:264       /dev/hda: size is 160836480 sectors
#device/dev-io.c:134         /dev/hda: block size is 4096 bytes
#filters/filter.c:110         /dev/hda: Skipping: Partition table signature=
 found
#device/dev-io.c:458         Closed /dev/hda
#device/dev-io.c:427         Opened /dev/loop0 RO
#device/dev-io.c:264       /dev/loop0: size is 2097152 sectors
#device/dev-io.c:458         Closed /dev/loop0
#filters/filter-composite.c:31         Using /dev/loop0
#device/dev-io.c:427         Opened /dev/loop0 RO O_DIRECT
#device/dev-io.c:134         /dev/loop0: block size is 4096 bytes
#label/label.c:189       /dev/loop0: No label detected
#device/dev-io.c:458         Closed /dev/loop0
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/sda RO
#device/dev-io.c:264       /dev/sda: size is 312598784 sectors
#device/dev-io.c:134         /dev/sda: block size is 4096 bytes
#filters/filter.c:110         /dev/sda: Skipping: Partition table signature=
 found
#device/dev-io.c:458         Closed /dev/sda
#filters/filter-regex.c:188         /dev/cdrom: Skipping (regex)
#filters/filter.c:87         /dev/backup_vg/backup: Skipping: Unrecognised =
LVM device type 254
#device/dev-io.c:427         Opened /dev/ram1 RO
#device/dev-io.c:264       /dev/ram1: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram1
#filters/filter-composite.c:31         Using /dev/ram1
#device/dev-io.c:382         /dev/ram1: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram1 RO
#device/dev-io.c:134         /dev/ram1: block size is 1024 bytes
#label/label.c:189       /dev/ram1: No label detected
#device/dev-io.c:458         Closed /dev/ram1
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda1 RO
#device/dev-io.c:264       /dev/hda1: size is 96327 sectors
#device/dev-io.c:458         Closed /dev/hda1
#filters/filter-composite.c:31         Using /dev/hda1
#device/dev-io.c:427         Opened /dev/hda1 RO O_DIRECT
#device/dev-io.c:134         /dev/hda1: block size is 1024 bytes
#label/label.c:189       /dev/hda1: No label detected
#device/dev-io.c:458         Closed /dev/hda1
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/loop1 RO
#device/dev-io.c:264       /dev/loop1: size is 2097152 sectors
#device/dev-io.c:458         Closed /dev/loop1
#filters/filter-composite.c:31         Using /dev/loop1
#device/dev-io.c:427         Opened /dev/loop1 RO O_DIRECT
#device/dev-io.c:134         /dev/loop1: block size is 4096 bytes
#label/label.c:189       /dev/loop1: No label detected
#device/dev-io.c:458         Closed /dev/loop1
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/sda1 RO
#device/dev-io.c:264       /dev/sda1: size is 312592707 sectors
#device/dev-io.c:458         Closed /dev/sda1
#filters/filter-composite.c:31         Using /dev/sda1
#device/dev-io.c:427         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:134         /dev/sda1: block size is 512 bytes
#label/label.c:168       /dev/sda1: lvm1 label detected
#device/dev-io.c:458         Closed /dev/sda1
#cache/lvmcache.c:426         lvmcache: /dev/sda1 now in VG main_vg
#filters/filter.c:87         /dev/backup_vg/scratch: Skipping: Unrecognised=
 LVM device type 254
#device/dev-io.c:427         Opened /dev/ram2 RO
#device/dev-io.c:264       /dev/ram2: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram2
#filters/filter-composite.c:31         Using /dev/ram2
#device/dev-io.c:382         /dev/ram2: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram2 RO
#device/dev-io.c:134         /dev/ram2: block size is 1024 bytes
#label/label.c:189       /dev/ram2: No label detected
#device/dev-io.c:458         Closed /dev/ram2
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda2 RO
#device/dev-io.c:264       /dev/hda2: size is 103410405 sectors
#device/dev-io.c:458         Closed /dev/hda2
#filters/filter-composite.c:31         Using /dev/hda2
#device/dev-io.c:427         Opened /dev/hda2 RO O_DIRECT
#device/dev-io.c:134         /dev/hda2: block size is 512 bytes
#label/label.c:168       /dev/hda2: lvm1 label detected
#device/dev-io.c:458         Closed /dev/hda2
#cache/lvmcache.c:426         lvmcache: /dev/hda2 now in VG backup_vg
#device/dev-io.c:427         Opened /dev/loop2 RO
#device/dev-io.c:264       /dev/loop2: size is 0 sectors
#filters/filter.c:104         /dev/loop2: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/loop2
#filters/filter.c:87         /dev/main_vg/usr_lv: Skipping: Unrecognised LV=
M device type 254
#device/dev-io.c:427         Opened /dev/ram3 RO
#device/dev-io.c:264       /dev/ram3: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram3
#filters/filter-composite.c:31         Using /dev/ram3
#device/dev-io.c:382         /dev/ram3: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram3 RO
#device/dev-io.c:134         /dev/ram3: block size is 1024 bytes
#label/label.c:189       /dev/ram3: No label detected
#device/dev-io.c:458         Closed /dev/ram3
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda3 RO
#device/dev-io.c:264       /dev/hda3: size is 4080510 sectors
#device/dev-io.c:458         Closed /dev/hda3
#filters/filter-composite.c:31         Using /dev/hda3
#device/dev-io.c:427         Opened /dev/hda3 RO O_DIRECT
#device/dev-io.c:134         /dev/hda3: block size is 4096 bytes
#label/label.c:189       /dev/hda3: No label detected
#device/dev-io.c:458         Closed /dev/hda3
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/loop3 RO
#device/dev-io.c:264       /dev/loop3: size is 0 sectors
#filters/filter.c:104         /dev/loop3: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/loop3
#filters/filter.c:87         /dev/main_vg/ulocal_lv: Skipping: Unrecognised=
 LVM device type 254
#device/dev-io.c:427         Opened /dev/ram4 RO
#device/dev-io.c:264       /dev/ram4: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram4
#filters/filter-composite.c:31         Using /dev/ram4
#device/dev-io.c:382         /dev/ram4: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram4 RO
#device/dev-io.c:134         /dev/ram4: block size is 1024 bytes
#label/label.c:189       /dev/ram4: No label detected
#device/dev-io.c:458         Closed /dev/ram4
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda4 RO
#device/dev-io.c:264       /dev/hda4: size is 2 sectors
#filters/filter.c:104         /dev/hda4: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/hda4
#device/dev-io.c:427         Opened /dev/loop4 RO
#device/dev-io.c:264       /dev/loop4: size is 0 sectors
#filters/filter.c:104         /dev/loop4: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/loop4
#filters/filter.c:87         /dev/main_vg/home_lv: Skipping: Unrecognised L=
VM device type 254
#device/dev-io.c:427         Opened /dev/ram5 RO
#device/dev-io.c:264       /dev/ram5: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram5
#filters/filter-composite.c:31         Using /dev/ram5
#device/dev-io.c:382         /dev/ram5: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram5 RO
#device/dev-io.c:134         /dev/ram5: block size is 1024 bytes
#label/label.c:189       /dev/ram5: No label detected
#device/dev-io.c:458         Closed /dev/ram5
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda5 RO
#device/dev-io.c:264       /dev/hda5: size is 51922017 sectors
#device/dev-io.c:458         Closed /dev/hda5
#filters/filter-composite.c:31         Using /dev/hda5
#device/dev-io.c:427         Opened /dev/hda5 RO O_DIRECT
#device/dev-io.c:134         /dev/hda5: block size is 512 bytes
#label/label.c:168       /dev/hda5: lvm1 label detected
#device/dev-io.c:458         Closed /dev/hda5
#cache/lvmcache.c:426         lvmcache: /dev/hda5 now in VG backup_vg
#device/dev-io.c:427         Opened /dev/loop5 RO
#device/dev-io.c:264       /dev/loop5: size is 0 sectors
#filters/filter.c:104         /dev/loop5: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/loop5
#filters/filter.c:87         /dev/main_vg/var_lv: Skipping: Unrecognised LV=
M device type 254
#device/dev-io.c:427         Opened /dev/ram6 RO
#device/dev-io.c:264       /dev/ram6: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram6
#filters/filter-composite.c:31         Using /dev/ram6
#device/dev-io.c:382         /dev/ram6: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram6 RO
#device/dev-io.c:134         /dev/ram6: block size is 1024 bytes
#label/label.c:189       /dev/ram6: No label detected
#device/dev-io.c:458         Closed /dev/ram6
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda6 RO
#device/dev-io.c:264       /dev/hda6: size is 1317267 sectors
#device/dev-io.c:458         Closed /dev/hda6
#filters/filter-composite.c:31         Using /dev/hda6
#device/dev-io.c:427         Opened /dev/hda6 RO O_DIRECT
#device/dev-io.c:134         /dev/hda6: block size is 4096 bytes
#label/label.c:189       /dev/hda6: No label detected
#device/dev-io.c:458         Closed /dev/hda6
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/loop6 RO
#device/dev-io.c:264       /dev/loop6: size is 0 sectors
#filters/filter.c:104         /dev/loop6: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/loop6
#filters/filter.c:87         /dev/main_vg/spool_lv: Skipping: Unrecognised =
LVM device type 254
#device/dev-io.c:427         Opened /dev/ram7 RO
#device/dev-io.c:264       /dev/ram7: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram7
#filters/filter-composite.c:31         Using /dev/ram7
#device/dev-io.c:382         /dev/ram7: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram7 RO
#device/dev-io.c:134         /dev/ram7: block size is 1024 bytes
#label/label.c:189       /dev/ram7: No label detected
#device/dev-io.c:458         Closed /dev/ram7
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/loop7 RO
#device/dev-io.c:264       /dev/loop7: size is 0 sectors
#filters/filter.c:104         /dev/loop7: Skipping: Too small to hold a PV
#device/dev-io.c:458         Closed /dev/loop7
#device/dev-io.c:427         Opened /dev/ram8 RO
#device/dev-io.c:264       /dev/ram8: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram8
#filters/filter-composite.c:31         Using /dev/ram8
#device/dev-io.c:382         /dev/ram8: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram8 RO
#device/dev-io.c:134         /dev/ram8: block size is 1024 bytes
#label/label.c:189       /dev/ram8: No label detected
#device/dev-io.c:458         Closed /dev/ram8
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram9 RO
#device/dev-io.c:264       /dev/ram9: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram9
#filters/filter-composite.c:31         Using /dev/ram9
#device/dev-io.c:382         /dev/ram9: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram9 RO
#device/dev-io.c:134         /dev/ram9: block size is 1024 bytes
#label/label.c:189       /dev/ram9: No label detected
#device/dev-io.c:458         Closed /dev/ram9
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram10 RO
#device/dev-io.c:264       /dev/ram10: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram10
#filters/filter-composite.c:31         Using /dev/ram10
#device/dev-io.c:382         /dev/ram10: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram10 RO
#device/dev-io.c:134         /dev/ram10: block size is 1024 bytes
#label/label.c:189       /dev/ram10: No label detected
#device/dev-io.c:458         Closed /dev/ram10
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram11 RO
#device/dev-io.c:264       /dev/ram11: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram11
#filters/filter-composite.c:31         Using /dev/ram11
#device/dev-io.c:382         /dev/ram11: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram11 RO
#device/dev-io.c:134         /dev/ram11: block size is 1024 bytes
#label/label.c:189       /dev/ram11: No label detected
#device/dev-io.c:458         Closed /dev/ram11
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram12 RO
#device/dev-io.c:264       /dev/ram12: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram12
#filters/filter-composite.c:31         Using /dev/ram12
#device/dev-io.c:382         /dev/ram12: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram12 RO
#device/dev-io.c:134         /dev/ram12: block size is 1024 bytes
#label/label.c:189       /dev/ram12: No label detected
#device/dev-io.c:458         Closed /dev/ram12
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram13 RO
#device/dev-io.c:264       /dev/ram13: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram13
#filters/filter-composite.c:31         Using /dev/ram13
#device/dev-io.c:382         /dev/ram13: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram13 RO
#device/dev-io.c:134         /dev/ram13: block size is 1024 bytes
#label/label.c:189       /dev/ram13: No label detected
#device/dev-io.c:458         Closed /dev/ram13
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram14 RO
#device/dev-io.c:264       /dev/ram14: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram14
#filters/filter-composite.c:31         Using /dev/ram14
#device/dev-io.c:382         /dev/ram14: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram14 RO
#device/dev-io.c:134         /dev/ram14: block size is 1024 bytes
#label/label.c:189       /dev/ram14: No label detected
#device/dev-io.c:458         Closed /dev/ram14
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/ram15 RO
#device/dev-io.c:264       /dev/ram15: size is 8192 sectors
#device/dev-io.c:458         Closed /dev/ram15
#filters/filter-composite.c:31         Using /dev/ram15
#device/dev-io.c:382         /dev/ram15: Not using O_DIRECT
#device/dev-io.c:427         Opened /dev/ram15 RO
#device/dev-io.c:134         /dev/ram15: block size is 1024 bytes
#label/label.c:189       /dev/ram15: No label detected
#device/dev-io.c:458         Closed /dev/ram15
#label/label.c:279         <backtrace>
#device/dev-io.c:427         Opened /dev/hda2 RO O_DIRECT
#device/dev-io.c:134         /dev/hda2: block size is 512 bytes
#label/label.c:168       /dev/hda2: lvm1 label detected
#device/dev-io.c:458         Closed /dev/hda2
#device/dev-io.c:427         Opened /dev/hda5 RO O_DIRECT
#device/dev-io.c:134         /dev/hda5: block size is 512 bytes
#label/label.c:168       /dev/hda5: lvm1 label detected
#device/dev-io.c:458         Closed /dev/hda5
#device/dev-io.c:427         Opened /dev/hda2 RO O_DIRECT
#device/dev-io.c:134         /dev/hda2: block size is 512 bytes
#format1/disk-rep.c:398       Found /dev/hda2 in VG backup_vg
#device/dev-io.c:458         Closed /dev/hda2
#device/dev-io.c:427         Opened /dev/hda5 RO O_DIRECT
#device/dev-io.c:134         /dev/hda5: block size is 512 bytes
#format1/disk-rep.c:398       Found /dev/hda5 in VG backup_vg
#device/dev-io.c:458         Closed /dev/hda5
#format1/import-export.c:74       System ID glaurung1036523076 on /dev/hda5=
 differs from glaurung1036523069 for volume group
#metadata/pv_manip.c:231         /dev/hda2 0:      0    768: backup(0:0)
#metadata/pv_manip.c:231         /dev/hda2 1:    768    768: scratch(0:0)
#metadata/pv_manip.c:231         /dev/hda2 2:   1536     40: NULL(0:0)
#metadata/pv_manip.c:231         /dev/hda5 0:      0    791: NULL(0:0)
#metadata/pv_manip.c:282   PV segment VG free_count mismatch: 831 !=3D 4294=
966591
#metadata/metadata.c:1056   Internal error: PV segments corrupted in backup=
_vg.
#metadata/metadata.c:1263         <backtrace>
#device/dev-io.c:427         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:134         /dev/sda1: block size is 512 bytes
#label/label.c:168       /dev/sda1: lvm1 label detected
#device/dev-io.c:458         Closed /dev/sda1
#device/dev-io.c:427         Opened /dev/sda1 RO O_DIRECT
#device/dev-io.c:134         /dev/sda1: block size is 512 bytes
#format1/disk-rep.c:398       Found /dev/sda1 in VG main_vg
#device/dev-io.c:458         Closed /dev/sda1
#metadata/pv_manip.c:231         /dev/sda1 0:      0    800: usr_lv(0:0)
#metadata/pv_manip.c:231         /dev/sda1 1:    800    800: ulocal_lv(0:0)
#metadata/pv_manip.c:231         /dev/sda1 2:   1600    800: home_lv(0:0)
#metadata/pv_manip.c:231         /dev/sda1 3:   2400    480: var_lv(0:0)
#metadata/pv_manip.c:231         /dev/sda1 4:   2880   1120: spool_lv(0:0)
#metadata/pv_manip.c:231         /dev/sda1 5:   4000    768: NULL(0:0)
#metadata/pv_manip.c:282   PV segment VG free_count mismatch: 768 !=3D 4294=
964064
#metadata/metadata.c:1056   Internal error: PV segments corrupted in main_v=
g.
#metadata/metadata.c:1263         <backtrace>
  No matching physical volumes found



       =20


-- System Information:
Debian Release: testing/unstable
  APT prefers unstable
  APT policy: (500, 'unstable'), (500, 'stable')
Architecture: i386 (i686)
Shell:  /bin/sh linked to /bin/bash
Kernel: Linux 2.6.11.2-skas3-v8-rc2
Locale: LANG=3Den_US.UTF-8, LC_CTYPE=3Den_US.UTF-8 (charmap=3DANSI_X3.4-196=
8) (ignored: LC_ALL set to C)

Versions of packages lvm2 depends on:
ii  debconf                     1.4.51       Debian configuration managemen=
t sy
ii  libc6                       2.3.2.ds1-22 GNU C Library: Shared librarie=
s an
ii  libdevmapper1.01            2:1.01.03-1  The Linux Kernel Device Mapper=
 use
ii  lvm-common                  1.5.19       The Logical Volume Manager for=
 Lin

lvm2 recommends no packages.

-- debconf information:
  lvm2/snapshots:

--=20
In war it is not men, but the man who counts. Napoleon
Manoj Srivastava   <srivasta@debian.org>  <http://www.debian.org/%7Esrivast=
a/>
1024D/BF24424C print 4966 F272 D093 B493 410B  924B 21BA DABB BF24 424C


----- End forwarded message -----

--=20
We have phasers, I vote we blast 'em!
		-- Bailey, "The Corbomite Maneuver", stardate 1514.2

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iEYEARECAAYFAkK5F1MACgkQnw66O/MvCNGHXwCgkG0/lFFdlACkig8XYaHF6dkp
NKYAnjIK6h0uN5+JmYAN9m68hYubMRX+
=X+di
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
