Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3386C77B71
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Apr 2023 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681368914;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zY2A1tCO9+k1UVNPKiPn2iCcQoOfcAJ9FIzhTkCBhsU=;
	b=LMFWyiQrITQNvHpZtt3PYTh6RsnVqt347W3XWjk/26U/tgnoyw+4SCqR0+4tNPaTsi5dom
	r2r4XziPFb4Dc2Q4i9IxmgGtbUp8Dj7UkAXQ/KaAgMWCvikcXHxwxU3E0q7uMn3gathxhv
	QLN+ewQNk9Xwhh03bfkOjTzbpeRLQeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-6vLF0aeyOiavOg2g-43lpg-1; Thu, 13 Apr 2023 02:55:12 -0400
X-MC-Unique: 6vLF0aeyOiavOg2g-43lpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0D2810B02AB;
	Thu, 13 Apr 2023 06:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F8AA2027046;
	Thu, 13 Apr 2023 06:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF3B519472DC;
	Thu, 13 Apr 2023 06:55:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 23D8D1946587
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 11:51:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 030BC47CE1; Wed, 12 Apr 2023 11:51:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF568FD6E
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 11:51:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC4A088B7A2
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 11:51:42 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-aAJPNEdWOPOR0N19Rz5p_A-1; Wed, 12 Apr 2023 07:51:40 -0400
X-MC-Unique: aAJPNEdWOPOR0N19Rz5p_A-1
Received: by mail-wr1-f48.google.com with SMTP id j11so14242855wrd.2
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 04:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300299; x=1683892299;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iIevvhJhSemHgAoXbZxrO9KpjmxPkHtxA0cv8ysF4Tw=;
 b=uBBVK5cBErPptuQ+XKVy2a/K9b+NuJKUulSa0vjGCFe1jwFwPNqFYgQKQWD2dw8/Q7
 N3POs6iBTiX3EpzOJcW37+3Eh7J5lu2GAXPda0BiePTrDP7Km0bZc1OXp5Mt7q7bTWoq
 GNbTD0JfUsD6oRsGYX8QABsrEJJmomeRVQpS884lv2ZHngjqxkIvGvDDpC1zAggRSYlO
 wMoziZePZTJl2C2Lc8U8K71nRuoV4luV4BCMNaIwax/S0Ix6+OXNyseJWhNLVEjeH519
 yDVcInErx0s2r/KIUxXHcNsIp9QK5UtBO+8xVrHZxrnYrZMmKOmAp299uyNrlMTMVQNO
 sPog==
X-Gm-Message-State: AAQBX9ePkAbkqs/Mz8JKkOBnIkweyeLkgsm6fK29tvA6AqFENp3EAh5c
 7tCEYWURoZdbcb/GyVM9C6SxJzCJVdc=
X-Google-Smtp-Source: AKy350bWXASadqoyyt6H2lk2cizYKniJgUG86zT4nC7OIIrWJKi9k/xJPJpjZ4Qed1y/Flzu1GD7NA==
X-Received: by 2002:adf:e48a:0:b0:2ef:4c83:b78e with SMTP id
 i10-20020adfe48a000000b002ef4c83b78emr1810249wrm.4.1681300298626; 
 Wed, 12 Apr 2023 04:51:38 -0700 (PDT)
Received: from [10.146.62.181] ([37.162.159.181])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05600c475000b003f092f0e0a0sm5463285wmo.3.2023.04.12.04.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:51:38 -0700 (PDT)
In-Reply-To: <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
 <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
X-Referenced-Uid: 72402
Thread-Topic: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <09afd742-3fd5-4387-9d62-ca6a5f8a865b@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Wed, 12 Apr 2023 13:51:37 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <09afd742-3fd5-4387-9d62-ca6a5f8a865b@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 13 Apr 2023 06:55:02 +0000
Subject: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
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
Cc: Roger Heflin <rogerheflin@gmail.com>, Roland <devzero@web.de>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============1610825545275944204=="

--===============1610825545275944204==
Content-Type: multipart/alternative; boundary="----0898Z6L14D4YEGU9PWTUJVACO3V4V8"

------0898Z6L14D4YEGU9PWTUJVACO3V4V8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

Zdenek is right

But if in this exact moment one or more drive do have not only bad sectors =
"reallocated" but also "pending" ones=20

the best choice is to preserve them shutting them off and allowing a PRO cl=
oning process with machines like PC-3000

But first at a PRO lab, they will open the drive in clean room for the sake=
 of check and verify WHY SMART are so bad for such amount of sectors

