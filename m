Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CFB210021B1
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2019 15:06:23 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEED283F4C
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2019 15:06:20 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id x23so5072905oix.3
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2019 07:06:20 -0800 (PST)
MIME-Version: 1.0
References: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
	<CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
In-Reply-To: <CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Thu, 24 Jan 2019 23:06:08 +0800
Message-ID: <CAKM4Aezaxa-mFDbyq2uDvZZUM2xgi6GyGAHoQaeWnUn9JExcFw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008bc8ef0580358d1f"
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

--0000000000008bc8ef0580358d1f
Content-Type: text/plain; charset="UTF-8"

Hi,

With single command to create thin-pool, the metadata LV is not created
> with striped
> target. Is this designed on purpose, or just the command doesn't handle
> this case very
> well for now?
>
> My main concern here is, if the metadata LV use stripped target, can
> thin_check/thin_repair tools work fine?
>

In our use scenario, we want to use DM thinp for a lot of containers as
rootfs. The container use heavy on snapshots,
so above 4K thin/snapshots LVs may share the thin pool concurrently.

This may make the space fragmented. So, another concern is, will using
striped thinp make
fragmentation much more worse?

Thanks!
Eric

--0000000000008bc8ef0580358d1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div>Hi,</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Wi=
th single command to create thin-pool, the metadata LV is not created with =
striped</div><div>target. Is this designed on purpose, or just the command =
doesn&#39;t handle this case very</div><div>well for now?</div><div><br></d=
iv><div>My main concern here is, if the metadata LV use stripped target, ca=
n thin_check/thin_repair tools work fine?=C2=A0</div></div></div>
</blockquote></div><div><br></div><div>In our use scenario, we want to use =
DM thinp for a lot of containers as rootfs. The container use heavy on snap=
shots,</div><div>so above 4K thin/snapshots LVs may share the thin pool con=
currently.</div><div><br></div><div>This may make the space fragmented. So,=
 another concern is, will using striped thinp make</div><div>fragmentation =
much more worse?<br></div><div><br></div><div>Thanks!</div><div>Eric</div><=
/div></div></div></div>

--0000000000008bc8ef0580358d1f--
