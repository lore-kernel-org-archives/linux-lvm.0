Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A098C433FE
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 01:21:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-tTJzdqf1MfOW9Ar5wQ2t7Q-1; Sat, 29 Jan 2022 20:21:36 -0500
X-MC-Unique: tTJzdqf1MfOW9Ar5wQ2t7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7477B1083F60;
	Sun, 30 Jan 2022 01:21:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E493D1002390;
	Sun, 30 Jan 2022 01:21:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C32A1809CB8;
	Sun, 30 Jan 2022 01:21:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20U1LG16024380 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 29 Jan 2022 20:21:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47EDAC159B3; Sun, 30 Jan 2022 01:21:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43BD4C1D3AD
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 01:21:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B192802E5E
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 01:21:16 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-224-rGMr1JvpMLeZ_pAEO_9x4g-1; Sat, 29 Jan 2022 20:21:13 -0500
X-MC-Unique: rGMr1JvpMLeZ_pAEO_9x4g-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C60585C009F;
	Sat, 29 Jan 2022 20:21:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Sat, 29 Jan 2022 20:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bG5nEu1edydidT4fY
	asAz1pfx8nNquxYLlmN8ZH0leI=; b=mNwabqA/hsvrrxk4vwexkoCk9i+b6IWL2
	/1dYxGzo9kYEfqXiULQhhK6+jDN/6xXCkiI1BLN5lRfyF/amcWl9tgp/l9MJxMdU
	JIXPe9DWSFzn9qRjMApe2Gjzx47pePwlZBcR8vffnTzh9JErYXqPuLcKXBVHSUug
	D4xui8hGPw37SxRGwg6ZAbbwuglpI4NBXtx1XGa2Za1sx96hrxSvoiJiaKDzAZZ7
	p6uOwDtuS9v173/sdXB6TI4x7ICH9YBVh/0TG8QYzSV6ulDbjD+PoeEDdbR9UnXG
	ObZJkwfei/Vqw4lLkyqJ8+uoOp+mluRVSuwpn3LuxjUPffB+TJAOQ==
X-ME-Sender: <xms:COj1YT34RuEUdCI6RbHaTZBZmbr0V6laF768ANUKAiF0VJqjscWy1A>
	<xme:COj1YSGccLTjIuY6CCOmpzZLM8xq3FcFui5LM8gsVVhb4djIlQpfgzvZnW7Wn7zAn
	uGncn2gSUL7joI>
X-ME-Received: <xmr:COj1YT54BIQnqxLVL8wbgUHUhWy1M-7VYEV425ykzeywp-h-aeOztTxvJVTu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeekgddufecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
	rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
	grsgdrtghomheqnecuggftrfgrthhtvghrnhepheehtdekhffggeeltdejfeejudetudei
	ieeliedukedvkedvueeuheffveetuddtnecuffhomhgrihhnpehrvgguhhgrthdrtghomh
	enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
	ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:COj1YY1S-hvQzT7zTXUrlDQBP5zu11BCgZkoH8fMpgyK04f2LvUJbA>
	<xmx:COj1YWGY_2u_w0fWMAj2-zYv1gXhDcjhEohxMhEDAYzIIxyWmFyscQ>
	<xmx:COj1YZ-jDbdsuINf3BlOR1KN_Ai9MFJJhduz0ndRtXj67mX5JaeE4Q>
	<xmx:COj1YRzSBbOxYWwTJA8XJZnMT2YE1WgqRwXO-RDOSkx6g6hmgbFXlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
	29 Jan 2022 20:21:12 -0500 (EST)
Date: Sat, 29 Jan 2022 20:20:49 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <YfXoBour6CGZt9NH@itl-email>
References: <YfWM+8w1TonBXNsP@itl-email>
	<9156ffae-650d-198d-5c7a-32f84dbcb332@gmail.com>
	<YfWfAAGK8L1iy7LU@itl-email>
	<83468eda-6697-5f15-d949-e23611cded84@gmail.com>
MIME-Version: 1.0
In-Reply-To: <83468eda-6697-5f15-d949-e23611cded84@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Content-Type: multipart/mixed; boundary="===============5859683206754854477=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22


--===============5859683206754854477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RfixY7QTc3n24Uw2"
Content-Disposition: inline


