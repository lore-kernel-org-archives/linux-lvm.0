Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A333F5B6A7
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2019 03:36:17 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F43ABB14
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2019 03:36:16 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id k98so10440478otk.3
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2019 19:36:16 -0800 (PST)
MIME-Version: 1.0
References: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
	<CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
	<CAKM4Aezaxa-mFDbyq2uDvZZUM2xgi6GyGAHoQaeWnUn9JExcFw@mail.gmail.com>
	<3d9fcd41-46df-aa71-7be9-f2258b7598e5@gmail.com>
In-Reply-To: <3d9fcd41-46df-aa71-7be9-f2258b7598e5@gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Sat, 26 Jan 2019 11:36:04 +0800
Message-ID: <CAKM4AewHtiKW56pwMt=xRPKPXb5pECOAoMU=kDJXAdYmdf2Gtw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000057f2c70580542505"
Subject: Re: [linux-lvm] Question about thin-pool/thin LV with stripes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--00000000000057f2c70580542505
Content-Type: text/plain; charset="UTF-8"

Hi Zdenek,

When 'stripe_size' is the 'right size' - striped device should appear
> faster,
> but telling you what's the best size is some sort of 'black magic'  :)
>
> Basically - strip size should match boundaries of thin-pool chunk sizes.
>
> i.e. for thin-pool with 128K chunksize -  and 2 disks -
> I'd assume best result you should get with 64K stripesize (so 2 disks will
> make it 128K stripe)  - but it depends on number of hw aspects.
>
> So you will need to benchmark it.
>

 Thanks a lot for your input! Very helpful points to take more
consideration~

Best regards,
Eric

--00000000000057f2c70580542505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=C2=A0Zdenek,</di=
v><div><br></div></div></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
When &#39;stripe_size&#39; is the &#39;right size&#39; - striped device sho=
uld appear faster,<br>
but telling you what&#39;s the best size is some sort of &#39;black magic&#=
39;=C2=A0 :)<br>
<br>
Basically - strip size should match boundaries of thin-pool chunk sizes.<br=
>
<br>
i.e. for thin-pool with 128K chunksize -=C2=A0 and 2 disks -<br>
I&#39;d assume best result you should get with 64K stripesize (so 2 disks w=
ill <br>
make it 128K stripe)=C2=A0 - but it depends on number of hw aspects.<br>
<br>
So you will need to benchmark it.<br></blockquote><div><br></div><div>=C2=
=A0Thanks a lot for your input! Very helpful points to take more considerat=
ion~</div><div><br></div><div>Best regards,</div><div>Eric</div></div></div=
>

--00000000000057f2c70580542505--
