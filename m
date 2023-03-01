Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8376C7EE23
	for <linux-lvm@archiver.kernel.org>; Wed,  1 Mar 2023 23:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677711756;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IcdaYkdVklfLfRBkNJX9/ndEkA+srtPgPtEW9vmognc=;
	b=F/oz3XaEc45/KElGjAfGYf/4iULTnBAjULItu3GSrnpIZ929uph7oiFHaoXxZ1SGb2L95h
	rdLFcplOckK719ylveaHjUUSfvV8Vr1JNArUAFjxeO47sCEFqUR4OeURmjPQwgUbQKnz/z
	C705UjHV+99K7Gm/Z51Y0Cj4m7c5TS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-YDAXCWJxOdWDAV1l8Gx9Ig-1; Wed, 01 Mar 2023 18:02:35 -0500
X-MC-Unique: YDAXCWJxOdWDAV1l8Gx9Ig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D91EF811E9C;
	Wed,  1 Mar 2023 23:02:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC5D140EBF4;
	Wed,  1 Mar 2023 23:02:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4805719452CE;
	Wed,  1 Mar 2023 23:02:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0651C19472FC
 for <linux-lvm@listman.corp.redhat.com>; Wed,  1 Mar 2023 23:02:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13955492B00; Wed,  1 Mar 2023 23:02:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C9FD492C3E
 for <linux-lvm@redhat.com>; Wed,  1 Mar 2023 23:02:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E50191991C42
 for <linux-lvm@redhat.com>; Wed,  1 Mar 2023 23:02:15 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-hAsnf7wyNgqQatcoc6x3Tw-1; Wed, 01 Mar 2023 18:02:14 -0500
X-MC-Unique: hAsnf7wyNgqQatcoc6x3Tw-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 169E25C00EC;
 Wed,  1 Mar 2023 17:55:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 01 Mar 2023 17:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1677711346; x=
 1677797746; bh=B7cc+QegDbyklNTbsF7aEcHNDjyZLhRsw8RbiXJ65O4=; b=E
 GApluzRSxCNoAnl8NvxBBEUqFkgbZrvIA5D5KomikoREhTLE+UNl82IK/jVOoy49
 QX3Z30Wg0r47LMxPlEi/qZdrQ3EMMe8C3zUX4JTJ5z0Y2LK/YDJmaC7F6AC/pmWM
 tLbqK5d7CHYDV+YOZgwKQUzbypSnVQWf6h4JOC0ttiwpKYGh9yyMXd983zth1EBp
 H9OvWGKcnaCnfhsnE5fuxe/DpFONYD0mz0JsaLMBe1MOPuduBtII3538RHD0gl1N
 Y0zbFMvMCbH7xD8omSDR6RSOCGTS+leoAdA9TieVvZUqezBEgxrqia4NChYugqPo
 dapAMvUWwVDCiln2g2AYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677711346; x=1677797746; bh=B7cc+QegDbyklNTbsF7aEcHNDjyZ
 LhRsw8RbiXJ65O4=; b=pJdNsoDJMc9jJEtrNn/oUkguuLWAlO3ex6J4bHGQ9BKf
 +Z7VuDnyH6IthuRVTePN3hG2FM0AZC8wCfVJvgEhrgwXrCCkpYqWfRDU6cP9pvxB
 ukfDOZQaFxligFI/Di7pUNNUNw+WCF0G1fKcrVgt4fbf+9iJfH6vNxqR8ayRhpVZ
 jWJL3ty7crB37W41gFqq3iIr23xhzmod9cHShfAu3wculr7ubwvLkJ92r0ivMybM
 Kk/JBxVmlU49OkPjuJz6kg/40DbJA28lOilwPKIM189HcMWCaU5YwXowrfmenMZe
 sM55a9+JfbP6Bbakha8Mj32dmLSdPoiTsCN9gLQ4vA==
X-ME-Sender: <xms:8df_YwsjMuwgmTlBNP6YdppSElBI6w4YlRF6PMzWWETvebQGNlq2KA>
 <xme:8df_Y9fp7ryHGIbTu_9vNsZSG8HaquImwnZJI988vi-31f05d0J06N57cnXjpwGAB
 EF8KkeCFdIXVLE>
