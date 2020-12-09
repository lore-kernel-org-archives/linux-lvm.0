Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44760C4361B
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 19:59:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F64B23A1D
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F64B23A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-Sm3T7R8VNl2x17c4jn8pwA-1; Wed, 09 Dec 2020 14:59:04 -0500
X-MC-Unique: Sm3T7R8VNl2x17c4jn8pwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1EBCB8132;
	Wed,  9 Dec 2020 19:58:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6333F60C91;
	Wed,  9 Dec 2020 19:58:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E012B4BB7B;
	Wed,  9 Dec 2020 19:58:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9JvLR2020281 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 14:57:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 337D72166B2A; Wed,  9 Dec 2020 19:57:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E0B02166B29
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2020 19:57:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12043802A5D
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2020 19:57:19 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1607543838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mUjGIpEuX/G9o/GlJrSgn1RxsufSB+W/NakRumltCKI=;
	b=eudow0c5fLBpxhrE4AtCinH5h4SDY/MzOrDmRhn1PRNo9z/aOG36JrkPZPEkzq1UQCpBwm
	VUxQ/Kw/OwoMUQqNBWKxQMMqsiuQt52dwJJHnPr58P11yOIR9yqD9Q7uHnhcG45LDcPcv+
	D7BLyqkU2ku7fJW9rI7FptyFRgex9OUBdn96gVAWBclxfz5Mq3n5kzAzqasOMjy7P3EsKM
	lDo0JTjmJ5FCbC9ken92Z9mPMTc6PeicuhMTF56WqSAPmiEePgVz9oMXAJE9xteNLjl+J1
	fD2mzoZD9YdS0LvmFBSezvh6BF3Gvu/Bceyvy6KzINrkvsdeauK0iprMcqVk6A==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1607543838; a=rsa-sha256;
	cv=none;
	b=LN4Hh+rY65/YyTf7llNJyU78JtvViukWSkjt9Fq37Po5k4dW6DxS10zRt88E7CGSEDvwVu
	ARUr10AoSPecLAfxlOuirDC3yCqjJKfWUOfE3t3PfNZN8wZd4CVwOdT7cdpLeX/ttW2aR3
	OErk+GOxmD9ySNmeHlZmXyuOcN8pPvBpMiJGFVRcqAkmW2Jc1pIhPRIh27rmuR1Wf8v70R
	Vl/6+6zHBpADDlIfdxbPmp6kPofLfkBeUTKyRbA9NofXY5v+G0hjaLUZ/89l5j/NbWFjN8
	Zrr08AlJmOYXYfWJYhXBwevWypSpGNj8OzueDgrBL5gux8+09S5cPsH1OKKKPg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=dHs7u1kG;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.19 as permitted sender)
	smtp.mailfrom=devurandom@gmx.net
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-411-bm8xjMlyPhOo5lYvRTLwBA-1;
	Wed, 09 Dec 2020 14:57:16 -0500
