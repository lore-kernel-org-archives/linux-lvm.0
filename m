Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B63F80AB6
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 05:28:42 +0000 (UTC)
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 3D4F6C047B64
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 05:28:40 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Sep 2017 07:28:38 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <832949972.1610294.1505170613541@mail.yahoo.com>
References: <832949972.1610294.1505170613541.ref@mail.yahoo.com>
	<832949972.1610294.1505170613541@mail.yahoo.com>
Message-ID: <a1ab16ea62d8f038973678621d8208f5@assyoma.it>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 12-09-2017 00:56 matthew patton ha scritto:
> with the obvious caveat that in ZFS the block layer and the file
> layers are VERY tightly coupled. LVM and the block layer see
> eye-to-eye but ext4 et. al. have absolutely (almost?) no clue what's
> going on beneath it and thus LVM is making (false) guarantees that the
> filesystem is relying upon to actually be true.

Sure, but in the previous examples, I did *not* use the ZFS filesystem 
part; rather, I used it as a logical volume manager to carve out block 
devices to be used by other, traditional filesystems.

The entire discussion stems from the idea to let thinp reserve some 
space to avoid a full pool, by denying new snapshot and volume creation 
when a free space threshold is crossed.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
