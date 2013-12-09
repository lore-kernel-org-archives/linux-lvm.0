Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rB9FDE0j010941
	for <linux-lvm@redhat.com>; Mon, 9 Dec 2013 10:13:14 -0500
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB9FDDCl014432
	for <linux-lvm@redhat.com>; Mon, 9 Dec 2013 10:13:13 -0500
Received: by mail-ie0-f181.google.com with SMTP id e14so6259738iej.40
	for <linux-lvm@redhat.com>; Mon, 09 Dec 2013 07:13:13 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 9 Dec 2013 20:13:13 +0500
Message-ID: <CAAKRE70EMS2i43Em_LiX3P7zJ7hR1KW5pL4Jxvjk9VSdLvnr=A@mail.gmail.com>
From: Umar Draz <unix.co@gmail.com>
Content-Type: multipart/alternative; boundary=089e01494f6e46820204ed1b6f1f
Subject: [linux-lvm] dev node change
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

--089e01494f6e46820204ed1b6f1f
Content-Type: text/plain; charset=ISO-8859-1

Hi All

I have a SCSI share which i am  using linux initiator on my ubuntu. Its
available for me in /dev/sdb

No I have created lvm group using the /dev/sdb. Today I just logut and
login my scsi share but this time ubutnu gave me this as /dev/sdc instead
of /dev/sdb.

due to this my lvm group is stuck, and its giving me the error

Input/output error

on pvdisplay or vgdisplay,

Any body help me how I can reslove this issue.?

Br.

Umar

--089e01494f6e46820204ed1b6f1f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All<div><br></div><div>I have a SCSI share which i am =
=A0using linux initiator on my ubuntu. Its available for me in /dev/sdb</di=
v><div><br></div><div>No I have created lvm group using the /dev/sdb. Today=
 I just logut and login my scsi share but this time ubutnu gave me this as =
/dev/sdc instead of /dev/sdb.</div>
<div><br></div><div>due to this my lvm group is stuck, and its giving me th=
e error</div><div><br></div><div><div>Input/output error</div></div><div><b=
r></div><div>on pvdisplay or vgdisplay,</div><div><br></div><div>Any body h=
elp me how I can reslove this issue.?</div>
<div><br></div><div>Br.</div><div><br></div><div>Umar</div></div>

--089e01494f6e46820204ed1b6f1f--
