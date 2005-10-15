Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9FIttV04804
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 14:55:55 -0400
Received: from greebo.hisser.org (postfix@hermes.hisser.org [62.49.72.126])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9FItrcI032427
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 14:55:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by greebo.hisser.org (Postfix) with ESMTP id 7F0B6580C
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 19:55:49 +0100 (BST)
Received: from greebo.hisser.org ([127.0.0.1])
	by localhost (greebo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27607-04 for <linux-lvm@redhat.com>;
	Sat, 15 Oct 2005 19:55:48 +0100 (BST)
Received: from [192.168.100.81] (leela.internal.hisser.org [192.168.100.81])
	by greebo.hisser.org (Postfix) with ESMTP id 72873580B
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 19:55:48 +0100 (BST)
Message-ID: <435150B2.9010007@hisser.org>
Date: Sat, 15 Oct 2005 19:55:46 +0100
From: James Pattinson <jamesp@hisser.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mostly OT: Adaptec software RAID
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi All / Heinz

I've been using LVM for years with a normal IDE controller using 2 PV's 
and lvcreate -i2 to create striped logical volumes.

I've just built a new system with SATA. I have a standalone boot disk on 
the motherboards built on SATA controller, and have an additional 
Adaptec 1210as RAID controller controlling two 10k rpm drives.

Now, I had originally planned to create a stripe set on the raid card, 
but since this is a "fake" raid card would this be any better than using 
lvm for striping? How much processing would be offloaded to the card?

Is anyone on the list using this card on Linux?

Cheers,

James
