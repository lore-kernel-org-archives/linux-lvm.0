Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5LGKe013555
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 12:20:40 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5LGKde1025391
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 12:20:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id A94C6DCBD
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 12:20:22 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01463-05 for <linux-lvm@redhat.com>;
	Mon, 21 Jun 2004 12:20:22 -0400 (EDT)
Received: from localhost (salusa.poochiereds.net [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 5D0C77258
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 12:20:22 -0400 (EDT)
Subject: Re: [linux-lvm] Failed to boot 2.6.6 with root on lvm
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <20040620171255.GA2783@tangerine.coulon.evette>
References: <20040620171255.GA2783@tangerine.coulon.evette>
Message-Id: <1087834832.5261.42.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Mon, 21 Jun 2004 12:20:33 -0400
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2004-06-20 at 13:12, Jean-Luc Coulon (f5ibh) wrote:

> If I tell grub:
> root=/dev/ram0 lvm2root=/dev/vg00/root_lv I get the following messages  
> at boot :
> [ ... ]
> device-mapper: 4.1.0-ioct (2003-12-10) initialised: dm@uk.syistina.com
> [ ... ]
> VFS cannot open root device "ram0" or unknown-block (0,0)
> Please apped a correct "root=" boot option

Do you have an appropriate initrd line in the GRUB stanza? Also, do you
have initrd support built into your kernel?
-- Jeff
