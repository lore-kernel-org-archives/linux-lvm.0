Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p28Do23J015512
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2011 08:50:02 -0500
Received: from mail.sf-mail.de (mail.sf-mail.de [62.27.20.61])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p28Dno1o030259
	for <linux-lvm@redhat.com>; Tue, 8 Mar 2011 08:49:51 -0500
Received: from business-088-079-120-127.static.arcor-ip.net
	([::ffff:88.79.120.127] HELO eb-work1.ma.silicon-software.de)
	(auth=eike@sf-mail.de)
	by mail.sf-mail.de (Qsmtpd 0.19svn) with (DHE-RSA-AES256-SHA encrypted)
	ESMTPSA for <linux-lvm@redhat.com>; Tue, 08 Mar 2011 13:49:48 +0000
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Tue, 8 Mar 2011 14:49:44 +0100
References: <201103081038.38338.eike-kernel@sf-tec.de>
In-Reply-To: <201103081038.38338.eike-kernel@sf-tec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <201103081449.44783.eike-kernel@sf-tec.de>
Subject: Re: [linux-lvm] 2.6.37.2: LVM pvmove hangs system
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: linux-lvm@redhat.com
Cc: linux-kernel@vger.kernel.org

Am Dienstag 08 M=EF=BF=BDrz 2011, 10:38:38 schrieb Rolf Eike Beer:
> Hi all,
>=20
> I'm experiencing a very annoying system lockup for some days. The setup is
> as follows:
>=20
> -two pairs of SATA disks that are bundled into a software raid 1 each
> -each of the raid devices is a physical volume
> -a volume group that includes both pv's
> -all mounted volumes (including root and swap) are in that vg
>=20
> The machine is a Xeon E5520 with 16G RAM that is otherwise idle, so swap
> shouldn't matter. And from what I read out of the documentation this all
> looks perfectly sane, but:
>=20
> Now I try to move the data from one pv to the other using pv. This prints
> out the current state (currently 10.9%) and then starts doing something.
> Two minutes later the kernel will complain:

After some further testing I _think_ I have an idea what's going on: this i=
s a=20
deadlock somewhere in the I/O stack. I have recompiled the kernel with all =
the=20
lock debugging enabled and will probably test this but this is a production=
=20
machine that should better get online again better sooner than later so my =

amount of what I can test is pretty limited. Since the machine is currently=
=20
doing the move and actually working I have not yet booted into the debug=20
kernel.

What I did was basically stopping everything on the machine. The only=20
userspace programs currently running are init, my sshd, my screen, shell, a=
nd=20
of course pvmove. And now it works. Whenever I try to do anything that caus=
es=20
I/O in parallel the machine will stop working. So this box is basically at =

runlevel 1 now moving all the stuff around instead of doing some useful wor=
k=20
while moving in the background :(

Eike
