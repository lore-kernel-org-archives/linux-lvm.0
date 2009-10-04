Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n94EcrnZ009166
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 10:38:53 -0400
Received: from smtp2f.orange.fr (smtp2f.orange.fr [80.12.242.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n94EcfYP014240
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 10:38:41 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2f17.orange.fr (SMTP Server) with ESMTP id 9E36080000AE
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 16:38:40 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2f17.orange.fr (SMTP Server) with ESMTP id 92D2B80000AF
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 16:38:40 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-56-4.w83-115.abo.wanadoo.fr [83.115.198.4])
	by mwinf2f17.orange.fr (SMTP Server) with ESMTP id 607E380000AE
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 16:38:40 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1MuRm6-0005Hg-AQ
	for linux-lvm@redhat.com; Sun, 04 Oct 2009 16:09:22 +0200
Date: Sun, 4 Oct 2009 16:38:35 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Unmounting file system hangs up...
Message-ID: <20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
References: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
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
> Hello,
>=20
> I am using Fedora 10 and LVM. Lately when I shut down or restart the Linux
> box, it hangs at the stage of "Unmounting file system".
>=20
>=20
>    - Turning off swap  --- OK
>    - Turning off quotas --- OK
>    - Unmounting pipe file system  --- OK
>    - Unmounting file system ---  hangs up
>=20
> Although I can turn off or restart the box manually, I am a bit concerned
> whether it is the beginning of more serious problems later.
> Your suggestion will be greatly appreciated.

You should find exactly which command hangs.
It might be as simple as a fs that it cannot umount because it's busy.
Or maybe something like Fedora trying to umount a network file system after=
 the network has been shut down.

In doubt, check the health of your disk with fsck, badblocks and smartmonto=
ols.

--=20
Andr=C3=A9 Gillibert
