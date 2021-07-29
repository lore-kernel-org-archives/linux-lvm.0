Return-Path: <SRS0=b/57=MW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C21C4338F
	for <linux-lvm@archiver.kernel.org>; Fri, 30 Jul 2021 06:45:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B330E60F46
	for <linux-lvm@archiver.kernel.org>; Fri, 30 Jul 2021 06:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B330E60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=netcologne.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-7FSqSXPnO8-bjZN70O66OQ-1; Fri, 30 Jul 2021 02:45:51 -0400
X-MC-Unique: 7FSqSXPnO8-bjZN70O66OQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FD5801AE3;
	Fri, 30 Jul 2021 06:45:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E040351C63;
	Fri, 30 Jul 2021 06:45:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B21764BB7C;
	Fri, 30 Jul 2021 06:45:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TFs6N8008326 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 11:54:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC63620A8DE0; Thu, 29 Jul 2021 15:54:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C0B20A8DE3
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2021 15:54:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 540A1866DF1
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2021 15:54:03 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1627574043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=toSeWRNIxkMlGQztTmiXPyLbg/+Hltn2MrqOsTNw8Hs=;
	b=bDmNuCGVReesoMC7Z1Qi/apNE0OWyChbMEGOLWowo/yj6sqb//mxL2EedjhgWhrmQaQ+D+
	MgUTbdSPF7rqekZ5xzcPDE8CBotdUQeCMx/Mn2IrdEH55fYB/6Bkgh182fNRNPDEjw9ztr
	5mY4IClWW2+MuwZ4W2+FE30qS2bg3jYn/bgJ/IrzQijwMyjsw1I5UpBHUzopO7Hdmp/l6L
	ZriSp3BQg9CgrvnqjzpREWmX/sVSmhsu3rtFxLg3TLWe0LhkYLXqifRFzGQ2NgLSqovqgD
	IkgfJCCk0kAwlNI4o0lUM9IbTnLXThP4w+1ZqWRrVzlCyfux6DLSqI0K6+fuyw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1627574043; a=rsa-sha256;
	cv=none;
	b=ic5ED+zwvvCgjyvf8/gNajgH6UMHzgolnEpluh8PCkK3bZ7neFl3MXamkeLolfsj8Wy/Uv
	5robtYvyz408XavNerK7a669+fdD/eNtsZh2xkBmtGVY1aRqZ3clf0FkoqexIjZ/KI4Bqz
	XdhutA2x7ZRwjiHzWIzKWSbAnYFjNBOOiysfDc65YKMynrE9ZmMwcP2FFH/K+SZFD4CLUY
	1d6tYPlPzTtsdNrLHEaQAKJ/ny4gbzqnB5XR3WDL2qgnZwwuKuwqbzQs8kzQeftGIrlvzd
	94P9AYkXVxH7U+4vYa+YBEfqiTFrSzYlth9ns/0T4Y194+RcjDtlDkq+fW09vg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=netcologne.de header.s=nc1116a header.b=kW+lWKSl;
	dmarc=pass (policy=none) header.from=netcologne.de;
	spf=pass (relay.mimecast.com: domain of nc-duenkekl3@netcologne.de
	designates 89.1.8.212 as permitted sender)
	smtp.mailfrom=nc-duenkekl3@netcologne.de
