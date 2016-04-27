Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RAWYDC031606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 06:32:34 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 805938113C
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 10:32:31 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 737EC7F2C3
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 12:32:29 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Apr 2016 10:32:29 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <57207A94.5040004@redhat.com>
References: <1878ee4357f761c330210f82e80ead3d@dds.nl>
	<57207A94.5040004@redhat.com>
Message-ID: <9831afa4d0375a35e0341fa24ae8b769@dds.nl>
Subject: Re: [linux-lvm] swap on lvm cache
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek Kabelac schreef op 27-04-2016 8:38:

> Yes, it would be seriously bad idea to use 'swap' on cached LV...
> 
> There are already unsolved issues with plain devices and swapping :)
> and you want to put caching logic into this stack.

I just think it would never promote it to the cache ;-). Unless the same 
blocks are written repeatedly with different memory. But typically every 
write is followed by a read. I don't think the same regions of swap are 
constantly reused. If your system is not heavily swapping, usually it 
would be rather stable. On heavy swap though you might find that the 
cache might start to promote it, but it also means the values constantly 
change.

Question: if a block has been promoted through reading (for example) 
(since reading promotion is usually lower (faster)) and is then written 
to, does this mean the cache for it is updated and then written through 
(or back)? I suppose it would. Let's assume that is the only sensible 
thing.

That means you could have swap blocks promoted due to heavy swapping 
(and hence reading) and if you have writeback, it would still make a 
modicum of sense since then it would actually cause hits to go to the 
cache instead of the slower disk.

I mean I could test it. I could just load a few programs heavy on 
memory, so that I can fully fill my cache (swap I mean) and then I could 
start alt-tabbing through these programs as a test. And then I would 
need statistics on lvmcache hits. You say there are issues but I am more 
than willing to crash my system for it :p.

For example, swap on thin LVM works fine. Although the swap filesystem 
is not cleared with swapoff. This can be changed with the --discard 
option, and then it is cleared.

Any discarded swap would instantly discard it from the LVM cache, 
likely, but not necessarily. If that happened then the promotion counter 
would never rise.

It is hard to find information on LVMcache. I don't know enough about 
dmcache to know its relation. I will just ask two short questions in a 
new email.
