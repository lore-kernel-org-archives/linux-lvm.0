Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2FCC77B77
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Apr 2023 06:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681368916;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pL5EXlMC6OK3/+D1XFsAzOEVtsaF90AttGtHX/VAg30=;
	b=XYN8sY7CxzV39KBbDh7SrMZmftmq+yPfMxug2+7+Gx8oFxbqlwtQgcdxFg45w032ZW4hSy
	XhMmmyTd50hGS8qLm1ImRqZj5rDqUeiSOkrAjM9qGWEb0bRB/GVYw4lUiZGqHnDX/ofU7b
	1WVvIorKPRHwOclRk1IWAlSnNw4qfD0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-EfCZtE3CONOFnST3wCsPug-1; Thu, 13 Apr 2023 02:55:11 -0400
X-MC-Unique: EfCZtE3CONOFnST3wCsPug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FBAF29DD99E;
	Thu, 13 Apr 2023 06:55:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF5D94042AD1;
	Thu, 13 Apr 2023 06:55:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0872519472C3;
	Thu, 13 Apr 2023 06:55:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B78241946587
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 13:53:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6697492C3E; Wed, 12 Apr 2023 13:53:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC2B492B03
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 13:53:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F62E8996E0
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 13:53:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-2xnT-lZtN3qMJTDkFgcjdA-1; Wed, 12 Apr 2023 09:53:56 -0400
X-MC-Unique: 2xnT-lZtN3qMJTDkFgcjdA-1
Received: by mail-wr1-f41.google.com with SMTP id i3so1669869wrc.4
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 06:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307635; x=1683899635;
 h=message-id:cc:to:date:from:subject:content-transfer-encoding
 :mime-version:user-agent:thread-topic:references:in-reply-to
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JHxRDZ0e5mSvPerHayyaVWlbtgrUHoKsNg3xuIoo+VE=;
 b=Y+L8KrmMgGAzSkjxJ6CKftdan4BkbUyX1re5GBvVAj/oOdiB1eey2phbirXUTqba7J
 L2GI92zGNCK4tt/winD8yBlIolchMCEt4k0afW07J3Z9z3rm7aZz0kM7L/GgyLejW8Vz
 btEOz/ygWy9BOuwZ+lYzRRFAerJXZsDH/fGfTeO7S8R7lInMJDDZQjdgcZN4iGegviq3
 ebCdlNx4bqzva/+nLEf9dg190iHTLgShSLU/QTVo884Fqkr3wIohtoIWnhITffoBkXqo
 S0dfPlXMngjpqyYRS0puMB6rEnd7EpwTVmw7gamFJTtqEvgzp1AoCdiDqvm63nAOfRlJ
 mVCA==
X-Gm-Message-State: AAQBX9e9zU0Ocx3e+S0YzrBLuyy6sQ0JrCx7tbrOTyjWdUyePKr70Ee/
 EyahG/guYQpkgRP01NfywrFWndAQy8I=
X-Google-Smtp-Source: AKy350Y/uGyQ9dB6JkY/YgChyZYt9MrTgAOmUjY5jIvykb7iSvweT3M6S9uBz4YIF1FJcVbqiTz+7Q==
X-Received: by 2002:adf:e681:0:b0:2ef:cf6c:9bd1 with SMTP id
 r1-20020adfe681000000b002efcf6c9bd1mr8710328wrm.67.1681307634531; 
 Wed, 12 Apr 2023 06:53:54 -0700 (PDT)
Received: from [10.142.94.181] ([37.163.221.231])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a7bcd19000000b003ed1ff06faasm2435492wmj.19.2023.04.12.06.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:53:54 -0700 (PDT)
In-Reply-To: <b24e48de-f4c7-b9f4-97fa-60671824c1f4@web.de>
References: <4649980a-7af2-5b2e-47de-ce88ccb8ac6f@web.de>
 <CAAMCDefZC-J7Nc0H45e_EmqkRDr8ZjpOn-JvNWyBzExh8TaCsg@mail.gmail.com>
 <845e5b45-42d5-3d7f-bdad-a66ce7a2e5a9@web.de>
 <563d6e1e-e752-12df-4073-70c9b45c1879@gmail.com>
 <b24e48de-f4c7-b9f4-97fa-60671824c1f4@web.de>
X-Referenced-Uid: 72407
Thread-Topic: Re: [linux-lvm] bug? shrink lv by specifying pv extent to be
 removed does not behave as expected
