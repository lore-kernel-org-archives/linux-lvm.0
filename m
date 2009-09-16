Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GMRUdo005394
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 18:27:30 -0400
Received: from smtp2e.orange.fr (smtp2e.orange.fr [80.12.242.113])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GMRLjF022802
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 18:27:22 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2e26.orange.fr (SMTP Server) with ESMTP id F107F80000AF
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 00:27:20 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2e26.orange.fr (SMTP Server) with ESMTP id E585380000B0
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 00:27:20 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-53-207.w83-115.abo.wanadoo.fr [83.115.195.207])
	by mwinf2e26.orange.fr (SMTP Server) with ESMTP id 7CB0680000AF
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 00:27:20 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mo2y7-0006N2-Rc
	for linux-lvm@redhat.com; Thu, 17 Sep 2009 00:27:19 +0200
Date: Thu, 17 Sep 2009 00:27:19 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] LVM Read/Write speed <10% drive's normal speed
Message-ID: <20090917002719.23698c46@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <1253137773.5136.357.camel@hamerst1-ll1>
References: <1253137773.5136.357.camel@hamerst1-ll1>
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

Stephen Hamer <Stephen.Hamer@jhuapl.edu> wrote:
> Hello all,
>=20
> I've been searching through the archives and the internet for a while
> now, and can't seem to find anything that helps me out. I hope you don't
> my posting this to both xen-users and linux-lvm simultaneously, but i
> figured it'd help keep the solution in one place... even though it'll be
> the same across two places... Anyways:
>=20
> My setup is this:
>         Xen 3.3 hypervisor (from the ubuntu repositories)
>         Ubuntu 9.04 server
>         Kernel and module listed here:
> http://www.infohit.net/blog/post/running-xen-on-ubuntu-intrepid-and-jaunt=
y.html
>=20
> The dom0 and domUs in my Xen setup are all Ubuntu 9.04, using that
> kernel. (I'm not sure if the kernel has something to do with it, so i
> included it just in case.) All the domUs are set up to use LVM. The dom0
> uses a straight ext3 fs on /dev/sda1. The domUs use ext3 fs's within
> LVMs (using LVM2) set up on /dev/sda5.
>=20
> I have noticed a massive file I/O problem on all of my domUs. While I
> can peak file operations around 100 MB/s within the dom0, I can't get
> anything more than 3 MB/s read OR write out of a file operation on the
> domUs. I am using values reported by "iotop" to make this distinction.
> I'm using both the deployment of a Jboss server and the "dd" command to
> benchmark this. The Jboss slowdown is how I found this. On the dom0, the
> server takes 56s to come up. On a domU, the same operation takes 15
> minutes.
>=20
> It should also be noted that I attempted to change the filesystems to
> ext2, because I noticed that 'kjournald' was chugging away taking up
> most of the i/o percentage, but only writing at KB/s! Actually, when I
> removed the journaling is when the process slowed from 7 minutes to 15.
> Even without the kjournald there, the java process took forever to load
> and never wrote more than 3 MB/s.
>=20
> I have messed around with the 'blockdev' and 'hdparm' commands (the
> second of which doesn't even interact with any partition on my computer,
> lvm or no, instead simply failing with an "input/output error" message),
> but have had no performance increases after messing around with the read
> ahead speed of the devices. I also tried the "lvchange -r" command to
> set the readahead higher. I think there's something else missing here,
> though.
>=20
> I'm fairly fresh to xen, this being only my second installation, and I'm
> extremely fresh to lvm. I've played with what seems like every option
> within "xm" and the 'lv*' commands. The LVMs themselves I haven't played
> with all too much yet, as I don't want to nuke a certain domU before it
> needs to be used heavily tomorrow. I've already killed a test domU that
> I brought up just for this.
>=20
> -Stephen

Are you sure the file systems in DomUs are not mounted with the sync option=
, either in their fstab entry or in their default mount options as set with=
 tune2fs? That could explain poor write performance, but not poor read perf=
ormance. :|
When using dd to create a file, does the block size change performances sig=
nificantly?

i.e. compare:
dd if=3D/dev/zero of=3Dtestfile bs=3D1M count=3D10
to:
dd if=3D/dev/zero of=3Dtestfile bs=3D1K count=3D10240

You should individually test the performance (in a test DomU) of the file s=
ystem on the LVM partition in the DomU, the performance of the LVM logical =
volume and the performance of the physical volume containing the LVM logica=
l volume, so that you see which layer is responsible.

That's general advice, but I hope it may help.

--=20
Andr=C3=A9 Gillibert
