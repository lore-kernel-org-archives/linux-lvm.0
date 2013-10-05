Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r952veum031924
	for <linux-lvm@redhat.com>; Fri, 4 Oct 2013 22:57:40 -0400
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r952vdov008238
	for <linux-lvm@redhat.com>; Fri, 4 Oct 2013 22:57:39 -0400
Received: by mail-pb0-f45.google.com with SMTP id mc17so4759583pbc.4
	for <linux-lvm@redhat.com>; Fri, 04 Oct 2013 19:57:38 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 4 Oct 2013 19:50:18 -0700
Message-ID: <CAH5g0259C2gvAJMcjZgXSru-hygfsFFcq-U6d=89Q3QncfSk4Q@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b4187ebb8097504e7f57a31
Subject: [linux-lvm] Destroyed partition on one PV
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

--047d7b4187ebb8097504e7f57a31
Content-Type: text/plain; charset=ISO-8859-1

I went through this once before a long time ago, but can't seem to find the
notes on what I did. So, asking again (sorry):

I have (had?) a vg with 5 pv's, and one lv with 3 of those. I accidentally
(isn't that always the case) destroyed the partitions on 1 of them, and
maybe some of the data as well.

I tried to recreate one of the pv's:

[root@elmer ken]# pvcreate --uuid "LTXsEX-QpJN-tM2F-2CP1-wHSP-JcUa-Rnnlju"
--restorefile /etc/lvm/archive/VG_NAS_00003-846081755.vg /dev/sdb
  Couldn't find device with uuid LTXsEX-QpJN-tM2F-2CP1-wHSP-JcUa-Rnnlju.
  Couldn't find device with uuid Tnw4jr-SPj1-ChV7-k6Rz-ytWt-MtDD-lHso13.
  Couldn't find device with uuid GQivgz-fh47-z2pF-kWQD-4khT-aRKz-flcvIs.
  Couldn't find device with uuid 67IRC3-kmhr-Lo94-N4H4-C6mJ-NkZ7-KVEubc.
  Device /dev/sdb not found (or ignored by filtering).
[root@elmer ken]# fdisk -l /dev/sdb

WARNING: GPT (GUID Partition Table) detected on '/dev/sdb'! The util fdisk
doesn't support GPT. Use GNU Parted.


Disk /dev/sdb: 3000.6 GB, 3000592982016 bytes
255 heads, 63 sectors/track, 364801 cylinders, total 5860533168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk identifier: 0x00000000

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1  4294967295  2147483647+  ee  GPT
Partition 1 does not start on physical sector boundary.
[root@elmer ken]#

Not good is it. I get the same thing for the other drive.

I think last time I just bit the bullet, and activated the partial VG/LV,
ran e2fsck to fix what was left of the filesystem, with files recovered
into trash.

Is that the best solution?

Any help with this would be greatly appreciated.

TIA

ken

--047d7b4187ebb8097504e7f57a31
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div>I went t=
hrough this once before a long time ago, but can&#39;t seem to find the not=
es on what I did. So, asking again (sorry):<br><br></div>I have (had?) a vg=
 with 5 pv&#39;s, and one lv with 3 of those. I accidentally (isn&#39;t tha=
t always the case) destroyed the partitions on 1 of them, and maybe some of=
 the data as well.<br>
<br></div>I tried to recreate one of the pv&#39;s:<br><br></div></div></div=
>[root@elmer ken]# pvcreate --uuid &quot;LTXsEX-QpJN-tM2F-2CP1-wHSP-JcUa-Rn=
nlju&quot; --restorefile /etc/lvm/archive/VG_NAS_00003-846081755.vg /dev/sd=
b<br>
=A0 Couldn&#39;t find device with uuid LTXsEX-QpJN-tM2F-2CP1-wHSP-JcUa-Rnnl=
ju.<br>=A0 Couldn&#39;t find device with uuid Tnw4jr-SPj1-ChV7-k6Rz-ytWt-Mt=
DD-lHso13.<br>=A0 Couldn&#39;t find device with uuid GQivgz-fh47-z2pF-kWQD-=
4khT-aRKz-flcvIs.<br>
=A0 Couldn&#39;t find device with uuid 67IRC3-kmhr-Lo94-N4H4-C6mJ-NkZ7-KVEu=
bc.<br>=A0 Device /dev/sdb not found (or ignored by filtering).<br>[root@el=
mer ken]# fdisk -l /dev/sdb<br><br>WARNING: GPT (GUID Partition Table) dete=
cted on &#39;/dev/sdb&#39;! The util fdisk doesn&#39;t support GPT. Use GNU=
 Parted.<br>
<br><br>Disk /dev/sdb: 3000.6 GB, 3000592982016 bytes<br>255 heads, 63 sect=
ors/track, 364801 cylinders, total 5860533168 sectors<br>Units =3D sectors =
of 1 * 512 =3D 512 bytes<br>Sector size (logical/physical): 512 bytes / 409=
6 bytes<br>
I/O size (minimum/optimal): 4096 bytes / 4096 bytes<br>Disk identifier: 0x0=
0000000<br><br>=A0=A0 Device Boot=A0=A0=A0=A0=A0 Start=A0=A0=A0=A0=A0=A0=A0=
=A0 End=A0=A0=A0=A0=A0 Blocks=A0=A0 Id=A0 System<br>/dev/sdb1=A0=A0 *=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1=A0 4294967295=A0 2147483647+=A0 ee=A0 GPT<br>Par=
tition 1 does not start on physical sector boundary.<br>
[root@elmer ken]# <br><br></div>Not good is it. I get the same thing for th=
e other drive.<br><br></div>I think last time I just bit the bullet, and ac=
tivated the partial VG/LV, ran e2fsck to fix what was left of the filesyste=
m, with files recovered into trash.<br>
<br></div>Is that the best solution? <br><br></div>Any help with this would=
 be greatly appreciated.<br><br></div>TIA<br><br>ken<br><br><div><div><div>=
<div><div><br></div></div></div></div></div></div>

--047d7b4187ebb8097504e7f57a31--
