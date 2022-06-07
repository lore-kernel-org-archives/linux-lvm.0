Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941CECCA47C
	for <linux-lvm@archiver.kernel.org>; Tue,  7 Jun 2022 17:42:49 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-laDbH6CMNgiMHEjNz-TcBw-1; Tue, 07 Jun 2022 13:42:47 -0400
X-MC-Unique: laDbH6CMNgiMHEjNz-TcBw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CF94811E76;
	Tue,  7 Jun 2022 17:42:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFA8D492C3B;
	Tue,  7 Jun 2022 17:42:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8136D1947B87;
	Tue,  7 Jun 2022 17:42:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26C7D19452D2
 for <linux-lvm@listman.corp.redhat.com>; Tue,  7 Jun 2022 17:42:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 15F144010E32; Tue,  7 Jun 2022 17:42:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D94400F3E9
 for <linux-lvm@redhat.com>; Tue,  7 Jun 2022 17:42:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED231968A63
 for <linux-lvm@redhat.com>; Tue,  7 Jun 2022 17:42:32 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-bmJlDEaTNs-1vUGztVREAw-1; Tue, 07 Jun 2022 13:42:28 -0400
X-MC-Unique: bmJlDEaTNs-1vUGztVREAw-1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CAF1B5C01D0
 for <linux-lvm@redhat.com>; Tue,  7 Jun 2022 13:42:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 07 Jun 2022 13:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654623746; x=
 1654710146; bh=tU8QHXyRLsQqv8nCnlE1Ul5UgRckgvRxeftVTb805lY=; b=D
 qKu7Cv6nZ/ad6WiMP2AIsrnmJB706qgM8MwmjABEk74gmTorjUDaOfKBGv9TL6D2
 SgKmIRk8ZEw/k7kMPDNNveGTJ7BTv60J0Yz6w7Bwn/JK/huzRmR9b+5gj29IJ3OT
 FkN3Dn4rBtFlOO2NI8Oyw3wxu7g+j1c1Un4igMsJkYcsObjs8ZdwUkjV6fReQChG
 IHRKawmAqjDkrNurBt7fJqrO2wewzjIorKp/HRZRmWImoxecSLqM3++TaR5jT9Ts
 adP/2mzm+g+N0AI/0qIoPH7dmS5kohoPN+z39hY/CNpZ4U3bCC0aO5Kggc09mik0
 JrAXLptY00iebfVk8Un8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654623746; x=1654710146; bh=tU8QHXyRLsQqv8nCnlE1Ul5UgRck
 gvRxeftVTb805lY=; b=Q/DNZL43LBADnknDahNFWJ9WCGIMRxA/uP/CAfIGvKIB
 wwy0EfxYXaendM+gLa72sd74JVKHFBMmKbOCNalNAm2R5pRa0+eDmDVWaTjxV6pt
 kr9hD4N6sZz5X4b6KDudPNvujLG7FkT/79QT+yHQjjcQZknHhH04HQKwJFVyLEoT
 h2Mv2wno7PQK1UqI3hvJZgDlJIIfJv5CyDZhQuokTnBLMtIpGSgu//+hPIJGMQVf
 BezvG/yRC0Q8Dcmq5tl0wJrtGXR3qa2BFzvcMLVik3ufs62EgSMG6ur06hEqxzid
 PuEZtpHNIMAY3y9tV/ws1eM/F/VkSgKRwraVW602Vw==
X-ME-Sender: <xms:Ao6fYv_zu9FRyoq3JpsIJg8OKlhV25g3p4cqTitvxT15XA6wtNx12A>
 <xme:Ao6fYrsZSIO2L47VTSRtzTNEAM-7oeKraGkRO1kHaIuT4vHYkG_uLKlWJnbvS9XBz
 381TAUoWJ0L8JM>
X-ME-Received: <xmr:Ao6fYtBOlYYHv6OcEa46nA0nI6xu0xDxSHmSPj9_tWLhw4n8lODbjFp46n6W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghm
 ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrh
 hnpedttedtueeivdefiedugfejtdeutdelfedvueekledtudegjedviedukeefhfeuteen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmih
 esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Ao6fYrfaBL8yk6KGJYOQq4XsCxWSITaA1SjjE03zFVvJSmtUb7E0uA>
 <xmx:Ao6fYkNOiUCoOgXS4V4xaURhzF7-0GSqX5LB0PDx_9I7Po8W1UCTKQ>
 <xmx:Ao6fYtkgcZe8s6mz7r-AHvvYLuvssyvwtrvF4Q0Mxth7EdtM8yXoZQ>
 <xmx:Ao6fYqY_8faAqMVrW4cz2m-ujLIcrAd9T89gUt67c5kCsmkeyh0LoA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Tue, 7 Jun 2022 13:42:26 -0400 (EDT)
Date: Tue, 7 Jun 2022 13:42:02 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Yp+OADjxwHS52NKM@itl-email>
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
 <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
 <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
 <Yp2mZGmhFD23XQcL@itl-email>
 <CAM3OQJEJCV_ozKjHS2FguUsnZXD37eK9YBExjRT-ZAdJGUp_TA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM3OQJEJCV_ozKjHS2FguUsnZXD37eK9YBExjRT-ZAdJGUp_TA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
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
Content-Type: multipart/mixed; boundary="===============9010927126459599835=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9


