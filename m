Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u119Hwbe023347
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 1 Feb 2016 04:17:58 -0500
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mx1.redhat.com (Postfix) with ESMTPS id 17A1A70D6F
	for <linux-lvm@redhat.com>; Mon,  1 Feb 2016 09:17:58 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id e32so113256410qgf.3
	for <linux-lvm@redhat.com>; Mon, 01 Feb 2016 01:17:58 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 1 Feb 2016 17:17:57 +0800
Message-ID: <CAAYit8TQRuUZjjRgMUsaQWNmTGmG824KEZZ8vyNDTG=OiDbObQ@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c1335250329c052ab1dcfb
Subject: [linux-lvm] LVM generates wrong low_water_mark value in thin-pool's
	table
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

--001a11c1335250329c052ab1dcfb
Content-Type: text/plain; charset=UTF-8

Hi,

I found that the <low_water_mark> parameter of thin-pool's table might be
wrong. In kernel, the this parameter is the number of free blocks. However,
LVM commit 99237f0908d87592815f4bdf3c239e8a108e835c sets this value as the
number of USED blocks, according
to activation_thin_pool_autoextend_threshold_CFG. Is that a bug?


Thanks,
Ming-Hung Tsai

--001a11c1335250329c052ab1dcfb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I found that the &lt;low_water_mark&gt; paramet=
er of thin-pool&#39;s table might be wrong.=C2=A0In kernel, the this parame=
ter is the number of free blocks. However, LVM commit 99237f0908d87592815f4=
bdf3c239e8a108e835c sets this value as the number of USED blocks, according=
 to=C2=A0activation_thin_pool_autoextend_threshold_CFG. Is that a bug?<div>=
<br></div><div><br></div><div>Thanks,</div><div>Ming-Hung Tsai</div><div><b=
r></div></div>

--001a11c1335250329c052ab1dcfb--
