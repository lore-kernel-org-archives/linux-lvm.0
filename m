Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7F92026D25
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 11:57:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5BCF103B80A
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 11:57:37 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id b8so3540225ila.13
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 03:57:34 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
	<CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
	<20201123131321.GC2229389@localhost.localdomain>
In-Reply-To: <20201123131321.GC2229389@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Tue, 24 Nov 2020 17:27:21 +0530
Message-ID: <CAMaziXvoqVUOD=iAks4x9bhOxeZCNcGcT6mJwaJCUEk29AoTOw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000020df1605b4d904d6"
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

--00000000000020df1605b4d904d6
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 6:43 PM Bryn M. Reeves <bmr@redhat.com> wrote:

> This is a classic (aka CoW/copy-on-write or "thick") snapshot since it
> was created with a size (-L 70GB). When creating a thin snapshot you do
> not specify a size for the snapshot LV - it consumes space from the
> associated thin pool as needed.
>
> Generally you can find information about the LVs on your system using
> the "lvs" command. The "Attr" field displays lv attributes including the
> volume type - see the NOTES section of 'man lvs' for the meaning of the
> values. The lvs report can also show you whether a snapshot is using CoW
> or thinp and the amount of data it is consuming.
>

I have now migrated to thin snapshots:

These are my logical volumes:

#  lvs

 LV     VG       Attr       LSize   Pool   Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  fedora vgfedora Vwi-a-tz-- 700.00g pool00        16.61

  pool00 vgfedora twi-aotz-- 929.75g               12.50  16.61



But I am unable to boot now due to these errors:

Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[861]: Scanning
devices dm-0  for LVM logical volumes vgfedora/fedora
Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive
'/dev/vgfedora/pool00' [929.75 GiB] inherit
Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive
'/dev/vgfedora/fedora' [700.00 GiB] inherit
Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: modprobe:
FATAL: Module dm-thin-pool not found in directory
/lib/modules/5.8.18-200.fc32.x86_64
Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]:
/usr/sbin/modprobe failed: 1
Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: Can't process
LV vgfedora/fedora: thin target support missing from kernel?

I have tried to mark the volumes as active by :

                lvchange -kn vgfedora/pool00
                lvchange -kn vgfedora/fedora

But no change.



How do I add the dm-thin-pool module ? I can't even boot.

-- 
Regards,
Sreyan Chakravarty

--00000000000020df1605b4d904d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23, 2020 at 6:43 PM Bryn =
M. Reeves &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is a cla=
ssic (aka CoW/copy-on-write or &quot;thick&quot;) snapshot since it<br>
was created with a size (-L 70GB). When creating a thin snapshot you do<br>
not specify a size for the snapshot LV - it consumes space from the<br>
associated thin pool as needed.<br>
<br>
Generally you can find information about the LVs on your system using<br>
the &quot;lvs&quot; command. The &quot;Attr&quot; field displays lv attribu=
tes including the<br>
volume type - see the NOTES section of &#39;man lvs&#39; for the meaning of=
 the<br>
values. The lvs report can also show you whether a snapshot is using CoW<br=
>
or thinp and the amount of data it is consuming.<br></blockquote><div><br><=
/div><div>I have now migrated to thin snapshots:</div><div><br></div><div>T=
hese are my logical volumes:</div><div><br></div><div>#=C2=A0 lvs</div><div=
><br></div><div>=C2=A0LV =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =C2=A0 Attr =C2=A0 =
=C2=A0 =C2=A0 LSize =C2=A0 Pool =C2=A0 Origin Data% =C2=A0Meta% =C2=A0Move =
Log Cpy%Sync Convert<br>=C2=A0 fedora vgfedora Vwi-a-tz-- 700.00g pool00 =
=C2=A0 =C2=A0 =C2=A0 =C2=A016.61 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br></div><div>=C2=A0 pool00 vgfedora twi-aotz-- 929.75g =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12.50 =C2=A016.61=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0</div><div><br></div><div><br></div><div>But I am unable to boot now due=
 to these errors:</div><div><br></div>Nov 24 10:44:00 localhost.HPNotebook =
dracut-initqueue[861]: Scanning devices dm-0 =C2=A0for LVM logical volumes =
vgfedora/fedora<br>Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[88=
6]: inactive &#39;/dev/vgfedora/pool00&#39; [929.75 GiB] inherit<br>Nov 24 =
10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive &#39;/dev/vgf=
edora/fedora&#39; [700.00 GiB] inherit<br>Nov 24 10:44:00 localhost.HPNoteb=
ook dracut-initqueue[888]: modprobe: FATAL: Module dm-thin-pool not found i=
n directory /lib/modules/5.8.18-200.fc32.x86_64<br>Nov 24 10:44:00 localhos=
t.HPNotebook dracut-initqueue[888]: /usr/sbin/modprobe failed: 1<br><div>No=
v 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: Can&#39;t process=
 LV vgfedora/fedora: thin target support missing from kernel?</div><div><br=
></div><div>I have tried to mark the volumes as active by :</div><div><br><=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvchange =
-kn vgfedora/pool00</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lvchange -kn vgfedora/fedora</div><div><br></div><div>But no cha=
nge.</div><div><br></div><div><br></div><div><br></div><div>How do I add th=
e=20

dm-thin-pool module ? I can&#39;t even boot.</div></div><div><br></div><div=
>--=C2=A0<br></div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Sreyan Chakravarty</div></div></div></div>

--00000000000020df1605b4d904d6--
