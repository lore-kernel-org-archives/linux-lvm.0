Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A3CC433EF
	for <linux-lvm@archiver.kernel.org>; Sun, 30 Jan 2022 22:15:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-rJxlNUAjNGejtqknx8cKUw-1; Sun, 30 Jan 2022 17:15:23 -0500
X-MC-Unique: rJxlNUAjNGejtqknx8cKUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA092FD16;
	Sun, 30 Jan 2022 22:15:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE54101F50E;
	Sun, 30 Jan 2022 22:15:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5E8F4BB7C;
	Sun, 30 Jan 2022 22:15:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20UMFEI0005552 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 30 Jan 2022 17:15:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 41F5D2026D4D; Sun, 30 Jan 2022 22:15:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D1DF2026D46
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 22:15:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 115FC3804510
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2022 22:15:11 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
	(wout4-smtp.messagingengine.com [64.147.123.20]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-189--VugO0sjPZKJuqMr0tDdeg-1; Sun, 30 Jan 2022 17:15:08 -0500
X-MC-Unique: -VugO0sjPZKJuqMr0tDdeg-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 3C23A3200DA8;
	Sun, 30 Jan 2022 17:15:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute2.internal (MEProxy); Sun, 30 Jan 2022 17:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=INd683CRRtTbi95Gp
	wkmrDz4zQrudNvslCV2nvXhMrg=; b=TMrrzIibkgQ4+cct8RkmVcLpnu76jnw+X
	9y7Q26ei/sEL6Z+bcTJuiG86Zy7LgZLN7GDqP7MCBNF8ACGtIWQj373YlvGjol+X
	urUyLve4K0LHG4tnI6ut6trJGoKMcKxOnm9kP8sdVB4uzp2LJa8OHtilmJxV8oOZ
	L0XYBHoCStL5SUiFCf1+W4+AaTkIuUmfRL/dku77chfML/5bK1dNkSShEXl8uMN/
	XeJQr1LT/ajBVh2Yu9lK745q5EyFqH9AT09g896umpliY64+dl0w3UvhkGT/ZNM8
	mF6d7745TpumjB1zEs+G7rbQoJvplYZ1V30y5gysTdKxzX4HmrFow==
X-ME-Sender: <xms:6g33YQnoMOgZCAaSbTC94DeGXlkqG5uzZY6RCwbu_mVmhtISu8obYw>
	<xme:6g33Yf39jMvTrXSVvXsg85kuOx6IYF1dNrqis7n361cj7hFwDCsTTRwCunZGP_2VF
	YrIHzNO9-W1qb0>
X-ME-Received: <xmr:6g33YerK1dk0mztw4gCLrT_rk59KpoL5yoQU4CI-5p2cgazEYtTXU0MgFkds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgdduheelucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeffvghmihcu
	ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
	hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdejteeftdehteeijeetleffheeu
	ffevjeevleejudfhleetuedtvddufeetudenucevlhhushhtvghrufhiiigvpedtnecurf
	grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
	rggsrdgtohhm
X-ME-Proxy: <xmx:6g33YckN8RTqxoil-gzYYRV3Ec4AcJkonZG1CMMRUj7MN3aj7pmLrA>
	<xmx:6g33Ye04lbz3ikISzAEWiFRnLdiHDCxbOLl_NAxzWsrwdJRJZ6ec6w>
	<xmx:6g33YTvHEN78OTsp9ANEYg1H5fIB5pp8QXvWyG4osYOCG1CDC2XfFw>
	<xmx:6g33YT-bta9XmNqHtslQNtwOu0VrKdM8UKN-i0RuRTzbQ6OtXbLkMQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
	30 Jan 2022 17:15:06 -0500 (EST)
Date: Sun, 30 Jan 2022 17:14:43 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YfcN6KHxLe3/krTX@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
MIME-Version: 1.0
In-Reply-To: <30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>,
	Zdenek Kabelac <zdenek.kabelac@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1153918871539087807=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22


--===============1153918871539087807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+RkTSzL1O5DYGGOI"
Content-Disposition: inline


--+RkTSzL1O5DYGGOI
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Jan 2022 17:14:43 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin

On Sun, Jan 30, 2022 at 04:39:30PM -0500, Stuart D. Gathman wrote:
> On Sun, 2022-01-30 at 11:45 -0500, Demi Marie Obenour wrote:
> > On Sun, Jan 30, 2022 at 11:52:52AM +0100, Zdenek Kabelac wrote:
> > >=20
> >=20
> > > Since you mentioned ZFS - you might want focus on using 'ZFS-only'
> > > solution.
> > > Combining=A0 ZFS or Btrfs with lvm2 is always going to be a painful
> > > way as
> > > those filesystems have their own volume management.
> >=20
> > Absolutely!=A0 That said, I do wonder what your thoughts on using loop
> > devices for VM storage are.=A0 I know they are slower than thin
> > volumes,
> > but they are also much easier to manage, since they are just ordinary
> > disk files.=A0 Any filesystem with reflink can provide the needed
> > copy-on-write support.
>=20
> I use loop devices for test cases - especially with simulated IO
> errors.  Devs really appreciate having an easy reproducer for
> database/filesystem bugs (which often involve handling of IO errors).=20
> But not for production VMs.
>=20
> I use LVM as flexible partitions (i.e. only classic LVs, no thin pool).
> Classic LVs perform like partitions, literally using the same driver
> (device mapper) with a small number of extents, and are if anything
> more recoverable than partition tables.  We used to put LVM on bare
> drives (like AIX did) - who needs a partition table?  But on Wintel,
> you need a partition table for EFI and so that alien operating systems
> know there is something already on a disk.
>=20
> Your VM usage is different from ours - you seem to need to clone and
> activate a VM quickly (like a vps provider might need to do).  We
> generally have to buy more RAM to add a new VM :-), so performance of
> creating a new LV is the least of our worries.