X-ME-Received: <xmr:8df_Y7wSZROf24QzCrAcytryBlC2QUq8Zg3m-1k4sM3PhBZ-ekaiZfhpA1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeliedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
 gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:8df_YzNOEaOIn5ZnLIgPvzpzwiiltyKidAHLSdrGtqfvgMDfbNeUzA>
 <xmx:8df_Yw_i54c8M3fWBgl_I55QFp7Edr3lFiIAb9UcY326ExarytK-uA>
 <xmx:8df_Y7VWjxvf8FAArAC9a_8v2auT8efN51wAgVAQ4L63ive7cq2k3Q>
 <xmx:8tf_Y5Lg34LvL3_nCvho8aTBSHvvwYcYZumBtgz4OecS_QYvjAUeIQ>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Mar 2023 17:55:45 -0500 (EST)
Date: Wed, 1 Mar 2023 17:55:31 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Y//X72Iwa6ORU9en@itl-email>
References: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
In-Reply-To: <2023967259.761825.1677710640334.JavaMail.zimbra@karlsbakk.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] lvconvert --uncache takes hours
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
Cc: Malin Bruland <malin.bruland@pm.me>
Content-Type: multipart/mixed; boundary="===============9035594234405816238=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7


--===============9035594234405816238==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xazqx1JtCBGSCjdU"
Content-Disposition: inline


--Xazqx1JtCBGSCjdU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Mar 2023 17:55:31 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Malin Bruland <malin.bruland@pm.me>
Subject: Re: [linux-lvm] lvconvert --uncache takes hours

On Wed, Mar 01, 2023 at 11:44:00PM +0100, Roy Sigurd Karlsbakk wrote:
> Hi all
>=20
> Working with a friend's machine, it has lvmcache turned on with writeback=
=2E This has worked well, but now it's uncaching and it takes *hours*. The =
amount of cache was chosen to 100GB on an SSD not used for much else and th=
e dataset that is being cached, is a RAID-6 set of 10x2TB with XFS on top. =
The system mainly works with file serving, but also has some VMs that benef=
it from the caching quite a bit. But then - I wonder - how can it spend hou=
rs emptying the cache like this? Most write caching I know of last only sec=
onds or perhaps in really worst case scenarios, minutes. Since this is taki=
ng hours, it looks to me something should have been flushed ages ago.
>=20
> Have I (or we) done something very stupid here or is this really how it's=
 supposed to work?

It=E2=80=99s likely normal.  HDDs stink at small random writes and RAID-6 m=
akes
this even worse.  That said, I *strongly* recommend using three-disk
RAID-1 for the cache, to match the redundancy of the RAID-6.  With
write-back caching, a failed cache will result in a corrupt and
unrecoverable filesystem.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Xazqx1JtCBGSCjdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmP/1+4ACgkQsoi1X/+c
IsFMQxAAjrs+xX0ku72g+AyX3cVWbVDsi2y00SkKhUUhZaZi2a+JcPvQadUCCxn4
UTb888HuhY+P6h+BP8m05sgag7BUozjuaaxbETi0MwiI9ZvyuFuXCE56GRaToVqT
jSUsrQWLUwRKMtkKXjJ8RVgwsD97xVA6K3erpB2MgAgfLy4o2A+iPP+WhxXyxTOW
Udp2gfwuK85lAlnpe9K4yT5Va4MlvBlfAEPO6LCAof6yG7l+YdiDlbWLCVAChEgy
jyewsJnfbeXb4S8v/XhULR9XSyZGAopR7x2aer1pL5FJY/N23jYU98cFAAZh7NJc
tIp5JTwrV0zRWJlpodlH/XqxELXSAS0B2HqBM7e+ndNxDFbVIdzE+1DLaMRWGA9Q
A3XaRa7wYGLpXkLg/PWmc7UahidkMOFGS8vPn1VzDziqoWRWUaUKzlTAW/6Lg9PW
CnuccsHYbs0l19+OacmO2nQB+v/qpG7lH9mtPxBDsOB9kg36QHDP4wIEje0GU/44
53XVPp1mZ2XERNdKMSZGrTCKUVoug2XWF+bqFFF6lt2p0V6xzHa6YnFpWRWyVDv0
toV300s7ymnzxt/YuZLYFO5t/9pe25UfZqeQLj26y3jonqEZOhhBzEPyS6pLKaUs
eoRlIMcYAlPseEzjg7u6U6c66FhqbzZusjXHVi4TkCcyW62siZ4=
=OuhO
-----END PGP SIGNATURE-----

--Xazqx1JtCBGSCjdU--


--===============9035594234405816238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============9035594234405816238==--

