Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t17FltN3022883
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2015 10:47:55 -0500
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t17Flr0J026426
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2015 10:47:54 -0500
Received: by mail-ob0-f178.google.com with SMTP id uz6so18494216obc.9
	for <linux-lvm@redhat.com>; Sat, 07 Feb 2015 07:47:53 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 7 Feb 2015 13:47:53 -0200
Message-ID: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
From: Marcos Dutra <macdutra@gmail.com>
Content-Type: multipart/alternative; boundary=089e0158ab3ccc7da5050e8175db
Subject: [linux-lvm] Volume group inconsistent
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

--089e0158ab3ccc7da5050e8175db
Content-Type: text/plain; charset=UTF-8

Hi everybody,

Yesterday some storage discs of my VG was with missing status
/dev/mapper/plt-01                                        platinum
lvm2 a-m  500.00g   24.95g
  /dev/mapper/plt-02                                        platinum
lvm2 a-m  500.00g   12.93g

I tried recover the discs and I used the command:
# vgextend --restoremissing platinum /dev/mapper/plt-01

It worked, removing missing status, but I did a big mistake, i tried to run
this command with multiple discs:
# vgextend --restoremissing platinum /dev/mapper/plt-0[2-9]

After that when I ran pvs command the output shows me checksum error:
  /dev/mapper/plt-04: Checksum error
  /dev/mapper/plt-06: Checksum error
  /dev/mapper/plt-01: Checksum error
  Couldn't read volume group metadata.
  /dev/mapper/plt-02: Checksum error
  Couldn't read volume group metadata.
  /dev/mapper/plt-03: Checksum error

I tried restore metadata without success:
# vgcfgrestore -f platinum_02336-1600706364.vg platinum
  /dev/mapper/plt-03: Checksum error
  /dev/mapper/plt-22: Checksum error
  /dev/mapper/plt-19: Checksum error
  /dev/mapper/plt-16: Checksum error
  /dev/mapper/plt-13: Checksum error
  /dev/mapper/plt-11: Checksum error
  /dev/mapper/plt-09: Checksum error
  /dev/mapper/plt-07: Checksum error
  /dev/mapper/plt-01: Checksum error
  /dev/mapper/plt-05: Checksum error
  /dev/mapper/plt-25: Checksum error
  /dev/mapper/plt-23: Checksum error
  /dev/mapper/plt-20: Checksum error
  /dev/mapper/plt-17: Checksum error
  /dev/mapper/plt-14: Checksum error
  /dev/mapper/plt-02: Checksum error
  /dev/mapper/plt-24: Checksum error
  /dev/mapper/plt-21: Checksum error
  /dev/mapper/plt-18: Checksum error
  /dev/mapper/plt-12: Checksum error
  /dev/mapper/plt-10: Checksum error
  /dev/mapper/plt-08: Checksum error
  /dev/mapper/plt-04: Checksum error
  /dev/mapper/plt-06: Checksum error
  Cannot restore Volume Group platinum with 24 PVs marked as missing.
  Restore failed.

Thanks for help me.

--089e0158ab3ccc7da5050e8175db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everybody,<div><br></div><div>Yesterday some storage di=
scs of my VG was with missing status</div><div><div>/dev/mapper/plt-01 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platinum =C2=
=A0 =C2=A0 =C2=A0 lvm2 a-m =C2=A0500.00g =C2=A0 24.95g</div><div>=C2=A0 /de=
v/mapper/plt-02 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0platinum =C2=A0 =C2=A0 =C2=A0 lvm2 a-m =C2=A0500.00g =C2=A0 12.93g</d=
iv></div><div><br></div><div>I tried recover the discs and I used the comma=
nd:=C2=A0</div><div># vgextend --restoremissing platinum /dev/mapper/plt-01=
</div><div><br></div><div>It worked, removing missing status, but I did a b=
ig mistake, i tried to run this command with multiple discs:</div><div><div=
># vgextend --restoremissing platinum /dev/mapper/plt-0[2-9]</div></div><di=
v><br></div><div>After that when I ran pvs command the output shows me chec=
ksum error:</div><div><div>=C2=A0 /dev/mapper/plt-04: Checksum error</div><=
div>=C2=A0 /dev/mapper/plt-06: Checksum error</div><div>=C2=A0 /dev/mapper/=
plt-01: Checksum error</div><div>=C2=A0 Couldn&#39;t read volume group meta=
data.</div><div>=C2=A0 /dev/mapper/plt-02: Checksum error</div><div>=C2=A0 =
Couldn&#39;t read volume group metadata.</div><div>=C2=A0 /dev/mapper/plt-0=
3: Checksum error</div></div><div><br></div><div>I tried restore metadata w=
ithout success:</div><div><div># vgcfgrestore -f <a href=3D"http://platinum=
_02336-1600706364.vg">platinum_02336-1600706364.vg</a> platinum</div><div>=
=C2=A0 /dev/mapper/plt-03: Checksum error<br></div><div>=C2=A0 /dev/mapper/=
plt-22: Checksum error</div><div>=C2=A0 /dev/mapper/plt-19: Checksum error<=
/div><div>=C2=A0 /dev/mapper/plt-16: Checksum error</div><div>=C2=A0 /dev/m=
apper/plt-13: Checksum error</div><div>=C2=A0 /dev/mapper/plt-11: Checksum =
error</div><div>=C2=A0 /dev/mapper/plt-09: Checksum error</div><div>=C2=A0 =
/dev/mapper/plt-07: Checksum error</div><div>=C2=A0 /dev/mapper/plt-01: Che=
cksum error</div><div>=C2=A0 /dev/mapper/plt-05: Checksum error</div><div>=
=C2=A0 /dev/mapper/plt-25: Checksum error</div><div>=C2=A0 /dev/mapper/plt-=
23: Checksum error</div><div>=C2=A0 /dev/mapper/plt-20: Checksum error</div=
><div>=C2=A0 /dev/mapper/plt-17: Checksum error</div><div>=C2=A0 /dev/mappe=
r/plt-14: Checksum error</div><div>=C2=A0 /dev/mapper/plt-02: Checksum erro=
r</div><div>=C2=A0 /dev/mapper/plt-24: Checksum error</div><div>=C2=A0 /dev=
/mapper/plt-21: Checksum error</div><div>=C2=A0 /dev/mapper/plt-18: Checksu=
m error</div><div>=C2=A0 /dev/mapper/plt-12: Checksum error</div><div>=C2=
=A0 /dev/mapper/plt-10: Checksum error</div><div>=C2=A0 /dev/mapper/plt-08:=
 Checksum error</div><div>=C2=A0 /dev/mapper/plt-04: Checksum error</div><d=
iv>=C2=A0 /dev/mapper/plt-06: Checksum error</div><div>=C2=A0 Cannot restor=
e Volume Group platinum with 24 PVs marked as missing.</div><div>=C2=A0 Res=
tore failed.</div></div><div><br></div><div>Thanks for help me.</div></div>

--089e0158ab3ccc7da5050e8175db--
