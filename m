Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57IjY010625
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:45:34 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i57IjXi5009913
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:45:33 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 801ADE6D40
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 19:43:41 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17792-11 for <linux-lvm@redhat.com>;
	Mon,  7 Jun 2004 19:43:41 +0100 (BST)
Received: from oak.dgreaves.com (modem-298.parera.dialup.pol.co.uk
	[81.78.177.42]) by mail.ukfsn.org (Postfix) with ESMTP id DB470E6D3F
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 19:43:40 +0100 (BST)
Received: from ash.dgreaves.com ([10.0.0.105])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BXP9E-00036J-5L
	for linux-lvm@redhat.com; Mon, 07 Jun 2004 19:47:04 +0100
Message-ID: <40C4B7C4.4090306@dgreaves.com>
Date: Mon, 07 Jun 2004 19:45:24 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software raid or lvm?
References: <40C48905.80608@blocked.name>	<20040607162858.GA5220@synapse.neuralscape.com>
	<40C4B1BA.7070006@blocked.name>
In-Reply-To: <40C4B1BA.7070006@blocked.name>
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

philip wrote:

> hello,
>
> Karen Shaeffer wrote:
>
>> You can find Sil311x support in the 2.6.6 kernel. I've run it with the
>> Sil3114 controller.
>
>
> so far i know (i didn't watch that for few last months) there is 
> driver for sil3112 in 2.6 kernel (sata_sil) but the raid driver didn't 
> work. also it didn't work well for everyone. so any good news?
> thank you
> philip


Jeff Garzik said on the 10th May in the linux-ide list:

Serial ATA (SATA) for Linux
status report
May 10, 2004


Silicon Image 3112/3114
-----------------------
Summary: No TCQ. Looks like a PATA controller, but with full SATA
control including hotplug and PM.

libata driver status: Beta.

drivers/ide driver status: Production, but see issue #4.

Issue #4: Need to have the most recent fixes posted to lkml, for stable
operation and full performance (where possible).




HTH

David
