Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i630MG021100
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 20:22:16 -0400
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i630MAXn030153
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 20:22:10 -0400
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id i630M9Ia011311
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 17:22:09 -0700
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id i630M8CW011309
	for linux-lvm@redhat.com; Fri, 2 Jul 2004 17:22:08 -0700
Date: Fri, 2 Jul 2004 17:22:08 -0700
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] pvmove - Can't expand LV: Mirror support missing
	fromkernel?
Message-ID: <20040703002208.GN10907@polop.usc.edu>
References: <1088690081.4221.6.camel@freya>
	<001b01c46081$399cc6c0$0201a8c0@fosi>
	<20040702234154.GB1506@chaos.ao.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ggdAeHltlv4tpqCr"
Content-Disposition: inline
In-Reply-To: <20040702234154.GB1506@chaos.ao.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--ggdAeHltlv4tpqCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2004 at 07:41:54PM -0400, Dan Merillat alleged:
> On Sat, 03 Jul 2004, Steve Wray wrote:
>=20
> > I strongly doubt that you'll get any help out of the list on this,
> > but if someone does send you a fix which works, off-list, *please*
> > send it to me too; I have two failing disks which I need to decommissio=
n.
>=20
> stock 2.6 dosn't have many dm-targets in it.  Pick up the LVM patches
> off the website and apply them for the more "experimental" things like
> mirroring.

What the?

$ tar jtvf 2.6.7-udm1.tar.bz2=20
drwxr-xr-x root/wheel        0 2004-07-01 13:45:46 2.6.7-udm1/
-rw-r--r-- root/wheel 14760862 2004-07-01 13:33:43 2.6.7-udm1/00001.patch
-rw-r--r-- root/wheel      372 2004-07-01 13:34:15 2.6.7-udm1/00002.patch
-rw-r--r-- root/wheel      825 2004-07-01 13:34:26 2.6.7-udm1/00003.patch
=2E..

Some of those patch tarballs seem to be patching a whole lot more then
just dm.

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--ggdAeHltlv4tpqCr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFA5fww0SBUxJbm9HMRAvP0AKCfuqa3yHTvYqiuSEaOHud9hCmCuwCbBqVd
opmQIkQJnNzHEOKzWPUmvkI=
=rPgx
-----END PGP SIGNATURE-----

--ggdAeHltlv4tpqCr--
