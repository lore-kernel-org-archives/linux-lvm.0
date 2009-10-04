Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n94L38uD017725
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 17:03:08 -0400
Received: from smtp2a.orange.fr (smtp2a.orange.fr [80.12.242.138])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n94L2uOO032675
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 17:02:56 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2a28.orange.fr (SMTP Server) with ESMTP id 25D6F80000AE
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 23:02:56 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2a28.orange.fr (SMTP Server) with ESMTP id 19B0080000AF
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 23:02:56 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-56-4.w83-115.abo.wanadoo.fr [83.115.198.4])
	by mwinf2a28.orange.fr (SMTP Server) with ESMTP id 70D4480000AE
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 23:02:55 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1MuXm0-0005gb-R2
	for linux-lvm@redhat.com; Sun, 04 Oct 2009 22:33:40 +0200
Date: Sun, 4 Oct 2009 23:02:48 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Unmounting file system hangs up...
Message-ID: <20091004230248.36789207@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <f6d6a910910041049r79912d8ap558c31788a3c233c@mail.gmail.com>
References: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
	<20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
	<f6d6a910910040823lffdc70fkff4d2e4a15d49349@mail.gmail.com>
	<20091004191106.08a50ebf@fixlaptop.gillibert.homelinux.net>
	<f6d6a910910041049r79912d8ap558c31788a3c233c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Thinking Outside the Well <rod.rook@gmail.com> wrote:

> CentOS-5 is on a hard drive of the same computer. /etc/fstab does not
> explicitly mount CentOS-5, but Fedora-10 somehow mounts all hard drives
> including NTFS drives. I must have done something to do this, but I forgot
> what I did. Do you have any idea what I did and how I remedy this situati=
on?
>=20

Two things may concur to this automatic mount.
1) hald (Hardware Abstraction Layer Daemon)
This informs software about which hardware, including hard drives, is curre=
ntly connected, and when removable drives are inserted or removed.
2) The desktop or file manager (nautilus on GNOME, konqueror or dolphin on =
KDE).
It gets the list of connected devices from hald, through the d-bus system, =
and, may automatically mount cold plugged and hot plugged drives.

As I neither use GNOME, nor KDE, I don't know what exact setting triggers t=
his behavior, but, ideally, you should configure the relevant application (=
nautilus, dolphin or konqueror) to disable this behavior, or make them prop=
erly unmount the drives.

--=20
Andr=C3=A9 Gillibert