If recovering the data is a must, failing the preservation of the bad SMART=
 drives , will result in loosing them and together the data too.

Read on the data recovery guide published on the website of the told compan=
y

R.

=E2=81=A3 =E2=80=8B

Il giorno 12 apr 2023, 12:20, alle ore 12:20, Zdenek Kabelac <zdenek.kabela=
c@gmail.com> ha scritto:
>Dne 09. 04. 23 v 20:21 Roland napsal(a):
>>> Well, if the LV is being used for anything real, then I don't know
>of
>>> anything where you could remove a block in the middle and still have
>a
>>> working fs.=C2=A0=C2=A0 You can only reduce fs'es (the ones that you ca=
n
>reduce)
>>=20
>> my plan is to scan a disk for usable sectors and map the logical
>volume
>> around the broken sectors.
>>=20
>> whenever more sectors get broken, i'd like to remove the broken ones
>to have
>> a usable lv without broken sectors.
>>
>
>Reall silly plan  - been there years back in time when drives were FAR
>more=20
>expensive with the price per GiB.
>
>Todays - just throw bad drive to recycle bin - it's not worth to do
>this=20
>silliness.
>
>HDD bad sectors are spreading - and slowly the surface gets
>destroyed....
>
>So if you make large 'head-room' around bad disk areas - if they are=20
>concentrated on some disk area - and you know topology of you disk
>drive
>like i.e. 1% free disk space before and after bad area - you could
>possibly=20
>use disk for a little while more - but only to store invaluable
>data....
>
>
>> since you need to rebuild your data anyway for that disk, you can
>also
>> recreate the whole logical volume.
>>=20
>> my question and my project is a little bit academic. i'd simply want
>to try
>> out how much use you can have from some dead disks which are trash
>otherwise...
>
>You could always take  'vgcfgbackup'  of lvm2 metadata and make some
>crazy=20
>transition of if with even  AWK/python/perl   -  but we really tend to
>support
>just some useful features - as there is already  'too much' and users
>are=20
>getting often lost.
>
>One very simply & naive implementation could be going alonge this path
>-
>
>whenever you want to create new arrangement for you disk with 'bad'
>areas,
>you can always start from 'scratch' - since afterall - lvm2 ONLY
>manipulates=20
>with metadata within disk front - so if you need to create new 'holes',
>just   'pvcreate -f', vgcreate,   and 'lvcreate -Zn -Wn'
>and then  'lvextend'  with normal  or  'lvextend --type error | --type
>zero'=20
>segment types around bad areas with specific size.
>Once you are finished and your LV precisely matches your 'previous'  LV
>of you=20
>past VG - you can start to use this LV again with new arrangement of=20
>'broken=20
>zeroed/errored' areas.
>
>I've some serious doubts about usability of this with any filesystem :)
>but if=20
>you think this has some added value - fell free to use.
>If the drive you play with would be 'discardable' (SSD/NVMe) then one
>must=20
>take extra care there is no 'discard/TRIM' anywhere in the process - as
>that=20
>would lose all data irrecoverably....
>
>But good advice from me - whenever  'smartctl' starts to show
>relocation block=20
>errors - it's the right moment to  'dd_rescue' any LV to your new
>drive...
>>=20
>> yes, pvmove is the other approach for that.
>>=20
>> but will pvmove continue/finish by all means when moving extents
>located on a
>> bad sector ?
>
>pvmove  CANNOT be used with bad drives - it cannot deal with erroring
>sectors=20
>and basically gets stuck there trying to mirror unrecoverable disk
>areas...
>
>Regards
>
>Zdenek
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------0898Z6L14D4YEGU9PWTUJVACO3V4V8
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">Zdenek is ri=
ght<br><br></div>
<div dir=3D"auto">But if in this exact moment one or more drive do have not=
 only bad sectors "reallocated" but also "pending" ones <br><br></div>
<div dir=3D"auto">the best choice is to preserve them shutting them off and=
 allowing a PRO cloning process with machines like PC-3000<br><br></div>
<div dir=3D"auto">But first at a PRO lab, they will open the drive in clean=
 room for the sake of check and verify WHY SMART are so bad for such amount=
 of sectors<br><br></div>
