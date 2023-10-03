Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5FCE8FDBD
	for <linux-lvm@archiver.kernel.org>; Tue,  3 Oct 2023 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696371829;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iXhHK6cq1xqR5tBLURapIkC6typKOi0RuDkLPWJk+r8=;
	b=DzO1muO+2UJ6X6GSVn+qL0QEhfEaE9nAWn+6RgS04z4Fq5okgNKQ3sDIqmzWtLXvU5IwBx
	yH0vfohpT5tDKeyzNRIoZ8bBIFvW32ZF0luFI9ZRyLHsn3NaTmSBe2rCsY+m4GXvso6/8+
	TAPHN/1KBKsLS89qWYX6rODyJUpWm8E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-6W-9xWqWODCfDLyPeZvmIw-1; Tue, 03 Oct 2023 18:23:45 -0400
X-MC-Unique: 6W-9xWqWODCfDLyPeZvmIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 271BE29AA389;
	Tue,  3 Oct 2023 22:23:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 956F7493113;
	Tue,  3 Oct 2023 22:23:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3356B1946597;
	Tue,  3 Oct 2023 22:23:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 305F1194658D
 for <linux-lvm@listman.corp.redhat.com>; Tue,  3 Oct 2023 22:23:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1ACA42156702; Tue,  3 Oct 2023 22:23:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 130802156701
 for <linux-lvm@redhat.com>; Tue,  3 Oct 2023 22:23:35 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDCF3800B35
 for <linux-lvm@redhat.com>; Tue,  3 Oct 2023 22:23:34 +0000 (UTC)
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca
 [69.165.217.196]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-5BmY6UZcNcu7js7NdURb4A-1; Tue, 03 Oct 2023 18:23:33 -0400
X-MC-Unique: 5BmY6UZcNcu7js7NdURb4A-1
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca
 [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by server.interlinx.bc.ca (Postfix) with ESMTPSA id EE0232F5EE
 for <linux-lvm@redhat.com>; Tue,  3 Oct 2023 18:23:31 -0400 (EDT)
Message-ID: <d6e03767fe9d155812fc1d6f1e13c1c64f0391d7.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: linux-lvm@redhat.com
Date: Tue, 03 Oct 2023 18:23:30 -0400
In-Reply-To: <878r8ksihe.fsf@vps.thesusis.net>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
 <87v8boviwj.fsf@vps.thesusis.net>
 <800e8363150ab830a3b2514e3133794e088d242f.camel@interlinx.bc.ca>
 <878r8ksihe.fsf@vps.thesusis.net>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] Is MD array (containing a PV) reducible?
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
Content-Type: multipart/mixed; boundary="===============7191097783569781958=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--===============7191097783569781958==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8EmOnpNu7ivCfml5TjzZ"


--=-8EmOnpNu7ivCfml5TjzZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-10-02 at 19:37 -0400, Phillip Susi wrote:
>=20
> "Brian J. Murrell" <brian@interlinx.bc.ca> writes:
>=20
> > Just to take advantage of MD's online/background sync to get the
> > data
> > from md0 array to the md1 array.
>=20
> If you weren't using LVM, then that would be a good idea, but LVM can
> do
> that too.

So just to confirm, given:

sdc                                             8:32   0   3.7T  0 disk =
=20
=E2=94=94=E2=94=80md0                                           9:0    0   =
3.7T  0 raid1=20
  =E2=94=9C=E2=94=80backups-backups                           253:13   0   =
2.5T  0 lvm   /.snapshots
  =E2=94=9C=E2=94=80backups-borg                              253:14   0   =
300G  0 lvm  =20
  =E2=94=94=E2=94=80backups-vdo--test                         253:15   0   =
700G  0 lvm  =20
    =E2=94=94=E2=94=80vdo-backups                             253:73   0   =
1.8T  0 vdo  =20
sdd                                             8:48   0   3.7T  0 disk =
=20
=E2=94=94=E2=94=80md1                                           9:1    0   =
3.7T  0 raid1=20
  =E2=94=94=E2=94=80luks-backup                               253:40   0   =
3.7T  0 crypt=20

I want to do:

# pvcreate /dev/mapper/luks-backup
# vgextend backups /dev/mapper/luks-backup
# pvmove /dev/md0 /dev/luks-backup
# vgreduce backups /dev/md0
# mdadm --stop /dev/md0
# mdadm --zero-superblocks /dev/sdc
# mdadm /dev/md1 --add /dev/sdc

Correct?

Cheers,
b.


--=-8EmOnpNu7ivCfml5TjzZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmUclGMACgkQ2sHQNBbL
yKANigf/XAmSVDXwsVbjyiKYV4qEqTj9bEldsbZ8Vh9X7mW5QSjczxKyMtVkpN9n
euqYfrekCOs9Jl/8jAb7bbYjnn4Nfg2ai72DKvGTQlHirPK2E6Q01Xei5eLUZtKI
P3Sf0AtmGPJG0aCLpLoxdIFDBygRwxR3uSBeXN7LYiPWyeAOY9TP2Pu1M/CfzgW8
d+CZ4GPb2B87OAIKg50h88o7ukbilE0LEvkIBduw1nkr5x7gqwKyavNhyMVPl1hV
nK2BlfhS/74rAwBNt3IrXA4BeZGJ/QuvdJdsNN0sK5ouz2zIq5uN5gxNVqwtiXbN
Mjm4ilWXfK5YSDaelAWkJYl604Q7Qw==
=XW6w
-----END PGP SIGNATURE-----

--=-8EmOnpNu7ivCfml5TjzZ--


--===============7191097783569781958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7191097783569781958==--

