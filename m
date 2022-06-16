Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27713C43334
	for <linux-lvm@archiver.kernel.org>; Thu, 16 Jun 2022 07:54:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-FTbs0h1aO3uIGApkCKPTBA-1; Thu, 16 Jun 2022 03:54:16 -0400
X-MC-Unique: FTbs0h1aO3uIGApkCKPTBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6660802D1F;
	Thu, 16 Jun 2022 07:54:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C622F2166B26;
	Thu, 16 Jun 2022 07:54:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5DCD194705C;
	Thu, 16 Jun 2022 07:54:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 77A161947056
 for <linux-lvm@listman.corp.redhat.com>; Thu, 16 Jun 2022 07:54:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66F39492CA6; Thu, 16 Jun 2022 07:54:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 621C1492CA5
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 07:54:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AA7580B70A
 for <linux-lvm@redhat.com>; Thu, 16 Jun 2022 07:54:12 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com
 (wout3-smtp.messagingengine.com [64.147.123.19]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-7X7XoOh2PP6cJAMX93zPEQ-1; Thu, 16 Jun 2022 03:54:07 -0400
X-MC-Unique: 7X7XoOh2PP6cJAMX93zPEQ-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EA1483200302;
 Thu, 16 Jun 2022 03:54:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Jun 2022 03:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1655366045; x=
 1655452445; bh=pe+gDfILtI7JQsOaSMJe4wPIDmGnKbpXIJXi5oldUig=; b=w
 1F8n8rRywMdAcDKUcFLyMZujpqroZO6Ba1gyJT9tijEz0dQKb/2zXH+t07EgwZGl
 sqv21kH3a23cLqVLJIrwLKk2nHvvX2IThD65cTvIgOX/dWAVC24HhanEx48cAGki
 3AmIqCII8q/Vssvvo/SNc7GGri1z87VuBIzJoYn9sb95vkEfEhDJeE0JBg1kQp/N
 CUvtghC0Gvs3tOECTlpTdt7yrFQk+EkYMqKwD50p60Vb711wMvfzNIQjrjYZEGrW
 EiagxyyU+Pxvypr1jjE8s5Q12UiLaB8HUi5Qcn9ha/xzN+Jh7ixO7LiJGaTNpxjT
 J4TlQRmJf0y6Sh8fJUuVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655366045; x=1655452445; bh=pe+gDfILtI7JQsOaSMJe4wPIDmGn
 KbpXIJXi5oldUig=; b=HXjUqTsvmBjskj7ZMRLToUkZwYyNSXLjivfmWyZVpGeG
 rvKZAQ1oNAJGsJQWDQdCAZiXfQbhlDigjc2FgKv257RpZz6jwGVIQNBE9XSeqjrd
 MNFXdOFi+wiDAmVHtcwhYQwNqWwW4Jsaj9vtKod4CxSeh3+gNnvx8i32+FP+llqN
 7zCBrotKMg6DXTuhT5EKvhqOC+UDAqhYZ+eKctDqI0AQtRiRqrLqFxY4ytqXLgvC
 8gvXD1f7c+Rsd9zTRrxnonHbZaQsXdTwaD5HnZq5K57hAL9skeGv9bMEA19CMZiU
 WpjRio/tiVBwfJXz/aoRhylvgPWDsydvPANppsgC4g==
X-ME-Sender: <xms:neGqYpmxOKt6I2T7kJ_8F9Ip3jQmrcdegKRU-tXVTpiziybcGAvDFw>
 <xme:neGqYk0wtYUzz7_vjNA9XhU8JzmOlN0q6XsJEFu1x3YQbu-9_ikE4pBEf3gfS7fa_
 X9ycZn4mBBjuEE>
X-ME-Received: <xmr:neGqYvoW5_tFPQYAiguCpwm9TLnrSbparmw8xAG5q_HUKHookfUDuy7y_Of1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedt
 leefvdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:neGqYpnQZB-1Rqia_ouOX6nj66eDI2x4Fe-Cy4ppPOoZAduhzc9vGQ>
 <xmx:neGqYn0LpihYHnSiKc6H0wUCeMSh6ClfS6oUnfKlVc6pvvZbayZliw>
 <xmx:neGqYovOJ_uYWm5uUhwBBw-19IzpbJTqGUDYZYUHcQi1Lu7UkdwMnQ>
 <xmx:neGqYsg_QAPuOYXsKUEJyxtVm6jm7MXzE8T-HdMHu8O6jUAoNrSG0g>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 03:54:04 -0400 (EDT)
Date: Thu, 16 Jun 2022 03:53:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Gionatan Danti <g.danti@assyoma.it>
Message-ID: <Yqrhmwwbp5KfiEWb@itl-email>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
 <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Content-Type: multipart/mixed; boundary="===============1615972808514562838=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6


--===============1615972808514562838==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4XQN2jh3iVa8wr09"
Content-Disposition: inline


--4XQN2jh3iVa8wr09
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jun 2022 03:53:23 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Gionatan Danti <g.danti@assyoma.it>
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so poor

On Wed, Jun 15, 2022 at 03:42:17PM +0800, Zhiyong Ye wrote:
>=20
>=20
> =E5=9C=A8 6/14/22 10:54 PM, Gionatan Danti =E5=86=99=E9=81=93:
> > Il 2022-06-14 15:29 Zhiyong Ye ha scritto:
> > > The reason for this may be that when the volume creates a snapshot,
> > > each write to an existing block will cause a COW (Copy-on-write), and
> > > the COW is a copy of the entire data block in chunksize, for example,
> > > when the chunksize is 64k, even if only 4k of data is written, the
> > > entire 64k data block will be copied. I'm not sure if I understand
> > > this correctly.
> >=20
> > Yes, in your case, the added copies are lowering total available IOPs.
> > But note how the decrease is sub-linear (from 64K to 1M you have a 16x
> > increase in chunk size but "only" a 10x hit in IOPs): this is due to the
> > lowered metadata overhead.
>=20
> It seems that the consumption of COW copies when sending 4k requests is m=
uch
> greater than the loss from metadata.
>=20
> > A last try: if you can, please regenerate your thin volume with 64K
> > chunks and set fio to execute 64K requests. Lets see if LVM is at least
> > smart enough to avoid coping a to-be-completely-overwritten chunks.
>=20
> I regenerated the thin volume with the chunksize of 64K and the random wr=
ite
> performance data tested with fio 64k requests is as follows:
> case                    iops
> thin lv                 9381
> snapshotted thin lv     8307

That seems reasonable.  My conclusion is that dm-thin (which is what LVM
uses) is not a good fit for workloads with a lot of small random writes
and frequent snapshots, due to the 64k minimum chunk size.  This also
explains why dm-thin does not allow smaller blocks: not only would it
only support very small thin pools, it would also have massive metadata
write overhead.  Hopefully dm-thin v2 will improve the situation.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--4XQN2jh3iVa8wr09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKq4ZsACgkQsoi1X/+c
IsGrmRAApbxwR1U0Iew155alybvuypqJr7yEeTF+w7a6PU5NgO+IFaLLj9N1QZb4
PtfL8kCE/0GANJsmrGPiB1okVxT6BXeKwgDq8qS3vYKBlwoAQ6onXcCFBSSE9dY8
NOi3RTZ0FXiBD00IkMBp3IsD7NuaqU/8apCSbjRhGeHR0q1twHtbt8VeQiDHvoXm
XpRjW5UQG26lTwPJjppzmcNN0B6o9jtKKO/2z6u2KAYeQpwCCxHBKQk9xMgIuHRi
f/OL2j4Cak+92OihMwhn2IUz5yJ1Y78XhZXibHXbcf+pR+QAq06+dCbxfG2Bzig2
KX4dKRnVeJGTp3iW5ewXo5Gya0edjhLBJrCaRpcccMln8ech7INTAQA2BA6a9YXu
Hsy9VoYptoL7m8c2WosE1FwFhYuCb2u5Je7kqe6APDwFNXHzt8Eua9jmaj8Xmq8p
2UI698esi3zaBYN2nLMJTIH/3HCV+BABMU1QKiee5k/sgQO8e3E0LahgNaNcjVef
c6D6k0dAqSkU+IKlCflV0X14bDkt6iZNQEcqlPjZCNTG9VsCuKPKB3Ij1zrc9iQ7
QEqGoQpBxpRZVmMbV7E/2LQR0/1qMA5E3opUhqlszPSPH6fmVmIXeXRJ1L7XTJDu
i5vHM/CML0mAe+Nb2UfbyGvvZ5pmSPTJgQrY1WIMsmwSMfIKYEk=
=7VGx
-----END PGP SIGNATURE-----

--4XQN2jh3iVa8wr09--


--===============1615972808514562838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============1615972808514562838==--

