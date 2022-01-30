Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB9BC433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 00:33:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-ztYysqsuO_CcWekAgXcYvg-1; Sat, 29 Jan 2022 19:33:55 -0500
X-MC-Unique: ztYysqsuO_CcWekAgXcYvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D99391083F65;
	Sun, 30 Jan 2022 00:33:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81AFC101E589;
	Sun, 30 Jan 2022 00:33:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B19664BB7C;
	Sun, 30 Jan 2022 00:33:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20U0XD3X021344 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 19:33:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7894640885CC; Sun, 30 Jan 2022 00:33:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7233240885C8
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 00:33:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5880C28EB7B3
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 00:33:13 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-660-vgrP_M6XNSGmLrLTcEFmJw-1; Sat, 29 Jan 2022 19:33:11 -0500
X-MC-Unique: vgrP_M6XNSGmLrLTcEFmJw-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DC7235C00D6;
	Sat, 29 Jan 2022 19:33:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sat, 29 Jan 2022 19:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xekDClXSFNUSxo0rx
	5b1gHnhOWYgRyVgB09CKA41zHc=; b=TsaohUD7KbWwfVOrS+oq7pkUh5ocSFnat
	wDzr53X4AWwefXgEgCyHSCmxxVMOlO/DfCFPufuaf9rW+TO4t6GFGCzutvbplKKh
	bRkrkpHKVdm6G1YoHi4R8PZKtCMyNoIIfNhqIdDphvzn9WXrSMRcbzeIkfsb/I+o
	fLP8m3/VIBig7i/0KyOurJsmtKapFW+b/P0TTA9siuWuatk34VdlmQOGRlazIPeU
	nyaKmHZ/T+CZofPor6QlnbDMXrgGPVzSBJnLGzl4HwwXfuQf6QIvVJv26eChI+dW
	CYPGYkg9RBFC8l8CQxHpyrgoMfygzRiy7lZ144nanpPiGxo5rCwrQ==
X-ME-Sender: <xms:xtz1YeSOsrMyRdyaz6GZF-qwKVP0qH_5BnwJHoGfaS3VAaPJNg5y6w>
	<xme:xtz1YTzLjan32GUAlLnSGmN7_2CCZRRfWP7N8SHCFXEHUiz2K5CY7yFI6osKLKceY
	bF6Y_Gc7FX-Ong>
X-ME-Received: <xmr:xtz1Yb3Ip_CGLu4uYpk5c3VJFsF8SAFnuzYerjHfGEZfcm9sheCBBxb7kC9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeekgddtfecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnhepiefgieefvdfgjeelfeeifefgjedvvdef
	leegleeifeegfffhgffffeffhfeuudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
	hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
	sgdrtghomh
X-ME-Proxy: <xmx:xtz1YaCy6W5cXtuF7LGffO-RLvBdGqxkn2Nkr5P8Fgds8ysqv9U4rA>
	<xmx:xtz1YXiSwNePXO3X6psv3oAUPyioeWkCEh3o8ThSShGL9WIJO77wQA>
	<xmx:xtz1YWrJHHgJ4IDSqVv4A5YnJ0q4MR642OzZ-Yetb1NGGYjzGUkCYw>
	<xmx:xtz1YZep8f8tj-L9U3ohIyb76x19-fUt6o73Z2mE2d_C69GUgZpSJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
	29 Jan 2022 19:33:10 -0500 (EST)
Date: Sat, 29 Jan 2022 19:32:51 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfXcxHenCZw4+EFX@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
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
Content-Type: multipart/mixed; boundary="===============1543999132663068489=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22


--===============1543999132663068489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Na5B9xJqG9iTs80k"
Content-Disposition: inline


--Na5B9xJqG9iTs80k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Jan 2022 19:32:51 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: LVM performance vs direct dm-thin

