Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E442A5C1D6
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 22:53:50 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EEB918CB8E0
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 22:53:49 +0000 (UTC)
Date: Tue, 22 Oct 2019 18:53:41 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <9e58accdc28692b3c8b2b09f37bce57c@assyoma.it>
Message-ID: <alpine.LRH.2.21.1910221846190.5121@fairfax.gathman.org>
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<9e58accdc28692b3c8b2b09f37bce57c@assyoma.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: =?ISO-8859-15?Q?Dalebj=F6rk=2C_Tomas?= <tomas.dalebjork@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 22 Oct 2019, Gionatan Danti wrote:

> The main thing that somewhat scares me is that (if things had not changed) 
> thinvol uses a single root btree node: losing it means losing *all* thin 
> volumes of a specific thin pool. Coupled with the fact that metadata dump are 
> not as handy as with the old LVM code (no vgcfgrestore), it worries me.

If you can find all the leaf nodes belonging to the root (in my btree
database they are marked with the root id and can be found by sequential
scan of the volume), then reconstructing the btree data is
straightforward - even in place.

I remember realizing this was the only way to recover a major customer's
data - and had the utility written, tested, and applied in a 36 hour
programming marathon (which I hope to never repeat).  If this hasn't
occured to thin pool programmers, I am happy to flesh out the procedure.
Having such a utility available as a last resort would ratchet up the
reliability of thin pools.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
