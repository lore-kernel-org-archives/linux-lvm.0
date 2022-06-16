Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D98CC43334
	for <linux-lvm@archiver.kernel.org>; Thu, 16 Jun 2022 16:19:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-0AyvwHvNOT673Q56YRghPw-1; Thu, 16 Jun 2022 12:19:42 -0400
X-MC-Unique: 0AyvwHvNOT673Q56YRghPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 726353C19023;
	Thu, 16 Jun 2022 16:19:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 521812166B29;
	Thu, 16 Jun 2022 16:19:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0F8021947061;
	Thu, 16 Jun 2022 16:19:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6FB91194705D
 for <linux-lvm@listman.corp.redhat.com>; Thu, 16 Jun 2022 16:19:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D148401015E; Thu, 16 Jun 2022 16:19:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D4B40466A4
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 16:19:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C01029DD9A4
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 16:19:33 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
 (wout1-smtp.messagingengine.com [64.147.123.24]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-rKIGJoHxOvaGDNDb3DkKmQ-1; Thu, 16 Jun 2022 12:19:31 -0400
X-MC-Unique: rKIGJoHxOvaGDNDb3DkKmQ-1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E9F2F32003AC
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 12:19:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 16 Jun 2022 12:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1655396369; x=
 1655482769; bh=okR6CCe4Mg/hpzp2SGwAQtGGvfgzQ/y8ZQ//7tNpt50=; b=F
 +crygX4e7ZX5Wuzgy1EcmCwYBTp/2aUlUCiY2sVXtY/A8LbLWpJzyUBznEm/PHQ2
 ONuNR6iiCyK68TN2PPGe1grpTe8hoVquaIZprMdwfv/D7wCKkzBcuP5hI5Qx9HqR
 9GYLAw6l84Zgv+HUzb1AC5ZmVVOlxaHWIWwE48r+cWCx0aHhVApAY8nioOIgVl6c
 esnQKVbnTkStuv20vyJC6lty3opfQ2UBx5iNbj3gx4hGuNAAjmb7OtG9urTESYzM
 sS10v8Z2CiW6lDfvBNWLubuSK9eLizYDTUJG7w8CYT+ddlIScxVtV2P8FIyh4UPH
 yO9Dpx9u7PRWSdDueK1xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655396369; x=1655482769; bh=okR6CCe4Mg/hpzp2SGwAQtGGvfgz
 Q/y8ZQ//7tNpt50=; b=HV8fZWODirURS7DXOMYXoN0D1tsyhggQcmpGocI7dnmU
 qDUqX5T2YOOQaSlSeQ2aModsnFDrSIiITJRNt9wApMx8MQzHlomc3Q77An3SwEEc
 CBXt0Jj4mRvIiK0WZczzxH21GNSFEXy5+EmG6GxzH0GHo+yETlwjrYvV5nm386Xq
 NoNdblhT4J74amw3VPuUX5y5gNcHXnpKC3wD1u2GaiNLfMrkPE1QyxXwP+31GZ/C
 3Audh3FYJb/zev/+EPW8yhiuVae2Hdo4P/C+3Otvz3NeNTB8Fggd5NWVKrYhfzgu
 PleAbrMtRLOjuh+Y0PJtVh3JQ1K8nqC84AJ+0zvY+Q==
X-ME-Sender: <xms:EVirYvPj1KIVwtC0fM3opfkE3qwg6zPpig4S0643Yhvg-52aLbVtrQ>
 <xme:EVirYp98a79K-EZTcH9wQ8wjFnTMKEIYEYHVT0AiWku5RUAfgQLzJRog-DL4Ycu-K
 P4QH8kZsEldxsI>
X-ME-Received: <xmr:EVirYuRBr86yq838q_d5jZOxZDaGvoWjpCNFitJ_CUkzIalaGly3hBB-OlcV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhi
 sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnh
 epgfejfeehvdevteeutedvieefgfduuddtuddvuddtveffkefgudejjeegkeeghefgnecu
 ffhomhgrihhnpehmrghrtgdrihhnfhhopdhkvghrnhgvlhdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhi
 sghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:EVirYjtS5TD2U1kH9NkZ1RS5-hO-ZZ_gfEV1FqcV4OUEIgJ-nru7Cg>
 <xmx:EVirYnfJLA4M_sixukb3637e3FvN1NRZ-Wqmof60hL9_qx4v8yB01Q>
 <xmx:EVirYv1NrbKHI6xHxR1CTDS6hMvL8eatugTzTJ_BVxDG0jJl1sNQTg>
 <xmx:EVirYhq6dKIR5CelmhmTcDAi8wy6Zvvt2GEZrHYAb1DMZz_Do0n_gw>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Thu, 16 Jun 2022 12:19:29 -0400 (EDT)
Date: Thu, 16 Jun 2022 12:19:24 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YqtYDgld/PAOLhpr@itl-email>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
 <Yqrhmwwbp5KfiEWb@itl-email>
 <7caac0c00c5c7cd93fdf50b62e2e7907@assyoma.it>
MIME-Version: 1.0
In-Reply-To: <7caac0c00c5c7cd93fdf50b62e2e7907@assyoma.it>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so
 poor
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Content-Type: multipart/mixed; boundary="===============8667881302273815803=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6


--===============8667881302273815803==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mkI9X9DwT4dgNIz/"
Content-Disposition: inline


--mkI9X9DwT4dgNIz/
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jun 2022 12:19:24 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so poor

On Thu, Jun 16, 2022 at 03:22:09PM +0200, Gionatan Danti wrote:
> Il 2022-06-16 09:53 Demi Marie Obenour ha scritto:
> > That seems reasonable.  My conclusion is that dm-thin (which is what LVM
> > uses) is not a good fit for workloads with a lot of small random writes
> > and frequent snapshots, due to the 64k minimum chunk size.  This also
> > explains why dm-thin does not allow smaller blocks: not only would it
> > only support very small thin pools, it would also have massive metadata
> > write overhead.  Hopefully dm-thin v2 will improve the situation.
>=20
> I think that, in this case, no free lunch really exists. I tried the
> following thin provisioning methods, each with its strong & weak points:
>=20
> lvmthin: probably the more flexible of the mainline kernel options. You p=
ay
> for r/m/w only when allocating a small block (say 4K) the first time after
> taking a snapshot. It is fast and well integrated with lvm command line.
> Con: bad behavior on out-of-space condition

Also, the LVM command line is slow, and there is very large write
amplification with lots of random writes immediately after taking a
snapshot.  Furthermore, because of the mismatch between the dm-thin
block size and the filesystem block size, fstrim might not reclaim as
much space in the pool as one would expect.

> xfs + reflink: a great, simple to use tool when applicable. It has a very
> small granularity (4K) with no r/m/w. Cons: requires fine tuning for good
> performance when reflinking big files; IO freezes during metadata copy for
> reflink; a very small granularity means sequential IO is going to suffer
> heavily (see here for more details:
> https://marc.info/?l=3Dlinux-xfs&m=3D157891132109888&w=3D2)

Also heavy fragmentation can make journal replay very slow, to the point
of taking days on spinning hard drives.  Dave Chinner explains this here:
https://lore.kernel.org/linux-xfs/20220509230918.GP1098723@dread.disaster.a=
rea/.

> btrfs: very small granularity (4K) and many integrated features. Cons: bad
> performance overall, especially when using mechanical HDD

Also poor out-of-space handling and unbounded worst-case latency.

> vdo: is provides small granularity (4K) thin provisioning, compression and
> deduplication. Cons: (still) out-of-tree; requires a powerloss protected
> writeback cache to maintain good performance; no snapshot capability
>=20
> zfs: designed for the ground up for pervasive CoW, with many features and
> ARC/L2ARC. Cons: out-of-tree; using small granularity (4K) means bad over=
all
> performance; using big granularity (128K by default) is a necessary
> compromise for most HDD pools.

Is this still a problem on NVMe storage?  HDDs will not really be fast
no matter what one does, at least unless there is a write-back cache
that can convert random I/O to sequential I/O.  Even that only helps
much if your working set fits in cache, or if your workload is
write-mostly.

> For what it is worth, I settled on ZFS when using out-of-tree modules is =
not
> an issue and lvmthin otherwise (but I plan to use xfs + reflink more in t=
he
> future).
>=20
> Do you have any information to share about dm-thin v2? I heard about it s=
ome
> years ago, but I found no recent info.

It does not exist yet.  Joe Thornber would be the person to ask
regarding any plans to create it.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--mkI9X9DwT4dgNIz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKrWA8ACgkQsoi1X/+c
IsFOyRAAwWwNgH16v3dPLU0eTYSbNiZmHzvLGY2onWXcG/KNuLri6246uX7BEyaq
TcNiZePoad4mj4u1qJchzeUQUq1tlBh5mrnXt/FkzNkWb9kSa/qAP7YUDghKWPqD
gh/C4SyHHclfjzl4q0wBH5j2UbwHbp3mP7i6A9thgjzgbR8zLOH0dM2HB1DbIPGf
922E6x0g8oamxJn0UM16rEG4sVRr2DnIKiLwPNx5Yk+PIAx7VUklVaW4/M4AQU3N
OsjckTKjTXEoze4ANIHci0jjmM2WxH7H73FpfpgiM619l8Kg7W+kKmDIF/mzphA8
/wdm9h9N2ZmcRKPYvYXo9glMY1+I6hXGUIQ6UMHeltkv0UzldcJRdn6l7zaHbncf
t4lcjWPCkTLOm2kaDOa4QdF14Coz+CYAiL+a82lykAdR3amSvJMTB2DBsZKjIEbr
kr5kPDlS06dJc8aPU3srzuYUd8CZfbWyfqwMKPWHchKudCAFvJeKw39/GV+Wb9MZ
ijk7dQCe5wq36JxwzoCdJHBNqTUr7+/upahvul6P/oMSfy5xc7epjPJYixOslg8X
YFrI9Q5YuaFQfj+z6B3SiKBQD01RowQiIOEYiCScH5p8s8jZkdu5fCqKkRaGfY+3
9MI8KrmHBJKBH+7fKXpvyl8Jr15rsw5delnyVa14/FQM4uDjrCY=
=Wezb
-----END PGP SIGNATURE-----

--mkI9X9DwT4dgNIz/--


--===============8667881302273815803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============8667881302273815803==--

