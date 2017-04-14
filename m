Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2A9D60A99
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 07:23:24 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id EBE6E3D97C
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2017 07:23:21 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 09:23:17 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
Message-ID: <062fccc39afe128ef5950634309a01ea@assyoma.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Il 13-04-2017 14:59 Stuart Gathman ha scritto:
> Using a classic snapshot for backup does not normally involve 
> activating
> a large CoW.  I generally create a smallish snapshot (a few gigs),  
> that
> will not fill up during the backup process.   If for some reason, a
> snapshot were to fill up before backup completion, reads from the
> snapshot get I/O errors (I've tested this), which alarms and aborts the
> backup.  Yes, keeping a snapshot around and activating it at boot can 
> be
> a problem as the CoW gets large.
> 
> If you are going to keep snapshots around indefinitely, the thinpools
> are probably the way to go.  (What happens when you fill up those?
> Hopefully it "freezes" the pool rather than losing everything.)
> 

Hi, no need to keep snapshot around. If so, the classic LVM solution 
would be completely inadequate.

I simply worry that, with many virtual machines, even the temporary 
backup snapshot can fill up and cause some problem. When the snapshot 
fills, apart from it being dropped, there is anything I need to be 
worried about?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
