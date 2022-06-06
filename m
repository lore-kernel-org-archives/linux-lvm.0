Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F73C43334
	for <linux-lvm@archiver.kernel.org>; Mon,  6 Jun 2022 07:02:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-uOxKKQHTNYGkfMA53vLmHg-1; Mon, 06 Jun 2022 03:02:18 -0400
X-MC-Unique: uOxKKQHTNYGkfMA53vLmHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2291F1C14482;
	Mon,  6 Jun 2022 07:02:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F14FD40CFD0A;
	Mon,  6 Jun 2022 07:02:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B26A2194707B;
	Mon,  6 Jun 2022 07:02:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 140AE194706E
 for <linux-lvm@listman.corp.redhat.com>; Mon,  6 Jun 2022 07:02:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D21EDC27E8F; Mon,  6 Jun 2022 07:02:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE35AC15E72
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 07:02:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6A388027EE
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 07:02:11 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com
 (wout2-smtp.messagingengine.com [64.147.123.25]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-BQm8hdX2P7q6eh-v-60dUw-1; Mon, 06 Jun 2022 03:02:00 -0400
X-MC-Unique: BQm8hdX2P7q6eh-v-60dUw-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0F48D3200900
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 03:01:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 06 Jun 2022 03:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654498918; x=
 1654585318; bh=9ydGC6+8TJyP+cb0phxn4gMm/dfyOTdsb89um2Ucnc0=; b=T
 VzQgO9SK4RUoslKHvLaGiSeWqt1jgH3LlzUKaNWcmf/0RMjvALwQBlFB83K6zLpG
 FVtovAG+4Y4+ZRqSePL61/kvhxlakkuhUTqU2m5IRWa/xwz4E3JrB0uIDb4wLvXY
 f8WRPnyrWgNSVU2kHhjGKgaJnrz6rMMxf/zubYfLBOo6XyhWjWbk5h7+et8rhCXb
 fg16Abau9rdH27f2LYZe2ICFrIfQbkdE1OpP25YVrwbszGrkIJd1JgM2C+WvOU5L
 dcMCOIbU3tQyNtARdPdKotp5Xy+phhwRfaELyWAlI4d4TGG/GHzwYHVhXq1w4l7v
 KuTTBzY4OLSxwojXzhkIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654498918; x=1654585318; bh=9ydGC6+8TJyP+cb0phxn4gMm/dfy
 OTdsb89um2Ucnc0=; b=kIqE0ZbG2dZm36JBAWc7XYV9PnDF4nDW4BoWowDf/+HG
 6NEPXBYTbLlPOk2AFGUYlCuXg9OUSyRXvA1K/3hJukMgsrrlGhIz0ucXG99wkTJb
 SglEE4Z2qyPwX1skLs2Yne64vsp1PlVB9GfKCQqqhXvomM5TZkzRS+c8/UFkRQuo
 4pgJSB4eZpS1LPb0lFtAe6z26AKt0S/NFAUAjKbaNKpfNbYjmq/CO8vsLJb8T3iO
 L2wploAjAl90jgQjJ5qDB6IA2VF+qwqm83tirG0WQ0KMtzYrh3zWg0FahuYtZGkY
 pnMH3Wv+F/rQuqUPFoaYr1Q2OWaVItzTBNt7qYMPDw==
X-ME-Sender: <xms:ZqadYo4uacWBvypt9h3hnn2dyNpyauxYtqg1ngvZwm-7NTJuT89uqg>
 <xme:ZqadYp6CeuQQgN8reWE_kJD1RmwZRt5ScKaHT3zarHBwKaqxWayA0xe27zdPRTk-j
 5evRvBFcPlYuEg>
X-ME-Received: <xmr:ZqadYnfpi77FJTrjoPB6vRlpb5kUVjuV6kd3E6-kvjapTDRZQ8bzOkCjB_Js>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghm
 ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrh
 hnpeevvdetheeuueektdefvdekhfejkeeikeetheeggeeuueeivedtudethedvgfefveen
 ucffohhmrghinhepphgrshhtvggsihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhn
 ghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:ZqadYtK96oXlHcWWOXmRDWXxyyI1cHqUB6zUWsdHWQVaSRP0V8PygQ>
 <xmx:ZqadYsJCWUFJ4mdwxF_DHhf1FPknH0PMoatf-clIZxo6TCaa2F0YsQ>
 <xmx:ZqadYuxUukyWsdujiyTGgpsUm89KC5SDEEKVpdMW9xH8yrZnyQtZeQ>
 <xmx:ZqadYhWdTz_S7cILOG4fXIwbA451RmLssYgWi6BRiQHHTHnazJfBtQ>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Mon, 6 Jun 2022 03:01:58 -0400 (EDT)
Date: Mon, 6 Jun 2022 03:01:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Yp2mZGmhFD23XQcL@itl-email>
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
 <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
 <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Content-Type: multipart/mixed; boundary="===============6240802661874356045=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1


--===============6240802661874356045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EL3xueeoyG1AeUC7"
Content-Disposition: inline


--EL3xueeoyG1AeUC7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Jun 2022 03:01:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod

On Mon, Jun 06, 2022 at 11:19:47AM +0530, Abhishek Agarwal wrote:
> 1. Yes, use_lvmetad is 0, and its systemd units for it are stopped/disabl=
ed.
> 2. Yes, everything on the host machine i.e(/proc, /sys etc) are getting
> mounted on the pod.
>=20
> *ubuntu@ip-172-31-89-47*:*~*$ kubectl exec -it openebs-lvm-node-v6jrb -c
> openebs-lvm-plugin  -n kube-system -- sh
>=20
> # ls
>=20
> bin  boot  dev etc  home  host  lib  lib32  lib64  libx32  media  mnt opt
> plugin  proc  root  run  sbin  srv  sys  tmp  usr var
>=20
> # cd /host
>=20
> # ls
>=20
> bin  boot  dev etc  home  lib lib32  lib64  libx32  lost+found  media  mnt
> opt  proc  root  run  sbin  snap srv  sys  tmp  usr  var
>=20
> #
> 3. The detail output of `strace -f -ttt` command:
> https://pastebin.com/raw/VFyXLNaC

I suggest bind-mounting the host=E2=80=99s D-Bus socket into the container =
and
using systemd=E2=80=99s D-Bus API to run the LVM commands on the host.  This
will avoid the problems you are having.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--EL3xueeoyG1AeUC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKdpmQACgkQsoi1X/+c
IsGMHxAAiGiFoCQ1dQWdttQCR/SryrAsEYc3hw9TsKVyVS0QIN63iysUEj+MkoSw
qAJ5cY5IW9CPQn0YmeJWEfM7ocwm2cVfAdQ8mMm4EOG9d8BgBjlIs/PDZnH41iso
lrsEOjeF6fo4woW2z3yNU1mvemgZcUb18XC6CH5XtmdbWkmhQXMffYRJBGPM56vH
nXlvNJ6X91yQOSTowketq3egycb8E1QrnUaPpgEBwVbsXmDE965GQ5EuDprpd0PV
Xl71VeppxWWyN9ehm72JPAR0027guh6nhs4ZIIwF+j+dYt1pYgkqpV94h1nkSdbH
kLS+ztS3/5L5z44eop08hLiTiwnZ3uuhYPL6dGTyDNJ2SwoaFJDcCLVOL6OnMgXB
LZEGIu34ZTL+81F0v57h0b316/bdiQ8mWYa/OdPkOp1Nyo5OOYl6VJKFaU5573F0
PCdHku8jsDHTKcsJKLh6hxA/zzc8Izi8rnnW9dgy1RnwV8Lx5VCdLOt1NlmnKouw
Oah6/YboZhkdPooEEgjr8MldFCl3nIFmP8NoSoboGGt1kiejdf6pJiJ9prFfID8I
NhhTB122zBQzwzeswkn+67qhVhd7BN9/TG4TQsH/JIPKyP9C3qHaiYIBGHpWUyl2
mjcY8gl2bu2fLGSXpqU9w3NoQ7/CUjQoQw0u9RfTr4o+PSE4QYg=
=7Hj7
-----END PGP SIGNATURE-----

--EL3xueeoyG1AeUC7--


--===============6240802661874356045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6240802661874356045==--

