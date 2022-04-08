Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C559C4332F
	for <linux-lvm@archiver.kernel.org>; Fri,  8 Apr 2022 11:35:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-Ibku31hSObGBJg9S91843Q-1; Fri, 08 Apr 2022 07:34:56 -0400
X-MC-Unique: Ibku31hSObGBJg9S91843Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C49AE1C0906A;
	Fri,  8 Apr 2022 11:34:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5160140CFD06;
	Fri,  8 Apr 2022 11:34:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B75021940344;
	Fri,  8 Apr 2022 11:34:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 357971940341
 for <linux-lvm@listman.corp.redhat.com>; Fri,  8 Apr 2022 11:34:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 116C4403367; Fri,  8 Apr 2022 11:34:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CA71416361
 for <linux-lvm@redhat.com>; Fri,  8 Apr 2022 11:34:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5B161C09060
 for <linux-lvm@redhat.com>; Fri,  8 Apr 2022 11:34:45 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-vu9gYtEvP_ylHIgygzWagA-1; Fri, 08 Apr 2022 07:34:44 -0400
X-MC-Unique: vu9gYtEvP_ylHIgygzWagA-1
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AEB8F5C0184
 for <linux-lvm@redhat.com>; Fri,  8 Apr 2022 07:34:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Apr 2022 07:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=BIaM9Ra5tuo4Qa7K0KG+WOudAJloTGuCjAxX5BPqt
 pI=; b=UIu4YxVVwC+DzQoYzlQ2fyujIJ0Aa8wvqkOH+bbnKJZgIZaDejwxnYvE/
 Ir3ZTDh9Rd4T7+IICfIQTVgZD4q+WXqqZpiLmMh8DY0jOj/PJoVXBxL0hRYC4zaU
 J16L+8nZ/y1c4eCL8hoKfVzU5nokfQnRdQhGOXqHZqsaPGpWCqrWpfUg+lEC2uw6
 uFwtIwddCUNpS83lvmCYAuE0pFwk/gWXx9gGhgYLvZWGLoeEHD5fEOVh74cRgYJX
 Tf7LshQ6e57vvX8jsG0BKNdSQEhwPZOKJBbEmkcfkdv87NLAfEzllrtg0HaimvhL
 3ME7OIaCXp3+fjKUg2qOK9KqBNrrQ==
X-ME-Sender: <xms:0x1QYkY_tMG4U3SYcjkbipipt44784Ba-sIQrua_fR8dZ-lup6M4qg>
 <xme:0x1QYvbwFbs1lYMjNpgrFw5NeXr39nP-eABIwTWW6MKHVZkBFvOw8BFAXtb6mE0VF
 G8r9ar5Rq_khjE>
X-ME-Received: <xmr:0x1QYu_0_MwppkkgsanJc8DrAciN3iCxE26RTds0x7GCU-231yMytZZLVTGH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheple
 ejtdegjeffleevfeeuleehjefgvdefhfehgfejgeelteegtdetjeelueeuveefnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:0x1QYupv-t5xxxc13mLopl9-AITetTFP360D1cnDWqynxoVoVNHcIQ>
 <xmx:0x1QYvqmKUVKzE1Kj3W8tz0UHcsVsiuh9GqdToEJ3RcGu7cp9JXJPw>
 <xmx:0x1QYsRQHxo9_8ZZXJ5OAYzSZn9pku408rM-U0h3M1zQpAk2k9nqdg>
 <xmx:0x1QYs0M9xY8QtDif1oVIK0I_FT5Aoi9vxQdFY8giuekf8U6xqeBUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-lvm@redhat.com>; Fri, 8 Apr 2022 07:34:43 -0400 (EDT)
Date: Fri, 8 Apr 2022 07:34:38 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YlAd0RlWERgOqP9Z@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [linux-lvm] Running multiple LVM commands in a batch
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
Content-Type: multipart/mixed; boundary="===============5155420539592881436=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1


--===============5155420539592881436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0LJhOcvFyBppcugX"
Content-Disposition: inline


--0LJhOcvFyBppcugX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 8 Apr 2022 07:34:38 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Running multiple LVM commands in a batch

Would it be possible for LVM to support multi-operation transactions
within a volume group?  Qubes OS often needs to perform 3 LVM commands
at once and doesn=E2=80=99t care about the order of the operations.  It wou=
ld
also be nice to get the result of the system afterwards, to avoid
needing a separate =E2=80=9Clvm lvs=E2=80=9D call.

The purpose of this is to improve performance, by allowing device
scanning, metadata access, and synchronizing with udev to happen once
per batch instead of once per operation.  I=E2=80=99m willing to promise th=
at
there are no dependencies between operations and that the operations can
safely be performed concurrently.  I also don=E2=80=99t need the overall
operation to be atomic, so long as the system is always in a consistent
state and any problems result in a non-zero exit code.  Getting the
result of the individual operations would be nice but is not required.

I=E2=80=99m not sure what the best syntax for this would be.  For the
interactive shell, =E2=80=9Cbegin=E2=80=9D and =E2=80=9Cend=E2=80=9D comman=
ds might be an option.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--0LJhOcvFyBppcugX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJQHdEACgkQsoi1X/+c
IsGu8hAAjIKp4wxvEcjNAL30bMi3wOUVW7Kzcgb/YCdXFIHD/uzfugn7joxyocG9
sKQURN/nvFNYfKI4cbFCuA0qhfu1AaA7kZVBntDG4lvzLqaWrijIrNF8AYMo+Mub
VV0rt1UGW3h4ndYPSaEEPT/yj5RckHcSHMjPRmf22AVNN5KPxSltsW6gwMz4ri+2
xF536D1QE9X6/1dFb+epC2NDM8QJ2UHOfBof3hruTn/uuHSUqunqA4IXbIDOu5WK
X55czoBwbTTJecW6oiC6Xfsh30vmhaASrHaIUhSVmAvItHLvYzO45BzRdjj78vub
oxw7X1yLU9MgOFIglZLVwcaWFRkmwFKlzyWJ3stlPgfrtD3rC4mSa8vFBhDOfikx
oQ5UCja8AEIkaqbMBXFRfxNnmAmHOO+PWwpHJaWlCaOx5tC9yKck4zJ27DP4Basv
t2+ujRM/huSIF9XWlQeKQSZF36aVu3lEtgYs47PFM2RFiLLeCBX1zaqtjO7l4Ti9
nN0U9qdOmvHeDuTYECMPrH/jnn0vtgl7lRBumlbvQmNIpUOqcTtvgAoceWfrtXBe
zw/A+aA5a6RqiuIMf1pkvcD89qFupGRhi87cfOPRLc3gMm+jy6yfIMuvZfgx8vq7
h1RGwEvhh42wi9btbB782RdaxJ9MuJi78aVvpbDTaayvoIxACtM=
=K6dq
-----END PGP SIGNATURE-----

--0LJhOcvFyBppcugX--


--===============5155420539592881436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5155420539592881436==--

