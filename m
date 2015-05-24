Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4OGWvru021361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 24 May 2015 12:32:57 -0400
Received: from mail-vn0-f52.google.com (mail-vn0-f52.google.com
	[209.85.216.52])
	by mx1.redhat.com (Postfix) with ESMTPS id E5B068EFF7
	for <linux-lvm@redhat.com>; Sun, 24 May 2015 16:32:47 +0000 (UTC)
Received: by vnbf1 with SMTP id f1so4054156vnb.6
	for <linux-lvm@redhat.com>; Sun, 24 May 2015 09:32:47 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Chewning <ryan.chewning@gmail.com>
Date: Sun, 24 May 2015 12:32:16 -0400
Message-ID: <CAA1e9_Pf_dkXeGGwYDjvkc5MfXkAHtA6Fx02Dt1-4VRrmk5Gng@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e0163526684d6040516d671b7
Subject: [linux-lvm] Removing failed lv cache pool from orgin lv
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

--089e0163526684d6040516d671b7
Content-Type: text/plain; charset=UTF-8

Hi,

Through my own bone headed mistake I lost/formatted the PV that holds the
cache pool LV and cache pool meta data LV while upgrading the hard drive in
my laptop. Is there a way to forcefully mount the origin LV without the
cache pool being available? Or a way to forcefully remove the caching from
the origin LV?

Distro: Debian 8
Kernel: 4.0.0.1
LVM2: 2.02.111


Please let me know if there is any additional information that is needed.

Thank you,

Ryan

--089e0163526684d6040516d671b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Through my own bone headed mistake =
I lost/formatted the PV that holds the cache pool LV and cache pool meta da=
ta LV while upgrading the hard drive in my laptop. Is there a way to forcef=
ully mount the origin LV without the cache pool being available? Or a way t=
o forcefully remove the caching from the origin LV?<div><div class=3D"gmail=
_signature"><div dir=3D"ltr"></div></div></div>
</div><div><br></div><div>Distro: Debian 8</div><div>Kernel: 4.0.0.1<br></d=
iv><div>LVM2: 2.02.111</div><div><br></div><div><br></div><div>Please let m=
e know if there is any additional information that is needed.</div><div><br=
></div><div>Thank you,</div><div><br></div><div>Ryan</div></div>

--089e0163526684d6040516d671b7--
