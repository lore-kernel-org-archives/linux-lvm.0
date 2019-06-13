Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3ED60A9A
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 19:58:42 +0000 (UTC)
Received: from mr014msb.fastweb.it (mr014msb.fastweb.it [85.18.95.103])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5096530842AF
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 19:58:15 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Jun 2019 21:54:35 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <5d0599c5-699c-7c35-8847-3c4787e3e245@izyk.ru>
References: <5d0599c5-699c-7c35-8847-3c4787e3e245@izyk.ru>
Message-ID: <7ee5ada1a5dc5256064c475f3179c6ac@assyoma.it>
Subject: Re: [linux-lvm] Maximum address used by a virtual disk on a thin
	pool.
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
Cc: Ilia Zykov <mail@izyk.ru>

Il 13-06-2019 18:05 Ilia Zykov ha scritto:
> Hello.
> Tell me please, how can I get the maximum address used by a virtual 
> disk
> (disk created with -V VirtualSize). I have several large virtual disks,
> but they use only a small part at the beginning of the disk. For 
> example:
> 
> # lvs
>   LV         VG  Attr       LSize   Pool     Origin Data%
>   mylvm      CVG Vwi-aot--- 100,00g fastheap        7,13
> 
> 
> Please advise me how to determine from which address the virtual disk
> did not allocate real disk space? And all the data read from addresses
> greater than this address will be exactly zeros. Or maybe, how can I 
> get
> map of the used chunks of disk?
> 
> Thanks.

Maybe thin_dump[1] can help you?
Regards.

[1] https://linux.die.net/man/8/thin_dump

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
