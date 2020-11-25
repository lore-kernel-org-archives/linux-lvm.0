Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60AEF2166B29
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 08:45:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17A47800B3B
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 08:45:49 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id y7so1405984lji.8
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 00:45:45 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
	<CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
	<20201123131321.GC2229389@localhost.localdomain>
	<CAMaziXvoqVUOD=iAks4x9bhOxeZCNcGcT6mJwaJCUEk29AoTOw@mail.gmail.com>
In-Reply-To: <CAMaziXvoqVUOD=iAks4x9bhOxeZCNcGcT6mJwaJCUEk29AoTOw@mail.gmail.com>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 14:15:33 +0530
Message-ID: <CAMaziXva=5j1F_x--HCB16jNm57Ncu_1Dq+nA67ev=tDQnpceA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f3c7f905b4ea7326"
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
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

--000000000000f3c7f905b4ea7326
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 5:27 PM Sreyan Chakravarty <sreyan32@gmail.com>
wrote:

>
> But I am unable to boot now due to these errors:
>
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[861]: Scanning
> devices dm-0  for LVM logical volumes vgfedora/fedora
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive
> '/dev/vgfedora/pool00' [929.75 GiB] inherit
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive
> '/dev/vgfedora/fedora' [700.00 GiB] inherit
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: modprobe:
> FATAL: Module dm-thin-pool not found in directory
> /lib/modules/5.8.18-200.fc32.x86_64
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]:
> /usr/sbin/modprobe failed: 1
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: Can't process
> LV vgfedora/fedora: thin target support missing from kernel?
>
> I have tried to mark the volumes as active by :
>
>                 lvchange -kn vgfedora/pool00
>                 lvchange -kn vgfedora/fedora
>
> But no change.
>
>
>
> How do I add the dm-thin-pool module ? I can't even boot.
>
>
Never mind, I have solved it by regenerating my initramfs.
-- 
Regards,
Sreyan Chakravarty

--000000000000f3c7f905b4ea7326
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 5:27 PM Sreya=
n Chakravarty &lt;<a href=3D"mailto:sreyan32@gmail.com">sreyan32@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div>=
But I am unable to boot now due to these errors:</div><div><br></div>Nov 24=
 10:44:00 localhost.HPNotebook dracut-initqueue[861]: Scanning devices dm-0=
 =C2=A0for LVM logical volumes vgfedora/fedora<br>Nov 24 10:44:00 localhost=
.HPNotebook dracut-initqueue[886]: inactive &#39;/dev/vgfedora/pool00&#39; =
[929.75 GiB] inherit<br>Nov 24 10:44:00 localhost.HPNotebook dracut-initque=
ue[886]: inactive &#39;/dev/vgfedora/fedora&#39; [700.00 GiB] inherit<br>No=
v 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: modprobe: FATAL: =
Module dm-thin-pool not found in directory /lib/modules/5.8.18-200.fc32.x86=
_64<br>Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: /usr/sbi=
n/modprobe failed: 1<br><div>Nov 24 10:44:00 localhost.HPNotebook dracut-in=
itqueue[888]: Can&#39;t process LV vgfedora/fedora: thin target support mis=
sing from kernel?</div><div><br></div><div>I have tried to mark the volumes=
 as active by :</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 lvchange -kn vgfedora/pool00</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvchange -kn vgfedora/fedora</div=
><div><br></div><div>But no change.</div><div><br></div><div><br></div><div=
><br></div><div>How do I add the=20

dm-thin-pool module ? I can&#39;t even boot.</div></div><div><br></div></di=
v></blockquote><div><br></div><div>Never mind, I have solved it by regenera=
ting my initramfs.=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</div></div></di=
v></div>

--000000000000f3c7f905b4ea7326--
