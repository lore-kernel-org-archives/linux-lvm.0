Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7SNtajU020486
	for <linux-lvm@redhat.com>; Thu, 28 Aug 2014 19:55:36 -0400
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7SNtYGt029988
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 28 Aug 2014 19:55:35 -0400
Received: by mail-oi0-f53.google.com with SMTP id i138so1115509oig.12
	for <linux-lvm@redhat.com>; Thu, 28 Aug 2014 16:55:34 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 28 Aug 2014 16:55:34 -0700
Message-ID: <CAA8m+Y1g8kiDYpokygSB0Z68aOwMqZVFgDy462zdVw+khZBfAg@mail.gmail.com>
From: Pirate Fibonacci <pirate112358@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b4727f4c5573b0501b945f4
Subject: [linux-lvm] python lvm2 calls sometimes Failed to initialize VG
	Handle.
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

--047d7b4727f4c5573b0501b945f4
Content-Type: text/plain; charset=UTF-8

All,

new install of host.
created volume group, no lvm
I have a class that scans and stores all volumes on init and keeps copy
in it's instance. class has handle error first time only. the second time
I create an instance of it, lvm2 is ok with the same calls.

suggestions?


from volume import *
>>> v = volume()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "volume.py", line 21, in __init__
    self.lv_list_obj[volume_group]  = vg.lvscan()
  File "/usr/lib/python2.7/site-packages/lvm2py/vg.py", line 429, in lvscan
    self.open()
  File "/usr/lib/python2.7/site-packages/lvm2py/vg.py", line 80, in open
    raise HandleError("Failed to initialize VG Handle.")
lvm2py.exception.HandleError: Failed to initialize VG Handle.
>>> v = volume()
>>>

thanks

Jeff

--047d7b4727f4c5573b0501b945f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><br></div>All,<br><br></div>=
new install of host.<br></div>created volume group, no lvm<br></div>I have =
a class that scans and stores all volumes on init and keeps copy<br></div>
in it&#39;s instance. class has handle error first time only. the second ti=
me <br></div>I create an instance of it, lvm2 is ok with the same calls. <b=
r><div><br></div><div>suggestions?<br></div><div><br><br><div><div><div>
<div><div>from volume import *<br>&gt;&gt;&gt; v =3D volume()<br>Traceback =
(most recent call last):<br>=C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, =
in &lt;module&gt;<br>=C2=A0 File &quot;volume.py&quot;, line 21, in __init_=
_<br>=C2=A0=C2=A0=C2=A0 self.lv_list_obj[volume_group]=C2=A0 =3D vg.lvscan(=
)<br>
=C2=A0 File &quot;/usr/lib/python2.7/site-packages/lvm2py/vg.py&quot;, line=
 429, in lvscan<br>=C2=A0=C2=A0=C2=A0 self.open()<br>=C2=A0 File &quot;/usr=
/lib/python2.7/site-packages/lvm2py/vg.py&quot;, line 80, in open<br>=C2=A0=
=C2=A0=C2=A0 raise HandleError(&quot;Failed to initialize VG Handle.&quot;)=
<br>
lvm2py.exception.HandleError: Failed to initialize VG Handle.<br>&gt;&gt;&g=
t; v =3D volume()<br>&gt;&gt;&gt;<br><br><div>thanks<br><br></div><div>Jeff=
<br></div></div></div></div></div></div></div></div>

--047d7b4727f4c5573b0501b945f4--
