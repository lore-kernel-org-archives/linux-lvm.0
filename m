Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9878DC433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 21:59:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-ZYxgi8NDMrSdIswr8kuAdw-1; Mon, 04 Apr 2022 17:58:16 -0400
X-MC-Unique: ZYxgi8NDMrSdIswr8kuAdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63EAE3C01C2E;
	Mon,  4 Apr 2022 21:58:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 912FFC52D6E;
	Mon,  4 Apr 2022 21:58:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75D5E1940369;
	Mon,  4 Apr 2022 21:58:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAB0D19451EF
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 21:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB3F5C52D6E; Mon,  4 Apr 2022 21:58:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B47D3C52D68
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:58:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98A081C05EBC
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:58:12 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-4nZnUTTQPxOayPFumFQ2JQ-1; Mon, 04 Apr 2022 17:58:11 -0400
X-MC-Unique: 4nZnUTTQPxOayPFumFQ2JQ-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F2AB75C051B;
 Mon,  4 Apr 2022 17:58:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 04 Apr 2022 17:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hAwJuBEFXFk1vyBGj
 kdzHT2hbvMiaWp+C8q/g9xu/LI=; b=WLTDoto2P/fYbOHwdlYXqNVZd/zU6iPow
 RXrGrNTMrsDKNk4jQZuqFjDjaMYyvGcVzx1WF//omhuiWXDIqvYJROGG/rGfJuOu
 bzFFQ8OeKwpVwzOLKYHwd6foOpP2QItTEtO/viyIZ0fM2xytsbLFUHNav+73+fc3
 4E3EqVheqvArR1Ebc7k0XWPJt0rsPhOMr9S2uygywDOVLHn+AAmt/z6DGzV6l+NQ
 7rdxwOG6M0H4jIjDWXmlmlUYFKc6BQ1A0+gu1U1ZlVXh5Eo4Q3I5DBdAVIYXxo5y
 XwbP9izTF9gfGSgMQEKnCu41SA6ZxkIL9MIOkyWHtWp6VMMVMHqRg==
X-ME-Sender: <xms:8mlLYqPfOk5TSn9WhwCA5tgD97rZrzYTXRVvPry3i3l8i8yFutP2-Q>
 <xme:8mlLYo_GNwBk90TJSp9HtAHFc--521ELVNNOA8mkGJqUlBkxAKQ9WFtvTBUPFHIPS
 P4ay-4CrloH0ME>
X-ME-Received: <xmr:8mlLYhRdWDmTtCfNorLuMgEpbkvM1GrVxWWdX111kUg2GuqP781MCO9LKewN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
 ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfeifedvgfejleefieefgfejvddv
 feelgeelieefgeffhffgffeffffhueduheenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
 rggsrdgtohhm
X-ME-Proxy: <xmx:8mlLYqsFkzm5OJo09SwynHoCnwWihpanFGDmuTbrQ_9kK3P7XoeSKA>
 <xmx:8mlLYifQmFra0oczeyxJbZzD5fKIfqrcaAlZlFEnDHGuy9DIug6YUg>
 <xmx:8mlLYu1G7hRJq5GcfZ2ikGr0AG7A1Y-DejOGXLXQcsPj236tCYbMQw>
 <xmx:8mlLYkqc8p6QC6NNEGCL9QkA3NIG0ImkthD6hq63wXsTRJUZlhbWmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 17:58:10 -0400 (EDT)
Date: Mon, 4 Apr 2022 17:58:08 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <Yktp8Jghdz1k5jex@itl-email>
References: <YktogFA9Lidvo6qa@itl-email>
MIME-Version: 1.0
In-Reply-To: <YktogFA9Lidvo6qa@itl-email>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [linux-lvm] [PATCH 1/3] dmsetup: return non-zero on stdio I/O error
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
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="===============5861911470626161257=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8


--===============5861911470626161257==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gge24DanfkvpvzMG"
Content-Disposition: inline


--gge24DanfkvpvzMG
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 17:58:08 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/3] dmsetup: return non-zero on stdio I/O error

If there is an I/O error on stdout, return a non-zero status so that
udev can avoid trusting the values printed.  Deeper changes to the
log code are out of scope for this patch.
---
 libdm/dm-tools/dmsetup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdm/dm-tools/dmsetup.c b/libdm/dm-tools/dmsetup.c
index d01b8f2..0449e40 100644
--- a/libdm/dm-tools/dmsetup.c
+++ b/libdm/dm-tools/dmsetup.c
@@ -7491,5 +7491,7 @@ out:
 	if (_initial_timestamp)
 		dm_timestamp_destroy(_initial_timestamp);
=20
+        if (fflush(stdout) || ferror(stdout))
+            return 1;
 	return (_switches[HELP_ARG] || _switches[VERSION_ARG]) ? 0 : ret;
 }
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--gge24DanfkvpvzMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJLafAACgkQsoi1X/+c
IsFM8Q//aUZPkI+YSVwy9tAi/DZGa4xOFlsop/Vnf8K/7G3AIXjtxSHr14LLd2uX
uluRaXm2Hm2aoHeTHyhUq4JRzhI+t4XlhfLmqpQLFXrSDZSmtIdJ3RO4nbYF5+7B
q2YuWCkrLVvCnTU1YogojWtpOL4y9z3vTzRHZ+4NKByy+DjzkyiDAfK3IxT9cFg+
KmJbmuiCR9si3XMnQAJn6kTDm8ZoHb59sEx/kztlK4XYvlrRVkcX5Tczlk3loOKf
xMeaKEToPYqqnDgF5AkuEWbEoOYnuwQhuwJohoJ6os0jNQRrSriyvaIOM8hOOv9i
g4jqfRrtzkukOOuYQ9/xhmZ8vNnkO+RQW+VYKjTqfu+iUyV09r7vhPyUgwLr1ysw
1lmVwy2G+5Auip2cjrVzBFhvQ7Lz5+GCHfK38Mcz9l0v7n0XHnPHwpRrx8XvnJsK
g3I/Ug/gYVIXd4ydDD5gsmDLb8TpTNdtZFcZ5GcualOVfyvhJTRu9oJHou2JUdbq
Ab5LEu9Gb7TwmdVxlNUiWwRaL5+GF1l7RuvsdYLvYyCaZh5GOPj6TrJ5fqwKZZYa
Ppk3D0UKRglV/LfkcKYCvGUw6Sl1/tFmmTYMT+VFYd92n+7rtyju6NAL5ITouuzm
vcSJQjqNVSUAWBCC9kX3KUYhy1BbXMf89kQGRfcPIclC60bnFzg=
=SBWh
-----END PGP SIGNATURE-----

--gge24DanfkvpvzMG--


--===============5861911470626161257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5861911470626161257==--

