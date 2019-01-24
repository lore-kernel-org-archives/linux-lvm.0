Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43CE0672EE
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2019 14:54:56 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 875CA356FE
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2019 14:54:45 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id i6so5021990oia.6
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2019 06:54:45 -0800 (PST)
MIME-Version: 1.0
References: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
In-Reply-To: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Thu, 24 Jan 2019 22:54:32 +0800
Message-ID: <CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000016482805803564c3"
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
To: linux-lvm@redhat.com

--00000000000016482805803564c3
Content-Type: text/plain; charset="UTF-8"

Hi,

As you can see, only "mythinpool_tdata" LV has 2 stripes. Is that OK?
> If I want to benefit performance from stripes, will it works for me? Or,
> should I create dataLV, metadata LV, thinpool and thin LV using
> step-by-step way
> and specify "--stripes 2" in every steps?
>

With single command to create thin-pool, the metadata LV is not created
with striped
target. Is this designed on purpose, or just the command doesn't handle
this case very
well for now?

My main concern here is, if the metadata LV use stripped target, can
thin_check/thin_repair tools work fine?


>
> Besides, is there anything I should take care of to extend the
> VG/thin-pool with *striped thin-LV*
> when out of space?
>

In this case, I should always vgextend the VG with 2 PVs, because thin pool
will find the half-of-extending-size
of free space on 2 seperate PVs for striping. If just adding one PV, the
free space in VG cannot be used
to extend the 2-striped thin-pool.

Thanks,
Eric

--00000000000016482805803564c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>As you can see, only &quot;=
mythinpool_tdata&quot; LV has 2 stripes. Is that OK?<br></div><div>If I wan=
t to benefit performance from stripes, will it works for me? Or,</div><div>=
should I create dataLV, metadata LV, thinpool and thin LV using step-by-ste=
p way</div><div>and specify &quot;--stripes 2&quot; in every steps?</div></=
div></div></div></div></blockquote><div><br></div><div>With single command =
to create thin-pool, the metadata LV is not created with striped</div><div>=
target. Is this designed on purpose, or just the command doesn&#39;t handle=
 this case very</div><div>well for now?</div><div><br></div><div>My main co=
ncern here is, if the metadata LV use stripped target, can thin_check/thin_=
repair tools work fine?</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div><br></div><div>Besides, is there anything I should take =
care of to extend the VG/thin-pool with *striped thin-LV*</div><div>when ou=
t of space?</div></div></div></div></div></blockquote><div><br></div><div>I=
n this case, I should always vgextend the VG with 2 PVs, because thin pool =
will find the half-of-extending-size</div><div>of free space on 2 seperate =
PVs for striping. If just adding one PV, the free space in VG cannot be use=
d</div><div>to extend the 2-striped thin-pool.</div><div><br></div><div>Tha=
nks,</div><div>Eric</div><div>=C2=A0</div></div></div>

--00000000000016482805803564c3--
