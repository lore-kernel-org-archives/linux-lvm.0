Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0F1ckXb022664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 14 Jan 2016 20:38:46 -0500
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mx1.redhat.com (Postfix) with ESMTPS id 4AF1932D3AF
	for <linux-lvm@redhat.com>; Fri, 15 Jan 2016 01:38:45 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l65so2602618wmf.1
	for <linux-lvm@redhat.com>; Thu, 14 Jan 2016 17:38:45 -0800 (PST)
MIME-Version: 1.0
From: Bryan Larsen <bryan@larsen.st>
Date: Fri, 15 Jan 2016 01:38:34 +0000
Message-ID: <CAJbEnTzHEWiFB9LAhvqWwiX4kUXwjLvBZf8Ek4cdVmD1=kG4EQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7b3a86bcb459e70529557665
Subject: [linux-lvm] device failure during pvmove
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

--047d7b3a86bcb459e70529557665
Content-Type: text/plain; charset=UTF-8

I was in the process of doing a pvmove from /dev/md3 to a new, blank
/dev/md1 when /dev/md1 failed due to operator stupidity.

I tried doing a pvmove abort, but it complains about a missing device.   It
suggests doing a vgreduce --removemissing but that refuses to proceed
without a --force because pvmove has placed data onto the broken and
missing /dev/md1.

So theoretically all my data should still be available on /dev/md3.   Any
hints on how to proceed?

Sorry for the inexact messages, the failed machine no longer has a root
partition so is only accessible from the console.

thanks,
Bryan

--047d7b3a86bcb459e70529557665
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was in the process of doing a pvmove from /dev/md3 =
to a new, blank /dev/md1 when /dev/md1 failed due to operator stupidity.</d=
iv><div><br></div><div>I tried doing a pvmove abort, but it complains about=
 a missing device. =C2=A0 It suggests doing a vgreduce --removemissing but =
that refuses to proceed without a --force because pvmove has placed data on=
to the broken and missing /dev/md1.</div><div><br></div><div>So theoretical=
ly all my data should still be available on /dev/md3. =C2=A0 Any hints on h=
ow to proceed?</div><div><br></div><div>Sorry for the inexact messages, the=
 failed machine no longer has a root partition so is only accessible from t=
he console.</div><div><br></div><div>thanks,</div><div>Bryan</div><div><br>=
</div></div>

--047d7b3a86bcb459e70529557665--
