Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A03FE7F14B
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Sep 2023 02:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695780997;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ATdmWpVNvk9L8jmW8mS7XUaLgnRyRjzR6G6Xh5E6X/Q=;
	b=fzrGoOSQ4BsfqJVXNR13XIloSbiM2EPFlwyFGtUrP/rEszqUokWU25pX01bLAiRVv9g4RX
	jJ01Gtgh337/nUc8X8Hf9jwRXtuL3V3bd6FEW+j7GEmH7YTaR7kk4nvuOF8YYlTqa2ZSE2
	p3dZwWdgLLj/wLHXuEaj+BnLHrI1gb4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-JbVko7PoNKSRyRoI5YTzKA-1; Tue, 26 Sep 2023 22:16:33 -0400
X-MC-Unique: JbVko7PoNKSRyRoI5YTzKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B298F801779;
	Wed, 27 Sep 2023 02:16:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 372D3140E950;
	Wed, 27 Sep 2023 02:16:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EB3C194658D;
	Wed, 27 Sep 2023 02:16:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CFBD91946588
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Sep 2023 01:50:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD84540C2070; Wed, 27 Sep 2023 01:50:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A603C40C2064
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 01:50:52 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8547938125A3
 for <linux-lvm@redhat.com>; Wed, 27 Sep 2023 01:50:52 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-buTXKJ7HNLKlWcwAChZ88g-1; Tue, 26 Sep 2023 21:50:50 -0400
X-MC-Unique: buTXKJ7HNLKlWcwAChZ88g-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E361A5C26DE;
 Tue, 26 Sep 2023 21:44:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 26 Sep 2023 21:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1695779045; x=1695865445; bh=BivSDiBzISWwOU+ILFrf4vMfy5OvQVmfzWk
 FvmDlFXU=; b=gitL6sGbT+FXzC9ewGfZWAxQkYNGxfs7Ooot6kyPrbVbDAIK/9x
 xDQZbjWwlKg4mI1ph76YGc1e3jvPylWX76EJHWfObpUGwLBVleHvOwccAQmB00C+
 lLz3fpr+1R+a/spmF4pSFJg1vQREDx6BEYtk8FICLIzBNPKW5oJG1ARE/33rdfmc
 PJS8DuP68gHwALUJvEBQSy4TnVcSI8vJLVBaSptXvHR/xs2vVTo5GOT6GM/8NuTn
 UgiMqnWjwgi5LUGujo/WlXGFOo3MhGSmRBT8EMi6S952QiBO9WzglgUlu8BPOXGe
 wPZwKcAfjgmvRQzwb268KuhBNtk/wNkSsPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1695779045; x=1695865445; bh=BivSDiBzISWwO
 U+ILFrf4vMfy5OvQVmfzWkFvmDlFXU=; b=czMJAYTtNfKLAQSwLxCZunB+2MKvA
 RZX2UsC93e9F2NFUZsLGvV4GdcScTP5tSxfy1m28TMyisjpcw5RKFkA7UCr+kcIO
 zCUpbJQ/2232Gi69LJ7eKVN16iYx66f5tqP1baWu/+/dSiVIIYOAp4eQXafmgiGC
 3puynwmFrQPZjcWQ9l9Y2umEcBKbXD5wQ0LuP75Z42mjNpbQnsMv/0D+mTLw1x1S
 28MAS0NAn0Li+2s6JYoeCzTCQeSdvzqsZhXub8e4shVpXtR9Q9taSWtXhma37mcc
 aM//njuOcG0+ZeHO980sMM1sNJGm9ncXQTBAGQ0S+bR3ZMPl9u027+gBQ==
X-ME-Sender: <xms:5YgTZabpWHe2Q_8_ZanK6c51IMWxDiGTsjkQEl7Q84VRWq4yxG138w>
 <xme:5YgTZda7xFMtk0NOYNDoUlDErfyMN6jjMtkVwt2WIOXIlvTNV7XYNO9g1M2GwnNMV
 MdDoU73Xs6vivM>
X-ME-Received: <xmr:5YgTZU-WLiC1_hEXa2B5IGX1e6ozdsMa-iD1pesgFFwtAmyLe-IwLZtDHowDsyeFYL_Osiq-XWnK-kR1N-GBuwtQ6jIUkluihYbMPP4n2DVnr55y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddugdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
 rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedtleef
 vdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
 sgdrtghomh
