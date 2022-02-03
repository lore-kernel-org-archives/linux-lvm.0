Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CE8C433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Feb 2022 04:49:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-QMQ-OhT2MLy1xqc7t27KVA-1; Wed, 02 Feb 2022 23:49:34 -0500
X-MC-Unique: QMQ-OhT2MLy1xqc7t27KVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DBD88143E5;
	Thu,  3 Feb 2022 04:49:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08C8518038;
	Thu,  3 Feb 2022 04:49:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAA651809CB8;
	Thu,  3 Feb 2022 04:49:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2134mwmX019540 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 23:48:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E54F776C; Thu,  3 Feb 2022 04:48:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74D4979DC
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 04:48:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881C2185A794
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 04:48:55 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
	(wout4-smtp.messagingengine.com [64.147.123.20]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-596-aSxszabWPLqt_x8oQ3LoXg-1; Wed, 02 Feb 2022 23:48:53 -0500
X-MC-Unique: aSxszabWPLqt_x8oQ3LoXg-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 9DAB23202179
	for <linux-lvm@redhat.com>; Wed,  2 Feb 2022 23:48:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Wed, 02 Feb 2022 23:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aOphFtQ+3mSDMhPxA
	sXF4dDsOpBqGVGmyIU4mo3Yv74=; b=LTSN7btUIIeyithi6JITi0vNSUa3AJPiU
	HvaS0IvZbXgLXCpuwW8ncr5xH2AmK8XQ8uBR9w3IIwyNPaoC+mf/zLtCp/Rjjrhn
	O8N8KnoAF71fEJusdJMw36O9MS+AGeoHstG9pPQGW2H2qVFK1N/jKk3vRFxfJU5w
	QP09EP68U1mZwu9I5RGDzlwiNhPBBFHamig5fu4CFWGT5Mryjfox0RT3Bu9X1ME8
	ZDb2SAw4FrYOCMG/pLbCy9p7Hrq91g42appYpQ6JNpriMP4vWwC6lnvWCrSUwdK3
	dIBjGxS9V4eWB4Ha5TTjbwIjJBC/4zzvwYdfKAQTBIwoi2HcdlPfQ==
X-ME-Sender: <xms:tF77YeagxNSIRO2ypsXuuG3CiZhwv0_6u7mQyzWruOW5_nc5Wor8nQ>
	<xme:tF77YRZCRVD0Z1Wz0b1KpyTfv9OoFTVZ1CBT5vuicaQmXI3anqik62WdMbRIUfMXX
	vdvOk__2Ii8vfI>
X-ME-Received: <xmr:tF77YY8_hV7iYXNZ2iLJkOKwv2sDTqGgBezVwn5oB4rgPhVFmf9RYuC3Mcj7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdejgecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
	dttdejnecuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihes
	ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpe
	dttedtueeivdefiedugfejtdeutdelfedvueekledtudegjedviedukeefhfeuteenucev
	lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesih
	hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tF77YQr2jdTEe5hfQO6S1k9Az-RQ6UCwV5IeeYys0PW04plaSthWmA>
	<xmx:tF77YZqC-sRuSJ6pnqnAFlPiAKAS6bPMBsyPuia3q7g2gDEV9R4DeQ>
	<xmx:tF77YeST3mJko8SK0TuL_VcAiDEyjCVqr-8qjprdkGPuXyc3J2ukAQ>
	<xmx:tF77YW0C1jS2tia38PMNPiyJQmP8bL_v_qzFJaHvltYAHpjQrdxbWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
	<linux-lvm@redhat.com>; Wed, 2 Feb 2022 23:48:51 -0500 (EST)
Date: Wed, 2 Feb 2022 23:48:47 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YftesLAiW8xoFxqq@itl-email>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<30ba3f0683afb9c3b60d96ac0019ced4ce9bb5b8.camel@gathman.org>
	<YfcN6KHxLe3/krTX@itl-email>
	<CAJNi=XrO3+N63W1zxVhP0_y7CrHB=mmKpA2_MrVRSRX_e2u53A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJNi=XrO3+N63W1zxVhP0_y7CrHB=mmKpA2_MrVRSRX_e2u53A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
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
Content-Type: multipart/mixed; boundary="===============2069273656210025685=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16


--===============2069273656210025685==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k9ZgPtbcTUVLW/Aj"
Content-Disposition: inline


--k9ZgPtbcTUVLW/Aj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Feb 2022 23:48:47 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin

On Mon, Jan 31, 2022 at 10:29:04PM +0100, Marian Csontos wrote:
> On Sun, Jan 30, 2022 at 11:17 PM Demi Marie Obenour <
> demi@invisiblethingslab.com> wrote:
>=20
>> On Sun, Jan 30, 2022 at 04:39:30PM -0500, Stuart D. Gathman wrote:
>>> Your VM usage is different from ours - you seem to need to clone and
>>> activate a VM quickly (like a vps provider might need to do).  We
>>> generally have to buy more RAM to add a new VM :-), so performance of
>>> creating a new LV is the least of our worries.
>>
>> To put it mildly, yes :).  Ideally we could get VM boot time down to
>> 100ms or lower.
>>
>=20
> Out of curiosity, is snapshot creation the main culprit to boot a VM in
> under 100ms? Does Qubes OS use tweaked linux distributions, to achieve the
> desired boot time?