--RfixY7QTc3n24Uw2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Jan 2022 20:20:49 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: Running thin_trim before activating a thin pool

On Sat, Jan 29, 2022 at 10:40:34PM +0100, Zdenek Kabelac wrote:
> Dne 29. 01. 22 v 21:09 Demi Marie Obenour napsal(a):
> > On Sat, Jan 29, 2022 at 08:42:21PM +0100, Zdenek Kabelac wrote:
> > > Dne 29. 01. 22 v 19:52 Demi Marie Obenour napsal(a):
> > > > Is it possible to configure LVM2 so that it runs thin_trim before it
> > > > activates a thin pool?  Qubes OS currently runs blkdiscard on every=
 thin
> > > > volume before deleting it, which is slow and unreliable.  Would run=
ning
> > > > thin_trim during system startup provide a better alternative?
> > >=20
> > > Hi
> > >=20
> > >=20
> > > Nope there is currently no support from lvm2 side for this.
> > > Feel free to open RFE.
> >=20
> > Done: https://bugzilla.redhat.com/show_bug.cgi?id=3D2048160
> >=20
> >=20
>=20
> Thanks
>=20
> Although your use-case Thinpool on top of VDO is not really a good plan a=
nd
> there is a good reason behind why lvm2 does not support this device stack
> directly (aka thin-pool data LV as VDO LV).
> I'd say you are stepping on very very thin ice...

Thin pool on VDO is not my actual use-case.  The actual reason for the
ticket is slow discards of thin devices that are about to be deleted;
you can find more details in the linked GitHub issue.  That said, now I
am curious why you state that dm-thin on top of dm-vdo (that is,
userspace/filesystem/VM/etc =E2=87=92 dm-thin data (*not* metadata) =E2=87=
=92 dm-vdo =E2=87=92
hardware/dm-crypt/etc) is a bad idea.  It seems to be a decent way to
add support for efficient snapshots of data stored on a VDO volume, and
to have multiple volumes on top of a single VDO volume.  Furthermore,
https://access.redhat.com/articles/2106521#vdo recommends exactly this
use-case.  Or am I misunderstanding you?

> Also I assume you have already checked performance of discard on VDO, but=
 I
> would not want to run this operation frequently on any larger volume...

I have never actually used VDO myself, although the documentation does
warn about this.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--RfixY7QTc3n24Uw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH16AUACgkQsoi1X/+c
IsGqKQ/+No7tcfxbrK6YQn9tTTVqQFioaeR+84e2UuV9iwgeLIu2GFdH10tQJu4z
YjNrzan8HJtgiY50sPb1+b2FtuTo68UN3f9nr2Dvzhz9MbmCz3LoJlyEmqVxmqDw
a4tYdEOTLdRWSTjMreMWF9877rTnA+39BsaBHOO4EI4K+s5FxczhdWklsLHqvJsB
lGvd8IF3aKXGx4DcCHr6X2Dlqs9J3fyoURmfj2dlwVaz7Bqb0tkW871ZD1ub+nbr
+4NkUnUYl65xFb6SlXfweTTFEZjvN6vN/D1yflgW3eNWCWd929/D8DPld1/beSdL
YIrAEJKpKkWJIzsjcmTEYd1qfyuB3+C5YFG2vCISFkdEIiGmjYyqxBwNEFNUM4ks
N+rvKp5QzN9+ee1KYYoxJZakKIImRlpl8zOor1q073vJOw/cBox6zy27RV51e9vU
btnBMaiAwJTxtUddA+HkH57xGa/XXXGswsMc38CQHJ4QwpFsrV+wC5gG7cbeYawI
q/9S83+mqmePlzlBnZSDFINtGdUF4hGBOxTD5fpKhPe0c6AcW3iZiIltzY5IPWxO
gJJbtFSPxY2sTBZeiQSklCJAW+dIqoIWTHvE676AgCpPCLhyEGy8rQ3ntJMbFMHp
6I/ZCu8/W3PEGTtu1VXV+35GKy2VY9R51tNLRoubRmRln23CM/o=
=Hvvz
-----END PGP SIGNATURE-----

--RfixY7QTc3n24Uw2--


--===============5859683206754854477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============5859683206754854477==--

