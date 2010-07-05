Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o65Fen2Z029976
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 11:40:49 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o65FeaiH019717
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 11:40:37 -0400
Received: by pwi5 with SMTP id 5so1765691pwi.33
	for <linux-lvm@redhat.com>; Mon, 05 Jul 2010 08:40:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTilLuXWENDd_bvUlEbV7Hde13h859SIwjLjjsDqZ@mail.gmail.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<AANLkTilLuXWENDd_bvUlEbV7Hde13h859SIwjLjjsDqZ@mail.gmail.com>
Date: Mon, 5 Jul 2010 08:39:11 -0700
Message-ID: <AANLkTikh5W3EHYUrGEz_BfBizwR5K-epcO_pLXBn67Bp@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd2e054f98118048aa5bcec
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

--000e0cd2e054f98118048aa5bcec
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 5, 2010 at 3:06 AM, Bryan Whitehead <driver@megahappy.net>wrote:

>
> The lv is available right?
>
> It would be great to see the output from lvdisplay and vgdisplay.
>
> -Bryan
>
>
___________________________________
[root@Elmer ken]# lvdisplay /dev/VolGroupX/LogVolX
  --- Logical volume ---
  LV Name                /dev/VolGroupX/LogVolX
  VG Name                VolGroupW
  LV UUID                eBQgqM-RHra-ruaK-CcEt-stnX-U9yR-Uz4UH5
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                442.80 GB
  Current LE             113358
  Segments               5
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:11

[root@Elmer ken]# vgdisplay VolGroupX
  --- Volume group ---
  VG Name               VolGroupX
  System ID
  Format                lvm2
  Metadata Areas        5
  Metadata Sequence No  28
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                5
  Act PV                5
  VG Size               442.80 GB
  PE Size               4.00 MB
  Total PE              113358
  Alloc PE / Size       113358 / 442.80 GB
  Free  PE / Size       0 / 0
  VG UUID               2CXUUY-j6nu-07qP-kKd1-ZkBJ-hNwf-iunkwK

___________________________________

I would think I should be able to find a backup superblock among the
remaining drives. I tried running mke2fs -n to get a list of possible
superblocks, but when I ran e2fsck with those values, I got the ioctl error,
and then the no superblock found message.

Is there any way to scan each of the individual drives for data, outside of
LVM? Just another desparate thought.

thx again.

ken

--000e0cd2e054f98118048aa5bcec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Jul 5, 2010 at 3:06 AM, Bryan Wh=
itehead <span dir=3D"ltr">&lt;<a href=3D"mailto:driver@megahappy.net">drive=
r@megahappy.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 20=
4); padding-left: 1ex;">
<div class=3D"im"><br>
</div>The lv is available right?<br>
<br>
It would be great to see the output from lvdisplay and vgdisplay.<br>
<font color=3D"#888888"><br>
-Bryan<br>
</font><div><div></div><div class=3D"h5"><br></div></div></blockquote><div>=
<br>___________________________________<br>[root@Elmer ken]# lvdisplay /dev=
/VolGroupX/LogVolX<br>=A0 --- Logical volume ---<br>=A0 LV Name=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /dev/VolGroupX/LogVolX<br>
=A0 VG Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VolGroupW<br>=A0 L=
V UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 eBQgqM-RHra-ruaK-CcEt-s=
tnX-U9yR-Uz4UH5<br>=A0 LV Write Access=A0=A0=A0=A0=A0=A0=A0 read/write<br>=
=A0 LV Status=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 available<br>=A0 # ope=
n=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br>=A0 LV Size=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 442.80 GB<br>
=A0 Current LE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 113358<br>=A0 Segments=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5<br>=A0 Allocation=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 inherit<br>=A0 Read ahead sectors=A0=A0=A0=A0 auto=
<br>=A0 - currently set to=A0=A0=A0=A0 256<br>=A0 Block device=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 253:11<br>=A0=A0 <br>[root@Elmer ken]# vgdisplay VolGrou=
pX<br>
=A0 --- Volume group ---<br>=A0 VG Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 VolGroupX<br>=A0 System ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <br>=
=A0 Format=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lvm2<br>=A0 Metadat=
a Areas=A0=A0=A0=A0=A0=A0=A0 5<br>=A0 Metadata Sequence No=A0 28<br>=A0 VG =
Access=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 read/write<br>=A0 VG Status=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 resizable<br>
=A0 MAX LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br>=A0 Cur LV=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1<br>=A0 Open LV=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br>=A0 Max PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0<br>=A0 Cur PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 5<br>=A0 Act PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 5<br>=A0 V=
G Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 442.80 GB<br>=A0 PE Size=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4.00 MB<br>
=A0 Total PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 113358<br>=A0 Alloc PE =
/ Size=A0=A0=A0=A0=A0=A0 113358 / 442.80 GB<br>=A0 Free=A0 PE / Size=A0=A0=
=A0=A0=A0=A0 0 / 0=A0=A0 <br>=A0 VG UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 2CXUUY-j6nu-07qP-kKd1-ZkBJ-hNwf-iunkwK<br><br>___________________=
________________ <br>
</div><br></div>I would think I should be able to find a backup superblock =
among the remaining drives. I tried running mke2fs -n to get a list of poss=
ible superblocks, but when I ran e2fsck with those values, I got the ioctl =
error, and then the no superblock found message.<br>
<br>Is there any way to scan each of the individual drives for data, outsid=
e of LVM? Just another desparate thought.<br><br>thx again. <br><br>ken<br>=
<br><br><br>

--000e0cd2e054f98118048aa5bcec--
