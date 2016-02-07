Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u17J8KKG023740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 7 Feb 2016 14:08:20 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id 39E53C0C2349
	for <linux-lvm@redhat.com>; Sun,  7 Feb 2016 19:08:18 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1aSUgx-0004C6-1r
	for linux-lvm@redhat.com; Sun, 07 Feb 2016 20:08:15 +0100
Received: from ebox.rath.org ([45.79.69.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 07 Feb 2016 20:08:15 +0100
Received: from Nikolaus by ebox.rath.org with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 07 Feb 2016 20:08:15 +0100
From: Nikolaus Rath <Nikolaus@rath.org>
Date: Sun, 07 Feb 2016 10:43:30 -0800
Message-ID: <87a8nctl7x.fsf@vostro.rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvmcache performance
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello,

My system boots rather slowly, so when I noticed a lot of free space on
one of my SSDs, I wanted to try to speed-up the boot by caching my root
volume.

For benchmarking purposes, I first moved the entire LV holding the root
file system to the SSD. This reduced the boot time from about 90 seconds
to 20 - nice!

I then moved the root fs LV back to the spinning disk and created a
cache-pool on the SSD. My root fs is 40 GB, with 19 GB used. The cache
pool had a 15 GB data and 15 MB metadata volumes and used writeback
cache. Finally, I converted my root fs LV to a cache LV.

To getting data into the initrd quickly, I also set up my initrd to call

    dmsetup message ${name} 0 sequential_threshold 0
    dmsetup message ${name} 0 read_promote_adjustment 0
    dmsetup message ${name} 0 write_promote_adjustment 0


However, even after a few reboots I do not notice any difference at all
in boot times. It is as if the cache was not used at all.


With the above settings (and the cache pool as big as the used space on
the origin LV), I would have expected to get almost the same performance
as when moving the entire PV to the SSD.

Is that the wrong expectation? But even then, shouldn't I at least see
some improvement?

Thanks,
-Nikolaus

-- 
GPG encrypted emails preferred. Key id: 0xD113FCAC3C4E599F
Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             »Time flies like an arrow, fruit flies like a Banana.«