User-Agent: Android
X-Is-Generated-Message-Id: true
MIME-Version: 1.0
X-Local-Message-Id: <136aa7af-b2ac-402a-afc5-6506d4b33488@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
Date: Wed, 12 Apr 2023 15:53:52 +0200
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <136aa7af-b2ac-402a-afc5-6506d4b33488@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Roger Heflin <rogerheflin@gmail.com>,
 Zdenek Kabelac <zdenek.kabelac@gmail.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============0467467529010093579=="

--===============0467467529010093579==
Content-Type: multipart/alternative; boundary="----U9REFNE11PUVPXHGU3AQPPHZNXJXM9"

------U9REFNE11PUVPXHGU3AQPPHZNXJXM9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
 charset=UTF-8

"but shouldn't we perhaps leave it up to the end user / owner of the
hardware,=C2=A0 to decide when it's ready for the recycle bin ?"

with hard drives (forget SSDs, they are hardware accelerators absolutely un=
affordable for data storing) it is not the user/owner that decide it , unle=
ss he doesn't want to suicide his data

is the SMART system that tells you that one first reallocation happen

Sectors reallocation are not allowed

Those few 100 or 250 sectors are just for the SMART system

As soon just one reallocation happen, it is time to waste the drive

Like with car tyres, when you reach the marker , it is time to waste them, =
but if you run too few kilometers per year, after few years the gum got dri=
ed and you create a risk for yourself and the others if you don waste them

This comparison applies to hard drives

If the weekly SMART test tells you that a drive is in pre-failure (just rea=
llocations happen, few mean 3 - 4 - 5) you have been warned:

it is time to waste "the tyre"

You don't do that, you was warned



