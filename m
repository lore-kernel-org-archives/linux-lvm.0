Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6QAD4RN016921
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 06:13:04 -0400
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6QACoXG002312
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 06:12:50 -0400
Received: by ey-out-2122.google.com with SMTP id 9so596814eyd.39
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 03:12:49 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 26 Jul 2009 12:12:49 +0200
Message-ID: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=00504502c89e661a1e046f99147e
Subject: [linux-lvm] Mirroring implementation
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--00504502c89e661a1e046f99147e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,
I have a few questions concerning LVM mirror implementation, and I couldn't
find any suitable design doc

I need to setup a dual site ( a few miles between the 2 sites, around 1 ms
RTD) mirror based cluster system.

-  what is the default behaviour of the mirroring, writing in parallel to
both mirror legs or serialized ? what about read requests ?

- for write requests, is the ack returned to the application (thru VFS) when
the 2 legs are updated or only when the first is updated ?
- Is there a way to control it ?

- what happens if the log device is lost ?

I saw a post about LVM mirror vs mdadm where it is about the location of the
mirror log (
https://www.redhat.com/archives/linux-lvm/2009-July/msg00012.html) someone
gave the answer that when creating the LV's with --alloc anywhere it will
auto locate the log on any of the PV's.

According to what I could read, the --alloc doesn't intend for that, am I
right ?

Brem ,

--00504502c89e661a1e046f99147e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I have a few questions concerning LVM mirror impleme=
ntation, and I couldn&#39;t find any suitable design doc</div><div><br></di=
v><div>I need to setup a dual site ( a few miles between the 2 sites, aroun=
d 1 ms RTD) mirror based cluster system.</div>
<div><br></div><div>- =A0what is the default behaviour of the mirroring, wr=
iting in parallel to both mirror legs or serialized ? what about read reque=
sts ?</div><div><br></div><div>- for write requests, is the ack returned to=
 the application (thru VFS) when the 2 legs are updated or only when the fi=
rst is updated ?</div>
<div>- Is there a way to control it ?</div><div><br></div><div>- what happe=
ns if the log device is lost ?</div><div><br></div><div>I saw a post about =
LVM mirror <span class=3D"Apple-style-span" style=3D"border-collapse: colla=
pse; white-space: pre; -webkit-border-horizontal-spacing: 2px; -webkit-bord=
er-vertical-spacing: 2px;">vs mdadm where it is about the location of the m=
irror log (<span class=3D"Apple-style-span" style=3D"border-collapse: separ=
ate; white-space: normal; -webkit-border-horizontal-spacing: 0px; -webkit-b=
order-vertical-spacing: 0px; "><a href=3D"https://www.redhat.com/archives/l=
inux-lvm/2009-July/msg00012.html">https://www.redhat.com/archives/linux-lvm=
/2009-July/msg00012.html</a>) someone gave the answer that when creating th=
e LV&#39;s with --alloc anywhere it will auto locate the log on any of the =
PV&#39;s.</span></span></div>
<div><br></div><div><span class=3D"Apple-style-span" style=3D"border-collap=
se: collapse; white-space: pre; -webkit-border-horizontal-spacing: 2px; -we=
bkit-border-vertical-spacing: 2px;"><span class=3D"Apple-style-span" style=
=3D"border-collapse: separate; white-space: normal; -webkit-border-horizont=
al-spacing: 0px; -webkit-border-vertical-spacing: 0px; ">According to what =
I could read, the --alloc doesn&#39;t intend for that, am I right ?</span><=
/span></div>
<div><br></div><div><span class=3D"Apple-style-span" style=3D"border-collap=
se: collapse; white-space: pre; -webkit-border-horizontal-spacing: 2px; -we=
bkit-border-vertical-spacing: 2px;"><span class=3D"Apple-style-span" style=
=3D"border-collapse: separate; white-space: normal; -webkit-border-horizont=
al-spacing: 0px; -webkit-border-vertical-spacing: 0px; ">Brem ,=A0=A0</span=
></span></div>
<div><span class=3D"Apple-style-span" style=3D"border-collapse: collapse; w=
hite-space: pre; -webkit-border-horizontal-spacing: 2px; -webkit-border-ver=
tical-spacing: 2px; "></span></div>

--00504502c89e661a1e046f99147e--
