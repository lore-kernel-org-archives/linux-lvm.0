Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27CCB202450A
	for <linux-lvm@redhat.com>; Sun, 30 Aug 2020 18:03:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 506B7185A78B
	for <linux-lvm@redhat.com>; Sun, 30 Aug 2020 18:03:44 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 30 Aug 2020 20:01:11 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <8f19f639-107d-610d-0083-596d0c21a081@redhat.com>
References: <83DAD1FF-6CE0-4725-A24D-2AE529433AEE@gmail.com>
	<8f19f639-107d-610d-0083-596d0c21a081@redhat.com>
Message-ID: <29c466317b90d36bff995b3f3d0f4cf2@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm limitations
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
Cc: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>

Il 2020-08-30 19:33 Zdenek Kabelac ha scritto:
> For illustration  for 12.000 LVs you need ~4MiB just store Ascii
> metadata itself, and you need metadata space for keeping at least 2 of
> them.

Hi Zdenek, are you speaking of classical LVM metadata, right?

> Handling of operations like  'vgremove' with so many LVs requires
> signification amount of your CPU time.
> 
> Basically to stay within bounds - unless you have very good reasons
> you should probably stay in range of low thousands to keep lvm2 
> performing
> reasonably well.

What about thin vols? Can you suggest any practical limit with lvmthin?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
