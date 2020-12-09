Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A513EC19425
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 20:16:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24CEA23A02
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 20:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24CEA23A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462--e3Va-pfN62voQ97TTbPbA-1; Wed, 09 Dec 2020 15:16:04 -0500
X-MC-Unique: -e3Va-pfN62voQ97TTbPbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D49190A7A0;
	Wed,  9 Dec 2020 20:15:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D15F55D6BA;
	Wed,  9 Dec 2020 20:15:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 630F74A7C6;
	Wed,  9 Dec 2020 20:15:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9KFiw2022055 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 15:15:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A50BD2166B27; Wed,  9 Dec 2020 20:15:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CA732166B2B
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2020 20:15:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC968007DF
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2020 20:15:42 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1607544942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=xUjx+Ghip9z62I3hc6jXkbLqg3bZsHVIaKyUaYnC6KQ=;
	b=JxUFBBjiWl70jy2scEvqBLSb210vZLe6KH44hg53tOaBEg/RgaylUIjD+HmzbiWzPv7ri/
	T8d+Z1FmRAd7SWJTNb7hf0CjlvWXofCexMFCMCJOgATCt4wVemZ1ppm41MoLCT7S1Wc+Fh
	8flfTktzYPIJCRCSmHKNHZ2gDgcsS4m1Rr6TYnpF/6R5ATXKWpsKH5Rwk9C2FhfIyQjVI6
	EC14b1M7iYhzXS5GlTJev+CuFKu9NV7cbrHg3yOnFENrtmQNgxL4QLNZ3MSq2GvdImpihm
	PRxF8JZUjEj4O8cDxUrxAZy9QF1v6m/da3mgIAPC4y169pTGVcfQQS/Apil0dw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1607544942; a=rsa-sha256;
	cv=none;
	b=cbNjYwRuYUw7Rcy6V+9DWb7I5arGECnnnIfrGOgKfV0tUSOmYSOzkL5v+dR6iTh5Nge4z4
	DjMb1UzpGyMPCmASa/MffoilDNCqD/JKFjPqVIojUFdMK8ipNdbCc8Qc3K1QqZb6cioB0n
	lI6RsWikdu9jqdjq4eDlHFLnDTdzNLgkb0rQYw72QkaZ+DMiBlf+i2cJwoTZU+1ZQVw/k1
	UkiKB2ahjCBQWUr2aHWp56CK+dKFF4L1JaulpyG3HXei4m8Sw8qkSlh/SOtuaN+lpsgq/v
	CXtUbsHy1rWm5l056dIOtZQNPOz2NSdYmDvXZM3TwVszW8HagCevcqFONmwkZw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=KVf1JsAS;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.15 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-589-MQ8d3frqMluHEA1Ujb9mKQ-1;
	Wed, 09 Dec 2020 15:15:39 -0500
