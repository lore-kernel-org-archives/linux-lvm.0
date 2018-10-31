Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEEF55D75D
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2018 08:29:04 +0000 (UTC)
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FAB1309174F
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2018 08:29:03 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id k206-v6so17124684ite.0
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2018 01:29:03 -0700 (PDT)
MIME-Version: 1.0
From: Gang He <dchg2000@gmail.com>
Date: Wed, 31 Oct 2018 16:28:51 +0800
Message-ID: <CAGmFzSeAiJ_Rn-shYG3K1VBcVxxy9RjLG7ZeOL-aHKQDpzC+RA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000031df6b05798218c9"
Subject: [linux-lvm] About --mirrorlog mirrored option in the latest lvm2
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

--00000000000031df6b05798218c9
Content-Type: text/plain; charset="UTF-8"

Hello List,

As you know, in the past versions(e.g. v2.02.120), lvcreate supports
creating a mirror type LV with "--mirrorlog mirrored" option,
But in the latest versions(e.g. v2.02.180), lvm2 says "mirrored is a
persistent log that is itself mirrored, but should be avoided. Instead, use
the raid1 type for log redundancy."
Then,  my questions are as below,
1)The latest lvm2 does not allow creating this kind of LV, or just not
recommended?
In my test environment, it looks that LVM2 can not create this kind of LV.
tb0307-nd1:/ # lvcreate --type mirror -m1 --mirrorlog mirrored -L 2G -n
mirr-lv cluster-vg2
  Log type, "mirrored", is unavailable to cluster mirrors.
If I try to create this kind of LV in local VG (not cluster VG), this
operation will be supported?

2)If we can not create this kind of LV, how can we migrate these existing
LVs after we upgrade LVM2 to the latest version (e.g. v2.02.180)?
e.g. we need to convert this kind of LV to "RAID1 type LV, I want to know
if there is a suggested guide for this scenario.

Thanks
Gang

--00000000000031df6b05798218c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default"><div class=
=3D"gmail_default"><font face=3D"verdana, sans-serif">Hello List,</font></d=
iv><div class=3D"gmail_default"><font face=3D"verdana, sans-serif"><br></fo=
nt></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">As=
 you know, in the past versions(e.g. v2.02.120), lvcreate supports creating=
 a mirror type LV with &quot;--mirrorlog mirrored&quot; option,=C2=A0</font=
></div><div class=3D"gmail_default"><font face=3D"verdana, sans-serif">But =
in the latest versions(e.g. v2.02.180), lvm2 says &quot;mirrored is a persi=
stent log that is itself mirrored, but should be avoided. Instead, use the =
raid1 type for log redundancy.&quot;</font></div><div class=3D"gmail_defaul=
t"><font face=3D"verdana, sans-serif">Then,=C2=A0 my questions are as below=
,</font></div><div class=3D"gmail_default"><font face=3D"verdana, sans-seri=
f">1)The latest lvm2 does not allow creating this kind of LV, or just not r=
ecommended?</font></div><div class=3D"gmail_default"><font face=3D"verdana,=
 sans-serif">In my test environment, it looks that LVM2 can not create this=
 kind of LV.</font></div><div class=3D"gmail_default"><font face=3D"verdana=
, sans-serif">tb0307-nd1:/ # lvcreate --type mirror -m1 --mirrorlog mirrore=
d -L 2G -n mirr-lv cluster-vg2</font></div><div class=3D"gmail_default"><fo=
nt face=3D"verdana, sans-serif">=C2=A0 Log type, &quot;mirrored&quot;, is u=
navailable to cluster mirrors.</font></div><div class=3D"gmail_default"><fo=
nt face=3D"verdana, sans-serif">If I try to create this kind of LV in local=
 VG (not cluster VG), this operation will be supported?</font></div><div cl=
ass=3D"gmail_default"><font face=3D"verdana, sans-serif"><br></font></div><=
div class=3D"gmail_default"><font face=3D"verdana, sans-serif">2)If we can =
not create this kind of LV, how can we migrate these existing LVs after we =
upgrade LVM2 to the latest version (e.g. v2.02.180)?</font></div><div class=
=3D"gmail_default"><font face=3D"verdana, sans-serif">e.g. we need to conve=
rt this kind of LV to &quot;RAID1 type LV, I want to know if there is a sug=
gested guide for this scenario.</font></div><div class=3D"gmail_default"><f=
ont face=3D"verdana, sans-serif"><br></font></div><div class=3D"gmail_defau=
lt"><font face=3D"verdana, sans-serif">Thanks</font></div><div class=3D"gma=
il_default"><font face=3D"verdana, sans-serif">Gang</font></div></div></div=
></div>

--00000000000031df6b05798218c9--
