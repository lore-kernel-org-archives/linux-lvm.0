Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A338419C7F
	for <linux-lvm@redhat.com>; Sun, 20 Oct 2019 03:03:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49D5F308212F
	for <linux-lvm@redhat.com>; Sun, 20 Oct 2019 03:03:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id y6so1179746lfj.2
	for <linux-lvm@redhat.com>; Sat, 19 Oct 2019 20:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJQbsSXOrNG+68VYcdoS2kfV=6tcsueyppCBr6dOSaL=Z3TmPA@mail.gmail.com>
In-Reply-To: <CAJQbsSXOrNG+68VYcdoS2kfV=6tcsueyppCBr6dOSaL=Z3TmPA@mail.gmail.com>
From: Udai Sharma <udai.sharma5@gmail.com>
Date: Sun, 20 Oct 2019 08:33:02 +0530
Message-ID: <CAJQbsSWp+HSk7bNHU0TRFrr7CRZofLNvSJc-Fu+ZBrgkBeQ80Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c23a0905954eceee"
Subject: [linux-lvm]  pvmove fails on VG,
 managed by PCS resource agent in HA-LVM mode(Active-Passive),
 with tagging enabled.
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

--000000000000c23a0905954eceee
Content-Type: text/plain; charset="UTF-8"

Hi,
pvmove seems to fail on VG, which is managed by PCS Resource agent with
'exclusive' activation enabled.

The volume group(VG) is created on a shared disk, with '--addtag test'
added.
Content of my lvm.conf is
#lvmconfig activation/volume_list
volume_list=["@test"]

I am able to create Logical volume over it, vgextend, vgremove everything
works fine.
When I tried to do pvmove, it fails with error that lvm cannot activate
vg0/pvmove0.

On probing little further, I found that when I create LVM PCS resource
agent with 'exclusive=true', it strips-off the original tag 'test'
and adds its own 'pacemaker' tag.
Since VG was stripped-off with original tag, I think, that is the reason of
pvmove is getting failed.

I am out-of ideas to debug this further. Need some expert advice/solution
to handle this situation.

Also, how to use lvmconfig utility to modify volume_list, without the need
manually update lvm.conf file?

-Udai

--000000000000c23a0905954eceee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Hi,=C2=A0<br></div><div dir=3D"ltr"><div>pvmove seems to fail on VG,=
 which is managed by PCS Resource agent with &#39;exclusive&#39; activation=
 enabled.</div><div><br></div><div>The volume group(VG) is created on a sha=
red disk, with &#39;--addtag test&#39; added.=C2=A0</div><div>Content of my=
 lvm.conf is<br></div><div>#lvmconfig activation/volume_list<br>volume_list=
=3D[&quot;@test&quot;]<br></div><div><br></div><div>I am able to create Log=
ical volume over it, vgextend, vgremove everything works fine.</div><div>Wh=
en I tried to do pvmove, it fails with error that lvm cannot activate vg0/p=
vmove0.</div><div><br></div><div>On probing little further, I found that wh=
en I create LVM PCS resource agent with &#39;exclusive=3Dtrue&#39;, it stri=
ps-off the original tag &#39;test&#39;=C2=A0</div><div>and adds its own &#3=
9;pacemaker&#39; tag.=C2=A0</div><div>Since VG was stripped-off with origin=
al tag, I think, that is the reason of pvmove is getting failed.</div><div>=
<br></div><div>I am out-of ideas to debug this further. Need some expert ad=
vice/solution to handle this situation.</div><div><br></div><div>Also, how =
to use lvmconfig utility to modify volume_list, without the need manually u=
pdate lvm.conf file?=C2=A0</div><div><br></div><div>-Udai=C2=A0<br></div><d=
iv><br></div><div>=C2=A0=C2=A0</div></div>
</div></div>

--000000000000c23a0905954eceee--
