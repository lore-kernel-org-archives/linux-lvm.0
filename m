Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DJn0IZ022103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2016 15:49:00 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16B97C049E1D
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2016 19:48:58 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 27CD17FF26
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2016 21:48:56 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Jun 2016 21:48:55 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <9fd01005d27eddbb546f0c3c1acc2302@dds.nl>
Subject: [linux-lvm] wipe LVM cache
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
To: Linux lvm <linux-lvm@redhat.com>

Is there a way to wipe a cache without recreating it?

When I split the cache using --split-cache, then dd if=/dev/zero the 
origin volume, and then combine the cache again, the system will think 
nothing has changed, and the blocks on the cache that were used before, 
will keep being used, and will "mask" blocks in the root volume, I 
believe. (The origin volume).

Dmsetup status will show all blocks in the cache are still used:

linux-root: 0 41943040 cache 8 367/3072 128 121600/121600

It seems weird that I can't just clean the cache. I'd have to either dd 
the entire volume when the cache is combined, or recreate the cache 
itself.