Il giorno 12 apr 2023, 14:37, alle ore 14:37, Roland <devzero@web.de> ha sc=
ritto:
>>Reall silly plan=C2=A0 - been there years back in time when drives were F=
AR
>more expensive with the price per GiB.
> >Todays - just throw bad drive to recycle bin - it's not worth to do
>this silliness.
>
>ok, i understand your point of view. and thank you for the input.
>
>but this applies to a world with endless ressources and when people can
>afford the new hardware.
>
>i think, with the same logic, you can designate some guy to be silly ,
>if he puts a patch on his bicycle inner tube instead
>of buying a new one, as they are cheap. with the patch, the tube is
>always worse then a new one. and he probably risks
>his own health, because of using a tube which may already have gotten
>porous...
>
>but shouldn't we perhaps leave it up to the end user / owner of the
>hardware,=C2=A0 to decide when it's ready for the recycle bin ?
>
>or should we perhaps wait for the next harddrive supply crisis (like in
>2011)?=C2=A0 then people start to get more creative in using
>what they have, because they have no other option...
>
> > whenever you want to create new arrangement for you disk with 'bad'
>areas,
> >you can always start from 'scratch' - since afterall - lvm2 ONLY
>manipulates with metadata within disk front -
> >so if you need to create new 'holes',
> >just=C2=A0=C2=A0 'pvcreate -f', vgcreate,=C2=A0=C2=A0 and 'lvcreate -Zn =
-Wn'
>>and then=C2=A0 'lvextend'=C2=A0 with normal=C2=A0 or=C2=A0 'lvextend --ty=
pe error | --type
>zero' segment types around bad areas with specific size.
> >Once you are finished and your LV precisely matches your 'previous'=C2=
=A0
>LV of you past VG - you can start to use this LV again with
> >new arrangement of=C2=A0 'broken zeroed/errored' areas.
>
>yes, i have already come to the conclusion, that it's always better to
>start from scratch like this. i dismissed the idea of
>excluding or relocating bad sectors.
>
> > But good advice from me - whenever=C2=A0 'smartctl' starts to show
>relocation block errors - it's the right moment to=C2=A0 'dd_rescue'
> > any LV to your new drive...
>
>yes, i'm totally aware that we walk on very thin ice here.
>
>but i'd really like to collect some real world data/information on how
>good such disk "recycling" can probably work.=C2=A0 i don't have
>any pointers for such and did not find any information, on "how fast a
>bad disk gets worse,=C2=A0 if it has irretrievable bad sectors
>and smart is reporting relocation errors. there seems not much
>information around for this...
>
>i guess such "broken" disks being used with zfs in a redundant setup,
>they could probable still serve a purpose. maybe not
>for production data, but probably good enough for "not so important"
>application.
>
>it's a little bit academic project. for my own fun. i like to fiddle
>with disks, lvm, zfs and that stuff....
>
>roland
>
>Am 12.04.23 um 12:20 schrieb Zdenek Kabelac:
>> Dne 09. 04. 23 v 20:21 Roland napsal(a):
>>>> Well, if the LV is being used for anything real, then I don't know
>of
>>>> anything where you could remove a block in the middle and still
>have a
>>>> working fs.=C2=A0=C2=A0 You can only reduce fs'es (the ones that you c=
an
>reduce)
>>>
>>> my plan is to scan a disk for usable sectors and map the logical
>volume
>>> around the broken sectors.
>>>
>>> whenever more sectors get broken, i'd like to remove the broken ones
>>> to have
>>> a usable lv without broken sectors.
>>>
>>
>> Reall silly plan=C2=A0 - been there years back in time when drives were
>FAR
>> more expensive with the price per GiB.
>>
>> Todays - just throw bad drive to recycle bin - it's not worth to do
>> this silliness.
>>
>> HDD bad sectors are spreading - and slowly the surface gets
>destroyed....
>>
>> So if you make large 'head-room' around bad disk areas - if they are
>> concentrated on some disk area - and you know topology of you disk
>drive
>> like i.e. 1% free disk space before and after bad area - you could
>> possibly use disk for a little while more - but only to store
>> invaluable data....
>>
>>
>>> since you need to rebuild your data anyway for that disk, you can
>also
>>> recreate the whole logical volume.
>>>
>>> my question and my project is a little bit academic. i'd simply want
>>> to try
>>> out how much use you can have from some dead disks which are trash
>>> otherwise...
>>
>> You could always take=C2=A0 'vgcfgbackup'=C2=A0 of lvm2 metadata and mak=
e some
>> crazy transition of if with even=C2=A0 AWK/python/perl=C2=A0=C2=A0 -=C2=
=A0 but we really
>> tend to support
>> just some useful features - as there is already=C2=A0 'too much' and use=
rs
>> are getting often lost.
>>
>> One very simply & naive implementation could be going alonge this
>path -
>>
>> whenever you want to create new arrangement for you disk with 'bad'
>> areas,
>> you can always start from 'scratch' - since afterall - lvm2 ONLY
>> manipulates with metadata within disk front - so if you need to
>create
>> new 'holes',
>> just=C2=A0=C2=A0 'pvcreate -f', vgcreate,=C2=A0=C2=A0 and 'lvcreate -Zn =
-Wn'
>> and then=C2=A0 'lvextend'=C2=A0 with normal=C2=A0 or=C2=A0 'lvextend --t=
ype error |
>--type
>> zero' segment types around bad areas with specific size.
>> Once you are finished and your LV precisely matches your 'previous'=C2=
=A0
>> LV of you past VG - you can start to use this LV again with new
>> arrangement of=C2=A0 'broken zeroed/errored' areas.
>>
>> I've some serious doubts about usability of this with any filesystem
>> :) but if you think this has some added value - fell free to use.
>> If the drive you play with would be 'discardable' (SSD/NVMe) then one
>> must take extra care there is no 'discard/TRIM' anywhere in the
>> process - as that would lose all data irrecoverably....
>>
>> But good advice from me - whenever=C2=A0 'smartctl' starts to show
>> relocation block errors - it's the right moment to=C2=A0 'dd_rescue' any
>LV
>> to your new drive...
>>>
>>> yes, pvmove is the other approach for that.
>>>
>>> but will pvmove continue/finish by all means when moving extents
>>> located on a
>>> bad sector ?
>>
>> pvmove=C2=A0 CANNOT be used with bad drives - it cannot deal with errori=
ng
>> sectors and basically gets stuck there trying to mirror unrecoverable
>> disk areas...
>>
>> Regards
>>
>> Zdenek
>>
>>
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://listman.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------U9REFNE11PUVPXHGU3AQPPHZNXJXM9
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"zoom: 0%;"><div dir=3D"auto">"but shouldn=
't we perhaps leave it up to the end user / owner of the<br></div>
<div dir=3D"auto">hardware,=C2=A0 to decide when it's ready for the recycle=
 bin ?"<br><br></div>
<div dir=3D"auto">with hard drives (forget SSDs, they are hardware accelera=
tors absolutely unaffordable for data storing) it is not the user/owner tha=
t decide it , unless he doesn't want to suicide his data<br><br></div>
<div dir=3D"auto">is the SMART system that tells you that one first realloc=
ation happen<br><br></div>
<div dir=3D"auto">Sectors reallocation are not allowed<br><br></div>
<div dir=3D"auto">Those few 100 or 250 sectors are just for the SMART syste=
m<br><br></div>
<div dir=3D"auto">As soon just one reallocation happen, it is time to waste=
 the drive<br><br></div>
