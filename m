Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5JHlauB026684
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 13:47:36 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5JHlXYo006336
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 13:47:33 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I0hn0-0006zx-KJ
	for linux-lvm@redhat.com; Tue, 19 Jun 2007 19:46:50 +0200
Received: from p57a0fc0a.dip.t-dialin.net ([87.160.252.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 19:46:50 +0200
Received: from gator_ml by p57a0fc0a.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 19:46:50 +0200
From: Peter Daum <gator_ml@yahoo.de>
Date: Tue, 19 Jun 2007 19:46:01 +0200
Message-ID: <f594oq$8i0$1@sea.gmane.org>
References: <f56smj$275$1@sea.gmane.org>
	<20070619131622.GO18457@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070619131622.GO18457@agk.fab.redhat.com>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: pvresize after extending RAID array
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Alasdair G Kergon wrote:
> Exactly which version of LVM2 was this (e.g. output of 'lvm version')?
# lvm version
  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.5.0

> 
>> # cat /sys/block/sdb/size
>> 12695042048
>  
> Use the 'blockdev' command - that gets the sizes the same way that lvm2
> does.

Hopefully not the same way as "blockdev --getsz" does it
(which silently fails on that disk; "blockdev --getsize64 /dev/sdb" reports
the correct size in bytes)

Regards,
                    Peter Daum
