Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B607F30B84
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 11:59:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9646F811E85
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 11:59:51 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id s10so21666791ioe.1
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 03:59:48 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
	<20201123130412.GB2229389@localhost.localdomain>
In-Reply-To: <20201123130412.GB2229389@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Tue, 24 Nov 2020 17:29:36 +0530
Message-ID: <CAMaziXsh55b9VNgq40nVJwoFtD774_5i=JEiNZZOrdKpJsWQ_A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000019627905b4d90cb2"
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

--00000000000019627905b4d90cb2
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 6:34 PM Bryn M. Reeves <bmr@redhat.com> wrote:

> OK - I understand what's going on in your environment now, thanks!
>
> Unfortunately it's not possible to have a writable external origin when
> using device-mapper thin provisioned snapshots. To be able to write to
> the origin while snapshots exist the origin device must also be a thin
> provisioned logical volume.
>
> This is explained in more detail in the kernel documentation for the
> thin provisioning targets.
>
> Documentation/admin-guide/device-mapper/thin-provisioning.rst:
>
>     External snapshots
>     ------------------
>
>     You can use an external **read only** device as an origin for a
>     thinly-provisioned volume.  Any read to an unprovisioned area of the
>     thin device will be passed through to the origin.  Writes trigger
>     the allocation of new blocks as usual.
>
>     One use case for this is VM hosts that want to run guests on
>     thinly-provisioned volumes but have the base image on another device
>     (possibly shared between many VMs).
>
>     You must not write to the origin device if you use this technique!
>     Of course, you may write to the thin device and take internal snapshots
>     of the thin volume.
>
> This allows a few niche use cases (like the VM example given), but it's
> not the conventional way of using snapshots with thinp and it does
> restrict what you can do.
>
> This means that to use thinp snapshots most effectively you must set the
> system up with a thin pool from the start (e.g. using the distro's
> installer to set up the VG).
>
> >             Command on LV vgfedora/fedora uses options that are invalid
> > with LV parameters: lv_is_external_origin.
>
> This is correct: currently you cannot make the origin writable since it
> is an external snapshot.
>
> There is some work going on at the moment that would make device-mapper
> type features more flexible and available in other device types, but
> with the features provided by current tools and the thinp kernel
> support you need to use a thinp device for the snapshot origin too.
>
> > Is there some sort of resolution ?
>
> It means re-installing but if the system is set up to use a thin pool
> and thin provisioned logical volumes from the start then you can use
> snapshots without any of the limitations that you've bumped into with
> external origin devices.


Do I have to reinstall my system for thin snapshots ?

Can't I just clone my filesystem and then create a thin pool ?

>
>


-- 
Regards,
Sreyan Chakravarty

--00000000000019627905b4d90cb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23, 2020 at 6:34 PM Bryn =
M. Reeves &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">OK - I unders=
tand what&#39;s going on in your environment now, thanks!<br>
<br>
Unfortunately it&#39;s not possible to have a writable external origin when=
<br>
using device-mapper thin provisioned snapshots. To be able to write to<br>
the origin while snapshots exist the origin device must also be a thin<br>
provisioned logical volume.<br>
<br>
This is explained in more detail in the kernel documentation for the<br>
thin provisioning targets.<br>
<br>
Documentation/admin-guide/device-mapper/thin-provisioning.rst:<br>
<br>
=C2=A0 =C2=A0 External snapshots<br>
=C2=A0 =C2=A0 ------------------<br>
<br>
=C2=A0 =C2=A0 You can use an external **read only** device as an origin for=
 a<br>
=C2=A0 =C2=A0 thinly-provisioned volume.=C2=A0 Any read to an unprovisioned=
 area of the<br>
=C2=A0 =C2=A0 thin device will be passed through to the origin.=C2=A0 Write=
s trigger<br>
=C2=A0 =C2=A0 the allocation of new blocks as usual.<br>
<br>
=C2=A0 =C2=A0 One use case for this is VM hosts that want to run guests on<=
br>
=C2=A0 =C2=A0 thinly-provisioned volumes but have the base image on another=
 device<br>
=C2=A0 =C2=A0 (possibly shared between many VMs).<br>
<br>
=C2=A0 =C2=A0 You must not write to the origin device if you use this techn=
ique!<br>
=C2=A0 =C2=A0 Of course, you may write to the thin device and take internal=
 snapshots<br>
=C2=A0 =C2=A0 of the thin volume.<br>
<br>
This allows a few niche use cases (like the VM example given), but it&#39;s=
<br>
not the conventional way of using snapshots with thinp and it does<br>
restrict what you can do.<br>
<br>
This means that to use thinp snapshots most effectively you must set the<br=
>
system up with a thin pool from the start (e.g. using the distro&#39;s<br>
installer to set up the VG).<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Command on LV vgfedora/=
fedora uses options that are invalid<br>
&gt; with LV parameters: lv_is_external_origin.<br>
<br>
This is correct: currently you cannot make the origin writable since it<br>
is an external snapshot.<br>
<br>
There is some work going on at the moment that would make device-mapper<br>
type features more flexible and available in other device types, but<br>
with the features provided by current tools and the thinp kernel<br>
support you need to use a thinp device for the snapshot origin too.<br>
<br>
&gt; Is there some sort of resolution ?<br>
<br>
It means re-installing but if the system is set up to use a thin pool<br>
and thin provisioned logical volumes from the start then you can use<br>
snapshots without any of the limitations that you&#39;ve bumped into with<b=
r>
external origin devices.</blockquote><div><br></div><div>Do I have to reins=
tall my system for thin snapshots=C2=A0?=C2=A0</div><div><br></div><div>Can=
&#39;t I just clone my filesystem and then create a thin pool ?</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockquote></div><b=
r clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</div></div></div></d=
iv>

--00000000000019627905b4d90cb2--
