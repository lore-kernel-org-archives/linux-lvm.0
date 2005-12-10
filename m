Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAKm1105565
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:48:01 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBAKlp7Z017280
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:47:53 -0500
Received: from gwood by ramoth.dragonhold.org with local (Exim 4.50)
	id 1ElBcz-0006TK-Sr
	for linux-lvm@redhat.com; Sat, 10 Dec 2005 20:47:33 +0000
Date: Sat, 10 Dec 2005 20:47:33 +0000
From: Graham Wood <clvm@spam.dragonhold.org>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <20051210204733.GA24767@dragonhold.org>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
Sender: <gwood@dragonhold.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Dec 10, 2005 at 01:14:54PM -0700, Michael Loftis wrote:
> Not a problem, a lot of people don't see the delineation right off. 
> Filesystems like VXVFS (Veritas) in their commercial implementations are 
> really LVM+Filesystem in one.  Not sure what the linux port is looking like 
> these days though.
Actually veritas have multiple products, and the FS is separate to
the LVM (E.g. there is file system and volume manager - which are
different products but can be purchased together as part of the
'foundation suite').

> ReiserFS has hot expansion capabilities, but no (yet?) hot shrinking 
> capabilities.  One of the reasons it has these features and ext2/3 does not 
> is because ext2/3 are very old filesystems designed on a different 
> mentality of a static filesystem.  On-line expansion of ext2 based 
> filesystems is an extremely complicated venture, it might honestly even be 
> impossible.
Um.  I've got a couple of RHEL4 boxes at work, and redhat ship
'ext2online' with the platform - that has grown my ext3 filesystems
multiple times.  One of the volumes I've got has been grown 5 times
since the machine was last rebooted - and seems to be fine.


(apologies for the offtopic discussion, but want to make sure that
people leave with accurate answers *grin*)
