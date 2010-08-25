Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7PALfTW006964
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 06:21:41 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7PALUQC027190
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 06:21:30 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1OoD6m-0006TK-Nt
	for linux-lvm@redhat.com; Wed, 25 Aug 2010 12:21:28 +0200
Received: from rima-00-ser0.ce.ip-plus.net ([164.128.113.126])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 12:21:28 +0200
Received: from alexanders.mailinglists+nospam by rima-00-ser0.ce.ip-plus.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 12:21:28 +0200
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Wed, 25 Aug 2010 10:21:20 +0000 (UTC)
Message-ID: <loom.20100825T121646-219@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Internal error: Maps lock
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

Hello again.

I'm now running into another problem:

+ /sbin/lvm lvcreate --permission r --snapshot /dev/Sys/Home --name
Home-Backup_Snapshot --extents 15%ORIGIN
  Internal error: Maps lock 14004224 < unlock 14266368
  Logical volume "Home-Backup_Snapshot" created

What does this "Internal error" mean? Did it actually cause any harm?
I'm confused, because it then goes on to say that the LV was created
and I've also been able to mount "Home-Backup_Snapshot" (it's ext4,
if it matters).

--($ ~)-- sudo /sbin/lvm version
  LVM version:     2.02.70(2) (2010-07-06)
  Library version: 1.02.52 (2010-07-06)
  Driver version:  4.17.0

--($ ~)-- uname -a
Linux winnb000546 2.6.35-ARCH #1 SMP PREEMPT Sat Aug 21 07:23:08 UTC 2010 i686
Intel(R) Core(TM)2 Duo CPU T7300 @ 2.00GHz GenuineIntel GNU/Linux

--($ ~)-- cat /proc/devices
Character devices:
  1 mem
  4 /dev/vc/0
  4 tty
  4 ttyS
  5 /dev/tty
  5 /dev/console
  5 /dev/ptmx
  6 lp
  7 vcs
 10 misc
 13 input
 14 sound/mixer
 14 sound/sequencer
 14 sound/dsp
 14 sound/audio
 14 sound/sequencer2
 14 sound/adsp
 21 sg
 29 fb
 99 ppdev
116 alsa
128 ptm
136 pts
180 usb
189 usb_device
195 nvidia
251 firewire
252 rtc
253 hidraw
254 bsg

Block devices:
259 blkext
  7 loop
  8 sd
 11 sr
 65 sd
 66 sd
 67 sd
 68 sd
 69 sd
 70 sd
 71 sd
128 sd
129 sd
130 sd
131 sd
132 sd
133 sd
134 sd
135 sd
254 device-mapper

--($ ~)-- cat /proc/misc
 58 device-mapper
 59 rfkill
130 watchdog
235 autofs
229 fuse
 60 network_throughput
 61 network_latency
 62 cpu_dma_latency
  1 psaux
228 hpet
231 snapshot
227 mcelog
 63 vga_arbiter

--($ ~)-- ls -la /dev/mapper/control
crw------- 1 root root 10, 58 Aug 25 07:10 /dev/mapper/control

Cheers,
Alexander
