Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAIIKYr04269
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 13:20:34 -0500
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAIIKWbQ030886
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 13:20:32 -0500
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id DB30FE6D42
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 18:18:17 +0000 (GMT)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30074-15 for <linux-lvm@redhat.com>;
	Thu, 18 Nov 2004 18:18:17 +0000 (GMT)
Received: from oak.dgreaves.com (modem-1848.parera.dialup.pol.co.uk
	[81.78.183.56]) by mail.ukfsn.org (Postfix) with ESMTP id 495A3E6D39
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 18:18:17 +0000 (GMT)
Received: from ash.dgreaves.com ([10.0.0.101])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1CUqxh-0007ZT-Co
	for linux-lvm@redhat.com; Thu, 18 Nov 2004 18:24:53 +0000
Message-ID: <419CE7E9.6040602@dgreaves.com>
Date: Thu, 18 Nov 2004 18:20:25 +0000
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software RAID 5 Resizing and LVM
References: <OF26153F74.622A298A-ON86256F4F.005C138B-86256F4F.005CBE3E@austinlogistics.com>	<1100732495.2496.6.camel@Slacktop.local>	<419CDA86.6050503@dgreaves.com>
	<419CE1AC.60007@theserrs.net>
In-Reply-To: <419CE1AC.60007@theserrs.net>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Oh yes :)

It now has an 'add new disk to raid5 array and rebuild parity whilst 
keeping your data' feature :)
It has to be done 'offline'.

I'm actually just installing it at the moment.

see:
http://evms.sourceforge.net/user_guide/#resizemdreg

also:
http://marc.theaimsgroup.com/?l=evms-devel&w=2&r=1&s=raid5&q=b

David

Scott Serr wrote:

> I have lvm2 on RAID5.  With scratch disks you can do pvmoves to move 
> extents off the RAID stripe onto a scratch disk.  Then redo the raid 
> stripe wider (more disks).  Then move the extents back.  If you're 
> (clever) adding a disk and it's partitioned up a little you can use 
> some of the partitions as "scratch" while bringing other partitions 
> into the raid.
>
> Does EVMS have something more elegant?  That would be nice.
>
> -Scott
>