<div dir=3D"auto">Like with car tyres, when you reach the marker , it is ti=
me to waste them, but if you run too few kilometers per year, after few yea=
rs the gum got dried and you create a risk for yourself and the others if y=
ou don waste them<br><br></div>
<div dir=3D"auto">This comparison applies to hard drives<br><br></div>
<div dir=3D"auto">If the weekly SMART test tells you that a drive is in pre=
-failure (just reallocations happen, few mean 3 - 4 - 5) you have been warn=
ed:<br><br></div>
<div dir=3D"auto">it is time to waste "the tyre"<br><br></div>
<div dir=3D"auto">You don't do that, you was warned<br><br></div>
<div class=3D"gmail_quote" >Il giorno 12 apr 2023, alle ore 14:37, Roland &=
lt;<a href=3D"mailto:devzero@web.de" target=3D"_blank">devzero@web.de</a>&g=
t; ha scritto:<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0p=
t 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"blue"><blockquote class=3D"gmail_quote" style=3D"margin: 0pt =
0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">Reall si=
lly plan&nbsp; - been there years back in time when drives were FAR<br></bl=
ockquote>more expensive with the price per GiB.<br><blockquote class=3D"gma=
il_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fc=
f; padding-left: 1ex;">Todays - just throw bad drive to recycle bin - it's =
not worth to do<br></blockquote>this silliness.<br><br>ok, i understand you=
r point of view. and thank you for the input.<br><br>but this applies to a =
world with endless ressources and when people can<br>afford the new hardwar=
e.<br><br>i think, with the same logic, you can designate some guy to be si=
lly ,<br>if he puts a patch on his bicycle inner tube instead<br>of buying =
a new one, as they are cheap. with the patch, the tube is<br>always worse t=
hen a new one. and he probably risks<br>his own health, because of using a =
tube which may already have gotten<br>porous...<br><br>but shouldn't we per=
haps leave it up to the end user / owner of the<br>hardware,&nbsp; to decid=
e when it's ready for the recycle bin ?<br><br>or should we perhaps wait fo=
r the next harddrive supply crisis (like in<br>2011)?&nbsp; then people sta=
rt to get more creative in using<br>what they have, because they have no ot=
her option...<br><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt=
 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> whenev=
er you want to create new arrangement for you disk with 'bad'<br></blockquo=
te>areas,<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex=
 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">you can always =
start from 'scratch' - since afterall - lvm2 ONLY<br></blockquote>manipulat=
es with metadata within disk front -<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-=
left: 1ex;">so if you need to create new 'holes',<br>just&nbsp;&nbsp; 'pvcr=
eate -f', vgcreate,&nbsp;&nbsp; and 'lvcreate -Zn -Wn'<br>and then&nbsp; 'l=
vextend'&nbsp; with normal&nbsp; or&nbsp; 'lvextend --type error | --type<b=
r></blockquote>zero' segment types around bad areas with specific size.<br>=
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; borde=
r-left: 1px solid #729fcf; padding-left: 1ex;">Once you are finished and yo=
ur LV precisely matches your 'previous'&nbsp;<br></blockquote>LV of you pas=
t VG - you can start to use this LV again with<br><blockquote class=3D"gmai=
l_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf=
; padding-left: 1ex;">new arrangement of&nbsp; 'broken zeroed/errored' area=
s.<br></blockquote><br>yes, i have already come to the conclusion, that it'=
s always better to<br>start from scratch like this. i dismissed the idea of=
<br>excluding or relocating bad sectors.<br><br><blockquote class=3D"gmail_=
quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; =
padding-left: 1ex;"> But good advice from me - whenever&nbsp; 'smartctl' st=
arts to show<br></blockquote>relocation block errors - it's the right momen=
t to&nbsp; 'dd_rescue'<br><blockquote class=3D"gmail_quote" style=3D"margin=
: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> a=
ny LV to your new drive...<br></blockquote><br>yes, i'm totally aware that =
we walk on very thin ice here.<br><br>but i'd really like to collect some r=
eal world data/information on how<br>good such disk "recycling" can probabl=
y work.&nbsp; i don't have<br>any pointers for such and did not find any in=
formation, on "how fast a<br>bad disk gets worse,&nbsp; if it has irretriev=
able bad sectors<br>and smart is reporting relocation errors. there seems n=
ot much<br>information around for this...<br><br>i guess such "broken" disk=
s being used with zfs in a redundant setup,<br>they could probable still se=
rve a purpose. maybe not<br>for production data, but probably good enough f=
or "not so important"<br>application.<br><br>it's a little bit academic pro=
ject. for my own fun. i like to fiddle<br>with disks, lvm, zfs and that stu=
ff....<br><br>roland<br><br>Am 12.04.23 um 12:20 schrieb Zdenek Kabelac:<br=
><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; bord=
er-left: 1px solid #729fcf; padding-left: 1ex;"> Dne 09. 04. 23 v 20:21 Rol=
and napsal(a):<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0p=
t 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left: 1ex;"><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1p=
x solid #8ae234; padding-left: 1ex;"> Well, if the LV is being used for any=
thing real, then I don't know of<br> anything where you could remove a bloc=
k in the middle and still have a<br> working fs.&nbsp;&nbsp; You can only r=
educe fs'es (the ones that you can reduce)<br></blockquote><br> my plan is =
to scan a disk for usable sectors and map the logical volume<br> around the=
 broken sectors.<br><br> whenever more sectors get broken, i'd like to remo=
