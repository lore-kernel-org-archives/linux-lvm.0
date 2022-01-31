Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3E1C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 31 Jan 2022 15:29:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-d0XPqWgpMYmy6mFW0lPI1w-1; Mon, 31 Jan 2022 10:29:27 -0500
X-MC-Unique: d0XPqWgpMYmy6mFW0lPI1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A5F8519E6;
	Mon, 31 Jan 2022 15:29:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87731108F845;
	Mon, 31 Jan 2022 15:29:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07D054BB7C;
	Mon, 31 Jan 2022 15:29:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFT4ZS008116 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:29:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47E92401E37; Mon, 31 Jan 2022 15:29:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441B7401DB8
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 15:29:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13CC5181B7AB
	for <linux-lvm@redhat.com>; Mon, 31 Jan 2022 15:29:04 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
	(wout4-smtp.messagingengine.com [64.147.123.20]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-596-LJbUaS1gOhe2S0j_0bvVuA-1; Mon, 31 Jan 2022 10:29:01 -0500
X-MC-Unique: LJbUaS1gOhe2S0j_0bvVuA-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 761C83201FF0;
	Mon, 31 Jan 2022 10:29:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute2.internal (MEProxy); Mon, 31 Jan 2022 10:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4d/ZFSIb5sFNN9NAV
	Wj2+vFvOGL6lTwYbnw5CHGRXcE=; b=kyWazx1NWeXOrZnEWF0h8+7kx2vJjbQSq
	VVkTufXby36sIurmd6Bzk0oD7qit5SMvfnTriUT0aMiFlHAKVrNOwNt4LhOjH4IE
	J+JUS3Vw9OwyOL/XYanAy46E4Pwy/CmcP2cNdyH4YSdLuhsq/Qa4IHZHzthWfbP8
	UP31RVEXhsKmfDMrqU51klDulEWHHwhgnJM9M8dYkm9rjUXOXI5aF5gKnObBv7Yk
	pj2Hb7opb2522CuAXwPay/hevdgNBZgWPkv3sXQi/WQawPjppxBvLNZEfv5oRu/5
	dWTDilmdnqlOJ621Oaw9CbuflPqEBfpUt+6cHrrToKJryBf4o4jNg==
X-ME-Sender: <xms:OwD4YR16jCzP5XAtQvIsRH_HeLLyg9LabSmXbjPx2Ir1h81MAj4MlQ>
	<xme:OwD4YYEoOC539nfHUEh2P_26lX-GroU9m8qx4o_HUIBFxLaecBVa276kIbfyWpiwg
	8YgwiqYT7RZ2u8>
X-ME-Received: <xmr:OwD4YR59mU7B8qKQz6Lpsdw3p6lq9-9wgLkB_918yI52j71gS-aidCRfb5vp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugdejjecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnhepfeevudegkedujefhgeeffeejhfeuffef
	heeuueelueekhffhudetudehveffudeinecuffhomhgrihhnpegrshhshihomhgrrdhith
	enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
	ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:OwD4Ye2lTv6nkHxlIXGRt7RXxc6f72TFAB5_LBiflxAW9-8B3UUrmw>
	<xmx:OwD4YUFYT6lSWMhm0TjPrq9BWsMQ6utIArmlpqk5XfbkfU6ZmcAtsw>
	<xmx:OwD4Yf-V5ZoUWeBiIBv7of10DG97OjlxIUP4mBC-LYsKogsR_dLNDQ>
	<xmx:PAD4YXyKzj9xUwDRcsWWz2W_z9aWVfABhuF5vFTHFxZHQLO3ZR5eGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
	31 Jan 2022 10:28:59 -0500 (EST)
Date: Mon, 31 Jan 2022 10:28:57 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <YfgAOeqHtutU91rI@itl-email>
References: <YfV9SAsGJBGMMv1b@itl-email>
	<9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
MIME-Version: 1.0
In-Reply-To: <9c35198501aae82e7a911f5418cfd7f6@assyoma.it>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool
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
Content-Type: multipart/mixed; boundary="===============0047468249385904799=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22


--===============0047468249385904799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RBDMtWpcnQMcMpvL"
Content-Disposition: inline


--RBDMtWpcnQMcMpvL
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Jan 2022 10:28:57 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Running thin_trim before activating a thin pool

On Mon, Jan 31, 2022 at 12:02:23PM +0100, Gionatan Danti wrote:
> Il 2022-01-29 18:45 Demi Marie Obenour ha scritto:
> > Is it possible to configure LVM2 so that it runs thin_trim before it
> > activates a thin pool?  Qubes OS currently runs blkdiscard on every thin
> > volume before deleting it, which is slow and unreliable.  Would running
> > thin_trim during system startup provide a better alternative?
>=20
> I think that, if anything, it would be worse: a long discard during boot =
can
> be problematic, even leading to timeout on starting other services.
> After all, blkdiscard should be faster then something done at higher leve=
l.

thin_trim is a userspace tool that works on an entire thin pool, and I
suspect it may be significantly faster than blkdiscard of an individual
thin volume.  That said, what I would *really* like is something
equivalent to fstrim for thin volumes: a tool that works asynchronously,
in the background, without disrupting concurrent I/O.

> --=20
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8

FYI, you might want to specify a full fingerprint here; short key IDs
are highly vulnerable to collision and preimage attacks.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--RBDMtWpcnQMcMpvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH4ADkACgkQsoi1X/+c
IsFphBAAtuhjBQ/iJdtQuaIE2C1n9rVm6fihp5h5QA74LAFRoooOWAHgXIdSPbWS
+MixJ/xqQdX6WzgRTiWVqtWqnptwfDLRJnN1jv8ZcTRULQZfcxTmq7YrmTLRTgh/
wlBbwGGEXNKDthvplSp7+i4byImgelhM7zaYsDMqdstp8Q5l+K1jErwwcoAArqYJ
U8gxu4OBv77QM31N1FMLa0lmQcq4A6m2slzdYyz2MOzPMEZEN1KH5fba4AGjPC/y
7xKPfQpdnOZiqM7QqKBQoVsd4ZYlafiep3VFxYce7ke95guVE2nHzZcMU5iEetqQ
YR/ycL71ZdraORIbZ9gAzAg6uTrBYEUxjL7VSQMmPafAq0GYJjkXK+47kQ9NRq6B
kcNgrhA22hFa1lxPrJEUzDTYl3oR5NdBMM2io4h7Dh3NocvS//AXlrn79GP26Fnu
ZqppasmAy1LnUzFYxiiIZ4+X6yvTleIPgGyjNUgWPp/adRawUWOibMrPW51E+fgU
Una9IcxRmnTfiG/Og4Aua5ar7d30+q6oYcIGmNFPLA0FxPJ7h4UVOwm42Jzd9c95
9dy/hx4N4f/kuEW3L+TDDbY+6WwIlSd08yeTiVo4YyRUCdIv2Mvo+iFF2o6FZIKe
eefk6qLZ7+gviL+P6GIZifzpy0M3BTjWs2PEfiQI6g+8vtAYVtI=
=p/t/
-----END PGP SIGNATURE-----

--RBDMtWpcnQMcMpvL--


--===============0047468249385904799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0047468249385904799==--

