Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2NLonO10330
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 16:50:49 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2NLohe4018730
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 16:50:44 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DEDhx-0007Zc-RD
	for linux-lvm@redhat.com; Wed, 23 Mar 2005 22:48:10 +0100
Received: from adsl-34-234-30.asm.bellsouth.net ([67.34.234.30])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 22:48:09 +0100
Received: from ecashin by adsl-34-234-30.asm.bellsouth.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 22:48:09 +0100
From: Ed L Cashin <ecashin@coraid.com>
Date: Wed, 23 Mar 2005 16:49:04 -0500
Message-ID: <87br9adodr.fsf@coraid.com>
References: <200502281138.00112.stuebiger-lvm@cip.ifi.lmu.de>
	<20050301191923.GA13742@redhat.com>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Raid1 only with LVM
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Heinz Mauelshagen <mauelshagen@redhat.com> writes:

> Michael,
>
> you can't do mirroring with LVM2 today but we'll suport it later
> this year.

Do you expect that when mirroring is working in LVM2 it will be
working in CLVM?  That is, will a cluster be able to share block
storage with using distributed RAID 1 later this year because of CLVM?

-- 
  Ed L Cashin <ecashin@coraid.com>
