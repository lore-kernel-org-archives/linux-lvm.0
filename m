Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1MC6vK29024
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 07:06:57 -0500
Received: from smtp8.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1MC6uaI028337
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 07:06:56 -0500
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0801.wanadoo.fr (SMTP Server) with ESMTP id 9C701180009E
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 13:06:50 +0100 (CET)
Received: from tangerine.coulon.evette
	(ADijon-151-1-11-26.w83-194.abo.wanadoo.fr [83.194.119.26])
	by mwinf0801.wanadoo.fr (SMTP Server) with ESMTP id F2A57180009F
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 13:06:49 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.44) id 1D3YoT-00035o-7B
	for linux-lvm@redhat.com; Tue, 22 Feb 2005 13:06:49 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07934-09 for <linux-lvm@redhat.com>;
	Tue, 22 Feb 2005 13:06:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.44) id 1D3YoK-00035I-Jc
	for linux-lvm@redhat.com; Tue, 22 Feb 2005 13:06:40 +0100
Date: Tue, 22 Feb 2005 12:06:40 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] bootloader questions
References: <1109018274.4532.14.camel@rich>
	<1109019036l.14910l.1l@tangerine> <1109020966.4532.59.camel@rich>
In-Reply-To: <1109020966.4532.59.camel@rich> (from rich@storix.com on Mon
	Feb 21 22:22:47 2005)
Message-Id: <1109074000l.10727l.1l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-NxeaVr3vQswwpGlepXBK"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--=-NxeaVr3vQswwpGlepXBK
Content-Type: text/plain; charset=UTF-8; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 21.02.2005 22:22:47, rich turner a =C3=A9crit=C2=A0:
> this is perhaps the wrong mailing list but is this the case with
> software raid as well? although, i believe the software raid must be
> raid level 1.

I've a software raid1 on 2 SATA drives.
I've LVM over the RAID

Software raid can be about anything

I've setup 2 md devices:
/dev/md0 with /dev/sda1 and /dev/sdb1 for /boot (non lvm)
/dev/md1 with /dev/sda2 and /dev/sdb2 for lvm

The /boot partition is xfs and 100Mbytes
I've setup everything in lvm, even the swap and the root partition.

Jean-Luc
>=20
> On Mon, 2005-02-21 at 12:50, Jean-Luc Coulon (f5ibh) wrote:
> > Le 21.02.2005 21:37:54, rich turner a =C3=A9crit :
> > > if i have root(/) on a logical volume, is it required that i have
> > > /boot
> > > on a separate filesystem? does /boot have to be a partition?
> > >
> > > the boot loaders i need to support are lilo and grub. do the
> answers
> > > to
> > > the above question vary if i use lilo or grub?
> >
> >
> > both lilo and grub can boot the root filesystem as a logical volume.
> >
> > but grub cannot boot /boot from a logical volume.
> > With lilo it can either be a separate lv, a partition, a disk, what
> you
> > what. With grub it should be outside of the logical volume manager
> > (IIRC, there is a patch for grub to use /boot on a LV but I've never
>=20
> > found/tried it)
> >
> >
> > >
> > > thanks for the help
> >
> > Regards
> >
> > Jean-Luc
> >
> > =20
> ______________________________________________________________________
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20
>=20
>=20
>=20

--=-NxeaVr3vQswwpGlepXBK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCGyBQUdGGXzzGnNARAsVrAKCJX2XriwZQJfWfwmbARrMZYqGFGwCfeNPl
FuJv60n0izOWDp/hn0Fh/QM=
=mbHg
-----END PGP SIGNATURE-----

--=-NxeaVr3vQswwpGlepXBK--
