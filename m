Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8CDkpYL001366
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 09:46:52 -0400
Received: from santino.mail.tiscali.it (santino.mail.tiscali.it
	[213.205.33.245])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8CDklhE007311
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 09:46:49 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Sep 2014 15:46:34 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <5412DF0B.40706@redhat.com>
References: <53B41EA2.3010203@assyoma.it>
	<ec2642484312b60a76e570e45a4f2bc9@assyoma.it>
	<5412DF0B.40706@redhat.com>
Message-ID: <a2d1a3dacf1c53a8d0beb02c9b716d1f@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?LVM_and_I/O_block_size_=28max=5Fsectors=5Fk?=
	=?utf-8?q?b=29?=
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
To: Marian Csontos <mcsontos@redhat.com>
Cc: g.danti@assyoma.it, LVM general discussion and development <linux-lvm@redhat.com>

Hi Marian,

> 1. As there are more disks in the VG, can them all work with larger
> max_sectors_kb?

All four disks and relative MD device has max_sectors_kb set to the 
required (large) 2048 value.
They all are recent (circa 2010) SATA disks, albeit from different 
vendors.

> 2. Does it work for md device without stacking LVM on top of that?

I did not try to directly use the MD device. Let me test this and I will 
report here.

> 3. What's your Physical extent size?
> 
>     vgs -ovg_extent_size vg_kvm # or simple vgs -v

PE size is at default (4MiB).

> 4. If all above is fine then it may be related to LVM.

I think so, because I did some test with a _single_ disk (an SSD, 
actually) with and without LVM on top. Without LVM, I see the normal and 
expected behavior - IO transfer size increase with max_sectors_kb. With 
LVM on top, I see the exact same behavior I am reporting: max IO 
transfer size seems capped at 512 KB, regardless the max_sectors_kb 
setting.

It really seems something related to LVM layer.

> -- Marian

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