Received: from cc-smtpout2.netcologne.de (cc-smtpout2.netcologne.de
	[89.1.8.212]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-7em5DTf-NHGM96hp3W5nzA-1; Thu, 29 Jul 2021 11:54:00 -0400
X-MC-Unique: 7em5DTf-NHGM96hp3W5nzA-1
Received: from cc-smtpin3.netcologne.de (cc-smtpin3.netcologne.de [89.1.8.203])
	by cc-smtpout2.netcologne.de (Postfix) with ESMTP id 4EEBB1245C;
	Thu, 29 Jul 2021 17:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=netcologne.de;
	s=nc1116a; t=1627574038;
	bh=b+Ys2g8sFa4KZ3eY83CD9SAnTrZXGhzQwqsghE3N+Aw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To:From;
	b=kW+lWKSlewKAcqdWXflodWGrqXqdxyZ3qZv+cFMNwiGkti6vgCO74OnJKDoAKVVcX
	OnUI3q8lFq44eplityof4bN8CRUVM94Du0Qu/Pch1IlfGRTvofN7cbJJfPrhlNFkcQ
	2HBsbQxaoTSrUMppkyJSCaQ1k3B/tPXIJqh3VdZHX8vvMbLbFiDBHoJbNjj+vYW2w0
	EEZ6R2zEXtjB9DlaBcMvN0JSZtASFeEwPBfoPGu1aXF/W+q8BsXTuOTmy5BSYasz5z
	4T7dyMKm9L3NeuZmwUVS8LJeRbKjaAi/Z0VUxdFBv6SUFZIQ5PcZ2mDBc4nvInSDrw
	q1OAhJ53j4mRQ==
Received: from [IPv6:2a0a:a546:2791:0:ca5b:76ff:fe31:28c3]
	(2a0a-a546-2791-0-ca5b-76ff-fe31-28c3.ipv6dyn.netcologne.de
	[IPv6:2a0a:a546:2791:0:ca5b:76ff:fe31:28c3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by cc-smtpin3.netcologne.de (Postfix) with ESMTPSA id 178F511D74;
	Thu, 29 Jul 2021 17:53:55 +0200 (CEST)
To: David Teigland <teigland@redhat.com>
References: <630e7a16-5305-9319-52e2-8c45da6e9e27@netcologne.de>
	<20210729145946.GA22305@redhat.com>
From: =?UTF-8?Q?Martin_D=c3=bcnkelmann?= <nc-duenkekl3@netcologne.de>
Message-ID: <7951f525-1c90-5824-c249-ee09c83ae5e7@netcologne.de>
Date: Thu, 29 Jul 2021 17:53:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729145946.GA22305@redhat.com>
X-NetCologne-Spam: L
X-Rspamd-Queue-Id: 178F511D74
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=netcologne.de header.s=nc1116a header.b=kW+lWKSl;
	dmarc=pass (policy=none) header.from=netcologne.de;
	spf=pass (relay.mimecast.com: domain of nc-duenkekl3@netcologne.de
	designates 89.1.8.212 as permitted sender)
	smtp.mailfrom=nc-duenkekl3@netcologne.de
X-Mimecast-Spam-Score: -5
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 30 Jul 2021 02:45:25 -0400
Cc: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Questions about monitoring,
 scrubbing & checking a LVM RAID5
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4682571471953508224=="
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4682571471953508224==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="1NHwAiEnNj3p1nFNN5JAOKgReWrkRCTmx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1NHwAiEnNj3p1nFNN5JAOKgReWrkRCTmx
Content-Type: multipart/mixed; boundary="TDRmY7aui4xATXSQciYCY7toXIr8AexXZ";
	protected-headers="v1"
From: =?UTF-8?Q?Martin_D=c3=bcnkelmann?= <nc-duenkekl3@netcologne.de>
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com
Message-ID: <7951f525-1c90-5824-c249-ee09c83ae5e7@netcologne.de>
Subject: Re: [linux-lvm] Questions about monitoring, scrubbing & checking a
	LVM RAID5
References: <630e7a16-5305-9319-52e2-8c45da6e9e27@netcologne.de>
	<20210729145946.GA22305@redhat.com>
In-Reply-To: <20210729145946.GA22305@redhat.com>

--TDRmY7aui4xATXSQciYCY7toXIr8AexXZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

Dear Dave,

thank you for your response.

Here is my output:
$ sudo lvs -o segtype cryptdata_raid5/home
 =C2=A0 Type
 =C2=A0 linear
 =C2=A0 linear
 =C2=A0 linear

And if I execute:
"$ sudo lvconvert --type raid5 -i 3 cryptdata_raid5/home"
I get
 =C2=A0 Using default stripesize 64,00 KiB.
 =C2=A0 Replaced LV type raid5 (same as raid5_ls) with possible type raid1.
 =C2=A0 Repeat this command to convert to raid5 after an interim conversion=
=20
has finished.
 =C2=A0 Are you sure you want to convert linear LV cryptdata_raid5/home to=
=20
raid1 type? [y/n]: y
 =C2=A0 Insufficient free space: 1 extents needed, but only 0 available

So probably I hit a bug with lvm2-2.03.12 on arch linux.

Thanks for your help.
Then it will be better to reformat my RAID5 with mdadm.

Am 29.07.21 um 16:59 schrieb David Teigland:
> On Wed, Jul 28, 2021 at 11:50:56PM +0200, Martin D=C3=BCnkelmann wrote:
>> Dear LVM2-People,
>>
>> I made a native RAID5 via LVM on 3 SSDs without mdadm, since LVM2 can do=
 it
>> natively.
>>
>> But I got confused about how to easily monitor it (send emails about err=
ors,
>> since it's a remove server) and how to check, repair and scrub the RAID5=
.
>>
>> Using:
>> "sudo lvchange --syncaction check cryptdata_raid5/home" (same for repair=
)
>> results in
>>
>> Command on LV cryptdata_raid5/home does not accept LV type linear.
>> Command not permitted on LV cryptdata_raid5/home.
> It works for me, so it could be a fixed bug.  Check that the LV is really
> raid5: lvs -o segtype cryptdata_raid5/home
>
>> Does that mean LVM2 doesn't fully support native RAID5 and I should form=
at
>> everything and set up a mdadm raid5?
>> Because mdadm has scrubbing and email reports according to the mdadm.con=
f.
> Right, mdadm does much more.
>
> Dave
>
--=20
Greetings

Martin



--TDRmY7aui4xATXSQciYCY7toXIr8AexXZ--

--1NHwAiEnNj3p1nFNN5JAOKgReWrkRCTmx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE6D66xlprAeml6jXFmSl3x1NCP7gFAmECzxMFAwAAAAAACgkQmSl3x1NCP7i4
LQ//cY5l94wuiB7Y6CGpABbHiEl/z7vMfzOR9I8jcNMap92Ahyl23BG0hSZRQcnt4DMX3TKuUj/M
6cu30g620yRpQcVnNwNOsUlYnReJlP+O0cVIyKme/65cqOSusozooXooRDQQyQynS3usxe6pmPc5
S3kbYGaSndNTPWuN0pkttkN56bJtELrYTnnC6phGKuzF3ieJwFvALlFPaeJWd02jhnH+fBDiVDn3
DyjWW+wJV9SdBPw623OTcs1P82i/7dVLbZkEN6uOrasXNjKu2hNtYHrwVYlJ1/UCXp05UFf73FkP
OxPaXl9a40xs4LoRNOzzcUoz7RKkv9oktH1y4QdjrAl1mNj6Z854iwtKKUL+UCGglCtOPG4iy9xr
67yA+ncCRjajsmtdGmweVC9x1lmJM7hstqR+Kwvt0PHshgdGC2eFcPe0r0JDY+ekQpMvW1ToFrOg
cft5p5Db1gxeMwCWFk55HTYpIHM6KEJL6HU2RHqmm6qd1yMjqUguZv8P1PRroZYmqcklhvYsUsbZ
EkJZ/vss3gHDPvERM9UGKwke5aKxwmgdscQhMcFpukOXf+eWkefKpFdtbkmnnaKApMC3OEGuHQGd
PjL84o0e2a+duPzXwdSM23PGdbP7GJtwfivfspBgiUOL0FKBhOWwe5qvCLhCIxEDheV75CKdCd/X
zEs=
=xing
-----END PGP SIGNATURE-----

--1NHwAiEnNj3p1nFNN5JAOKgReWrkRCTmx--


--===============4682571471953508224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4682571471953508224==--

