Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s5AIiqjl026666
	for <linux-lvm@redhat.com>; Tue, 10 Jun 2014 14:44:52 -0400
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5AIilvJ014442
	for <linux-lvm@redhat.com>; Tue, 10 Jun 2014 14:44:49 -0400
Received: by mail-lb0-f182.google.com with SMTP id z11so4130679lbi.41
	for <linux-lvm@redhat.com>; Tue, 10 Jun 2014 11:44:47 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 10 Jun 2014 20:44:47 +0200
Message-ID: <CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com>
From: alessandro macuz <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3d8a0d9c7ec04fb7fb879
Subject: [linux-lvm] pvs -a on a partition of ZFS block device
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

--001a11c3d8a0d9c7ec04fb7fb879
Content-Type: text/plain; charset=UTF-8

Hi all,

the goal is to mount a LVM volume that is contained in a 8e partition of a
zvol device.

Since we speak about a production system I stated from the basic and I
wanted to see if pvs would recognize the partition. No luck.

root@server02:/mnt# pvs -a /dev/zd1168p2
  Failed to read physical volume "/dev/zd1168p2"

but on the other way on the same system I get

root@server02:/mnt# pvs -a /dev/sdb2
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sdb2  vgserver01 lvm2 a-   464.83g 432.82g

The only difference I can see between the 2 is the major number

root@server02:/mnt# ls -la /dev/zd1168p2
brw-rw---- 1 root disk 230, 1170 Jun 10 19:56 /dev/zd1168p2

and

root@server02:/mnt# ls -la /dev/sdb2
brw-rw---- 1 root disk 8, 18 Feb 11 10:43 /dev/sdb2

Is it an expected behaviour that I pvs doesn't recognize "physical device"
within ZFS block devices?

Thanks, Alex

--001a11c3d8a0d9c7ec04fb7fb879
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>the goal is to mount a LVM volu=
me that is contained in a 8e partition of a zvol device.</div><div><br></di=
v><div>Since we speak about a production system I stated from the basic and=
 I wanted to see if pvs would recognize the partition. No luck.</div>
<div><br></div><div><div>root@server02:/mnt# pvs -a /dev/zd1168p2</div><div=
>=C2=A0 Failed to read physical volume &quot;/dev/zd1168p2&quot;</div></div=
><div><br></div><div>but on the other way on the same system I get=C2=A0</d=
iv><div>
<br></div><div><div>root@server02:/mnt# pvs -a /dev/sdb2</div><div>=C2=A0 P=
V =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fmt =C2=A0Attr=
 PSize =C2=A0 PFree</div><div>=C2=A0 /dev/sdb2 =C2=A0vgserver01 lvm2 a- =C2=
=A0 464.83g 432.82g</div></div><div><br></div><div>The only difference I ca=
n see between the 2 is the major number</div>
<div><br></div><div><div>root@server02:/mnt# ls -la /dev/zd1168p2</div><div=
>brw-rw---- 1 root disk 230, 1170 Jun 10 19:56 /dev/zd1168p2</div></div><di=
v><br></div><div>and=C2=A0</div><div><br></div><div><div>root@server02:/mnt=
# ls -la /dev/sdb2</div>
<div>brw-rw---- 1 root disk 8, 18 Feb 11 10:43 /dev/sdb2</div></div><div><b=
r></div><div>Is it an expected behaviour that I pvs doesn&#39;t recognize &=
quot;physical device&quot; within ZFS block devices?</div><div><br></div>
<div>Thanks, Alex</div></div>

--001a11c3d8a0d9c7ec04fb7fb879--
