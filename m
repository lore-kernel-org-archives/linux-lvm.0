Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA1Fcqr12570
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 10:38:52 -0500
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iA1FcjhO001504
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 10:38:51 -0500
Message-ID: <41865881.6060107@mikebabcock.ca>
Date: Mon, 01 Nov 2004 10:38:41 -0500
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net>
	<20041028011738.GD13737@kluge.net>	<41814060.4040400@mikebabcock.ca>
	<41851771.4060203@markus.org>
In-Reply-To: <41851771.4060203@markus.org>
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

Markus Baertschi wrote:

> You can make life easier by creating several raid arrays on the same 
> disks and tie them together with LVM.
> For example split your three 160GB drives into 4 partitions each and 
> create a raid over the three disks.
>
> sda -> sda1+sda2+sda3+sda4, etc.
> md0 = sda1+sdb1+sdc1, md1=sda2+sdb2+sdc2, etc.


And how exactly does that allow me to easily change how much RAID-0 or 
RAID-5 storage I have?

If I need more RAID-5 storage and I want to steal it from RAID-0 space, 
I need to dissassemble LVM, then software RAID, then repartition, then 
rebuild RAID, then restore LVM.
-- 
Michael T. Babcock
http://mikebabcock.ca
