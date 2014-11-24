Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAOMR4Jh022332
	for <linux-lvm@redhat.com>; Mon, 24 Nov 2014 17:27:04 -0500
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAOMR394013105
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 24 Nov 2014 17:27:03 -0500
Received: by mail-vc0-f179.google.com with SMTP id le20so4505753vcb.24
	for <linux-lvm@redhat.com>; Mon, 24 Nov 2014 14:27:02 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 24 Nov 2014 23:27:02 +0100
Message-ID: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Content-Type: multipart/alternative; boundary=089e01634b0431f9a30508a24bca
Subject: [linux-lvm] LVM VG is not activated during system boot
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

--089e01634b0431f9a30508a24bca
Content-Type: text/plain; charset=UTF-8

Hi all,

I use Ubuntu, and several weeks ago I asked a question about LVM here:
http://askubuntu.com/questions/542656/lvm-vg-is-not-activated-during-system-boot

Unfortunately, I didn't receive any answers.

I don't know if my problem is distro-specific or not, but I try to ask here
too.

I have 2 VGs on my system, and for some reason, only one of them gets
activated during the initrd boot sequence, which doesn't have my root LV,
so my boot sequence halts with an initrd prompt. I already specified in
lvm.conf that I wish both my VGs to be auto-activated with
auto_activation_volume_list, but it has no effect.

Could anyone please advise what might be the problem?


MegaBrutal

--089e01634b0431f9a30508a24bca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi all,<br><br>I use Ubuntu, and several we=
eks ago I asked a question about LVM here:<br><a href=3D"http://askubuntu.c=
om/questions/542656/lvm-vg-is-not-activated-during-system-boot">http://asku=
buntu.com/questions/542656/lvm-vg-is-not-activated-during-system-boot</a><b=
r><br>Unfortunately, I didn&#39;t receive any answers.<br><br></div>I don&#=
39;t know if my problem is distro-specific or not, but I try to ask here to=
o.<br><br></div><div>I have 2 VGs on my system, and for some reason, only o=
ne of them gets activated during the initrd boot sequence, which doesn&#39;=
t have my root LV, so my boot sequence halts with an initrd prompt. I alrea=
dy specified in lvm.conf that I wish both my VGs to be auto-activated with =
auto_activation_volume_list, but it has no effect.<br><br></div><div>Could =
anyone please advise what might be the problem?<br></div><div><br><br></div=
><div>MegaBrutal<br></div></div></div>

--089e01634b0431f9a30508a24bca--