The goal is 100ms from user action until PID 1 starts in the guest.
After that, it=E2=80=99s the job of whatever distro the guest is running.
Storage management is one area that needs to be optimized to achieve
this, though it is not the only one.

> Back to business. Perhaps I missed an answer to this question: Are the
> Qubes OS VMs throw away?  Throw away in the sense like many containers are
> - it's just a runtime which can be "easily" reconstructed. If so, you can
> ignore the safety belts and try to squeeze more performance by sacrificing
> (meta)data integrity.

Why does a trade-off need to be made here?  More specifically, why is it
not possible to be reasonably fast (a few ms) AND safe?

> And the answer to that question seems to be both Yes and No. Classical pe=
ts
> vs cattle.
>=20
> As I understand it, except of the system VMs, there are at least two kinds
> of user domains and these have different requirements:
>=20
> 1. few permanent pet VMs (Work, Personal, Banking, ...), in Qubes OS call=
ed
> AppVMs,
> 2. and many transient cattle VMs (e.g. for opening an attachment from
> email, or browsing web, or batch processing of received files) called
> Disposable VMs.
>=20
> For AppVMs, there are only "few" of those and these are running most of t=
he
> time so start time may be less important than data safety. Certainly
> creation time is only once in a while operation so I would say use LVM for
> these. And where snapshots are not required, use plain linear LVs, one le=
ss
> thing which could go wrong. However, AppVMs are created from Template VMs,
> so snapshots seem to be part of the system.

Snapshots are used and required *everywhere*.  Qubes OS offers
copy-on-write cloning support, and users expect it to be cheap, not
least because renaming a qube is implemented using it.  By default,
AppVM private and TemplateVM root volumes always have at least one
snapshot, to support `qvm-volume revert`.  Start time really matters
too; a user may not wish to have every qube running at once.

In short, performance and safety *both* matter, and data AND metadata
operations are performance-critical.

> But data may be on linear LVs
> anyway as these are not shared and these are the most important part of t=
he
> system. And you can still use old style snapshots for backing up the data
> (and by backup I mean snapshot, copy, delete snapshot. Not a long term
> snapshot. And definitely not multiple snapshots).

