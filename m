Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o84LIIUc015516
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2010 17:18:18 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o84LI8kd009358
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2010 17:18:08 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o84LI7th013378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2010 17:18:07 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o84LI7pE007479
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2010 17:18:07 -0400
Date: Sat, 4 Sep 2010 17:18:07 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4c8249ae.07c1640a.2f38.ffff91c3@mx.google.com>
Message-ID: <Pine.LNX.4.64.1009041714390.7372@bmsred.bmsi.com>
References: <4c8249ae.07c1640a.2f38.ffff91c3@mx.google.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463799287-724678839-1283635087=:7372"
Subject: Re: [linux-lvm] Important diretories are missing after adding space.
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463799287-724678839-1283635087=:7372
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> # pvs
> =EF=BF=BD PV=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD VG=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD Fmt=EF=BF=BD Attr PSize=EF=BF=BD=EF=BF=BD PF=
ree=EF=BF=BD
> =EF=BF=BD /dev/hdc1=EF=BF=BD VG_Storage00 lvm2 a-=EF=BF=BD=EF=BF=BD=EF=BF=
=BD 74.53G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> =EF=BF=BD /dev/hdc2=EF=BF=BD VG_backup=EF=BF=BD=EF=BF=BD=EF=BF=BD lvm2 a-=
=EF=BF=BD=EF=BF=BD=EF=BF=BD 74.52G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 0
> =EF=BF=BD /dev/hdd1=EF=BF=BD VG_Storage00 lvm2 a-=EF=BF=BD=EF=BF=BD=EF=BF=
=BD 74.53G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> =EF=BF=BD /dev/hdd2=EF=BF=BD VG_backup=EF=BF=BD=EF=BF=BD=EF=BF=BD lvm2 a-=
=EF=BF=BD=EF=BF=BD=EF=BF=BD 74.52G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 0
> =EF=BF=BD /dev/hdd3=EF=BF=BD VG_backup=EF=BF=BD=EF=BF=BD=EF=BF=BD lvm2 a-=
=EF=BF=BD=EF=BF=BD=EF=BF=BD 83.83G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 0
> =EF=BF=BD /dev/sda2=EF=BF=BD VG_SYS=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD lvm2 a-=EF=BF=BD=EF=BF=BD 148.95G=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD 0
> =EF=BF=BD /dev/sdb1=EF=BF=BD VG_Storage=EF=BF=BD=EF=BF=BD lvm2 a-=EF=BF=
=BD=EF=BF=BD 465.67G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> =EF=BF=BD /dev/sdb5=EF=BF=BD VG_Storage=EF=BF=BD=EF=BF=BD lvm2 a-=EF=BF=
=BD=EF=BF=BD 465.67G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> =EF=BF=BD /dev/sdb6=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD lv=
m2 --=EF=BF=BD=EF=BF=BD 465.93G 465.93G

There are several things I am suspicious about, but I would like to see
the output of "sfdisk -l /dev/sdb".  sdb1 wouldn't by any chance, be
an extended partition?

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
---1463799287-724678839-1283635087=:7372--
