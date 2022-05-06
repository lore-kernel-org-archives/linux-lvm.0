Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F47BC433EF
	for <linux-lvm@archiver.kernel.org>; Fri,  6 May 2022 10:05:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-3fAu_ISXPCiI3r_pIUb7KA-1; Fri, 06 May 2022 06:05:44 -0400
X-MC-Unique: 3fAu_ISXPCiI3r_pIUb7KA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20CD1014A60;
	Fri,  6 May 2022 10:05:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 238EC432707;
	Fri,  6 May 2022 10:05:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D0F691947058;
	Fri,  6 May 2022 10:05:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E1D0E1947056
 for <linux-lvm@listman.corp.redhat.com>; Fri,  6 May 2022 10:05:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C47CF14609DD; Fri,  6 May 2022 10:05:36 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BE11460E59
 for <linux-lvm@redhat.com>; Fri,  6 May 2022 10:05:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9CD382A682
 for <linux-lvm@redhat.com>; Fri,  6 May 2022 10:05:36 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-3mZlB7zvP5WgpEf94TsxZQ-1; Fri, 06 May 2022 06:05:34 -0400
X-MC-Unique: 3mZlB7zvP5WgpEf94TsxZQ-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F7825C00B1
 for <linux-lvm@redhat.com>; Fri,  6 May 2022 06:05:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 06 May 2022 06:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651831534; x=
 1651917934; bh=n+0oARsyScWgFWOFa36JexpynkaS8t7p/OQ4/pdFq+0=; b=c
 gdFLGCcyrziaQpUJOtkuFhVYanNSZWWiX5m1w8sF3B2YrUtFdIN1zFW9XfFF5zb/
 Z4T+nWF+t0he+3SKjZ/M9aFfYPpQYurVgjNgH5EstAecq5JNMlr7cUYofPZiA/J2
 oXiYpbrEgPtfR2TpU5vVb7qs0EPy9sQO4fjtWj6CmrdT1vdwoCZxmWVw4bbDQ8iU
 JxWjroBChBGkyWdd1RqjKA/1kMIqlz6PFBYcWOXysQJXE81SrqMy9By0v4P9guy5
 J3iJfMY4hx5VfLLfbcYKNRqDRCxSGwScOiiqU35KhPF5Uhrv8AJq9uS2g7Xe6lSd
 GpYlYH+7Am9NunF4NRF+w==
X-ME-Sender: <xms:7vJ0YnG36vCBWY3XSuzkd90iYOcxucdvcTrtekqRMi7Z54catZS5XA>
 <xme:7vJ0YkW94dasdtJpdfcrcF2xpb_GV2VXe0ZxGUX67i5valdyDACkG3CQi6NHqiRPl
 e_47V0mYyd_U8A>
X-ME-Received: <xmr:7vJ0YpLsJZcv2TvtnCGtsM_wC4YtmvDSsFzhrZvskCEzpuGNlatnnXCdn0FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttdejnecuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihes
 ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpe
 dukedujeelfedvuedtffeiuddvtdefteffvdektdfhueejfeelgfefhedvtdeiffenucff
 ohhmrghinhepghhithhhuhgsrdgtohhmpdhrvgguhhgrthdrtghomhdpphhrohigmhhogi
 drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 peguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:7vJ0YlFSLGVOAtfhzcQCKaaE4PMm64laSROZBLlOmiO9-OWMlLI3zA>
 <xmx:7vJ0YtWWw0Jb1OpfAoBlaVLLqx26lmuq0OTU4nWK7rJvmknpRzJIkg>
 <xmx:7vJ0YgMzDWrybMoIE60AK2URF7yeTxrqNZ29zGR5iYqwU5jg_L3xug>
 <xmx:7vJ0Ylg_1hRN1whg0gUBM01Vwq0iXBgbT4SApzNqtNbijgE0MCKcdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Fri, 6 May 2022 06:05:34 -0400 (EDT)
Date: Fri, 6 May 2022 06:04:43 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YnTy6x+B6pmQFXSS@itl-email>
References: <CA+QLa9BupRpP00xSpaKMwCvvsWtH=Q=_Z7hwuX1A7o8VsFNgWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+QLa9BupRpP00xSpaKMwCvvsWtH=Q=_Z7hwuX1A7o8VsFNgWg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [linux-lvm] Silence Pool Check Overprovisioning Warnings
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
Content-Type: multipart/mixed; boundary="===============0586773067270809049=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9


