Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13CDB0671
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 13:41:09 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3E4F7FD42
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 13:41:08 +0000 (UTC)
Received: from elissa.gathman.org (h.elissa.gathman.org
	[IPv6:fc37:2c50:7583:e01a:8c69:8f50:8dcf:a076])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v3DCurBJ022016
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 08:56:54 -0400
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
Date: Thu, 13 Apr 2017 08:59:07 -0400
MIME-Version: 1.0
In-Reply-To: <dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Using a classic snapshot for backup does not normally involve activating
a large CoW.  I generally create a smallish snapshot (a few gigs),  that
will not fill up during the backup process.   If for some reason, a
snapshot were to fill up before backup completion, reads from the
snapshot get I/O errors (I've tested this), which alarms and aborts the
backup.  Yes, keeping a snapshot around and activating it at boot can be
a problem as the CoW gets large.

If you are going to keep snapshots around indefinitely, the thinpools
are probably the way to go.  (What happens when you fill up those? 
Hopefully it "freezes" the pool rather than losing everything.)

On 04/07/2017 12:33 PM, Gionatan Danti wrote:

> For the logical volume itself, I target a 8+ TB size. However, what
> worries me is *not* LV size by itself (I know that LVM can be used on
> volume much bigger than that), rather the snapshot CoW table. In
> short, from reading this list and from first-hand testing, big
> snapshots (20+ GB) require lenghtly activation, due to inefficiency in
> how classic metadata (ie: non thinly-provided) are layed out/used.
> However, I read that this was somewhat addressed lately. Do you have
> any insight?
>
