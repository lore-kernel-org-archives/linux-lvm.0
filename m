Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A8CE743C3
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Oct 2023 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696263211;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=I4n1VticUou4ncnHQgkF4BGVPKNwzPED7Olnl//Yyao=;
	b=WAFJPmqJfQTNFUnubh3CYuFixYFEGdokAcTEaqaQ/elb3GmkQ4HJeQxKuI5SABB7Lv+Jkb
	ZiqEbWnJ8FBL2mSuoeQp1f4dWB8JHyAww95AvlXO7vyyn+1lTM/D9HooQfTmV9mdjjtugJ
	pKYxZH3OnA9Pe2KcEZyWDB8kOyRCzwE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-8H5fv7yzPTOIftuJKaKD8A-1; Mon, 02 Oct 2023 12:13:18 -0400
X-MC-Unique: 8H5fv7yzPTOIftuJKaKD8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E38B797E407;
	Mon,  2 Oct 2023 16:13:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 403792156701;
	Mon,  2 Oct 2023 16:13:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1219119465B1;
	Mon,  2 Oct 2023 16:12:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F53F19465A2
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 Oct 2023 16:12:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6107028FE; Mon,  2 Oct 2023 16:12:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59C3751E3
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 16:12:52 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 381703C02B81
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 16:12:52 +0000 (UTC)
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca
 [69.165.217.196]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-T4KzBTZ1NaKnuoswt4GrYw-1; Mon, 02 Oct 2023 12:12:50 -0400
X-MC-Unique: T4KzBTZ1NaKnuoswt4GrYw-1
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca
 [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by server.interlinx.bc.ca (Postfix) with ESMTPSA id F29992F5EE
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 12:03:45 -0400 (EDT)
Message-ID: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: linux-lvm@redhat.com
Date: Mon, 02 Oct 2023 12:03:45 -0400
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [linux-lvm] Is MD array (containing a PV) reducible?
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
Content-Type: multipart/mixed; boundary="===============4447767071039287011=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6


--===============4447767071039287011==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dzHWJ+bJfto6sl9W5fSe"


--=-dzHWJ+bJfto6sl9W5fSe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

Just hoping to get a sanity check here.  I have a PV on an mdadm raid
array.  the PV's size is:

  PV Size               3.64 TiB / not usable 2.84 MiB
  Allocatable           yes=20
  PE Size               4.00 MiB
  Total PE              953829
  Free PE               35813
  Allocated PE          918016

The mdadm array's size is:
        Array Size : 3,906,887,512 (3.64 TiB 4.00 TB)
     Used Dev Size : 3,906,887,512 (3.64 TiB 4.00 TB)

I can shrink this array down to 3,906,886,464 without impacting the PV
(and it's contents) correct?

=46rom my calculations there is 4,022,272 bytes of unused space after the
PV to the end of the array so shrinking it by 1,073,152 shouldn't have
any impact, correct?

Cheers,
b.


--=-dzHWJ+bJfto6sl9W5fSe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmUa6eEACgkQ2sHQNBbL
yKA2yQf/TaGhmRPfrt9drdo6Q7WaYIRC5IaCwm0isXYKOxOi3fTW90Fou9iigfDg
uFYSofcZO+HVtZW6rekHI+mnOW0grOyf0Xb15wypuukuxh9iCjx8K9eEsnG6JYqe
W1AtH4Ofh+WgFTU96zIEB52TwgfH6nX6EHU97vf6btyGmVjvZDDyk1k7NC1xwwgs
Jq8YJGTSZUBhQ6jQPzZ7o7dhBrfd0Ej73j1Aea5E7RJ5poWItJj/b/BM837RK0Mj
I+O21VyZAV6zPizQKmTFGM6V8enkbSP1nlQiLp3GMfHCpTIXJc8ss8fV/kNXv0PH
9gM9+tjuhS16/7l7J1iIpO5f5SFr6Q==
=o3O1
-----END PGP SIGNATURE-----

--=-dzHWJ+bJfto6sl9W5fSe--


--===============4447767071039287011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4447767071039287011==--

