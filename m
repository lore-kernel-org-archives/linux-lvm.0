Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34704100191B
	for <linux-lvm@redhat.com>; Sun,  3 Jun 2018 22:22:07 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E6A630041D4
	for <linux-lvm@redhat.com>; Sun,  3 Jun 2018 22:21:56 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p126-v6so3032781wmb.2
	for <linux-lvm@redhat.com>; Sun, 03 Jun 2018 15:21:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
From: Inbox <jimhaddad46@gmail.com>
Date: Sun, 3 Jun 2018 15:21:54 -0700
Message-ID: <CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009780e4056dc43e1d"
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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

--0000000000009780e4056dc43e1d
Content-Type: text/plain; charset="UTF-8"

Sorry to be mailing again, think this info helps though...



On Sun, Jun 3, 2018 at 1:13 PM, Inbox <jimhaddad46@gmail.com> wrote:
...

> # lvcreate -V200G lvm/disk3thin -n test3
>
...

>   /dev/sdh3: write failed after 24064 of 24576 at 4993488961536: No space
> left on device
>
...

> # lvremove lvm/test3
>   /dev/sdh3: write failed after 24064 of 24576 at 4993488961536: No space
> left on device
>   WARNING: Failed to write an MDA of VG lvm.
>   /dev/sdg3: write failed after 24064 of 24576 at 4993488961536: No space
> left on device
>   WARNING: Failed to write an MDA of VG lvm.
>   /dev/sdf3: write failed after 24064 of 24576 at 4993488961536: No space
> left on device
>   WARNING: Failed to write an MDA of VG lvm.
>

fdisk -l  shows sdf3, sdg3, and sdh3, sdg3, are 4993488985600 bytes.

After some reading, I'm guessing mda means metadata area.

If LVM is trying to write mda2 at 4993488961536, there's only 24064 bytes
left in the partition, which is exactly where it's saying the write is
failing.

I did use "--pvmetadatacopies 2" when running pvcreate.

So, am I right that it's trying to write more than 24k of metadata at the
end of the disk, but there's only 24k left at the end of the disk for a
metadata copy?

If so, where the other locations for metadata (both the main one, and the
first copy) only 24k?  Did I lose metadata in those areas?  Did it
overwrite what was after the metadata area?

Where do I go from here?

# pvdisplay --maps /dev/sdh3
  --- Physical volume ---
  PV Name               /dev/sdh3
  VG Name               lvm
  PV Size               4.54 TiB / not usable 2.19 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              1190540
  Free PE               0
  Allocated PE          1190540
  PV UUID               BK8suJ-dqiy-mdK4-IyUH-aeRR-TPUo-3Dj6JG

  --- Physical Segments ---
  Physical extent 0 to 127:
    Logical volume      /dev/lvm/disk1thin_tmeta
    Logical extents     32 to 159
  Physical extent 128 to 4095:
    Logical volume      /dev/lvm/swap1
    Logical extents     0 to 3967
  Physical extent 4096 to 4127:
    Logical volume      /dev/lvm/lvol0_pmspare
    Logical extents     0 to 31
  Physical extent 4128 to 132127:
    Logical volume      /dev/lvm/disk1thin_tdata
    Logical extents     0 to 127999
  Physical extent 132128 to 132159:
    Logical volume      /dev/lvm/disk1thin_tmeta
    Logical extents     0 to 31
  Physical extent 132160 to 1190539:
    Logical volume      /dev/lvm/disk1thin_tdata
    Logical extents     128000 to 1186379

Those physical extents translate to beginning/ending bytes (4MiB PE size)
of:

0 532676608
536870912 17175674880
17179869184 17309892608
17314086912 554180804608
554184998912 554315022336
554319216640 4993482489856


Disk size (4993488961536) - last physical extent ending byte (4993482489856
+ 4*1024*1024 assuming worst case scenario here, the x856 is the starting
byte of the last extent) still leaves 2277376 bytes, way more than 24k.

--0000000000009780e4056dc43e1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Sorr=
y to be mailing again, think this info helps though...</div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">On Sun, Jun 3, 2018 at 1:13=
 PM, Inbox <span dir=3D"ltr">&lt;<a href=3D"mailto:jimhaddad46@gmail.com" t=
arget=3D"_blank">jimhaddad46@gmail.com</a>&gt;</span> wrote:</div><div clas=
s=3D"gmail_quote">...<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div># lvcreate -V200G lvm/disk3thin -n test3<br></div></d=
iv></blockquote><div>...</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div>=C2=A0 /dev/sdh3: write failed after 24064 of 24=
576 at 4993488961536: No space left on device</div></div></blockquote><div>=
...=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div># lvremove lvm/test3<br></div><div>=C2=A0 /dev/sdh3: write fa=
iled after 24064 of 24576 at 4993488961536: No space left on device</div><d=
iv>=C2=A0 WARNING: Failed to write an MDA of VG lvm.</div><div>=C2=A0 /dev/=
sdg3: write failed after 24064 of 24576 at 4993488961536: No space left on =
device</div><div>=C2=A0 WARNING: Failed to write an MDA of VG lvm.</div><di=
v>=C2=A0 /dev/sdf3: write failed after 24064 of 24576 at 4993488961536: No =
space left on device</div><div>=C2=A0 WARNING: Failed to write an MDA of VG=
 lvm.</div></div></blockquote><div><br></div><div>fdisk -l=C2=A0 shows sdf3=
