Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2FD3B04024100
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2015 09:03:12 -0400
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2FD39LV006562
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2015 09:03:10 -0400
Received: by qgez64 with SMTP id z64so20644293qge.2
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2015 06:03:09 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 15 Mar 2015 14:03:09 +0100
Message-ID: <CANvCAA9qEJQUFbFh6X6BVPO2uo2+ELQZp0Fi_wQr34JyvkaHOA@mail.gmail.com>
From: Tomas Dalebjork <tomas.dalebjork@repostor.com>
Content-Type: multipart/alternative; boundary=001a11c16fa0f8875e0511535a86
Subject: [linux-lvm] device-mapper: snapshots: Invalidating snapshot: Unable
	to allocate exception.
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
Cc: Lars <lars.i.johansson@delecsys.se>

--001a11c16fa0f8875e0511535a86
Content-Type: text/plain; charset=UTF-8

Hi,

We have configured /etc/lvm/lvm.conf to extend our snapshot automatically.
This works fine for slow growing volumes, but if the growth of the volume
is faster, than LVM invalidate the snapshot rather than extend the snapshot
volume.
Because I think that the lvm-monitor does not grow the volume in time.

This is the error we see in kernel log (dmesg)
device-mapper: snapshots: Invalidating snapshot: Unable to allocate
exception.

Our snapshot volume is 1GB
Our extension is configured like this in /etc/lvm/lvm.conf

    snapshot_autoextend_threshold = 50
    snapshot_autoextend_percent = 20

And we have restarted lvm2-monitor services after this changes using
# service lvm2-monitor restart

Other slow growing volumes works fine.

Can someone hint us of what the issue can be, or how to mitigate this to
happen?
Or tell me how often the "lvm2-monitor" is checking the utilization
threashold of the volumes?

Regards Tomas

--001a11c16fa0f8875e0511535a86
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div>Hi,<br><=
br></div>We have configured /etc/lvm/lvm.conf to extend our snapshot automa=
tically.<br></div>This works fine for slow growing volumes, but if the grow=
th of the volume is faster, than LVM invalidate the snapshot rather than ex=
tend the snapshot volume.<br>Because I think that the lvm-monitor does not =
grow the volume in time.<br><br>This is the error we see in kernel log (dme=
sg)<br><span style=3D"font-family:monospace,monospace">device-mapper: snaps=
hots: Invalidating snapshot: Unable to allocate exception.<br></span><br></=
div>Our snapshot volume is 1GB<br></div>Our extension is configured like th=
is in /<span style=3D"font-family:monospace,monospace">etc/lvm/lvm.conf</sp=
an><br><br><span style=3D"font-family:monospace,monospace">=C2=A0=C2=A0=C2=
=A0 snapshot_autoextend_threshold =3D 50<br>=C2=A0=C2=A0=C2=A0 snapshot_aut=
oextend_percent =3D 20</span><br><br></div>And we have restarted lvm2-monit=
or services after this changes using<br></div><span style=3D"font-family:mo=
nospace,monospace"># service lvm2-monitor restart<br></span><br></div>Other=
 slow growing volumes works fine.<br><br></div>Can someone hint us of what =
the issue can be, or how to mitigate this to happen?<br></div>Or tell me ho=
w often the &quot;lvm2-monitor&quot; is checking the utilization threashold=
 of the volumes?<br><br></div>Regards Tomas<br></div>

--001a11c16fa0f8875e0511535a86--
