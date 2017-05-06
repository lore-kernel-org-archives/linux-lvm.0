Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 169D660E3E
	for <linux-lvm@redhat.com>; Sun,  7 May 2017 01:00:59 +0000 (UTC)
Received: from blaine.gmane.org (unknown [195.159.176.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55BE1C05683F
	for <linux-lvm@redhat.com>; Sun,  7 May 2017 01:00:57 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1d78gH-0001lG-QY
	for linux-lvm@redhat.com; Sun, 07 May 2017 01:00:05 +0200
From: =?UTF-8?Q?Piotr_Paw=c5=82ow?= <pp@siedziba.pl>
Date: Sun, 7 May 2017 00:55:58 +0200
Message-ID: <oelkci$tbg$1@blaine.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] suspend to disk and LVM cache corruption
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

Hello,

TL;DR: should LVM cache work properly with suspend to disk?

I'm using LVM cache for my /home volume since 2015 and had no troubles
with it, until I started to suspend my computer to disk every day.

At least once per 2-3 weeks the machine would lock up a few seconds
after resuming, and after reset it would usually work again, but
sometimes the cache would end up badly corrupted, unrepairable, and I
had to remove the cache. I had to switch to writethrough mode, as
removing writeback cache would leave the file system too corrupted to
repair.

I thought the problem was caused by initrd, as it activates volumes and
scans devices for filesystem superblocks before resuming. I thought
reads may cause blocks to be cached and modify the cache, and then the
resumed system doesn't know that something has changed and gets confused.

I attempted to fix it by adding "resume=/dev/sda1" to kernel command
line, where sda1 is my swap partition, which makes it resume without
starting initrd.

I switched to writeback again, and it was working fine for 6 months,
maybe more. Until today.

Today I resumed it, and was greeted with this in kernel log:

block manager: recursive lock detected in metadata
cache: 253:8: promotion failed; couldn't update on disk metadata
cache: 253:8: metadata operation 'dm_cache_insert_mapping' failed: error
= -22
cache: 253:8: aborting current metadata transaction

(http://paste.ubuntu.com/24526200 line 2445)

Fortunately cache_repair was able to repair it, and then filesystem
scrub found only 1 checksum error, so it's a lot better than previous
corruptions.

Maybe it's a different problem than before. Maybe it's unrelated to
suspending. I don't know. That's why I'm writing to the list.

Is my current approach to resuming theoretically safe with caching? Are
there some other gotchas I'm not aware of?
