Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LFFPa12674
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 11:15:25 -0400
Received: from smtp.mailbox.co.uk (smtp.mailbox.co.uk [195.82.125.32])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6LFFJXn011808
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 11:15:19 -0400
Received: from core.penguinpowered.org ([212.18.250.170]
	helo=smtp.penguinpowered.org)
	by smtp.mailbox.co.uk with esmtp (Exim 4.30) id 1BnIoQ-0006ON-GM
	for linux-lvm@redhat.com; Wed, 21 Jul 2004 16:15:18 +0100
Received: from localhost ([127.0.0.1] helo=webmail.penguinpowered.org)
	by smtp.penguinpowered.org with smtp (Exim 4.30; FreeBSD)
	id 1BnIlZ-0003Fu-Dj
	for linux-lvm@redhat.com; Wed, 21 Jul 2004 16:12:21 +0100
Message-ID: <19322.195.50.100.20.1090422741.squirrel@webmail.penguinpowered.org>
In-Reply-To: <8CCBDD5583C50E4196F012E79439B45C04C9A463@atl-ms1.megatrends.com>
References: <8CCBDD5583C50E4196F012E79439B45C04C9A463@atl-ms1.megatrends.com>
Date: Wed, 21 Jul 2004 16:12:21 +0100 (BST)
Subject: RE: [linux-lvm] Raid 0+1
From: "Wayne Pascoe" <lists-june2004@penguinpowered.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


> The softraid comes with linux does not support resize.
>
> Try DM + EVMS. This is much simpler and powerful. You can create Raid
> over
> Raid (Any raid level not limited to 0 and 1)
> The next EVMS release 2.4 scheduled for Aug 2004, has features to
> resize
> RAID 1 and 4/5.

Thanks. I'm replying privately, as I'm not sure if this is relevant to
the lvm-list :)

Is there any beta stuff that I can play with now ? If so, where can I
get hold of it ?

I'm very keen to win this comparison and remove VxVM and possibly VxFS
from the Linux environment.

Regards,

-- 
Wayne Pascoe
