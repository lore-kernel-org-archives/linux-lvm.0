Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0F2UBZ5009725
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 14 Jan 2016 21:30:11 -0500
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mx1.redhat.com (Postfix) with ESMTPS id 9494A8535A
	for <linux-lvm@redhat.com>; Fri, 15 Jan 2016 02:30:10 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u188so6233826wmu.1
	for <linux-lvm@redhat.com>; Thu, 14 Jan 2016 18:30:10 -0800 (PST)
MIME-Version: 1.0
References: <CAJbEnTzHEWiFB9LAhvqWwiX4kUXwjLvBZf8Ek4cdVmD1=kG4EQ@mail.gmail.com>
In-Reply-To: <CAJbEnTzHEWiFB9LAhvqWwiX4kUXwjLvBZf8Ek4cdVmD1=kG4EQ@mail.gmail.com>
From: Bryan Larsen <bryan@larsen.st>
Date: Fri, 15 Jan 2016 02:29:59 +0000
Message-ID: <CAJbEnTxMa=LSk+=55oUko7vQ9m8qOLJpu-WBsEh5nOA2ooiRew@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a114b2aa499d7f30529562edd
Subject: Re: [linux-lvm] device failure during pvmove
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

--001a114b2aa499d7f30529562edd
Content-Type: text/plain; charset=UTF-8

On Thu, 14 Jan 2016 at 20:38 Bryan Larsen <bryan@larsen.st> wrote:

> I was in the process of doing a pvmove from /dev/md3 to a new, blank
> /dev/md1 when /dev/md1 failed due to operator stupidity.
>
> I tried doing a pvmove abort, but it complains about a missing device.
> It suggests doing a vgreduce --removemissing but that refuses to proceed
> without a --force because pvmove has placed data onto the broken and
> missing /dev/md1.
>
> So theoretically all my data should still be available on /dev/md3.   Any
> hints on how to proceed?
>

I solved the problem.   I did a vgcfgdump, carefully edited the resulting
file, and used vgcfgrestore to bring things back to life.

cheers,
Bryan

--001a114b2aa499d7f30529562edd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 14 Jan=
 2016 at 20:38 Bryan Larsen &lt;<a href=3D"mailto:bryan@larsen.st">bryan@la=
rsen.st</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div>I was in the process of doing a pvmove from /dev/md3 to a new, bl=
ank /dev/md1 when /dev/md1 failed due to operator stupidity.</div><div><br>=
</div><div>I tried doing a pvmove abort, but it complains about a missing d=
evice. =C2=A0 It suggests doing a vgreduce --removemissing but that refuses=
 to proceed without a --force because pvmove has placed data onto the broke=
n and missing /dev/md1.</div><div><br></div><div>So theoretically all my da=
ta should still be available on /dev/md3. =C2=A0 Any hints on how to procee=
d?</div></div></blockquote><div><br></div><div>I solved the problem. =C2=A0=
 I did a vgcfgdump, carefully edited the resulting file, and used vgcfgrest=
ore to bring things back to life.</div><div><br></div><div>cheers,</div><di=
v>Bryan</div><div><br></div></div></div>

--001a114b2aa499d7f30529562edd--