X-MC-Unique: bm8xjMlyPhOo5lYvRTLwBA-1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1607543835;
	bh=mISbPOfeJKwAt44Hu+iB4sNUcAaOaEanJCIiU8EmRX0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dHs7u1kGVS7rJo2bGOsq1nLfBdRu/pTsol2fwwuswWfONfgbRc3nKiK9uH+okS4Yz
	JQX7kzcUTfd7XdjtFjJHTQHH+HHpLLh7jbxLpqCOfHgl699fAdjUBtJjkF8TyA+vTS
	o06WD4qLUSzUArCiumErrWnd6Xa7U157PnBhCgT8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monk.localnet ([79.211.252.228]) by mail.gmx.com (mrgmx004
	[212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9uK-1kW6xs3gRe-00IDz2;
	Wed, 09 Dec 2020 20:57:14 +0100
From: Dennis Schridde <devurandom@gmx.net>
To: linux-lvm@redhat.com
Date: Wed, 09 Dec 2020 20:57:07 +0100
Message-ID: <11903480.O9o76ZdvQC@monk>
In-Reply-To: <20201209193051.GC15208@redhat.com>
References: <4384449.LvFx2qVVIh@monk> <5900102.lOV4Wx5bFT@monk>
	<20201209193051.GC15208@redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Gw8Oh+AwJ3iYxeETySWPyK1WTl7vSzz3MoygiLd6koOQDR49QVJ
	om5cWgWSZR4Oq4SO9uK89JtzNY0u8PAsp2J13p2LHDd7wqjSwV1FXgC5Od2vMwmCUesp6xZ
	Ez1bomKs5QHfLZKwiNwx57vr5T2lPjBqe15DTmiNuGvq7oDZGtXeROYA7Jf15ingaMjphG0
	xOm6a4leh3+mK0/VaMtig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y5bUdBiupHg=:Km07oPUvQ/G7WTwFQ1O9fn
	P/pOyw8QvbsARO8UOv3Vsrhks/l4ZpTpGOmCvMPMyVmAlLQ5E5+Ds+y2V2GXwO0T7u7dsdj8q
	wQES2l74VxSM3NY9gVKlitbBJQR1/fZCf6lSo7jMLJr1x1ZeK4Z0D6TM1b66MrsZG3XL5YBFv
	PlmFPEvzXEXJpeCB81G1m7mIXjNFG28q5GPUaVu6omTT+BOBPln91ruxPqaQ62IqMN7E0N819
	YFl0JCg4xPD9X8Hkw/YbAPfmxrcMWX6XMIP7m84VKER+3wb+tPG9+sofbcVRF+qOl1fiYJC7p
	QaScXmWmUXwNuIYHSZtyGpiYA5w+e/RMiZjQaLNNkmet4F1uXpD40UoUGUds1JCT5/r3x7Z82
	bV0Qp70xUKlylmm2BPxGYaZ/03vqIiHNSynKsxd3gfdxAaifW2exqnbF4F/m7YsmkIicAnOFV
	m+mAGjt0ol4N4I/Hev+uCsutE1tcgk0+Q03HlX7A/X/qwZoBnMh7UoxpSwTfhrL2ERfmw+nM9
	fFpqvg9NJN8RcZozQJdd3nuH5/fYYa1R5DL6+e2DH61Aj/VDxsJg8FVAMy3bI11ZpLatO7TUq
	E+u0lDbpASuowE6PjP/1A8r4Pj25et7WsloER0m5Sz5sIqqA8eZn+XaAuGzrchyw2d9+OEy5t
	LsF1SEtrgFyiaQIbtiKcvaxu43jw4+R9S8PDQaSizV/OgiTm4VmedbYDoqkudNQAho7UGpe6r
	LBjPDF0IFiCsayNHXNhCWE5lgy/i1emlxhN5v4cKMFrcpzknEgK6n1vGfdtrsc4t75NJPqVT8
	EIIK95XiEdzUKlVMV/eMx+Un1jyDMBxusQT40mylXz85X+ve2QsOmYTjfH4h/dA1do25AJD+5
	Sgolzl1TJS25eCf6URww==
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=gmx.net header.s=badeba3b8450 header.b=dHs7u1kG;
	dmarc=pass (policy=none) header.from=gmx.net;
	spf=pass (relay.mimecast.com: domain of devurandom@gmx.net designates
	212.227.15.19 as permitted sender)
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
Cc: David Teigland <teigland@redhat.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============8234261595491994119=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12

--===============8234261595491994119==
Content-Type: multipart/signed; boundary="nextPart5667217.DvuYhMxLoT";
	micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5667217.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Dennis Schridde <devurandom@gmx.net>
To: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
	needs_check flag?
Date: Wed, 09 Dec 2020 20:57:07 +0100
Message-ID: <11903480.O9o76ZdvQC@monk>
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

Sadly the cache is in writeback mode.

Is my understanding correct that the cache itself is fine?  It is just the
inability to clear the needs_check flag that is preventing me from using th=
e
device?  Or did I miss to run some checks that could reveal a problem / did=
 I
misinterpret the output of cache_check on lv_cache?

--Dennis

--nextPart5667217.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAl/RLBQACgkQz+h/M161
qdw2qwv/azwRSS1f2rPJUYqpmhxYOc176OUCBpUy0Jp7MkKGR7MnRPcSn9tPiHen
+TqkOPCj3SSNmQoC//kdVKJeuZxaKpLoZJ0OiuUmlMmaXLjv5fC6Yiyem/guxNrS
h4auCZnJ8lW/XJIz9k/BGlyJdL70lhqQVES1gNOGj1eOh4/j5exPawVHb4bkNAfp
FDMS3RvZYajCbIYJcR45cIfm3mmLVRTekx48uEzBHaTdrqwZIt0QAZIdd1wK5a7O
b1ZCyrUpFbcBr+6Qax4WVR+81crvzh8R8XCrpbMPXrkcAw/BSp+Mm4m1mCMRQWdW
dkz47NrFZYXHt/R62yjHGoGzG2nnrJElf1yIm4CqKO1oGfiqiKCgaYajYJ/mAcLN
AZHWf5UU5BHCc4dhbE2pPA+ccQlwTYGPxbmiflkAr0x0V1eO1UUBIQtMxUeZ5rJ0
EVtVgS3W4gLTFOyDgdF/Uj2/BXmurBpoSua5hrUTW3MCIX5EAiKc4O/g/R8dCV5J
aYNsPNOe
=eySI
-----END PGP SIGNATURE-----

--nextPart5667217.DvuYhMxLoT--




--===============8234261595491994119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8234261595491994119==--



