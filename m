Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3458F112D170
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:24:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A74906399
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:24:13 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 00:24:05 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <alpine.LRH.2.23.451.2009151726030.32184@mail.gathman.org>
References: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
	<257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
	<alpine.LRH.2.23.451.2009151726030.32184@mail.gathman.org>
Message-ID: <1f3665cda84cb1fe3bbb1a0ad52b588c@assyoma.it>
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
To: Stuart D Gathman <stuart@gathman.org>
Cc: Kabelac <zkabelac@redhat.com>, Zdenek, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-09-15 23:30 Stuart D Gathman ha scritto:
> My feeling is that btrfs is a better solution for the hourly snapshots.
> (Unless you are testing a filesystem :-)

For fileserver duty, sure - btrfs is adequate.
For storing VMs and/or databases - no way, thinvol is much faster

Side note: many btrfs guides suggest disabling CoW fixes btrfs 
performance issue. Reality is that noCoW fixes them partially at best, 
while at the same time disabling all advanced feature (checksum, 
compression, etc). Snapshot automatically re-enable CoW for the 
overwritten data.

> I find "classic" LVs a robust replacement for partitions that are 
> easily
> resized without moving data around.  I would be more likely to try
> RAID features on classic LVs than thin LVs.

I agree for classical LVM.
However thinvols permit much more interesting scenario.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
