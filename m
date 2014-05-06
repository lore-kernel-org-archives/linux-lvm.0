Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s46FsON9024913
	for <linux-lvm@redhat.com>; Tue, 6 May 2014 11:54:24 -0400
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s46FsLY3013152
	for <linux-lvm@redhat.com>; Tue, 6 May 2014 11:54:22 -0400
Received: by mail-ob0-f177.google.com with SMTP id gq1so2657050obb.36
	for <linux-lvm@redhat.com>; Tue, 06 May 2014 08:54:21 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 6 May 2014 17:54:21 +0200
Message-ID: <CAPrERe1-+T+PpQ1gTBUSKzCjKn498TbH45Jnsrf5hrLLHgUiqA@mail.gmail.com>
From: Marc Caubet <mcaubet@pic.es>
Content-Type: multipart/alternative; boundary=089e015372c6e05b0e04f8bd425e
Subject: [linux-lvm] Alignment: XFS + LVM2
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

--089e015372c6e05b0e04f8bd425e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I am trying to setup a storage pool with correct disk alignment and I hope
somebody can help me to understand some unclear parts to me when
configuring XFS over LVM2.

Actually we have few storage pools with the following settings each:

- LSI Controller with 3xRAID6
- Each RAID6 is configured with 10 data disks + 2 for double-parity.
- Each disk has a capacity of 4TB, 512e and physical sector size of 4K.
- 3x(10+2) configuration was considered in order to gain best performance
and data safety (less disks per RAID less probability of data corruption)

From the O.S. side we see:

[root@stgpool01 ~]# fdisk -l /dev/sda /dev/sdb /dev/sdc

Disk /dev/sda: 40000.0 GB, 39999997214720 bytes
255 heads, 63 sectors/track, 4863055 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk identifier: 0x00000000

Disk /dev/sdb: 40000.0 GB, 39999997214720 bytes
255 heads, 63 sectors/track, 4863055 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk identifier: 0x00000000

Disk /dev/sdc: 40000.0 GB, 39999997214720 bytes
255 heads, 63 sectors/track, 4863055 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk identifier: 0x00000000

The idea is to aggregate the above devices and show only 1 storage space.
We did as follows:

vgcreate dcvg_a /dev/sda /dev/sdb /dev/sdc
lvcreate -i 3 -I 4096 -n dcpool -l 100%FREE -v dcvg_a

Hence, stripe of the 3 RAID6 in a LV.

And here is my first question: How can I check if the storage and the LV
are correctly aligned?

On the other hand, I have formatted XFS as follows:

mkfs.xfs -d su=3D256k,sw=3D10 -l size=3D128m,lazy-count=3D1 /dev/dcvg_a/dcp=
ool

So my second question is, are the above 'su' and 'sw' parameters correct on
the current LV configuration? If not, which values should I have and why?
AFAIK su is the stripe size configured in the controller side, but in this
case we have a LV. Also, sw is the number of data disks in a RAID, but
again, we have a LV with 3 stripes, and I am not sure if the number of data
disks should be 30 instead.

Thanks a lot,
--=20
Marc Caubet Serrabou
PIC (Port d'Informaci=C3=B3 Cient=C3=ADfica)
Campus UAB, Edificio D
E-08193 Bellaterra, Barcelona
Tel: +34 93 581 33 22
Fax: +34 93 581 41 10
http://www.pic.es
Avis - Aviso - Legal Notice: http://www.ifae.es/legal.html

--089e015372c6e05b0e04f8bd425e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi all,<br><br></div><div>I am trying to se=
tup a storage pool with correct disk alignment and I hope somebody can help=
 me to understand some unclear parts to me when configuring XFS over LVM2.<=
br>
</div><div><br></div>Actually we have few storage pools with the following =
settings each:<br><br></div>- LSI Controller with 3xRAID6<br>- Each RAID6 i=
s configured with 10 data disks + 2 for double-parity. <br>- Each disk has =
a capacity of 4TB, 512e and physical sector size of 4K. <br>
</div><div>- 3x(10+2) configuration was considered in order to gain best pe=
rformance and data safety (less disks per RAID less probability of data cor=
ruption)<br></div><div><br>From the O.S. side we see:<br><span style=3D"fon=
t-family:courier new,monospace"><br>
[root@stgpool01 ~]# fdisk -l /dev/sda /dev/sdb /dev/sdc <br><br>Disk /dev/s=
da: 40000.0 GB, 39999997214720 bytes<br>255 heads, 63 sectors/track, 486305=
5 cylinders<br>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>Sect=
or size (logical/physical): 512 bytes / 4096 bytes<br>
I/O size (minimum/optimal): 4096 bytes / 4096 bytes<br>Disk identifier: 0x0=
0000000<br><br>Disk /dev/sdb: 40000.0 GB, 39999997214720 bytes<br>255 heads=
, 63 sectors/track, 4863055 cylinders<br>Units =3D cylinders of 16065 * 512=
 =3D 8225280 bytes<br>
Sector size (logical/physical): 512 bytes / 4096 bytes<br>I/O size (minimum=
/optimal): 4096 bytes / 4096 bytes<br>Disk identifier: 0x00000000<br><br>Di=
sk /dev/sdc: 40000.0 GB, 39999997214720 bytes<br>255 heads, 63 sectors/trac=
k, 4863055 cylinders<br>
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>Sector size (logica=
l/physical): 512 bytes / 4096 bytes<br>I/O size (minimum/optimal): 4096 byt=
es / 4096 bytes<br>Disk identifier: 0x00000000</span><br></div><div><div><d=
iv>
<div><div><br>The idea is to aggregate the above devices and show only 1 st=
orage space. We did as follows:<br><br><span style=3D"font-family:courier n=
ew,monospace">vgcreate dcvg_a /dev/sda /dev/sdb /dev/sdc<br>lvcreate -i 3 -=
I 4096 -n dcpool -l 100%FREE -v dcvg_a			</span><br>
<br></div><div>Hence, stripe of the 3 RAID6 in a LV. <br></div><div><br>And=
 here is my first question: How can I check if the storage and the LV are c=
orrectly aligned?<br></div><div><br></div><div>On the other hand, I have fo=
rmatted XFS as follows:<br>
<br><span style=3D"font-family:courier new,monospace">mkfs.xfs -d su=3D256k=
,sw=3D10 -l size=3D128m,lazy-count=3D1 /dev/dcvg_a/dcpool</span><br><br></d=
iv><div>So my second question is, are the above &#39;su&#39; and &#39;sw&#3=
9; parameters correct on the current LV configuration? If not, which values=
 should I have and why? AFAIK su is the stripe size configured in the contr=
oller side, but in this case we have a LV. Also, sw is the number of data d=
isks in a RAID, but again, we have a LV with 3 stripes, and I am not sure i=
f the number of data disks should be 30 instead.<br>
<br></div><div>Thanks a lot,<br>-- <br>Marc Caubet Serrabou<br>PIC (Port d&=
#39;Informaci=C3=B3 Cient=C3=ADfica)<br>Campus UAB, Edificio D<br>E-08193 B=
ellaterra, Barcelona<br>Tel: +34 93 581 33 22<br>Fax: +34 93 581 41 10<br><=
a href=3D"http://www.pic.es" target=3D"_blank">http://www.pic.es</a><br>
Avis - Aviso - Legal Notice: <a href=3D"http://www.ifae.es/legal.html" targ=
et=3D"_blank">http://www.ifae.es/legal.html</a>
</div></div></div></div></div></div>

--089e015372c6e05b0e04f8bd425e--