<div dir=3D"auto">If recovering the data is a must, failing the preservatio=
n of the bad SMART drives , will result in loosing them and together the da=
ta too.<br><br></div>
<div dir=3D"auto">Read on the data recovery guide published on the website =
of the told company<br><br></div>
<div dir=3D"auto">R.<br><br></div>
<div dir=3D"auto"><!-- tmjah_g_1299s --> <!-- tmjah_g_1299e --></div>
<div class=3D"gmail_quote" >Il giorno 12 apr 2023, alle ore 12:20, Zdenek K=
abelac &lt;<a href=3D"mailto:zdenek.kabelac@gmail.com" target=3D"_blank">zd=
enek.kabelac@gmail.com</a>&gt; ha scritto:<blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">
<pre class=3D"blue">Dne 09. 04. 23 v 20:21 Roland napsal(a):<br><blockquote=
 class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px=
 solid #729fcf; padding-left: 1ex;"><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left=
: 1ex;"> Well, if the LV is being used for anything real, then I don't know=
 of<br> anything where you could remove a block in the middle and still hav=
e a<br> working fs.&nbsp;&nbsp; You can only reduce fs'es (the ones that yo=
u can reduce)<br></blockquote> <br> my plan is to scan a disk for usable se=
ctors and map the logical volume<br> around the broken sectors.<br> <br> wh=
enever more sectors get broken, i'd like to remove the broken ones to have<=
br> a usable lv without broken sectors.</blockquote><br><br>Reall silly pla=
n  - been there years back in time when drives were FAR more <br>expensive =
with the price per GiB.<br><br>Todays - just throw bad drive to recycle bin=
 - it's not worth to do this <br>silliness.<br><br>HDD bad sectors are spre=
ading - and slowly the surface gets destroyed....<br><br>So if you make lar=
ge 'head-room' around bad disk areas - if they are <br>concentrated on some=
 disk area - and you know topology of you disk drive<br>like i.e. 1% free d=
isk space before and after bad area - you could possibly <br>use disk for a=
 little while more - but only to store invaluable data....<br><br><br><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-lef=
t: 1px solid #729fcf; padding-left: 1ex;"> since you need to rebuild your d=
ata anyway for that disk, you can also<br> recreate the whole logical volum=
e.<br> <br> my question and my project is a little bit academic. i'd simply=
 want to try<br> out how much use you can have from some dead disks which a=
re trash otherwise...<br></blockquote><br>You could always take  'vgcfgback=
up'  of lvm2 metadata and make some crazy <br>transition of if with even  A=
WK/python/perl   -  but we really tend to support<br>just some useful featu=
res - as there is already  'too much' and users are <br>getting often lost.=
<br><br>One very simply &amp; naive implementation could be going alonge th=
is path -<br><br>whenever you want to create new arrangement for you disk w=
ith 'bad' areas,<br>you can always start from 'scratch' - since afterall - =
lvm2 ONLY manipulates <br>with metadata within disk front - so if you need =
to create new 'holes',<br>just   'pvcreate -f', vgcreate,   and 'lvcreate -=
Zn -Wn'<br>and then  'lvextend'  with normal  or  'lvextend --type error | =
--type zero' <br>segment types around bad areas with specific size.<br>Once=
 you are finished and your LV precisely matches your 'previous'  LV of you =
<br>past VG - you can start to use this LV again with new arrangement of  '=
broken <br>zeroed/errored' areas.<br><br>I've some serious doubts about usa=
bility of this with any filesystem :) but if <br>you think this has some ad=
ded value - fell free to use.<br>If the drive you play with would be 'disca=
rdable' (SSD/NVMe) then one must <br>take extra care there is no 'discard/T=
RIM' anywhere in the process - as that <br>would lose all data irrecoverabl=
y....<br><br>But good advice from me - whenever  'smartctl' starts to show =
relocation block <br>errors - it's the right moment to  'dd_rescue' any LV =
to your new drive...<br><blockquote class=3D"gmail_quote" style=3D"margin: =
0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> <br=
> yes, pvmove is the other approach for that.<br> <br> but will pvmove cont=
inue/finish by all means when moving extents located on a<br> bad sector ?<=
br></blockquote><br>pvmove  CANNOT be used with bad drives - it cannot deal=
 with erroring sectors <br>and basically gets stuck there trying to mirror =
unrecoverable disk areas...<br><br>Regards<br><br>Zdenek<br><br><br><br><hr=
><br>linux-lvm mailing list<br>linux-lvm@redhat.com<br><a href=3D"https://l=
istman.redhat.com/mailman/listinfo/linux-lvm">https://listman.redhat.com/ma=
ilman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HOWTO</a>/<br></pre></blo=
ckquote></div></body></html>
------0898Z6L14D4YEGU9PWTUJVACO3V4V8--

--===============1610825545275944204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============1610825545275944204==--

