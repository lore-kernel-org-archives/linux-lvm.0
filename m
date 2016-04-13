Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3DEU3Vc030440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2016 10:30:03 -0400
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8AAB51F
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2016 14:30:01 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a140so105030916wma.0
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2016 07:30:01 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 13 Apr 2016 16:30:00 +0200
Message-ID: <CANvCAA8ehAT5Y20hjv9uCCRCvNTTRTLna0CBJhDQUEkOc0mZJw@mail.gmail.com>
From: Tomas Dalebjork <tomas.dalebjork@repostor.com>
Content-Type: multipart/alternative; boundary=047d7ba975e4db0c7b05305e9c87
Subject: [linux-lvm] Invalid property name or unable to query'lv_attr',
	errno = 22.
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

--047d7ba975e4db0c7b05305e9c87
Content-Type: text/plain; charset=UTF-8

Hi,

We are trying to use the lvm2api, which works fine on RHEL6.
But on some RHEL7 systems, we receive this error:


*Invalid property name or unable to query'lv_attr', errno = 22.*
What can possible be wrong with this?

Regards Tomas

--047d7ba975e4db0c7b05305e9c87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi,<br><br></div>We are trying to use =
the lvm2api, which works fine on RHEL6.<br></div>But on some RHEL7 systems,=
 we receive this error:<br><br><b><span style=3D"color:rgb(255,0,0)">Invali=
d property name or unable to query&#39;lv_attr&#39;, errno =3D 22.<br></spa=
n></b><br></div>What can possible be wrong with this?<br><br></div>Regards =
Tomas<br></div>

--047d7ba975e4db0c7b05305e9c87--
