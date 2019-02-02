Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A3CD895AC
	for <linux-lvm@redhat.com>; Sat,  2 Feb 2019 23:54:24 +0000 (UTC)
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
	[209.85.222.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5661DC059B8C
	for <linux-lvm@redhat.com>; Sat,  2 Feb 2019 23:54:24 +0000 (UTC)
Received: by mail-ua1-f70.google.com with SMTP id d9so867421uaq.20
	for <linux-lvm@redhat.com>; Sat, 02 Feb 2019 15:54:24 -0800 (PST)
MIME-Version: 1.0
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 3 Feb 2019 01:54:10 +0200
Message-ID: <CAMRbyyv5qcsqmmP0uk+hEBmZJfZ-stV7XWUH23eJDnNMZYs7QA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009160610580f1fad3"
Subject: [linux-lvm] Mixing devices with different logical or physical block
 size in oVirt LVM based storage
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
Cc: Denis Chaplygin <dchaplyg@redhat.com>, Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>, Vojtech Juranek <vjuranek@redhat.com>

--0000000000009160610580f1fad3
Content-Type: text/plain; charset="UTF-8"

We working on enabling 4k block size in oVirt block storage domain, built
using VG
on multipath devices on shared storage.

We have incomplete support for 4k, added in 2011, for this bug:

    https://bugzilla.redhat.com/732980

When creating or extending a VG, we check that all PVs are using same
logical and
phyisical block size, and we store both logical and physical block size in
the VG tags.
We get the block sizes from
/sys/block/dm-X/queue/{logical,physical}_block_size.

We also enforce that device physical block size is not smaller than logical
block size,
This check was added in this patch, trying to enable block size != 512.
There is no
explanation in the patch or in the review comments why we need to validate
this.


https://github.com/oVirt/vdsm/commit/7e79153705891a91a06eb31cd642fb209d10ff86

When we start to use a VG, we validate that all the devices are using the
stored logical
and physical block size.

In vdsm itself, we use the logical block size to manage vdsm metadata,
assuming that writing
and reading one block of logical block size bytes is atomic, and we can
read and write
different blocks from different hosts at the same time.

The relevant code validating PV block sizes is here:


https://github.com/oVirt/vdsm/blob/8b043e402f41d8a82b9f832be5f582b8520b38bc/lib/vdsm/storage/lvm.py#L1110

Reading the comments in bug 732980, I don't see anything about physical
block size. It looks
like this is unnecessary check, and we should check only the logical block
size.

Regarding mixing devices with different logical block size, according to

    https://bugzilla.redhat.com/show_bug.cgi?id=732980#c8

We should not extend an LV over devices with different block size, as this
will change the device
logical block size (e.g change from 512 to 4k), and the change may break
the upper layer that
already use the device and assume the previous logical block size.

Based on this, I think we are ok with limiting VG to devices with same
logical block size, so any
LV can be extended to any device.

I think this code should change to:

1. When creating a VG, check that all PVs use the same logical block size
2. Store the logical block size in the VG tag
3. When extending the VG, check that the new PVs use the same logical block
size
4. When starting to use a VG, check that stored logical block size matches
PVs logical block size

What do you think?

Nir

--0000000000009160610580f1fad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0=
,0,0)">We working on enabling 4k block size in oVirt block storage domain, =
built using VG</div><div class=3D"gmail_default" style=3D"font-size:small;c=
olor:rgb(0,0,0)">on multipath devices on shared storage.</div><div class=3D=
"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">We have i=
ncomplete support for 4k, added in 2011, for this bug:</div><div class=3D"g=
mail_default"><font color=3D"#000000"><br></font></div><div class=3D"gmail_=
default"><font color=3D"#000000">=C2=A0 =C2=A0 <a href=3D"https://bugzilla.=
redhat.com/732980">https://bugzilla.redhat.com/732980</a></font></div><div =
class=3D"gmail_default"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:rgb(0,0,0)">When creating or extending a VG, we check th=
at all PVs are using same logical and</div><div class=3D"gmail_default" sty=
le=3D"font-size:small;color:rgb(0,0,0)">phyisical block size, and we store =
both logical and physical block size in the VG tags.</div><div class=3D"gma=
il_default" style=3D"font-size:small;color:rgb(0,0,0)">We get the block siz=
es from /sys/block/dm-X/queue/{logical,physical}_block_size.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">We al=
so enforce that device physical block size is not smaller than logical bloc=
k size,</div><div class=3D"gmail_default" style=3D"font-size:small;color:rg=
b(0,0,0)">This check was added in this patch, trying to enable block size !=
=3D 512. There is no</div><div class=3D"gmail_default" style=3D"font-size:s=
mall;color:rgb(0,0,0)">explanation in the patch or in the review comments w=
hy we need to validate this.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default"><font=
 color=3D"#000000">=C2=A0 =C2=A0 <a href=3D"https://github.com/oVirt/vdsm/c=
