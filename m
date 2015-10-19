Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9JD696X030943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2015 09:06:09 -0400
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mx1.redhat.com (Postfix) with ESMTPS id 0DB708C1D5
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2015 13:06:03 +0000 (UTC)
Received: by obbzf10 with SMTP id zf10so137645101obb.2
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2015 06:06:02 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 19 Oct 2015 15:06:02 +0200
Message-ID: <CAPrERe2dc0B=9_YN6sZ9SXKq2JqHQbLMaZYRtsQ1NywEKWxCJw@mail.gmail.com>
From: Marc Caubet <mcaubet@pic.es>
Content-Type: multipart/alternative; boundary=001a11c29a3aaa91da052274ce0d
Subject: [linux-lvm] LVM Cache Configuration issues
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

--001a11c29a3aaa91da052274ce0d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am testing LVM Cache but I am completely concerned about obtained iozone
results which are worse than without using an SSD card, so my guess is that
I am doing something wrong.

We have a machine with 2 storage devices sda (LSI Controller 1:
RAID6(16+2)+RAID6(16+2)) & sdb (LSI Controller 2: RAID6(16+2)+RAID6(16+2)),
6TB Disks. Hence, we have a ~384TB (sda =3D 192TB + sdb =3D 192TB)

On the other hand, we purchased a 400GB SSD card, which is shown as
/dev/nvme0n1. I created 2 partitions 356.61 GiB and 16.00 GiB. I guess this
shouldn't be necessary but I created a 16GiB partition for cache metadata.

vgcreate dcvg_a /dev/sda /dev/sdb
lvcreate -i 2 -I8192 -n dcpool -l 100%PVS -v dcvg_a /dev/sda /dev/sdb
lvcreate -n cache0meta -l 100%PVS dcvg_a /dev/nvme0n1p1
lvcreate -n cache0 -l 100%PVS dcvg_a /dev/nvme0n1p2
lvconvert --type cache-pool --poolmetadata dcvg_a/cache0meta dcvg_a/cache0

I also tried with a single SSD partition:

vgcreate dcvg_a /dev/sda /dev/sdb
lvcreate -n dcpool -l 100%PVS dcvg_a
lvcreate --type cache -l 100%PVS -n cache0 dcvg_a/dcpool /dev/nvme0n1

So here are my questions:
- I guess both methods are the same, isn't it? The main difference is to
define or not a specific/custom partition for the pool metadata.
- Are they correct and which method is the recommended with 1 SSD? Is there
any "this is the best" recommended setup?
- Default mode is 'writethrough' which should be safer, but I do not see
any improvement of performance on reads and neither on writes (I used
iozone). Instead of this, performance becomes really bad. Why?
- I would like to set up 'writeback', but for a single SSD (so no RAID1 for
SSD) which are the risks? I can expect that current data being written will
be lost, but no data corruption can be found in the Origin LV, isn't it?
- writethrough / writeback caches can be hot-removed from the LVM? As I can
see, it seems so.
- Any suggestions?

Thanks a lot for your help,
--=20
Marc Caubet Serrabou
PIC (Port d'Informaci=C3=B3 Cient=C3=ADfica)
Campus UAB, Edificio D
E-08193 Bellaterra, Barcelona
Tel: +34 93 581 33 22
Fax: +34 93 581 41 10
http://www.pic.es
Avis - Aviso - Legal Notice: http://www.ifae.es/legal.html

--001a11c29a3aaa91da052274ce0d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I am testing LVM Cache but=
 I am completely concerned about obtained iozone results which are worse th=
an without using an SSD card, so my guess is that I am doing something wron=
g.<br><br></div>We have a machine with 2 storage devices sda (LSI Controlle=
r 1: RAID6(16+2)+RAID6(16+2)) &amp; sdb (LSI Controller 2: RAID6(16+2)+RAID=
6(16+2)), 6TB Disks. Hence, we have a ~384TB (sda =3D 192TB + sdb =3D 192TB=
)<br><br></div>On the other hand, we purchased a 400GB SSD card, which is s=
hown as /dev/nvme0n1. I created 2 partitions 356.61 GiB and 16.00 GiB. I gu=
ess this shouldn&#39;t be necessary but I created a 16GiB partition for cac=
he metadata.<br><div><br>vgcreate dcvg_a /dev/sda /dev/sdb<br>  lvcreate -i=
 2 -I8192 -n dcpool -l 100%PVS -v dcvg_a /dev/sda /dev/sdb<br>lvcreate -n c=
ache0meta -l 100%PVS dcvg_a /dev/nvme0n1p1 <br>lvcreate -n cache0 -l 100%PV=
S dcvg_a /dev/nvme0n1p2 <br> <span class=3D"">lvconvert</span> --type cache=
-pool --poolmetadata dcvg_a/cache0meta dcvg_a/cache0<br><br></div><div>I al=
so tried with a single SSD partition:<br></div><div><br>vgcreate dcvg_a /de=
v/sda /dev/sdb<br>lvcreate -n dcpool -l 100%PVS dcvg_a<br>lvcreate --type c=
ache -l 100%PVS -n cache0 dcvg_a/dcpool /dev/nvme0n1<br><div><div><br></div=
><div>So here are my questions:<br></div><div>- I guess both methods are th=
e same, isn&#39;t it? The main difference is to define or not a specific/cu=
stom partition for the pool metadata.<br>- Are they correct and which metho=
d is the recommended with 1 SSD? Is there any &quot;this is the best&quot; =
recommended setup?<br></div><div>- Default mode is &#39;writethrough&#39; w=
hich should be safer, but I do not see any improvement of performance on re=
ads and neither on writes (I used iozone). Instead of this, performance bec=
omes really bad. Why?<br></div><div>- I would like to set up &#39;writeback=
&#39;, but for a single SSD (so no RAID1 for SSD) which are the risks? I ca=
n expect that current data being written will be lost, but no data corrupti=
on can be found in the Origin LV, isn&#39;t it?<br></div><div>- writethroug=
h / writeback caches can be hot-removed from the LVM? As I can see, it seem=
s so.<br></div><div>- Any suggestions?<br><br></div><div>Thanks a lot for y=
our help,<br><div><div>-- <br><div class=3D"gmail_signature">Marc Caubet Se=
rrabou<br>PIC (Port d&#39;Informaci=C3=B3 Cient=C3=ADfica)<br>Campus UAB, E=
dificio D<br>E-08193 Bellaterra, Barcelona<br>Tel: +34 93 581 33 22<br>Fax:=
 +34 93 581 41 10<br><a href=3D"http://www.pic.es" target=3D"_blank">http:/=
/www.pic.es</a><br>Avis - Aviso - Legal Notice: <a href=3D"http://www.ifae.=
es/legal.html" target=3D"_blank">http://www.ifae.es/legal.html</a></div>
</div></div></div></div></div></div>

--001a11c29a3aaa91da052274ce0d--
