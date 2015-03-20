Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2KEDJYq008758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 10:13:19 -0400
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mx1.redhat.com (Postfix) with ESMTPS id D27A6B0418
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 14:13:18 +0000 (UTC)
Received: by iedm5 with SMTP id m5so29161209ied.3
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 07:13:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <550BDABE.3060005@redhat.com>
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
	<54743766.7020502@redhat.com>
	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>
	<5474933E.8070007@redhat.com>
	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>
	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>
	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
	<CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
	<550B1E2D.2030206@gathman.org> <550BDABE.3060005@redhat.com>
Date: Fri, 20 Mar 2015 15:13:18 +0100
Message-ID: <CAE8gLhmo_MfwEsPjVDycRP7m575C-X5K6Dgo91NnDA_uePTeBQ@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bd74a30045e9b0511b8eb75
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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

--047d7bd74a30045e9b0511b8eb75
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2015-03-20 9:30 GMT+01:00 Zdenek Kabelac <zkabelac@redhat.com>:

> This problem with old snaps basically cannot be fixed unless there would
> be a completely different new snapshot target ;)
>

I understand this is a by-design feature of LVM snapshots, and I accept it
as is. The problem for me is not the long activation time, but the fact
that initrd stops waiting for the full activation to complete. It gives up
and kills the vgchange process.

I understand initrd behaviour may be distro-specific.


So the advised fix for long term snapshot is to switch to use thin-pool.
>
> Here you will have all the goodies - very fast and efficient snapshots,
> you could easily take snapshot of snapshot and you could also select if y=
ou
> want to have snapshot activated or not (and by default it's skipped from
> activation).
>

Well, thin pools seem nice, but I don't see them being matured enough for
production use. For example, basic VG management like reducing or splitting
a VG failed for me when a thin pool was present in the VG, even if the
split would have not affected the thin pool itself. I also failed to get
rid of missing PVs when a thin pool would have been affected =E2=80=93 whil=
e
=E2=80=9Evgreduce --removemissing --force=E2=80=9D promises to remove affec=
ted LVs, it
couldn't get rid of the thin pool. When I posted a thread about the issue
here, no one bothered to answer.
(It is here:
https://www.redhat.com/archives/linux-lvm/2015-March/msg00001.html)

Also, as far as I know, thin snapshots can only be created of thin LVs
residing in the same thin pool. That means, you can't make a thin snapshot
of any LV, and one shouldn't keep critical LVs (e.g. root FS) in thin pools=
.

--047d7bd74a30045e9b0511b8eb75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2015=
-03-20 9:30 GMT+01:00 Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span>=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
This problem with old snaps basically cannot be fixed unless there would be=
 a completely different new snapshot target ;)<br></blockquote><div><br></d=
iv><div>I understand this is a by-design feature of LVM snapshots, and I ac=
cept it as is. The problem for me is not the long activation time, but the =
fact that initrd stops waiting for the full activation to complete. It give=
s up and kills the vgchange process.<br><br></div><div>I understand initrd =
behaviour may be distro-specific.<br></div><div><br><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">

So the advised fix for long term snapshot is to switch to use thin-pool.<br=
>
<br>
Here you will have all the goodies - very fast and efficient snapshots, you=
 could easily take snapshot of snapshot and you could also select if you wa=
nt to have snapshot activated or not (and by default it&#39;s skipped from =
activation).<br></blockquote><div><br></div><div>Well, thin pools seem nice=
, but I don&#39;t see them being matured enough for production use. For exa=
mple, basic VG management like reducing or splitting a VG failed for me whe=
n a thin pool was present in the VG, even if the split would have not affec=
ted the thin pool itself. I also failed to get rid of missing PVs when a th=
in pool would have been affected =E2=80=93 while =E2=80=9Evgreduce --remove=
missing --force=E2=80=9D promises to remove affected LVs, it couldn&#39;t g=
et rid of the thin pool.<span></span> When I posted a thread about the issu=
e here, no one bothered to answer.<br>(It is here: <a href=3D"https://www.r=
edhat.com/archives/linux-lvm/2015-March/msg00001.html">https://www.redhat.c=
om/archives/linux-lvm/2015-March/msg00001.html</a>)<br><br></div><div>Also,=
 as far as I know, thin snapshots can only be created of thin LVs residing =
in the same thin pool. That means, you can&#39;t make a thin snapshot of an=
y LV, and one shouldn&#39;t keep critical LVs (e.g. root FS) in thin pools.=
<br></div></div></div></div>

--047d7bd74a30045e9b0511b8eb75--