X-ME-Proxy: <xmx:5YgTZcplmOaGrP05TdZnlDGHkOn-1Jd54npUDLOh5LNZCUd3PfDnsA>
 <xmx:5YgTZVqX0lgTyjoMCe_xqCHFl6B75Y2qMK0wwjrHQyOdFCaRxfDftg>
 <xmx:5YgTZaTpgxmVdm3-kiT4sLHZVbccthGb_yynSyf0NN2g8ZpCS-rswQ>
 <xmx:5YgTZXFTuHzH6qcbMuu6G2uJ9VVEGFJXpVk4vRHPqAavYaS0hUvdrg>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Sep 2023 21:44:05 -0400 (EDT)
Date: Tue, 26 Sep 2023 21:43:55 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <ZROI3igNN/whnc1T@itl-email>
References: <CAM5YWZfo5q5rP+E2JFudGaHJLQ-2bk2UfpR=En5eDF37JKq2rw@mail.gmail.com>
 <6e0faedf-f450-4454-a86b-6448a1b4747b@gmail.com>
 <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM5YWZfL8zf9=re+VU2MiAQcYvXodqDV-08Zu5RkKUMfkDJ7Tg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption
 and snapshots?
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
Content-Type: multipart/mixed; boundary="===============7670390394973997047=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7


--===============7670390394973997047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7riDZwPuNlGmO0y"
Content-Disposition: inline


--p7riDZwPuNlGmO0y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Sep 2023 21:43:55 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] Can I combine LUKS and LVM to achieve encryption and
 snapshots?

On Wed, Sep 27, 2023 at 01:10:10AM +0200, Jean-Marc Saffroy wrote:
> Hi,
>=20
> On Tue, Sep 26, 2023 at 10:00=E2=80=AFPM Zdenek Kabelac
> <zdenek.kabelac@gmail.com> wrote:
> > Yep typical usage is to encrypt underlying PV - and then create LVs and=
 its
> > snapshots on encrypted device.
>=20
> Sure, I'd do that in other circumstances.
>=20
> But in my case it would just be a waste: I am replacing several disks
> on a desktop computer with a single 2TB NVME SSD for everything. Only
> /home needs to be encrypted, and it's tiny, like 100-200GB. Going
> through encryption for most application I/Os would use CPU time and
> increase latency with no benefit.

"No benefit" depends on one's threat model.  A surprising amount of
sensitive data gets put outside of /home.  For instance, SSH host keys
are in /etc, and system daemons store their data in /var.  That's why
the standard is to encrypt the entire drive, except for /boot and
/boot/efi.  It's the only way to ensure that sensitive data doesn't wind
up on the NVMe drive, from which it cannot be removed except by
destroying or (cryptographically) securely erasing the drive.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--p7riDZwPuNlGmO0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmUTiN4ACgkQsoi1X/+c
IsFt/RAAkbB+fFZ+zSPvPkED7vrKOoiFAUrn0sTrTXS5wpP4IsSrfKZ6QFsbjeo9
3y5PMLsv6HxEpebi/NBT2pptpTw5GpOy6bV7IhULyQvpUmQe5ZjDvxC9Ai6XOutJ
qy8/ux4Wk5//Ap/V8kVfcH7Gy11L2lzQnR69vF/Fz372qIU3ggqARKLgF9bjXrZL
zPRJ+ddXVo0qUevCbMVYqrzM3Q1NPu6AqPUBZL7tCitLGYBJH7SutHxzkkuq8QIq
gZTC/RcdbAP0QGYYLQfKdqTTu+aWwwIdfLHVaExbl444dJeOBlvddT+HLmVaQuUQ
N1wEP8ryYQvr1rHAdubHmK7tnRRPQtWzPMzMUcp6/1xG1ZH48u5ssvLWw70cbafB
HZpIK32XiyaXNhIz9NqZ/OQZhu9DhSUBJRbB6bnaUYK3OxJvOes35eT/sBrQL+Y5
WO2L09vshxsYNAEO/gJ17nR+341DLuycrkKgQ3dAFAapQ0wxt9SVmsanAt2yxqQ1
lK9vAam900IeSR1UJIIonZSEhqgvViOUOqQqyI2QZ6huFnjsfy86u9lJfXFu0AOb
OCVAnvLjlM11SM0tZbiFlDfO5vNyYGkNRZT7q8QWF58bUD7zru1ngvI3xXgRPfpD
6nfPiBkdFEtWVa5m1y6C+yR38Mf9F1p/WQ5vIMDPkYXQg4nEBdY=
=s2YH
-----END PGP SIGNATURE-----

--p7riDZwPuNlGmO0y--


--===============7670390394973997047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7670390394973997047==--

