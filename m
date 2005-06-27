Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5RDubu02818
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 09:56:37 -0400
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j5RDuV9u024936
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 09:56:32 -0400
Date: Mon, 27 Jun 2005 15:56:21 +0200 (MEST)
From: "Markus Jeckeln" <Markus.Jeckeln@gmx.de>
MIME-Version: 1.0
References: <20050627130803.GA27078@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] Problem with locking_type 2 lvm/cluster/gfs
Message-ID: <428.1119880581@www77.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> --- Urspr=EF=BF=BDngliche Nachricht ---
> Von: Alasdair G Kergon <agk@redhat.com>
> An: LVM general discussion and development <linux-lvm@redhat.com>
> Betreff: Re: [linux-lvm] Problem with locking_type 2 lvm/cluster/gfs
> Datum: Mon, 27 Jun 2005 14:08:03 +0100
>=20
> On Mon, Jun 27, 2005 at 02:56:38PM +0200, Markus Jeckeln wrote:
> > as soon as i put up the locking_type =3D 2 and set the locking_library
> then i
> > can't run any lvm commands (vgdisplay/vgchange) ... returning with=20
> > connect() failed on local socket: Connection refused
> > Locking type 2 initialisation failed.
>=20
> Is root filesystem on LVM? - if so, check your initrd got updated.
> Check *exactly* what lvm commands are getting run in initrd and
> initscripts.

No the root filesystem is not on LVM.=20

=20
> vgdisplay output for a clustered VG:
> Clustered             yes
>=20
> Cluster Suite packages are available on RH Network.

Wohoooow.. yes.. right the cluster channel is there.. great. But i am
missing lvm2-cluster and the gfs packages :(
=20
> Alasdair
> --=20
> agk@redhat.com
>=20

--=20
Weitersagen: GMX DSL-Flatrates mit Tempo-Garantie!
Ab 4,99 Euro/Monat: http://www.gmx.net/de/go/dsl
