Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l93BRaA6021619
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 07:27:36 -0400
Message-ID: <47037C2D.7080302@redhat.com>
Date: Wed, 03 Oct 2007 12:25:33 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backuping "special" snapshots
References: <4703572F.8020604@es.clara.net> <47035C3D.2010901@redhat.com>
	<47037B9A.3040209@es.clara.net>
In-Reply-To: <47037B9A.3040209@es.clara.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marc Patino G=EF=BF=BDmez wrote:
> Hi again,
>=20
> I try kpartx and it's so cool, but I can't make snapshots of
> /dev/vg00/lv00p1 ... so I can't solve the problem of making backup
> without stopping the Virtual Machine.
>=20
> Any advice?
>=20
> Regards,
>=20
> Marc
>=20

Sorry, I thought that lv00 was the snapshot. Just create a snapshot of
it (e.g. lv00-snap) and run kpartx against that instead.

Cheers,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHA3wt6YSQoMYUY94RArTrAJ9jq6qz/upa2iacWkBlGA6tI95S3wCghRRu
qOVm/ledC8AaycR1PZlEAWY=3D
=3DBn6e
-----END PGP SIGNATURE-----
