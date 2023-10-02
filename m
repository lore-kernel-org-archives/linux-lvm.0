Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C1DE7491B
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Oct 2023 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696274514;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3/aj2k1tOUmYWIGkcHWafhqfzTd04qQONpBGV1qzwXM=;
	b=gHEoYVZ/YoohvtOE2kGWSr8CKkMz9JArvUdWikdVNLchwVFSmNqy7X6dhXoBQlMl97tie1
	EEZ45q56TKaq2N7DpC6DOsqk+3558XBirzqC1L8tucN5oLUsfAj53WKxGJtEdHydst+2BY
	Lz2BQvLxmWscDOz1whJ3YStzvDNbcbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-00LlA96rNQGNBkS2zZrT6Q-1; Mon, 02 Oct 2023 15:21:40 -0400
X-MC-Unique: 00LlA96rNQGNBkS2zZrT6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 987C8811E96;
	Mon,  2 Oct 2023 19:21:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3F6740C6EBF;
	Mon,  2 Oct 2023 19:21:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8409819465A2;
	Mon,  2 Oct 2023 19:21:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D8271946595
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 Oct 2023 19:21:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF5062026D68; Mon,  2 Oct 2023 19:21:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7CC12026D4B
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 19:21:32 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 896D8811E7B
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 19:21:32 +0000 (UTC)
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca
 [69.165.217.196]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-_YDr81H9NSqUANPHIFhNYg-1; Mon, 02 Oct 2023 15:21:19 -0400
X-MC-Unique: _YDr81H9NSqUANPHIFhNYg-1
Received: from pc.interlinx.bc.ca (pc.interlinx.bc.ca
 [IPv6:fd31:aeb1:48df:0:3b14:e643:83d8:7017])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by server.interlinx.bc.ca (Postfix) with ESMTPSA id B07A52F5EE
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 15:21:17 -0400 (EDT)
Message-ID: <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: linux-lvm@redhat.com
Date: Mon, 02 Oct 2023 15:21:17 -0400
In-Reply-To: <87pm1wn9j0.fsf@vps.thesusis.net>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Content-Type: multipart/mixed; boundary="===============7471731937189402808=="
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2


--===============7471731937189402808==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ruIvuEmvsy+IiAXSlolW"


--=-ruIvuEmvsy+IiAXSlolW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-10-02 at 14:49 -0400, Phillip Susi wrote:
>=20
> Looks that way.=C2=A0 That would be how much space is left in the array
> that
> is not quite enough for another 4 MiB PE.

Good.  Thanks for the sanity check.

> It shouldn't, but why bother?

Because I need to add another member to the array that is just slightly
smaller than the existing array.  It's the same sized disk as what's in
the array currently but is itself an MD array with luks, which is
reserving it's own metadata region from the total disk making it
slightly smaller.

So yes, ultimately I am going to have both an encrypted and unencrypted
member of this raid-1 array.  At least until the encrypted member is
added and then I will remove the unencrypted member and add it to the
luks encrypted array.

The general idea is to (safely -- as in be able to achieve in specific
sepearate steps that have a back-out plan) convert a non-encrypted
raid-1 array into an encrypted raid-1 array.

So what I have right now is:
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

I am going to reduce the size of md0 so that it's the same size as md1,
then add md1 to md0 (so yes, I will have a raid-1 array with a raid-1
member).  Then I am going to remove md0 from the md1 array and then add
sdc to md1 so that md0 no longer exists and md1 is the primary raid-1
array.  Ideally, rename md1 to md0 once done but that's aesthetic.

Ultimately I should end up (prior to any attempt to rename) md1 with
sdd and sdc as an encrypted raid-1 array.  The goal is to be able to
remove a disk from the raid array and safely
discard/return/recycle/etc. it knowing that it's content is relatively
secure.

The most problematic scenario of course is a disk dies and you want to
return it under warranty but you cannot access the disk to "scrub" it
and you either send it back with all kinds of sensitive data on it, or
you eat it.

Cheers,
b.


--=-ruIvuEmvsy+IiAXSlolW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE8B/A+mOVz5cTNBuZ2sHQNBbLyKAFAmUbGC0ACgkQ2sHQNBbL
yKDrMQf8D7Ha4nmXhuFdNbRm1BUpuGDDbAQbS9Q+0fXB3Qu89xY21XSzQM9Gwxha
IiNEYMnNVyL2+C1slb+35nWLGlT94/kToDUwrnd4RTyXE9rHx0HEFyd50ZrnHbzO
zvRorXfiA+1dWfKWhf6KGjUkcHcDIwfK/evX2hmirAFMYyMZmzVpyi0YZSG/kHmZ
1sv68J5KPXrE9oK7zKsL8bfPfrwuie2WEYLXCpZRbsnXxSO1w/I8AWqwvSAmAM3V
w4g1ZgfYrrnCwPyyRMSOYIfgyfh9RBtTPj3iPXF/3GS2EQ7j0cH7Kc6Wui04AvQ6
bCHWJZ//vHMRbsPhphkhR51eDQh/+w==
=E0PN
-----END PGP SIGNATURE-----

--=-ruIvuEmvsy+IiAXSlolW--


--===============7471731937189402808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7471731937189402808==--

