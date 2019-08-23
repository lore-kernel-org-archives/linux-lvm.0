Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B956A514
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2019 14:58:38 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5065310C6961
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2019 14:58:36 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Aug 2019 16:58:30 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <b17bea72-f9c3-9be6-c237-f56b8b446530@redhat.com>
References: <e11a2dbd-de9c-475f-bf6e-36cab78f7165@www.fastmail.com>
	<36c36310-1771-fed1-e208-3db7c0f9c768@redhat.com>
	<ee8820cc-8d2d-4503-afb1-9654e12745c4@www.fastmail.com>
	<b17bea72-f9c3-9be6-c237-f56b8b446530@redhat.com>
Message-ID: <07a8641dd1c8c10b24a65f546557685c@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Dave Cohen <linux-lvm@dave-cohen.com>

Il 23-08-2019 14:47 Zdenek Kabelac ha scritto:
> Ok - serious disk error might lead to eventually irrepairable metadata
> content - since if you lose some root b-tree node sequence it might be
> really hard
> to get something sensible  (it's the reason why the metadata should be 
> located
> on some 'mirrored' device - since while there is lot of effort put into
> protection again software errors - it's hard to do something with
> hardware error...

Would be possible to have a backup superblock, maybe located on device 
end?
XFS, EXT4 and ZFS already do something similar...

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
