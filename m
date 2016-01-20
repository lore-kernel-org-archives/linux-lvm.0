Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0KCJO7Y004381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 07:19:24 -0500
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mx1.redhat.com (Postfix) with ESMTPS id 40A3C8F025
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 12:19:23 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id t15so100283821igr.0
	for <linux-lvm@redhat.com>; Wed, 20 Jan 2016 04:19:23 -0800 (PST)
MIME-Version: 1.0
From: Bryan Larsen <bryan@larsen.st>
Date: Wed, 20 Jan 2016 12:19:13 +0000
Message-ID: <CAJbEnTyXh8t6o5de6dFfWqSBLuemHE3rkJkA5StQR27f1NOvkA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e013a06bc067cde0529c2ffb2
Subject: [linux-lvm] -l 100%FREE doesn't work with RAID1
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

--089e013a06bc067cde0529c2ffb2
Content-Type: text/plain; charset=UTF-8

I'm setting up some provisioning scripts, so I don't know the actual sizes
of the hard drives

$ sudo lvcreate --type raid1 -m 1 -l 100%FREE -n backups hdd_vg
  Insufficient free space: 781320 extents needed, but only 390658 available
$ sudo lvcreate --type raid1 -m 1 -l 50%FREE -n backups hdd_vg
  Insufficient free space: 390662 extents needed, but only 390658 available

thoughts?

thanks,
Bryan

--089e013a06bc067cde0529c2ffb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m setting up some provisioning scripts, so I do=
n&#39;t know the actual sizes of the hard drives</div><div><br></div><div>$=
 sudo lvcreate --type raid1 -m 1 -l 100%FREE -n backups hdd_vg</div><div>=
=C2=A0 Insufficient free space: 781320 extents needed, but only 390658 avai=
lable</div><div>$ sudo lvcreate --type raid1 -m 1 -l 50%FREE -n backups hdd=
_vg</div><div>=C2=A0 Insufficient free space: 390662 extents needed, but on=
ly 390658 available</div><div><br></div><div>thoughts?</div><div><br></div>=
<div>thanks,</div><div>Bryan</div></div>

--089e013a06bc067cde0529c2ffb2--
