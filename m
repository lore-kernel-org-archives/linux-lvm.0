Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE55C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  4 Apr 2022 21:55:05 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-yifpkPUDN0u3mmLt8Y-fVQ-1; Mon, 04 Apr 2022 17:54:34 -0400
X-MC-Unique: yifpkPUDN0u3mmLt8Y-fVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3636180418F;
	Mon,  4 Apr 2022 21:54:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BEA0C50942;
	Mon,  4 Apr 2022 21:54:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B1D91940368;
	Mon,  4 Apr 2022 21:54:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 84B5719451EF
 for <linux-lvm@listman.corp.redhat.com>; Mon,  4 Apr 2022 21:54:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53E61145CB9F; Mon,  4 Apr 2022 21:54:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5032B145CB99
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:54:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 772CF805F54
 for <linux-lvm@redhat.com>; Mon,  4 Apr 2022 21:54:15 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-HXhesntlM36xP3LIitH08w-1; Mon, 04 Apr 2022 17:54:13 -0400
X-MC-Unique: HXhesntlM36xP3LIitH08w-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 44A805C05BE;
 Mon,  4 Apr 2022 17:54:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 Apr 2022 17:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=MBpB3yaWA/ZR7VYITpffyQ/n3Hp/MGJU5Zyi4dqMo
 qg=; b=Q8IcqXeRlksW7lU0zRMd8K4vmlwoMWH0bd5JZlCWGAkjKjUEN7gYKLcLi
 9f3fuyWvvdMciS9eP6Ou3lOLJSWFqUv7BK3UO0f/pHxNteskX1Kreq6/rAmwlASg
 w/VKJhT/7iPdUA1/pyAYNT/3FnYJeKqgCAc7GYuDORe4U7NUWWDFR0aT8/E5dx5D
 v8C6uBP09isBR1jcOy75qVYFA2vva04CbcCgxPNd4l0T/LWqYxLybwki9ptynLo2
 Sy7CZlDCHOGz7+9QRU/lnlftI8Ha38Aoh2A2kkKFtdNWm4nJ+ucvhWgT0Yg5Cr3o
 rUi00Ty6jojU2Rj05126bnLMexC0g==
X-ME-Sender: <xms:BWlLYrp3yTVDnQ-KVKzwZQ2Ug8Acjwoc95z2Z2kizGqo2YvCNlfgJQ>
 <xme:BWlLYloyx9va7RLPY08nrvjV_ieS12U7EY-b73UdLj6uVV0Jx0_cw4V_HMmibskJq
 3KW8x1yG7mMATA>
X-ME-Received: <xmr:BWlLYoOkZfksAtRVFfz66gzxGa1PZ2dy-E2Y9u8ajuoQNteBunJd6ZEMos7D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
 rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhmqeenucggtffrrghtthgvrhhnpedujefgjeeggeelhfevkeeltdekvdeuhfet
 iefffefhkeehhfevhefhkefgudegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
 rdgtohhm
X-ME-Proxy: <xmx:BWlLYu4pvAmyZbyhgkmZFDTEWe6EBsWpSF85zsOMswsq8sINGplgbw>
 <xmx:BWlLYq5ydXo9wAnt168ZBtb8TtQn2qeBocMPYmid0-0i9iZAkXGbag>
 <xmx:BWlLYmjEWMbjJqxqBbNxcHHNMJJ5f91vtmnFt2BsbyeqvM8roh9XDQ>
 <xmx:BWlLYnWWuantQNBLATQBtpIOrDLcRld4egXnRGrpia8IJ-t8PWvRHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 17:54:12 -0400 (EDT)
Date: Mon, 4 Apr 2022 17:54:10 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <YktpA/zUgvO2YPoo@itl-email>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Content-Type: multipart/mixed; boundary="===============0773970005729202522=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8


--===============0773970005729202522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XzlqDo7Gwnihho92"
Content-Disposition: inline


--XzlqDo7Gwnihho92
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 17:54:10 -0400
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


--XzlqDo7Gwnihho92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJLaQMACgkQsoi1X/+c
IsHdlA//ZrpBc8KmhDimmnUouWjtg4oPvZTP5+ViloxUDlEvjLYQSpJd1xTQEvLm
k1YSlobz6v4Abgp2Df1KFU+79FVnIpz3k7RyKkfFWy2gYGOw+eBrAeOzmd05W3fK
fXGpCU+7VqWOhOiFGdVaXmdccpSnxL8c2SEmqNvAWn6LVMqFCYzz9d9cpT7cGnmq
73Glzrqmkw1IyXcRwJOvJJelTEQ9QivofqNnmnR7aPckg6nO0swmYTFCybQCPwQd
KFz2UPUXBjvHur3fcEufO82k5sj3QSDI+88kMcZysug4/XlNjL9QMGWilQpr/yZE
Q49kKXkQptysfcqY3d9FNYwviq4eRgcZZqZ81bVCTCDJkTQfwMqHJPJIsyZkC8DM
lryZjHBzi/ZL1f2egbzKXXsA6zQ/l2SmTtTTWKyBRbJ0ZBIlQ0r12KIRfjeA4J44
/pNvWPtNhlHnyQLb4W+YruWa3+wq4cNZc5z4U2HFXFE4+8nb2HeQFDomRmDaXiC9
itrFobaGsJJZuS9v9oAJ0xukpTYzZFErlNV2aBcN/q+VGyh3aSNRFN0eS31j9js1
HQv7b5A4U7e6xZsyv7PfS6BH1ekqelmTarAEK55e1G8ikvwnksq+wWUVmGOKCM8I
UAmNnnSF4OIXAb4T6Mq9uAcpSt8KdR3mo3SNSLVJX9q37nvV4YQ=
=fvRP
-----END PGP SIGNATURE-----

--XzlqDo7Gwnihho92--


--===============0773970005729202522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0773970005729202522==--