To put it mildly, yes :).  Ideally we could get VM boot time down to
100ms or lower.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--+RkTSzL1O5DYGGOI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH3DegACgkQsoi1X/+c
IsF9sBAAxxnvXpXgGY2CyBx6+/CpEXxfE8usC8a1zRlt8dYd+CUpAqAAMADCN4HV
0zTjGd0rTluIXE6EdvHilaS8yAEcb3ztTcYAcRn9BBDQVu+wPolkipy6FuB1ER3J
6qmHWBZuu8pJJ1VfdITSLvrUbqZqe5DYAlk0CC0OBaBoszs9OxIRbdPkUaw+EkgO
1vxBobEwHOHK2Gr4UavQwEo8nyaVuu/d3c5EBMzHidHASbsmk7dcdMZpYmHMgzcz
S4DmdjlGeH2O5MWRy0zdYvw2Xe+Fzz+6V9fRnne37bl8kOU5Pje6v+wHcgh32YG+
I2CYi+4GxYTqAwoyc1zCkOlVfnG76Nop2jzR6K3ZoxCgX+jnO0z0/Td/TLOA1DHp
Y9JN5CYMCFn9wtgqTRjLuqqoIbSMnwW8xx8NJ6DR4ZR3zqYxp3KzUk6zO1VGIX3D
pAXZSGxnWYeN864paB50yThiagQolXAfDSdCCss/6n6FWlGX5g0qMbbNzjWJ/EjC
dkOQn0RYzB2Ak/h3tEnHO/FhjedDqF5S5aMv3JVzbTb7rOlwcpQWCvwSoJn1UVo/
Y1U9qSW9srPkPv1JNiUr5Jts4MSbWGXi71iKKMRQY2oyhlRiKpgXyQQPSSTyI/gW
BHbeMii1r9wu+3THsAMe+5bVlZQmewSIa85FEu+dWLFVKyZYVOw=
=qpHS
-----END PGP SIGNATURE-----

--+RkTSzL1O5DYGGOI--


--===============1153918871539087807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============1153918871539087807==--

