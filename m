Return-Path: <SRS0=UyFc=MV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AEFC4338F
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Jul 2021 06:56:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFB261040
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Jul 2021 06:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAFB261040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=netcologne.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-f7f-dhYlMDCHEJjtCysLxA-1; Thu, 29 Jul 2021 02:56:49 -0400
X-MC-Unique: f7f-dhYlMDCHEJjtCysLxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 242B987D541;
	Thu, 29 Jul 2021 06:56:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6695F60843;
	Thu, 29 Jul 2021 06:56:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E82424BB7C;
	Thu, 29 Jul 2021 06:56:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SLx0Zv007631 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 17:59:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A75F106A44; Wed, 28 Jul 2021 21:59:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8469B107115
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2021 21:58:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67D0518A6580
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2021 21:58:57 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1627509537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	dkim-signature; bh=1BR+0Gw/oHcrfIv0tEWXn/Ol/w8b61u3A/kMFWt8j8w=;
	b=E46yuvubaYJ2WD34fORk8sRNyo6YI9f7rPrk/SyAbUrRxYXQNtrJrCJYvHauxOf0eXPlsc
	zCuRmZTB6cIHqUvKQOhOKBTwzBrwTkNkxQvgZEjOSDjZ20F2oT4+816BYtbc72dlxQb3Pf
	8FIKA7aMt99A4mYhsYl0RIyhe2JSeMhuLVS0ahoICdM3+ap7HzkXSvYNKGCT6mQCczDthW
	YTBR3+b/WMs3NVpPF8YJplmgVHFBHij1lkpMTDa/vW84dgcV7l05YhbjmXB4I+USTuITmc
	epTr6WweRw+XCnQJjGDm0ZJKsCMGYR3rXdDonqc+1EIsKZsV7EbhcvXzmAcywg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1627509537; a=rsa-sha256;
	cv=none;
	b=gPty9wwuEzZAYmvlm0LvfeWaVjZb55mk7VGVJJokeFGHJZD2NNzOIxecpg4nLyhSosaaiA
	oumANRNjHJ0rh9KpIeqE/9xDMhM21cyFPNOUSr+Qh60vPyso7ZPeNgLsLqJa1AkemNuM+L
	9xuhjXmR8tgXWioJEwlO8+Ix651B9wM9XI7OhNn4hzls3rkq6nq/lO9wkc8+tKTKm+TDGJ
	y4+NJolTmsBDlf49ZV31Ziocixrif/cgjPoPpwopjZ0CD8VHwLjounplOMql+rEqimkSG9
	bZirlEkWwIcp48excxs6/wsc12ddRB7Zkk0gWf9T7D8+0PQIKs18etkOUkq/dQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=netcologne.de header.s=nc1116a header.b=dgJ+H52D;
	dmarc=pass (policy=none) header.from=netcologne.de;
	spf=pass (relay.mimecast.com: domain of nc-duenkekl3@netcologne.de
	designates 89.1.8.212 as permitted sender)
	smtp.mailfrom=nc-duenkekl3@netcologne.de
