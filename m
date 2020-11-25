Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D56D2166B2A
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 08:46:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35B74811E85
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 08:46:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id v14so2025096lfo.3
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 00:46:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
	<20201123130412.GB2229389@localhost.localdomain>
	<CAMaziXsh55b9VNgq40nVJwoFtD774_5i=JEiNZZOrdKpJsWQ_A@mail.gmail.com>
In-Reply-To: <CAMaziXsh55b9VNgq40nVJwoFtD774_5i=JEiNZZOrdKpJsWQ_A@mail.gmail.com>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 14:16:35 +0530
Message-ID: <CAMaziXtkemFjnvDtvXbknW35C_vxHtA1GRntV1sSRrupMvyJxw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ade6a405b4ea77dc"
Subject: Re: [linux-lvm] What is the use of thin snapshots if the external
 origin cannot be set to writable ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--000000000000ade6a405b4ea77dc
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 5:29 PM Sreyan Chakravarty <sreyan32@gmail.com>
wrote:

> Do I have to reinstall my system for thin snapshots ?
>
> Can't I just clone my filesystem and then create a thin pool ?
>
>>
>
>
Used partclone to restore my backup.

Did not have re-install but did have to delete old volumes.
-- 
Regards,
Sreyan Chakravarty

--000000000000ade6a405b4ea77dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 5:29 PM Sreya=
n Chakravarty &lt;<a href=3D"mailto:sreyan32@gmail.com">sreyan32@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr">Do I have to reinstall my system for thin =
snapshots=C2=A0?=C2=A0<br></div><div class=3D"gmail_quote"><div><br></div><=
div>Can&#39;t I just clone my filesystem and then create a thin pool ?</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote></div=
></div></blockquote><div><br></div><div>Used partclone to restore my backup=
.</div><div><br></div><div>Did not have re-install but did have to delete o=
ld volumes.=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</div></div></div></div=
>

--000000000000ade6a405b4ea77dc--
