Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7717DFT027781
	for <linux-lvm@redhat.com>; Wed, 6 Aug 2014 21:07:13 -0400
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7717BdI000835
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 6 Aug 2014 21:07:11 -0400
Received: by mail-yk0-f172.google.com with SMTP id 10so2305862ykt.3
	for <linux-lvm@redhat.com>; Wed, 06 Aug 2014 18:07:11 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 7 Aug 2014 09:07:10 +0800
Message-ID: <CAKtQ4UkDfuxfMMGLjJv9=aNQv4gm6TEqEDr3Hbbo=GVOk-Q6pQ@mail.gmail.com>
From: Dong Ding <dyd281@gmail.com>
Content-Type: multipart/alternative; boundary=089e01537be2584e3604ffffb563
Subject: [linux-lvm] can't deactive VG in cluster
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

--089e01537be2584e3604ffffb563
Content-Type: text/plain; charset=UTF-8

Dear all,
I have two servers as active/standby function.   I  used the lvm in two
servers but not use the 'exclusive' for VG.      I  tried  umount the
volume in active server, then  vgchange -an VG,  but  the deactive failed .
From lvs output that shows the lv's attr still has a 'o' at 6th place, but
the volume not mounted.

There are 6 cluster groups,   when I  tried to  migrate to standby servers
that all the active servers have same issuse.

Normally  if the volume umounted,  the lvs output show the  'attr' without
'o' at 6th place,  but I have it.

pls help me find  the  reason.  thx

--089e01537be2584e3604ffffb563
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Dear all,<br>
 I have two servers as active/standby function.=C2=A0=C2=A0 I=C2=A0 used th=
e lvm in two servers but not use the &#39;exclusive&#39; for VG.=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 I=C2=A0 tried=C2=A0 umount the volume in active serve=
r, then=C2=A0 vgchange -an VG,=C2=A0 but=C2=A0 the deactive failed . From l=
vs output that shows the lv&#39;s attr still has a &#39;o&#39; at 6th place=
, but=C2=A0 the volume not mounted.<br>
</p>
<p dir=3D"ltr">There are 6 cluster groups,=C2=A0=C2=A0 when I=C2=A0 tried t=
o=C2=A0 migrate to standby servers that all the active servers have same is=
suse.</p>
<p dir=3D"ltr">Normally=C2=A0 if the volume umounted,=C2=A0 the lvs output =
show the=C2=A0 &#39;attr&#39; without &#39;o&#39; at 6th place,=C2=A0 but I=
 have it. <br><br></p>
<p dir=3D"ltr">pls help me find=C2=A0 the=C2=A0 reason.=C2=A0 thx<br>
</p>

--089e01537be2584e3604ffffb563--