X-MC-Unique: MQ8d3frqMluHEA1Ujb9mKQ-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1607544938;
	bh=xpl24OpcpfzVp6ybLPVaHDyZi92TaCMRYpQyYMbDm5E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KVf1JsASAvLfFD5wuThgXwhikaRSTy88XoxZ8rN/HoghWroa7iSKEAFZugZZU8CdX
	9R/RQrjbjhec+M58hfA2B3aae4cZZDNLUluNVpAfVVlW/Bj2uDH1QQjA6zX5qeIWT9
	PUoG6l405ItPFa+RgM+i/zEcWoek86NMi6Pno/Yg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monk.localnet ([79.211.252.228]) by mail.gmx.com (mrgmx005
	[212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1kfQsP45MS-00RZow;
	Wed, 09 Dec 2020 21:15:38 +0100
From: Dennis Schridde <devurandom@gmx.net>
To: David Teigland <teigland@redhat.com>
Date: Wed, 09 Dec 2020 21:15:25 +0100
Message-ID: <2815973.mvXUDI8C0e@monk>
In-Reply-To: <20201209193051.GC15208@redhat.com>
References: <4384449.LvFx2qVVIh@monk> <5900102.lOV4Wx5bFT@monk>
	<20201209193051.GC15208@redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5TJuDBh+WCgw+BJNNHUXvMLJ75QnX9xEfWJw7aoaYi1v5smHBCQ
	uvVq0PKSDBSOPhN2KRJsmmz7efMrk5xaaZZVx0QilMCXaH/HUcqiX/SeJK7zu2xneWAN9XA
	9aXb4mPKU2J6MAdY89kwdrw4BAakSjX1HnS22Te3pegDAmfNWNQmKX72nRw2yW7FReQ1tyS
	9nIG+BW0KZE/M26PiA9Gg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TnFHOxZNxKs=:V4UmUmVDoXSL+0MzZtE3Dy
	1s9Y1NM4VfH3lqexVWF/wRnn36nbCWtOIQ/lfpbGTAhft3c3CCJMt98fbEXvaxJJL7wO/sGOG
	WtPf4RFTfmt2mPCLBxrB1TYTF/wOJSgJoaKhwN8MBTY9h1aYIkfqu7ez4R8N/XbZs0dWrZyEx
	OddzSBFgxB7A+by/ZsIvlpKA2cDFlZCYUqr1d+jcBGgr6p3MAVEIE+eqYN2Ax3QVEVr+ygHEp
	pG2Yml3wEB4qwTqpNgydIOq1Mr5sv0USAXJ6HpPtmkbfOP5JB60CznyDsi4C1Ixe9TqW6yUuH
	n/3ohyOJvTKG/VpNLhkzczoyTkiSCIU4xkHfaVBcdoqnsNK77vPBBrhijjWzmqVa9T9vTnsHa
	b+XVyhVi6x5wc9oJwvlwqH/7ytOb0oQmYaC0n2J4FGOtKBdP/5SmEYckyo/bSdzCTSp6paCkd
	kBiwF+Mu0eslUzIa/NZkeFPLG2DzIcWUsnxB0TqL3JMeCOs5GNB6h1HlwO0hiM1DpqHXx5GQK
	YVZSd+XWjQa6Tspw0nHPYiHjdWYF1Mx6tdeQ1YR08PkSpw3hasvXvxRaC9euIhN2gQRsuhRSS
	KUDoYT8tiF8WWU0izC/mfebaoDHNjaQxy6VPrZbm0Ukiz7Zg4OE07PkJjDXXlgyFhfH47DBLl
	KMT90xPArdjBcW/pDJtnDr5MzmOn5LcJs3f+ZiXW3oYqg4ezitdD8Q1l6okaQcpmgnrRyQiuM
	C3Jc4klhqJYaPJw26Kd3qhiA4f/OhCtg6aQjmjRcygQo2W2rsH5hrejn8R8xfOeFufFLX0fmW
	GBwVHpIqbZD7CohpqbHqBEMqNTalSLao/Vw0m5YcEG4hRNtdeyiamit0jlajkac3iGenZmDy1
	xY8fkSK3pTGngvZcYKlQ==
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=KVf1JsAS;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.15 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
X-Mimecast-Spam-Score: 0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6501356290521198372=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

--===============6501356290521198372==
Content-Type: multipart/signed; boundary="nextPart11909134.O9o76ZdvQC";
	micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart11909134.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Dennis Schridde <devurandom@gmx.net>
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
Date: Wed, 09 Dec 2020 21:15:25 +0100
Message-ID: <2815973.mvXUDI8C0e@monk>
In-Reply-To: <20201209193051.GC15208@redhat.com>
References: <4384449.LvFx2qVVIh@monk> <5900102.lOV4Wx5bFT@monk>
	<20201209193051.GC15208@redhat.com>

On Mittwoch, 9. Dezember 2020 20:30:51 CET David Teigland wrote:
> On Wed, Dec 09, 2020 at 08:06:41PM +0100, Dennis Schridde wrote:
> > How would you proceed to repair this cache?  I can recreate it as a
> > cachepool, but first I need to gain back access to the data, i.e. get
> > into a state where I can --uncache.
>
> I know that cachevols do not yet work with lvconvert --repair, which uses
> cache_repair, but this must be another case where cache_repair is still
> needed.  If this is writethough mode you should be able to simply drop th=
e
> cache with lvconvert --splitcache and then recreate it.

Would this be safe if cache_dump showed all blocks are clean (dirty=3Dfalse=
),
even if the cache was in writeback mode?

--Dennis

--nextPart11909134.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAl/RMF4ACgkQz+h/M161
qdxsdgwArGQ+d+fMBXNnOCeU/POcEnle/e/m02DjVojJt5AkRo1sydF2woeToEY6
U0y5+ok1YhmrFLH+bnvYMoNRhwJfwLMpIhDkfTtIiwTyYOlVZyBrXiflPrFqYTJM
khZ0d67h2pOJH4n0ZQnkoDZ28jwI615vKrvTI6Bf6y5TaAK1mSXBVSI7OAqckC+x
CRbxWDXFAdjIcakLsbdMD1C0QYRzlexD9kPGAEDw+GsAkUMS40IoKzDVwAV3BFIz
ua/VP3AYyIiq7QBbpLY9Gx5NaDGCk2QdFr6Nkvd6kGeT6bAqpNOzaid2/XsXgRPj
UEKuL3A1HzfjFvFhQ5Q57gAG5U5txvocgD4MedpKrwzWVDQzC7RTeM3rMlhu9OgM
H9OsZaP25TeSa9SqoyVPmGn0vHiusZxwUaZbAoA5I7HfKgWt1S9V1ucnxeY7Rcf3
K7RIiK+z/iA/rePlxS5pz/yxWHw0yA0JKNCmQgQAkhwwppY+EJn8mAnDPQ/U1x+R
QYqpYBi4
=uHmo
-----END PGP SIGNATURE-----

--nextPart11909134.O9o76ZdvQC--




--===============6501356290521198372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============6501356290521198372==--



