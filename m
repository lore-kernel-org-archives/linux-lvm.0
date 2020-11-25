Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 061B91004145
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 08:54:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 062F5858EEC
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 08:54:44 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id b17so1419237ljf.12
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 00:54:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXssM=DVD1qLEhqmVpZmepn-GpA2KgGm8BcDuthbtM+gQQ@mail.gmail.com>
In-Reply-To: <CAMaziXssM=DVD1qLEhqmVpZmepn-GpA2KgGm8BcDuthbtM+gQQ@mail.gmail.com>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 14:24:27 +0530
Message-ID: <CAMaziXu-cbjHntSZzCwDKWdPPgz8_x_mRYmhhJ1hEqsR9XpXvw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d1d2e305b4ea9341"
Subject: Re: [linux-lvm] System bricked after moving to thin snapshots
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

--000000000000d1d2e305b4ea9341
Content-Type: text/plain; charset="UTF-8"

Never mind.

Had to regenerate my initramfs.

On Tue, Nov 24, 2020 at 5:34 PM Sreyan Chakravarty <sreyan32@gmail.com>
wrote:

> Hi,
>
> I have cloned my original root LVM, and then migrated to the newer thin
> LVMs using partclone.
>
> Both backup and restore went off without causing any problems.
>
> But when I am now trying to boot into my system, it asks for the
> encryption LUKS passphrase but after that I am getting:
>
>               dracut-initqueue[300]: Warning: dracut-initqueue timeout  -
> starting timeout scripts
>
> This are my current logical volumes:
>
> #  lvs
>
>  LV     VG       Attr       LSize   Pool   Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>   fedora vgfedora Vwi-a-tz-- 700.00g pool00        16.61
>
>   pool00 vgfedora twi-aotz-- 929.75g               12.50  16.61
>
>
> I keep getting the error:
>
> Scanning devices dm-0  for LVM logical volumes vgfedora/fedora
> inactive '/dev/vgfedora/pool00' [929.75 GiB] inherit
> inactive '/dev/vgfedora/fedora' [700.00 GiB] inherit
>  modprobe: FATAL: Module dm-thin-pool not found in directory
> /lib/modules/5.8.18-200.fc32.x86_64
> /usr/sbin/modprobe failed: 1
> Can't process LV vgfedora/fedora: thin target support missing from kernel?
>
> I have marked the logical volumes as active via :
>           lvchange -kn vgfedora/pool00
>           lvchange -kn vgfedora/fedora
>
> How can I add the dm-thin-pool module ? I can't even boot.
>
> Please let me know if any other info is required from my side.
>
> Need some help as I am unable to use my laptop.
>
> --
> Regards,
> Sreyan Chakravarty
>


-- 
Regards,
Sreyan Chakravarty

--000000000000d1d2e305b4ea9341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Never mind.<div><br></div><div>Had to regenerate my initra=
mfs.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Nov 24, 2020 at 5:34 PM Sreyan Chakravarty &lt;<a href=3D=
"mailto:sreyan32@gmail.com">sreyan32@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,</di=
v><div><br></div><div>I have cloned my original root LVM, and then migrated=
 to the newer thin LVMs using partclone.</div><div><br></div><div>Both back=
up and restore went off without causing any problems.<br></div><div><br></d=
iv><div>But when I am now trying to boot into my system, it asks for the en=
cryption LUKS passphrase but after that I am getting:</div><div><br></div><=
div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dracut-initqueue[300]: Warning: dracut-initqueue timeout=C2=A0 -=
=C2=A0 starting timeout scripts</div><div><br></div><div>This are my curren=
t logical volumes:</div><div><br></div><div>#=C2=A0 lvs</div><div><br></div=
><div>=C2=A0LV =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =C2=A0 Attr =C2=A0 =C2=A0 =C2=
=A0 LSize =C2=A0 Pool =C2=A0 Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy%Sy=
nc Convert<br>=C2=A0 fedora vgfedora Vwi-a-tz-- 700.00g pool00 =C2=A0 =C2=
=A0 =C2=A0 =C2=A016.61 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=
=A0 pool00 vgfedora twi-aotz-- 929.75g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 12.50 =C2=A016.61=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div><br></div=
><div>I keep getting the error:</div><div><br></div><div>Scanning devices d=
m-0 =C2=A0for LVM logical volumes vgfedora/fedora<br>inactive &#39;/dev/vgf=
edora/pool00&#39; [929.75 GiB] inherit<br>inactive &#39;/dev/vgfedora/fedor=
a&#39; [700.00 GiB] inherit<br>=C2=A0modprobe: FATAL: Module dm-thin-pool n=
ot found in directory /lib/modules/5.8.18-200.fc32.x86_64<br>/usr/sbin/modp=
robe failed: 1<br>Can&#39;t process LV vgfedora/fedora: thin target support=
 missing from kernel?<br></div><div><br></div><div>I have marked the logica=
l volumes as active via :</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvch=
ange -kn vgfedora/pool00</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvcha=
nge -kn vgfedora/fedora</div><div><br></div><div>How can I add the dm-thin-=
pool module ? I can&#39;t even boot.</div><div><br></div><div>Please let me=
 know if any other info is required from my side.</div><div><br></div><div>=
Need some help as I am unable to use my laptop.</div><div><br></div>-- <br>=
<div dir=3D"ltr"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</div></di=
v></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty=
</div></div></div>

--000000000000d1d2e305b4ea9341--
