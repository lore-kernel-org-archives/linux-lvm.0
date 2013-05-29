Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4T7uVd9013728
	for <linux-lvm@redhat.com>; Wed, 29 May 2013 03:56:31 -0400
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4T7uSAH020065
	for <linux-lvm@redhat.com>; Wed, 29 May 2013 03:56:29 -0400
Received: by mail-lb0-f179.google.com with SMTP id r11so8507379lbv.24
	for <linux-lvm@redhat.com>; Wed, 29 May 2013 00:56:28 -0700 (PDT)
MIME-Version: 1.0
From: =?ISO-8859-1?Q?Lo=EFc?= <loic@recisio.com>
Date: Wed, 29 May 2013 09:56:07 +0200
Message-ID: <CAA9cXK679Fwn+Ow4hxVUunkuusa7xoH+qYNj6fUR060pQjwjzA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3d8d015211a04ddd6b837
Subject: [linux-lvm] Alert before LVM snapshot becomes full
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

--001a11c3d8d015211a04ddd6b837
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

I would like to raise my problem because I have not found the answer to my
question by searching on the Internet. Hoping that one of you had
experience with this kind of problem.

I'm looking for a way to launch a script or disable an LVM snaphot before
it becomes full.
For example I would like to launch a script that will umount the LVM snapsh=
ot
and delete it if it reaches 90%. That is to avoid LVM issue when snapshot
is full.

Any ideas ?

Thank you in advance.

Lo=EFc

--001a11c3d8d015211a04ddd6b837
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Hi all,</div><div style><br></div>I would like =
to raise my problem because I have not found the answer to my question by s=
earching on the Internet. Hoping that one of you had experience with this k=
ind of problem.<div>

<br></div><div><span style=3D"font-family:arial,sans-serif;font-size:13px">=
I&#39;m looking for a way to launch a script or disable an LVM snaphot befo=
re it=A0</span><span style=3D"font-family:arial,sans-serif;font-size:13px">=
becomes full.</span><br style=3D"font-family:arial,sans-serif;font-size:13p=
x">

<span style=3D"font-family:arial,sans-serif;font-size:13px">For example I w=
ould like to launch a script that will umount the LVM=A0</span><span style=
=3D"font-family:arial,sans-serif;font-size:13px">snapshot and delete it if =
it reaches 90%. That is to avoid LVM issue when snapshot is full.</span></d=
iv>

<div><span style=3D"font-family:arial,sans-serif;font-size:13px"><br></span=
></div><div style><span style=3D"font-family:arial,sans-serif;font-size:13p=
x">Any ideas ?</span></div><div><font face=3D"arial, sans-serif"><br></font=
></div>

<div><font face=3D"arial, sans-serif">Thank you in advance.<br clear=3D"all=
"></font><div><br>Lo=EFc</div>
</div></div>

--001a11c3d8d015211a04ddd6b837--
