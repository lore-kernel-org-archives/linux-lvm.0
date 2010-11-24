Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAOLZrS9012779
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 16:35:53 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAOLZdKt011356
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 16:35:41 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oAOLZdb2016907
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 16:35:39 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oAOLZdtw016906
	for linux-lvm@redhat.com; Wed, 24 Nov 2010 16:35:39 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Wed, 24 Nov 2010 21:35:38 +0000 (UTC)
Message-ID: <ick0fa$tm$2@taco.int.tagonline.com>
References: <icjsgr$tm$1@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Solving the "metadata too large for circular
 buffer"	condition
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wed, 24 Nov 2010 20:28:11 +0000, Andrew Gideon wrote:

> But even if two segments are moved from dislocated locations to
> immediately adjacent locations, I see nothing which says that these two
> segments would be combined into a single segment.  So I'm not clear how
> fragmentation can be reduced.

This one part I was able to answer myself with some experimentation.  
pvmove is actually smart enough that, if two segments that are logically 
contiguous are placed such that they're physically contiguous, they are 
aggregated into a single segment.

Unfortunately, I cannot use pvmove in my production environment since it 
needs to create a temporary volume for a move and this runs into the 
"metadata too large" error.

So I'm still looking at how to solve this problem either with new PVs 
(and removing the metadata from the previous PVs, if I've understood this 
correctly) and/or moving the metadata to an external file.

	- Andrew
