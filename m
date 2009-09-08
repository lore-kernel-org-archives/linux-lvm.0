Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n88DNQk5015032
	for <linux-lvm@redhat.com>; Tue, 8 Sep 2009 09:23:26 -0400
Received: from smtp28.orange.fr (smtp28.orange.fr [80.12.242.99])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n88DNFYF006525
	for <linux-lvm@redhat.com>; Tue, 8 Sep 2009 09:23:15 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2804.orange.fr (SMTP Server) with ESMTP id C1C7B700009D
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2009 15:23:14 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2804.orange.fr (SMTP Server) with ESMTP id B67A27000082
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2009 15:23:14 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-56-139.w83-115.abo.wanadoo.fr [83.115.198.139])
	by mwinf2804.orange.fr (SMTP Server) with ESMTP id EFFBB700009F
	for <linux-lvm@redhat.com>; Tue,  8 Sep 2009 15:23:13 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Ml0fB-0007Dz-9r
	for linux-lvm@redhat.com; Tue, 08 Sep 2009 15:23:13 +0200
Date: Tue, 8 Sep 2009 15:23:12 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Message-ID: <20090908152312.37ac4f9f@fixlaptop.gillibert.homelinux.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=MP_4r1.ITucWwevyBzdPkJHw7A
Subject: [linux-lvm] Powers of 1024 units in man pages
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--MP_4r1.ITucWwevyBzdPkJHw7A
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello.
I'm new to this mailing list, but didn't found any FAQ or netiquette guidel=
ines applying to this list. I'm sorry if I break a rule.

A patch that improves man pages of LVM2 command line tools is attached to t=
his message:
1) Making it clear what units are used (mebibytes, etc.).
2) Specifying where sizes are rounded up or down to a multiple of the exten=
t size.
3) Fixing an error in pvdisplay.8.in which said, with the -c option, physic=
al volume size is output in kilobytes while it is output in sectors.

This patch doesn't modify any source code file (.h or .c). It's a simple do=
cumentation fix.

When doing critical operations such as lvreduce(8), I don't care the progra=
ms use SI or powers of 1024 as far as I can easily know exactly how many by=
tes it'll get. So, I think fixing man pages is important.
(As a LVM2 user, the current workaround is to use -l number_of_extents)

The SI (1k=3D1000) vs binary (1k=3D1024) units issue has been reported 4 ye=
ars ago:
<http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D306200>
and has been discussed in July 2009:
<https://www.redhat.com/archives/linux-lvm/2009-June/msg00073.html>
And a patch has been proposed. Unfortunately, this patch functionally modif=
ies the LVM command line tools, and does so in a way that may silently brea=
k scripts, which probably explain why it hasn't been included yet.

Fixing the source code to make it use SI units, in my eyes, is not a short =
term concern, but fixing man pages is one.

Not being a native english speaker, my patch may contain language glitches.=
 Improvements and discussion is welcome.
To compute these data, I made a few tests on small loop-backs volumes. I th=
ink everything I state is true, but, if you find an error, please, fix it.

Thank you.

--=20
Sincerely.
Andr=C3=A9 Gillibert

--MP_4r1.ITucWwevyBzdPkJHw7A
Content-Type: application/x-gzip; name=LVM2-man-binary-units.patch.gz
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=LVM2-man-binary-units.patch.gz

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
sAp2AAA=

--MP_4r1.ITucWwevyBzdPkJHw7A--