, sdg3, and sdh3, sdg3, are=C2=A04993488985600 bytes.</div><div><br></div><=
div>After some reading, I&#39;m guessing mda means metadata area.</div><div=
><br></div><div>If LVM is trying to write mda2 at=C2=A0<span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">4993488961536, there&#39;s only 24064 bytes left in the partition, wh=
ich is exactly where it&#39;s saying the write is failing.</span></div><div=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline"><br></span></div><div>I did use &quot;--pvmetada=
tacopies 2&quot; when running pvcreate.</div><div><br></div><div>So, am I r=
ight that it&#39;s trying to write more than 24k of metadata at the end of =
the disk, but there&#39;s only 24k left at the end of the disk for a metada=
ta copy?</div><div><br></div><div>If so, where the other locations for meta=
data (both the main one, and the first copy) only 24k?=C2=A0 Did I lose met=
adata in those areas?=C2=A0 Did it overwrite what was after the metadata ar=
ea?</div><div><br></div><div>Where do I go from here?</div><div><br></div><=
div><div># pvdisplay --maps /dev/sdh3</div><div>=C2=A0 --- Physical volume =
---</div><div>=C2=A0 PV Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/dev/sdh3</div><div>=C2=A0 VG Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0lvm</div><div>=C2=A0 PV Size=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.54 TiB / not usable 2.19 MiB</div><div>=
=C2=A0 Allocatable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes (but full)</=
div><div>=C2=A0 PE Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A04.00 MiB</div><div>=C2=A0 Total PE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1190540</div><div>=C2=A0 Free PE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00</div><div>=C2=A0 Allocated PE=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 1190540</div><div>=C2=A0 PV UUID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0BK8suJ-dqiy-mdK4-IyUH-aeRR-TPUo-3Dj6JG</div><div=
><br></div><div>=C2=A0 --- Physical Segments ---</div><div>=C2=A0 Physical =
extent 0 to 127:</div><div>=C2=A0 =C2=A0 Logical volume=C2=A0 =C2=A0 =C2=A0=
 /dev/lvm/disk1thin_tmeta</div><div>=C2=A0 =C2=A0 Logical extents=C2=A0 =C2=
=A0 =C2=A032 to 159</div><div>=C2=A0 Physical extent 128 to 4095:</div><div=
>=C2=A0 =C2=A0 Logical volume=C2=A0 =C2=A0 =C2=A0 /dev/lvm/swap1</div><div>=
=C2=A0 =C2=A0 Logical extents=C2=A0 =C2=A0 =C2=A00 to 3967</div><div>=C2=A0=
 Physical extent 4096 to 4127:</div><div>=C2=A0 =C2=A0 Logical volume=C2=A0=
 =C2=A0 =C2=A0 /dev/lvm/lvol0_pmspare</div><div>=C2=A0 =C2=A0 Logical exten=
ts=C2=A0 =C2=A0 =C2=A00 to 31</div><div>=C2=A0 Physical extent 4128 to 1321=
27:</div><div>=C2=A0 =C2=A0 Logical volume=C2=A0 =C2=A0 =C2=A0 /dev/lvm/dis=
k1thin_tdata</div><div>=C2=A0 =C2=A0 Logical extents=C2=A0 =C2=A0 =C2=A00 t=
o 127999</div><div>=C2=A0 Physical extent 132128 to 132159:</div><div>=C2=
=A0 =C2=A0 Logical volume=C2=A0 =C2=A0 =C2=A0 /dev/lvm/disk1thin_tmeta</div=
><div>=C2=A0 =C2=A0 Logical extents=C2=A0 =C2=A0 =C2=A00 to 31</div><div>=
=C2=A0 Physical extent 132160 to 1190539:</div><div>=C2=A0 =C2=A0 Logical v=
olume=C2=A0 =C2=A0 =C2=A0 /dev/lvm/disk1thin_tdata</div><div>=C2=A0 =C2=A0 =
Logical extents=C2=A0 =C2=A0 =C2=A0128000 to 1186379</div></div><div><br></=
div><div>Those physical extents translate to beginning/ending bytes (4MiB P=
E size) of:</div><div><br></div><div><div>0<span style=3D"white-space:pre">=
	</span>532676608</div><div>536870912<span style=3D"white-space:pre">	</spa=
n>17175674880</div><div>17179869184<span style=3D"white-space:pre">	</span>=
17309892608</div><div>17314086912<span style=3D"white-space:pre">	</span>55=
4180804608</div><div>554184998912<span style=3D"white-space:pre">	</span>55=
4315022336</div><div>554319216640<span style=3D"white-space:pre">	</span>49=
93482489856</div></div><div><br></div><div><br></div><div>Disk size (499348=
8961536) - last physical extent ending byte (4993482489856 + 4*1024*1024 as=
suming worst case scenario here, the x856 is the starting byte of the last =
extent) still leaves=C2=A02277376 bytes, way more than 24k.</div></div></di=
v></div>

--0000000000009780e4056dc43e1d--
