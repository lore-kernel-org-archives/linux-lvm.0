Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB3GX6Yq005871
	for <linux-lvm@redhat.com>; Wed, 3 Dec 2014 11:33:06 -0500
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB3GX4WX011393
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 3 Dec 2014 11:33:05 -0500
Received: by mail-vc0-f180.google.com with SMTP id im6so6888235vcb.25
	for <linux-lvm@redhat.com>; Wed, 03 Dec 2014 08:33:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417534714.42086.YahooMailBasic@web181504.mail.ne1.yahoo.com>
References: <CAHEKYV5KqihaYWUb3Go53vSJj__X82ZiOCMXCG=-Kzm-uesPgw@mail.gmail.com>
	<1417534714.42086.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Date: Wed, 3 Dec 2014 17:33:04 +0100
Message-ID: <CAE8gLhk_VpJwKhDR5-UYVYkg4EHwE6nf4JR=PRBhnLYMe+8aXg@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3aea6dd169e0509526593
Subject: Re: [linux-lvm] LVM mirror or RAID1?
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

--001a11c3aea6dd169e0509526593
Content-Type: text/plain; charset=UTF-8

Just to be clear, I wouldn't like to use LVM over RAID1, as the requirement
for having equal-sized disks is not tolerable by me, also I don't wish to
mirror all of my LVs.

My question is whether to use the mirror or raid1 segment types for LVs
over LVM.

So, should I rather create my LVs with "lvcreate --type mirror" or
"lvcreate --type raid1"? Which option is more efficient?


2014-12-02 16:38 GMT+01:00 matthew patton <pattonme@yahoo.com>:

> LVM now has folded the raid capability. but you want to use the true raid1
> capability not the "mirrored" logical volumes. The raid writes to both in
> parallel. The mirrored LV is sequential and a LOT slower.
>

--001a11c3aea6dd169e0509526593
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Just to be clear, I wouldn&#39;t like to use LVM=
 over RAID1, as the requirement for having equal-sized disks is not tolerab=
le by me, also I don&#39;t wish to mirror all of my LVs.<br><br></div>My qu=
estion is whether to use the mirror or raid1 segment types for LVs over LVM=
.<br><br></div>So, should I rather create my LVs with &quot;lvcreate --type=
 mirror&quot; or &quot;lvcreate --type raid1&quot;? Which option is more ef=
ficient?<br><div><div><br><div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">2014-12-02 16:38 GMT+01:00 matthew patton <span dir=3D"ltr">&=
lt;<a href=3D"mailto:pattonme@yahoo.com" target=3D"_blank">pattonme@yahoo.c=
om</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">LVM now has folded the=
 raid capability. but you want to use the true raid1 capability not the &qu=
ot;mirrored&quot; logical volumes. The raid writes to both in parallel. The=
 mirrored LV is sequential and a LOT slower.<br>
</blockquote></div><br></div></div></div></div></div>

--001a11c3aea6dd169e0509526593--