Creating a qube is intended to be a cheap operation, so thin
provisioning of storage is required.  Qubes OS also relies heavily
on over-provisioning of storage, so linear LVs and old style snapshots
won=E2=80=99t fly.  Qubes OS does have a storage driver that uses dm-snapsh=
ot on
top of loop devices, but that is deprecated, since it cannot provide the
features Qubes OS requires.  As just one example, the default private
volume size is 2GiB, but many qubes use nowhere near this amount of disk
space.

> Now I realized there is the third kind of user domains - Template VMs.
> Similarly to App VM, there are only few of those, and creating them
> requires downloading an image, upgrading system on an existing template, =
or
> even installation of the system, so any LVM overhead is insignificant for
> these. Use thin volumes.
>=20
> For the Disposable VMs it is the creation + startup time which matters. U=
se
> whatever is the fastest method. These are created from template VMs too.
> What LVM/DM has to offer here is external origin. So the templates
> themselves could be managed by LVM, and Qubes OS could use them as extern=
al
> origin for Disposable VMs using device mapper directly. These could be he=
ld
> in a disposable thin pool which can be reinitialized from scratch on host
> reboot, after a crash, or on a problem with the pool. As a bonus this wou=
ld
> also address the absence of thin pool shrinking.

That is an interesting idea I had not considered, but it would add
substantial complexity to the storage management system.  More
generally, the same approach could be used for all volatile volumes,
which are intended to be thrown away after qube shutdown.  Qubes OS even
supports encrypting volatile volumes with an ephemeral key to guarantee
they are unrecoverable.  (Disposable VM private volumes should support
this, but currently do not.)

> I wonder if a pool of ready to be used VMs could solve some of the startup
> time issues - keep $POOL_SIZE VMs (all using LVM) ready and just inject t=
he
> data to one of the VMs when needed and prepare a new one asynchronously. =
So
> you could have to some extent both the quick start and data safety as a
> solution for the hypothetical third kind of domains requiring them - e.g.=
 a
> Disposable VM spawn to edit a file from a third party - you want to keep
> the state on a reboot or a system crash.

That is also a good idea, but it is orthoganal to which storage driver
is in use.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--k9ZgPtbcTUVLW/Aj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmH7XrEACgkQsoi1X/+c
IsHH6A/7BGPVH07advQMwEX6/vOvHh/TXnEzb20dcI5IginUwVrXCfiFpuoBYEf4
PZfrR7AgjgAsKdkVV0SUWY5EWRI3QHs5Pyejw4KH/j/cjKP+6CgstMy9s83M2l/H
UHhADOu8QPEGZ+CwkUl/y/R4pJxPsuLibrm9xzUxTVs9xCP+J3osn+G1e2b/0Fgl
uEUc0UHtDNhXq7+Dlozl+SmQh89OfGz4KBLSRHHxCbd4t70FH4N/OlCBzHVJpzqX
p2HUAN0GpW4zKQOp1QRMf7jp4/fc2/NT/2LsnkuSJiwulmWy9SmiMW3qKmwH0vrV
mzQgNajbPdn7aO0nQQ/h0G/fKldD9Cfd5Oiawxe/Vv8WjMZl/XA79w6I2ih/MaLq
YjvaGyNvb6Kr+barcqR00vSi53akC86onjuWk1lAMtKDYa80is1iIsfHfEp2pPH0
kEPMe/aTeD7NABIqEcyU+lQlyOhiFI4zh7aTjhjYBSfgGsHap/bQKZzgFA6PMtCN
0mT832RlwzNm9Ajoo8p62kcg9e4JMB9iKp4wxgQTPOBEUGw+eLqPoCb5BFOlVNiJ
E81OcqCNO9ZJfAAgAzswP5wdD9XOBfWrtSrKghfMztvduiCUpvqWReUQI3yPhlUx
4SclMFhVs4hZantDc7NQKI4YbApuRWNyr1z3zIHf18LgHh1f94w=
=3vwf
-----END PGP SIGNATURE-----

--k9ZgPtbcTUVLW/Aj--


--===============2069273656210025685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============2069273656210025685==--