--===============0586773067270809049==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MxZ+lN+uUXWf8rvD"
Content-Disposition: inline


--MxZ+lN+uUXWf8rvD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 May 2022 06:04:43 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] Silence Pool Check Overprovisioning Warnings

On Thu, May 05, 2022 at 12:11:29PM -0400, Robert Simmons wrote:
> Greetings,
>=20
> I knowingly overprovision storage pools. I have careful monitoring of the
> overall free space in the storage pool, and the snapshots that I take for=
 a
> particular volume are ephemeral. They're only related to a particular
> reverse engineering task. Once the task is complete, all the snapshots are
> deleted. There are a set of warnings that are generated
> during pool_check_overprovisioning here:
>=20
> https://github.com/lvmteam/lvm2/blob/f70d97b91620bc7c2e5c5ccc39913c543793=
22c2/lib/metadata/thin_manip.c#L413-L428
>=20
> The second, third, and fourth warnings are printed
> via log_print_unless_silent but the first is printed via log_warn. I would
> like an option that would silence all four of these warnings. If all four
> were logged via log_print_unless_silent, there would still be the problem
> of what other very useful warnings would I be silencing. This would be a
> suboptimal fix. I have read one proposed fix that appears to be optimal f=
or
> my use case: adding an envvar "LVM_SUPPRESS_POOL_WARNINGS". This was
> proposed by zkabelac at redhat.com here:
> https://listman.redhat.com/archives/linux-lvm/2017-September/024332.html
>=20
> What would be the next steps to getting this option implemented?
>=20
> I see that there have been two threads about these warnings in the past:
> https://listman.redhat.com/archives/linux-lvm/2016-April/023529.html
> https://listman.redhat.com/archives/linux-lvm/2017-September/024323.html
>=20
> One issue in the bug tracker that I can find:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1465974
>=20
> Finally, we have a thread going about our use case over at Proxmox here:
> https://forum.proxmox.com/threads/solved-you-have-not-turned-on-protectio=
n-against-thin-pools-running-out-of-space.91055/

The Qubes OS developers (myself included) would also like a solution.
In Qubes OS, LVM is invoked by a python daemon which currently uses an
ugly regex hack to strip that line out of LVM=E2=80=99s stderr before asser=
ting
that LVM=E2=80=99s stderr is empty.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--MxZ+lN+uUXWf8rvD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJ08uwACgkQsoi1X/+c
IsE7eQ/+KraCJrKCfdmVrnIEPQ/8BKcZLPsskyinQnIYUFb/7H7gMjYwHmGAVkQf
9/h05UfSQV8kNX5zoUH4lugp4VGYNO3Jhuhw+a/qqxhuV+P+k5auQMfRBdI9z/Mq
fmWbJ5jrWzuNnpylWBXn6rkuylwodw6luN+ibW7NTBMOgTl4BJ6gnvzsw8sTim2r
qRCoN5frgSt6BcWcpTzZgPT5xTv30bIIB7VJo4TSAkuEys2UNVu7fFNuROK1QXGk
J+CpxumTdbHkpIZcV4+8SWPaA0SS55IBAxsU4/MtZfPikbOzYncuBO/167H9CYDB
lIjcRHGmkJg8PxvXY2zJ2ml5618QDySBID8qn5k47TNDzGxLhvT8l7wEuEuD+E+6
J4yWKHcOSk/q9PVlFdr95D7DSXCQ02vjs7KMKyKtZ6cgkFkjFYzZ7lsig7QrOXUf
AXtFcg4vwyKEEai8DVnAP0taaY1Keihw2liwHZko1piD3Clx0zcPSKk15RoDMjLh
5zao4d2FFyY6TP/m4kV3XPI56qPYeV/GIscirNMUB1K9loK6l/fO5obnswabfuGn
R6qnzZtcXK/6u16CvHHL+EU7AEK5zyzA4shxKMME8VeOi1OX8YCNTB9rEiQPKRpN
++Diyem5Vquf0HKHk9uXvGXL5jjceNo121Q5zX6qxeiZNy+oifo=
=UGh8
-----END PGP SIGNATURE-----

--MxZ+lN+uUXWf8rvD--


--===============0586773067270809049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0586773067270809049==--