--===============9010927126459599835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e46hF4+3o81981iT"
Content-Disposition: inline


--e46hF4+3o81981iT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Jun 2022 13:42:02 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod

On Mon, Jun 06, 2022 at 05:01:15PM +0530, Abhishek Agarwal wrote:
> Hey Demi, can you explain how it will help to solve the problem? I'm
> actually not aware of that much low-level stuff but would like to learn
> about it.

By default, a systemd unit runs in the same namespaces as systemd
itself.  Therefore, it runs outside of any container, and has full
access to udev and the host filesystem.  This is what you want when
running lvm2 commands.

> Also, can you provide a few references for it on how I can use it?

The easiest method is the systemd-run command-line tool.  I believe
=E2=80=9Csystemd-run --working-directory=3D/ --pipe --quiet -- lvm "$@"=E2=
=80=9D should
work, with "$@" replaced by the actual LVM command you want to run.  Be
sure to pass --reportformat=3Djson to get machine-readable JSON output.
The default output depends on configuration in /etc/lvm/lvm.conf, so you
don=E2=80=99t want to rely on it.  Alternatively, you can pass no arguments=
 to
lvm and get an interactive shell, but that is a bit more complex to use.

To use this method, you will need to bind-mount the host=E2=80=99s system-w=
ide
D-Bus instance into your container.  You will likely need to disable all
forms of security confinement and user namespacing as well.  This means
your container will have full control over the system, but LVM requires
full control over the system in order to function, so that does not
impact security much.  Your container can expose an API that impose
whatever restrictions it desires.

Instead of systemd-run, you can use the D-Bus API exposed by PID 1
directly, but that requires slightly more work than just calling a
command-line tool.  I have never used D-Bus from Go so I cannot comment
on how easy this is.

There are some other caveats with LVM.  I am not sure if these matter
for your use-case, but I thought you might want to be aware of them:

- LVM commands are slow (0.2 to 0.4 seconds or so) and serialized with a
  per-volume group lock.  Performance of individual commands is not a
  high priority of LVM upstream as per prior mailing list discussion.
  The actual time that I/O is suspended is much shorter.

- If LVM gets SIGKILLd or OOM-killed, your system may be left in an
  inconsistent state that requires a reboot to fix.  The latter can be
  prevented by setting OOMScoreAdjust to -1000.

- If you use thin provisioning (via thin pools and/or VDO), be sure to
  have monitoring so you can prevent out of space conditions.  Out of
  space conditions will likely result in all volumes going offline, and
  recovery may require growing the pool.

- Thin pools are backed by the dm-thin device-mapper target, which is
  optimized for overwriting already allocated blocks.  Writing to shared
  blocks, and possibly allocating new blocks, appears to triggers a slow
  path in dm-thin.  Discards are only supported at the block size
  granularity, which is typically greater than the block size of a
  filesystem.

- Deleting a thin volume does not pass down discards to the underlying
  block device, even if LVM is configured to discard deleted logical
  volumes.  You need to use blkdiscard before deleting the volume, but
  this can hang the entire pool unless you use the --step option to
  limit the amount of data discarded at once.

- If you are going to be exposing individual thinly-provisioned block
  devices to untrusted code (such as virtual machine guests), you need
  to prevent udev from scanning the thin volumes and keep zeroing of
  newly provisioned blocks enabled.  The latter is synchronous and slow.

- Shrinking thin or VDO pools is not supported.

- Old-style (not thin) snapshots are slow, and only intended for
  short-lived snapshots for backup purposes.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--e46hF4+3o81981iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKfjgEACgkQsoi1X/+c
IsFumxAAj4TRn0VjTFE/EVKTxaHyoL4I9n+N7D5jD6lLWk3vTqwUv1bgimRdD42C
X5kPjAEz4mDbwk13CMEGtFFeGlzJUHmSlajUoZXKnsVfq+uR2Gq2fg6ieOS59LVS
KzbO9gBhA9Baqf6v5mVQ8tvIeyaPeVoAfnJh8qBZzw0YP9/Q55+jomkRvwokUxas
0IRAWq4YfKt7XZbzZQ8rTwH1NI8GNRyolmOR30QLFiaZFpDbK2oh/8+MXd52HPra
6kPZeFRiD9JXOPc1P0GdAX7P2Or3Q5khDbJvHhiIalsWNhLUMcDfmpFUCvv4/5UI
ooBOUAu6r+BrcsC+6F3N5RrrrxsAmO6jatfOJeRXXxxBiiQXDcObt1n5QmzQc1sE
+0xetCCMvK505NKOZ/+BvH5wnnQtplHtydj7v8U1mz2239RmSEo0czfRxnhr+qxz
4dXDfnLOhH/N3KgsOVaR047XCn9NgyXL0q4E5btOaPc3pWKOPwMoPKH3ryjkezUy
6gwO9Zd9gHk8KUg1dDJWwTDDTQ9/CJtusWLPhPeVJwwgcxPGiHXkqow8V3dQddxn
yFb9v8DbkKAwIG01DceYY5SWa1af8MWvozucj+tTszcn1yHTBYBWP9StAUDTfUEp
YXQv0ozQpdNbNipi87K1d/aUlu4krcKjA8A7bHj0NCUhmjUf5p8=
=aHzr
-----END PGP SIGNATURE-----

--e46hF4+3o81981iT--


--===============9010927126459599835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============9010927126459599835==--