ommit/7e79153705891a91a06eb31cd642fb209d10ff86">https://github.com/oVirt/vd=
sm/commit/7e79153705891a91a06eb31cd642fb209d10ff86</a></font><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">=
When we start to use a VG, we validate that all the devices are using the s=
tored logical</div><div class=3D"gmail_default" style=3D"font-size:small;co=
lor:rgb(0,0,0)">and physical block size.</div><div class=3D"gmail_default" =
style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small;color:rgb(0,0,0)">In vdsm itself, we use th=
e logical block size to manage vdsm metadata, assuming that writing</div><d=
iv class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">and r=
eading one block of logical block size bytes is atomic, and we can read and=
 write</div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb=
(0,0,0)">different blocks from different hosts at the same time.</div><div =
class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">T=
he relevant code validating PV block sizes is here:</div><div class=3D"gmai=
l_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=
=3D"gmail_default"><font color=3D"#000000">=C2=A0 =C2=A0 <a href=3D"https:/=
/github.com/oVirt/vdsm/blob/8b043e402f41d8a82b9f832be5f582b8520b38bc/lib/vd=
sm/storage/lvm.py#L1110">https://github.com/oVirt/vdsm/blob/8b043e402f41d8a=
82b9f832be5f582b8520b38bc/lib/vdsm/storage/lvm.py#L1110</a></font><br></div=
><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0=
,0)">Reading the comments in bug 732980, I don&#39;t see anything about phy=
sical block size. It looks</div><div class=3D"gmail_default" style=3D"font-=
size:small;color:rgb(0,0,0)">like this is unnecessary check, and we should =
check only the logical block size.</div><div class=3D"gmail_default" style=
=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small;color:rgb(0,0,0)">Regarding mixing devices with =
different logical block size, according to</div><div class=3D"gmail_default=
"><font color=3D"#000000"><br></font></div><div class=3D"gmail_default"><fo=
nt color=3D"#000000">=C2=A0 =C2=A0 <a href=3D"https://bugzilla.redhat.com/s=
how_bug.cgi?id=3D732980#c8">https://bugzilla.redhat.com/show_bug.cgi?id=3D7=
32980#c8</a></font><br></div><div class=3D"gmail_default"><font color=3D"#0=
00000"><br></font></div><div class=3D"gmail_default"><font color=3D"#000000=
">We should not extend an LV over devices with different block size, as thi=
s will change the device</font></div><div class=3D"gmail_default"><font col=
or=3D"#000000">logical block size (e.g change from 512 to 4k), and the chan=
ge may break the upper layer that</font></div><div class=3D"gmail_default">=
<font color=3D"#000000">already use the device and assume the previous logi=
cal block size.</font></div><div class=3D"gmail_default"><font color=3D"#00=
0000"><br></font></div><div class=3D"gmail_default"><font color=3D"#000000"=
>Based on this, I think we are ok with limiting VG to devices with same log=
ical block size, so any=C2=A0</font></div><div class=3D"gmail_default"><fon=
t color=3D"#000000">LV can be extended to any device.</font></div><div clas=
s=3D"gmail_default"><br></div><div class=3D"gmail_default">I think this cod=
e should change to:</div><div class=3D"gmail_default"><br></div><div class=
=3D"gmail_default">1. When creating a VG, check that all PVs use the same l=
ogical block size</div><div class=3D"gmail_default">2. Store the logical bl=
ock size in the VG tag</div><div class=3D"gmail_default">3. When extending =
the VG, check that the new PVs use the same logical block size</div><div cl=
ass=3D"gmail_default">4. When starting to use a VG, check that stored logic=
al block size matches PVs logical block size</div><div class=3D"gmail_defau=
lt"><br></div><div class=3D"gmail_default">What do you think?</div><div cla=
ss=3D"gmail_default"><br></div><div class=3D"gmail_default">Nir</div><div c=
lass=3D"gmail_default"><br></div></div></div></div></div></div>

--0000000000009160610580f1fad3--