ve the broken ones<br> to have<br> a usable lv without broken sectors.</blo=
ckquote><br><br> Reall silly plan&nbsp; - been there years back in time whe=
n drives were FAR<br> more expensive with the price per GiB.<br><br> Todays=
 - just throw bad drive to recycle bin - it's not worth to do<br> this sill=
iness.<br><br> HDD bad sectors are spreading - and slowly the surface gets =
destroyed....<br><br> So if you make large 'head-room' around bad disk area=
s - if they are<br> concentrated on some disk area - and you know topology =
of you disk drive<br> like i.e. 1% free disk space before and after bad are=
a - you could<br> possibly use disk for a little while more - but only to s=
tore<br> invaluable data....<br><br><br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-=
left: 1ex;"> since you need to rebuild your data anyway for that disk, you =
can also<br> recreate the whole logical volume.<br><br> my question and my =
project is a little bit academic. i'd simply want<br> to try<br> out how mu=
ch use you can have from some dead disks which are trash<br> otherwise...<b=
r></blockquote><br> You could always take&nbsp; 'vgcfgbackup'&nbsp; of lvm2=
 metadata and make some<br> crazy transition of if with even&nbsp; AWK/pyth=
on/perl&nbsp;&nbsp; -&nbsp; but we really<br> tend to support<br> just some=
 useful features - as there is already&nbsp; 'too much' and users<br> are g=
etting often lost.<br><br> One very simply &amp; naive implementation could=
 be going alonge this path -<br><br> whenever you want to create new arrang=
ement for you disk with 'bad'<br> areas,<br> you can always start from 'scr=
atch' - since afterall - lvm2 ONLY<br> manipulates with metadata within dis=
k front - so if you need to create<br> new 'holes',<br> just&nbsp;&nbsp; 'p=
vcreate -f', vgcreate,&nbsp;&nbsp; and 'lvcreate -Zn -Wn'<br> and then&nbsp=
; 'lvextend'&nbsp; with normal&nbsp; or&nbsp; 'lvextend --type error | --ty=
pe<br> zero' segment types around bad areas with specific size.<br> Once yo=
u are finished and your LV precisely matches your 'previous'&nbsp;<br> LV o=
f you past VG - you can start to use this LV again with new<br> arrangement=
 of&nbsp; 'broken zeroed/errored' areas.<br><br> I've some serious doubts a=
bout usability of this with any filesystem<br> :) but if you think this has=
 some added value - fell free to use.<br> If the drive you play with would =
be 'discardable' (SSD/NVMe) then one<br> must take extra care there is no '=
discard/TRIM' anywhere in the<br> process - as that would lose all data irr=
ecoverably....<br><br> But good advice from me - whenever&nbsp; 'smartctl' =
starts to show<br> relocation block errors - it's the right moment to&nbsp;=
 'dd_rescue' any LV<br> to your new drive...<br><blockquote class=3D"gmail_=
quote" style=3D"margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; =
padding-left: 1ex;"><br> yes, pvmove is the other approach for that.<br><br=
> but will pvmove continue/finish by all means when moving extents<br> loca=
ted on a<br> bad sector ?<br></blockquote><br> pvmove&nbsp; CANNOT be used =
with bad drives - it cannot deal with erroring<br> sectors and basically ge=
ts stuck there trying to mirror unrecoverable<br> disk areas...<br><br> Reg=
ards<br><br> Zdenek</blockquote><br><br><br><br><hr><br>linux-lvm mailing l=
ist<br>linux-lvm@redhat.com<br><a href=3D"https://listman.redhat.com/mailma=
n/listinfo/linux-lvm">https://listman.redhat.com/mailman/listinfo/linux-lvm=
</a><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO">=
http://tldp.org/HOWTO/LVM-HOWTO</a>/<br></pre></blockquote></div></body></h=
tml>
------U9REFNE11PUVPXHGU3AQPPHZNXJXM9--

--===============0467467529010093579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0467467529010093579==--

