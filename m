Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAN0ger03041
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 19:42:40 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAN0gdsc029614
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2004 19:42:39 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <1101137773.3399.4.camel@dhcp174.msp.redhat.com>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120002207.GK3139@polop.usc.edu>
	<1100914586.4379.75.camel@tesuji.nac.uci.edu>
	<20041120020807.GP3139@polop.usc.edu>
	<1100917096.4379.92.camel@tesuji.nac.uci.edu>
	<1101137773.3399.4.camel@dhcp174.msp.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-9vwOGKSrqWgA/0kxLB7C"
Message-Id: <1101170556.24828.11.camel@soot.ess.uci.edu>
Mime-Version: 1.0
Date: Mon, 22 Nov 2004 16:42:36 -0800
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


--=-9vwOGKSrqWgA/0kxLB7C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-11-22 at 07:36, Kevin Anderson wrote:
> On Fri, 2004-11-19 at 20:18, Dan Stromberg wrote:
>=20
> >=20
> > Last I heard:
> >=20
> > Sistina (prior to the Redhat purchase) had a roadmap for GFS, which
> > included bringing it up to, but not surpassing, the 16 terabyte limit.
> Plans were always to go way past 16TB, requires 64bit hardware
> architectures and the 2.6 kernel to push the limits.

I see.  Thank you for clearing that I'm.

I'm now guessing that the person who told me this was restricting his
vision to 32 bit hardware.

> >=20
> > Since the Redhat purchase, my understanding is that this previous
> > roadmap has been scrapped, and there are no longer any immediate plans
> > to raise the GFS filesystem size limit from 2 terabytes to 16 terabytes
> > - in which case, you can pretty much just use NFS, unless you're stuck
> > with small disks or low density servers.  :)
> >=20
> > I'd -really-like- to find out this isn't true.
> >=20
> For the 2.6 kernel, GFS should be able to go to 16TB on 32bit machines.=20
> On 64 bit machines, the theoretical limit is something like 8 exabytes.=20
> If anyone wants to pony up that amount of storage, we would be more than
> happy to give it a go.  In the meantime, smaller sizes are going to be
> validated.  So, plans have not been scrapped or even changed much from
> Sistina to Red Hat.

Would would GFS on kernel 2.6 do with a bunch of 32 bit machines with
disks attached to them, but a 64 bit client?

Is GFS for kernel 2.6 ready at this point?  Or nearly so?

Thanks for the great info.  :)


> >=20
> > ______________________________________________________________________
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

--=-9vwOGKSrqWgA/0kxLB7C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBood8o0feVm00f/8RAsA7AJ9tZiByTY0wBdmEDJmu64jyMfQvHACePX2F
VTZPkAaygleIZpQ+f9d1UpU=
=6r03
-----END PGP SIGNATURE-----

--=-9vwOGKSrqWgA/0kxLB7C--
