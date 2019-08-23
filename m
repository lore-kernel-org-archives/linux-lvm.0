Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB97A5D6B2
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2019 15:29:37 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6FF58980EE
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2019 15:29:36 +0000 (UTC)
Date: Fri, 23 Aug 2019 11:29:29 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <07a8641dd1c8c10b24a65f546557685c@assyoma.it>
Message-ID: <alpine.LRH.2.21.1908231127490.3542@fairfax.gathman.org>
References: <e11a2dbd-de9c-475f-bf6e-36cab78f7165@www.fastmail.com>
	<36c36310-1771-fed1-e208-3db7c0f9c768@redhat.com>
	<ee8820cc-8d2d-4503-afb1-9654e12745c4@www.fastmail.com>
	<b17bea72-f9c3-9be6-c237-f56b8b446530@redhat.com>
	<07a8641dd1c8c10b24a65f546557685c@assyoma.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] repair pool with bad checksum in superblock
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Dave Cohen <linux-lvm@dave-cohen.com>

On Fri, 23 Aug 2019, Gionatan Danti wrote:

> Il 23-08-2019 14:47 Zdenek Kabelac ha scritto:
>> Ok - serious disk error might lead to eventually irrepairable metadata
>> content - since if you lose some root b-tree node sequence it might be
>> really hard
>> to get something sensible  (it's the reason why the metadata should be 
>> located
>> on some 'mirrored' device - since while there is lot of effort put into
>> protection again software errors - it's hard to do something with
>> hardware error...
>
> Would be possible to have a backup superblock, maybe located on device end?
> XFS, EXT4 and ZFS already do something similar...

On my btree file system, I can recover from arbitrary hardware
corruption by storing the root id of the file (table) in each node. 
Leaf nodes (with full data records) are also indicated.  Thus, even if
the root node of a file is lost/corrupted, the raw file/device can be
scanned for corresponding leaf nodes to rebuild the file (table) with
all remaining records.

Drawbacks: deleting individual leaf nodes requires changing the root id
of the node requiring an extra write.  (Otherwise records could be
included in some future recovery.)  Deleting entire files (tables) 
just requires marking the root node deleted - no need to write all the
leaf nodes.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
