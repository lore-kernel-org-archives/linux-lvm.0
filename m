Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA9Fleni010058
	for <linux-lvm@redhat.com>; Sun, 9 Nov 2008 10:47:40 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA9FktOG026048
	for <linux-lvm@redhat.com>; Sun, 9 Nov 2008 10:47:05 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KzCV0-00010J-VP
	for linux-lvm@redhat.com; Sun, 09 Nov 2008 15:46:50 +0000
Received: from p57a0dd5f.dip.t-dialin.net ([87.160.221.95])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 09 Nov 2008 15:46:50 +0000
Received: from gator_ml by p57a0dd5f.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 09 Nov 2008 15:46:50 +0000
From: Peter Daum <gator_ml@yahoo.de>
Date: Sun, 09 Nov 2008 16:46:36 +0100
Message-ID: <gf70ks$16f$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] write performance with active snapshot
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

Hi,

for an application I am just working on it looks like lvm snapshots would
be just what I need as far as functionality is concerned. Unfortunately,
I am experiencing such a massive degradation in performance, that the
result is almost useless.

I'm working on a fairly fast machine (Quadcore, 8GB RAM) with a big
hardware RAID array and lvm2 (Debian Lenny; Linux 2.6.26-1-amd64;
LVM version:2.02.39 (2008-06-27)
Library version: 1.02.27 (2008-06-25)
Driver version:  4.13.0)

Sequentially writing to a file (ext3) on a logical volume, I get a
sustained performance of ~ 250 MB/sec. When I create a snapshot
volume, the write throughput drops to 7-8 MB/secs (on the original
volume; writing to the snapshot I see a significant degradation,
but not nearly, as bad; read performance is o.k.).Is this "normal"
or is there anything I can do to about it?

I looked in this list and searched the WWW but couldn't find any
concrete information on the performance impact of snapshots
(except http://www.nikhef.nl/~dennisvd/lvmcrap.html).
It seems like write performance should probably be less then 1/3
of the original throughput, because every write to the source
volume causes 3 I/O operations plus some overhead for meta data.
More difficult to estimate would be the time lost by additional
head movements. Still, a throughput degradation by a factor of 30
seems pretty extreme.

Any ideas?

Regards,
                          Peter Daum
