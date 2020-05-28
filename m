Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DB52156A22
	for <linux-lvm@redhat.com>; Thu, 28 May 2020 08:14:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3D48185A78B
	for <linux-lvm@redhat.com>; Thu, 28 May 2020 08:14:24 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 28 May 2020 10:14:19 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CAB3eZfsY6hLzJD_AgP+zMKJm-coM134MehCU9me80ePt05-iRw@mail.gmail.com>
References: <CAB3eZfsY6hLzJD_AgP+zMKJm-coM134MehCU9me80ePt05-iRw@mail.gmail.com>
Message-ID: <23204dd6777b6eebd73b7fc6374692ca@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to repair superblock is corrupt
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
Cc: lampahome <pahome.chen@mirlab.org>

Il 2020-05-28 09:35 lampahome ha scritto:
> I create a vg1 on one SSD and create a lv1 in vg1.
> Then I run:
> sudo thin_check /dev/mapper/vg1-lv1
> 
> It shows:
> examining superblock
>   superblock is corrupt
>     bad checksum in superblock
> 
> Can someone teach me how to fix corrupted superblock?

Hi, thin_check should be run against the metadata device (more 
precisely, against a snapshot of the metadata device).

I suggest you reading thin_check/thin_dump man pages: 
https://www.systutorials.com/docs/linux/man/8-thin_check/

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