On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
> Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):
> > How much slower are operations on an LVM2 thin pool compared to manually
> > managing a dm-thin target via ioctls?  I am mostly concerned about
> > volume snapshot, creation, and destruction.  Data integrity is very
> > important, so taking shortcuts that risk data loss is out of the
> > question.  However, the application may have some additional information
> > that LVM2 does not have.  For instance, it may know that the volume that
> > it is snapshotting is not in use, or that a certain volume it is
> > creating will never be used after power-off.
> >=20
>=20
> Hi
>=20
> Short answer: it depends ;)
>=20
> Longer story:
> If you want to create few thins per hour - than it doesn't really matter.
> If you want to create few thins in a second - than the cost of lvm2
> management is very high  - as lvm2 does far more work then just sending a
> simple ioctl (as it's called logical volume management for a reason)

Qubes OS definitely falls into the second category.  Starting a qube
(virtual machine) generally involves creating three thins (one fresh and
two snapshots).  Furthermore, Qubes OS frequently starts qubes in
response to user actions, so thin volume creation speed directly impacts
system responsiveness.

> So brave developers may always write their own management tools for their
> constrained environment requirements that will by significantly faster in
> terms of how many thins you could create per minute (btw you will need to
> also consider dropping usage of udev on such system)

What kind of constraints are you referring to?  Is it possible and safe
to have udev running, but told to ignore the thins in question?

> It's worth to mention - the more bullet-proof you will want to make your
> project - the more closer to the extra processing made by lvm2 you will g=
et.

Why is this?  How does lvm2 compare to stratis, for example?

> However before you will step into these waters - you should probably
> evaluate whether thin-pool actually meet your needs if you have that high
> expectation for number of supported volumes - so you will not end up with
> hyper fast snapshot creation while the actual usage then is not meeting y=
our
> needs...

What needs are you thinking of specifically?  Qubes OS needs block
devices, so filesystem-backed storage would require the use of loop
devices unless I use ZFS zvols.  Do you have any specific
recommendations?

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Na5B9xJqG9iTs80k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH13MQACgkQsoi1X/+c
IsF59w//XnpGFPCRX3OkW4HLNo+q6MAXlChzZNAUKeWBtm6Ro2RlYsoTObRvszJ4
yApOIZXmNNBpSUoJrgXZN6Aau5ruchUOnlTqL2dStbLGzJcyYg87sLSIjnGkftYR
WZsgY4DJQhhhVlb2CeNNj/Q+9FWZyoLpbNSCcXFflXHbrmldY1po2jt7MdDuSdTT
IZzXuudPGFvfSYKdZBzSxrLcZaHdisHWfiYBYTeonSwMV5s2IFxOEuLME9H0X2hT
dm5FTzXH0L9lf9q7NnuF++/39dAjh6IRa9vOVe/hC9RB21w5gSgrxIfwvAftMziS
Qa+9tTPmcCTqhTGZQd99SvdqyNBg1qicOZqUgDdqRT/FxI4wuag8up6KGD3Rhh12
z5OrdyiVi2i0Il19VLO8a0hWQvVzLZGeWleFYH2nwjl7eEC3Tdm+gR9Oq+FaGsp/
zY5qgsKF5XfQnVwDgkIE+2A0AVhfrbmumEIunuT3PKQ0mLnI/WnjvrhtsKxkrr6n
N+EdjVLQT6lHx0QH6qU2Z6rTziM8uJUy1Lfyobl47oDgQmdoS4tGi0Vt5+nQfFHv
Pf9gjBg3J2TzQ/BWGfRuRVz1w5pRRKqT4vW3t2YlgfJ6prHlmGrBCUsp0mRGFGy/
UvINahr0ImaRWWj6rWcW6YGAa/JFM0X/lthRHxZPLwHSY4cA2zg=
=SiIB
-----END PGP SIGNATURE-----

--Na5B9xJqG9iTs80k--


--===============1543999132663068489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1543999132663068489==--

