Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFFF2026D69
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2020 09:31:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54FE4800307
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2020 09:31:48 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 Feb 2020 10:31:43 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
References: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
Message-ID: <7c2966762598bf3ab8667bcd0b429464@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] faster snapshot creation?
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
Cc: Eric Toombs <ewtoombs@uwaterloo.ca>

Il 2020-02-22 12:58 Eric Toombs ha scritto:
> So, is there a sort of "dumber" way of making these snapshots, maybe by
> changing the allocation algorithm or something?

Hi, I think that total snapshot creation time is dominated by LVM 
flushing its (meta)data to the physical disks. Two things to try:
- use thin lvm snapshot (see man lvmthin);
- create a pv/vg/lv from a memory-backed loop device (ie: truncate 
--size=1G /dev/shm/test.img; losetup -f /dev/shm/test.img; pvcreate 
/dev/loop0 and so on...)

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
