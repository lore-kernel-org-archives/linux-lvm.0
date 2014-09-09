Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s89Lek8h007239
	for <linux-lvm@redhat.com>; Tue, 9 Sep 2014 17:40:46 -0400
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s89LeijF026585
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 9 Sep 2014 17:40:44 -0400
Received: by mail-qg0-f45.google.com with SMTP id j107so4845395qga.32
	for <linux-lvm@redhat.com>; Tue, 09 Sep 2014 14:40:44 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 9 Sep 2014 14:40:43 -0700
Message-ID: <CAA8m+Y3xrfXNONGtyAw_8UuGeunBL6Wp5yE-Y39P4ALuhY10dg@mail.gmail.com>
From: Pirate Fibonacci <pirate112358@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3d8d49f1a630502a8c9c8
Subject: [linux-lvm] lvm2 lvmetad hangs with 100% cpu
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

--001a11c3d8d49f1a630502a8c9c8
Content-Type: text/plain; charset=UTF-8

All,

I'm using fedora20. fresh install. I start with an empty volume group,
vg-targetd

I've included some python code that reproduces the hang.

the script creats 11 logical volumes. attaches them to the
BlockStorageObject from the rtslib. iscsi...

then we go in to a loop calling lvscan() about the 42 iteration, the
program will hang with lvmetad going 100% cpu

using the lvm lib, I don't have this issue.

thanks

Jeffrey



#!/usr/bin/python
from lvm2py import *
from rtslib import BlockStorageObject

lvm = LVM()
vg_list_obj  = lvm.vgscan()
lv_list_obj  = {}
target_count = 12
volume_size  = 1
vg_name      = 'vg-targetd'
volume_name  = "test_volume_%s"

for i in range (1,target_count):
  lv_name = volume_name % (str(i).zfill(2))
  so_name = "%s:%s" % (vg_name, lv_name)
  vg = lvm.get_vg(vg_name, 'w')
  vg.create_lv(lv_name, volume_size, 'GiB')
  storageblock_obj = BlockStorageObject(so_name, dev="/dev/%s/%s" %
(vg_name, lv_name))
  print 'created volume ', lv_name

i = 1
while i < 300:
    vg = lvm.get_vg(vg_name, 'r')
    lv_list_obj = vg.lvscan()
    output = []
    for lv in lv_list_obj:
        output.append(dict(volume_name=lv.name, size=int(lv.size()),
uuid=lv.uuid))
    print output
    print i
    i = i + 1


# hangs after 42 iterations with 12 volumes

--001a11c3d8d49f1a630502a8c9c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>All,<br><br></div>I&#39;m using fedora=
20. fresh install. I start with an empty volume group, vg-targetd<br><br></=
div>I&#39;ve included some python code that reproduces the hang.<br><br></d=
iv>the script creats 11 logical volumes. attaches them to the BlockStorageO=
bject from the rtslib. iscsi...<br><br></div>then we go in to a loop callin=
g lvscan() about the 42 iteration, the program will hang with lvmetad going=
 100% cpu<br><div><div><div><br></div><div>using the lvm lib, I don&#39;t h=
ave this issue. <br><br></div><div>thanks<br><br>Jeffrey<br><br><br></div><=
div><br>#!/usr/bin/python<br>from lvm2py import *<br>from rtslib import Blo=
ckStorageObject<br><br>lvm =3D LVM()<br>vg_list_obj=C2=A0 =3D lvm.vgscan()<=
br>lv_list_obj=C2=A0 =3D {}<br>target_count =3D 12<br>volume_size=C2=A0 =3D=
 1<br>vg_name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &#39;vg-targetd&#39;<br>vol=
ume_name=C2=A0 =3D &quot;test_volume_%s&quot;<br><br>for i in range (1,targ=
et_count):<br>=C2=A0 lv_name =3D volume_name % (str(i).zfill(2))<br>=C2=A0 =
so_name =3D &quot;%s:%s&quot; % (vg_name, lv_name)<br>=C2=A0 vg =3D lvm.get=
_vg(vg_name, &#39;w&#39;)<br>=C2=A0 vg.create_lv(lv_name, volume_size, &#39=
;GiB&#39;)<br>=C2=A0 storageblock_obj =3D BlockStorageObject(so_name, dev=
=3D&quot;/dev/%s/%s&quot; % (vg_name, lv_name))<br>=C2=A0 print &#39;create=
d volume &#39;, lv_name<br><br>i =3D 1<br>while i &lt; 300:<br>=C2=A0=C2=A0=
=C2=A0 vg =3D lvm.get_vg(vg_name, &#39;r&#39;)<br>=C2=A0=C2=A0=C2=A0 lv_lis=
t_obj =3D vg.lvscan()<br>=C2=A0=C2=A0=C2=A0 output =3D []<br>=C2=A0=C2=A0=
=C2=A0 for lv in lv_list_obj:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 output.append(dict(volume_name=3D<a href=3D"http://lv.name">lv.name</a>, s=
ize=3Dint(lv.size()), uuid=3Dlv.uuid))<br>=C2=A0=C2=A0=C2=A0 print output<b=
r>=C2=A0=C2=A0=C2=A0 print i<br>=C2=A0=C2=A0=C2=A0 i =3D i + 1<br><br><br>#=
 hangs after 42 iterations with 12 volumes<br><br></div><div><br><br></div>=
</div></div></div>

--001a11c3d8d49f1a630502a8c9c8--
