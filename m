Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7P1oQET006929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2016 21:50:26 -0400
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4CCCC000714
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 01:50:25 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id l203so48439067oib.1
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2016 18:50:25 -0700 (PDT)
MIME-Version: 1.0
From: su liu <liusu8788@gmail.com>
Date: Thu, 25 Aug 2016 09:50:24 +0800
Message-ID: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a114285ca1c7e97053adb9f75
Subject: [linux-lvm] lvm2 cluster aware
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
To: linux-lvm <linux-lvm@redhat.com>

--001a114285ca1c7e97053adb9f75
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have a question about lvm2 cluster, The scene is that I try to imitate
FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
volume to  create a PV and VG.I stoped the lvmetad daemon on the compute
nodes. Then I find that when I operating the VG on one compute node, the
changes can also be aware on another compute nodes.

But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html=EF=BC=
=89 says
that "*LVM is not cluster aware".*

My question is that can I use the method to achieve the case that I create
or delete lv on one node whlie other compute node can using the lvs?

Can anybody explain this?

thx very much!

--001a114285ca1c7e97053adb9f75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a question about lvm2 cluster, The scene is that I =
try to=C2=A0imitate FCSAN by mapping a rbd volume to two compute node, Then=
 I using the rbd volume to =C2=A0create a PV and VG.I stoped the lvmetad da=
emon on the compute nodes. Then I find that when I operating the VG on one =
compute node, the changes can also be aware on another compute nodes.<div><=
br></div><div>But this docment(<a href=3D"http://www.tldp.org/HOWTO/LVM-HOW=
TO/sharinglvm1.html">http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html</=
a>=EF=BC=89=C2=A0says that &quot;<b style=3D"color:rgb(0,0,0);font-family:S=
imsun;font-size:medium">LVM is not cluster aware&quot;.</b></div><div><div>=
<br></div><div>My question is that can I use the method to achieve the case=
 that I create or delete lv on one node whlie other compute node can using =
the lvs?</div><div><br></div><div>Can anybody explain this?=C2=A0</div><div=
><br></div><div>thx very much!</div></div></div>

--001a114285ca1c7e97053adb9f75--