Received: from cc-smtpout2.netcologne.de (cc-smtpout2.netcologne.de
	[89.1.8.212]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-489-e1NAl9p3MgO79CuBw7QV5g-1; Wed, 28 Jul 2021 17:58:54 -0400
X-MC-Unique: e1NAl9p3MgO79CuBw7QV5g-1
Received: from cc-smtpin3.netcologne.de (cc-smtpin3.netcologne.de [89.1.8.203])
	by cc-smtpout2.netcologne.de (Postfix) with ESMTP id E457112560
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2021 23:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=netcologne.de;
	s=nc1116a; t=1627509057;
	bh=WZXfqNIorUZePaOCr92nl+VPNoNBYMjDTSB7kOmikMs=;
	h=To:From:Subject:Message-ID:Date:From;
	b=dgJ+H52D375wUhL/keSkc863l+3D0rdLs9s2CtLTI88jEMov+QqeOnw9INnVfOemQ
	zeXmjFmigkWjCYLousumU3LOMk1UNZFl12NPIY+EyuX3N45nVPBRyTbg5c5bj/EHmV
	DY4HAs8OqOU2mDW605uALXClgKc/tes7VmLlAKSxCI2Ruxg6cx1oV7P+Ke3qyHRcxK
	qpz7/7kxaEKEXPChqCGhv6XKnV5zqL/RKkwJRobcLEEzi4RdJ+qneG+zsmQOMPoz4g
	oIZHXrYlxNpFmvnmrcWPb9lmIgfiT5JV9pUc8Z4Nf8OhD6u+YqFJdkl9mlX/TiT0fQ
	GcvVydlBrZ05g==
Received: from [IPv6:2a0a:a546:2791:0:668:9ab5:9769:943]
	(2a0a-a546-2791-0-668-9ab5-9769-943.ipv6dyn.netcologne.de
	[IPv6:2a0a:a546:2791:0:668:9ab5:9769:943])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by cc-smtpin3.netcologne.de (Postfix) with ESMTPSA id A2F6D11DB8
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2021 23:50:57 +0200 (CEST)
To: linux-lvm@redhat.com
From: =?UTF-8?Q?Martin_D=c3=bcnkelmann?= <nc-duenkekl3@netcologne.de>
Message-ID: <630e7a16-5305-9319-52e2-8c45da6e9e27@netcologne.de>
Date: Wed, 28 Jul 2021 23:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
X-NetCologne-Spam: L
X-Rspamd-Queue-Id: A2F6D11DB8
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=netcologne.de header.s=nc1116a header.b=dgJ+H52D;
	dmarc=pass (policy=none) header.from=netcologne.de;
	spf=pass (relay.mimecast.com: domain of nc-duenkekl3@netcologne.de
	designates 89.1.8.212 as permitted sender)
	smtp.mailfrom=nc-duenkekl3@netcologne.de
X-Mimecast-Spam-Score: -1
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 29 Jul 2021 02:56:21 -0400
Subject: [linux-lvm] Questions about monitoring,
	scrubbing & checking a LVM RAID5
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7064329534881907977=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7064329534881907977==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="GxKsolf5j4iFnwFvR1BphZioIHgZOkfDu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GxKsolf5j4iFnwFvR1BphZioIHgZOkfDu
Content-Type: multipart/mixed; boundary="Cfmkh6jfmX8EXF3NEI4hWwz8Fx6GdQG01";
	protected-headers="v1"
From: =?UTF-8?Q?Martin_D=c3=bcnkelmann?= <nc-duenkekl3@netcologne.de>
To: linux-lvm@redhat.com
Message-ID: <630e7a16-5305-9319-52e2-8c45da6e9e27@netcologne.de>
Subject: Questions about monitoring, scrubbing & checking a LVM RAID5

--Cfmkh6jfmX8EXF3NEI4hWwz8Fx6GdQG01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Dear LVM2-People,

I made a native RAID5 via LVM on 3 SSDs without mdadm, since LVM2 can do=20
it natively.

But I got confused about how to easily monitor it (send emails about=20
errors, since it's a remove server) and how to check, repair and scrub=20
the RAID5.

Using:
"sudo lvchange --syncaction check cryptdata_raid5/home" (same for=20
repair) results in

Command on LV cryptdata_raid5/home does not accept LV type linear.
Command not permitted on LV cryptdata_raid5/home.

Does that mean LVM2 doesn't fully support native RAID5 and I should=20
format everything and set up a mdadm raid5?
Because mdadm has scrubbing and email reports according to the mdadm.conf.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen

Martin D=C3=BCnkelmann



--Cfmkh6jfmX8EXF3NEI4hWwz8Fx6GdQG01--

--GxKsolf5j4iFnwFvR1BphZioIHgZOkfDu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE6D66xlprAeml6jXFmSl3x1NCP7gFAmEB0UEFAwAAAAAACgkQmSl3x1NCP7ib
7A/8Do87VNUjWXV7VPM2oxDmIyuzzaHn6wtaZoqD3fJpKR0SgMdUulAEhyMZESpGcIQsck5xCXWH
iH8RH+1uBs9yksTfiK10hgUfJzyAR+2Yp+m98GSR7QMcp7UIelVbhBEcMIItUAOC6lBrtRgeTG6Z
l6ysDwe3zx5DZYvW0ffdiinQCVZb3DtjlsC7UHekcUcFuLTUYu9+gua/CAVFfZzKEhjT2uQQN9fn
zYWNUJpXKejHc4wA4eEwJXGbQ5A3KHoXiF/E9HWP+oX9d1AFVpwwiY/y2ZiqnfgDh3Ay4wUQ28qa
9p8HuyEv39/fTuxNgGbmMx2hdKqRKmZwMJnDL4Wzim7kG0YoQMM63ud7IGhzaH5d1407wgquLsoq
X7u0/3Vga7diadJB64GrT+umAbUDXZdXtcmi4YHGilrAPJqaL995T82l2QReaEObh7rVIgfLXBId
e3mT/KVzvmfqqYKrSucKbXG1SgZvWc54pF6KDRb1BoLQgx6r2HNPlXReqKspXKF11HwdK12fyV+V
gqk0rLN+MxA2XDpLQoMMflciA2tyaTOTmQQGmSYr7IdqSxkfx0TC9+3lq70KqJqQtOaYJREb0tiO
OhkHDUeDmiX0I5lplxGMItgOhZPkPqZlAy3Ul5i9rQY2WNzNksIrA/QbHkeDoOtOIKMzYB/1WdKO
qRo=
=4hhd
-----END PGP SIGNATURE-----

--GxKsolf5j4iFnwFvR1BphZioIHgZOkfDu--


--===============7064329534881907977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7064329534881907977==--

