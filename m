Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8JEBYtc029228
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 10:11:34 -0400
Received: from smtp21.orange.fr (smtp21.orange.fr [80.12.242.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8JEBMwr027874
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 10:11:23 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2126.orange.fr (SMTP Server) with ESMTP id 14D9F1C0008A
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 16:11:22 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2126.orange.fr (SMTP Server) with ESMTP id 080831C000AC
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 16:11:22 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-24-36.w83-115.abo.wanadoo.fr [83.115.209.36])
	by mwinf2126.orange.fr (SMTP Server) with ESMTP id B8B0A1C0008A
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 16:11:21 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mp0en-0001Jd-35
	for linux-lvm@redhat.com; Sat, 19 Sep 2009 16:11:21 +0200
Date: Sat, 19 Sep 2009 16:11:20 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Disk crash on LVM
Message-ID: <20090919161120.6ef5215d@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <1253308756.16684.7@raydesk1.bettercgi.com>
References: <127450ED38024F8FA2FD360E99F363ED@caramon>
	<1253308756.16684.7@raydesk1.bettercgi.com>
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

Ray Morris <support@bettercgi.com> wrote:
> [...]
>    Then dd from the old copy of the LV to the new:
>=20
> dd if=3D/dev/org/$1 bs=3D64M iflag=3Ddirect |=20
> dd of=3D/dev/copy/$1 bs=3D64M oflag=3Ddirect=20
>=20
>    That piped dd is 2-3 times faster than the "obvious"=20
> way to run dd.
> [...]

The issue with dd is that if any read() fails, it skips the entry (64M) and=
 doesn't write to the output, making the output file smaller than the input=
 file.

with conv=3Dsync,noerror, it's better, but, still loosing a whole 64M block=
 at once is a bad thing.

That's why I think dd_rescue would be better.
<http://www.garloff.de/kurt/linux/ddrescue/>

If it still gets warm too fast, I've heard that storing the hard drive in a=
 freezer 24 hours may make it work again.
<http://geeksaresexy.blogspot.com/2006/01/freeze-your-hard-drive-to-recover=
-data.html>

If it crashes when dd or dd_rescue fails, it's possible to continue copying=
 later, from the point it failed.

--=20
Andr=C3=A9 Gillibert
