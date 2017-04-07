Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BAC587448
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 08:19:27 +0000 (UTC)
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05379C0010A8
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 08:19:26 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id c55so22518601wrc.3
	for <linux-lvm@redhat.com>; Fri, 07 Apr 2017 01:19:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Fri, 7 Apr 2017 04:19:24 -0400
Message-ID: <CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1146790c88f371054c8f480c
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

--001a1146790c88f371054c8f480c
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 6, 2017 at 10:31 AM, Gionatan Danti <g.danti@assyoma.it> wrote:

> I'm seeking some advice for a new virtualization system (KVM) on top of
> LVM. The goal is to take agentless backups via LVM snapshots.
>
> In short: what you suggest to snapshot a quite big (8+ TB) volume? Classic
> LVM (with old snapshot behavior) or thinlvm (and its new snapshot method)?
>

I found classic LVM snapshots to suffer terrible performance. I switched to
BTRFS as a result, until LVM thin pools became a real thing, and I happily
switched back.

I expect this depends on exactly what access patterns you have, how many
accesses will happen during the time the snapshot is held, and whether you
are using spindles or flash. Still, even with some attempt to be objective
and critical... I think I would basically never use classic LVM snapshots
for any purpose, ever.


-- 
Mark Mielke <mark.mielke@gmail.com>

--001a1146790c88f371054c8f480c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Apr 6, 2017 at 10:31 AM, Gionatan Danti <span dir=3D"ltr">&lt;<a href=
=3D"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assyoma.it</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m=
 seeking some advice for a new virtualization system (KVM) on top of LVM. T=
he goal is to take agentless backups via LVM snapshots.<br>
<br>
In short: what you suggest to snapshot a quite big (8+ TB) volume? Classic =
LVM (with old snapshot behavior) or thinlvm (and its new snapshot method)?<=
br></blockquote><div><br></div>I found classic LVM snapshots to suffer terr=
ible performance. I switched to BTRFS as a result, until LVM thin pools bec=
ame a real thing, and I happily switched back.</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">I expect this depends on exactly w=
hat access patterns you have, how many accesses will happen during the time=
 the snapshot is held, and whether you are using spindles or flash. Still, =
even with some attempt to be objective and critical... I think I would basi=
cally never use classic LVM snapshots for any purpose, ever.</div><br clear=
=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature">Mark Mielke &=
lt;<a href=3D"mailto:mark.mielke@gmail.com" target=3D"_blank">mark.mielke@g=
mail.com</a>&gt;<br><br></div>
</div></div>

--001a1146790c88f371054c8f480c--
