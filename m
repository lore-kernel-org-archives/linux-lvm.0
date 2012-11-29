Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qATMrVAF009260
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 17:53:31 -0500
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qATMrLMU032518
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 17:53:22 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1TeCz4-0004uR-Ag
	for linux-lvm@redhat.com; Thu, 29 Nov 2012 23:53:30 +0100
Received: from d67-193-214-242.home3.cgocable.net ([67.193.214.242])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 23:53:30 +0100
Received: from brian by d67-193-214-242.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 29 Nov 2012 23:53:30 +0100
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Thu, 29 Nov 2012 17:53:06 -0500
Message-ID: <k98p0h$feg$1@ger.gmane.org>
References: <1045065586.477.16.camel@dev-ehopper.tiecommerce.com>
	<20030214172615.GA2438@fib011235813.fsnet.co.uk>
	<loom.20121128T142616-703@post.gmane.org>
	<50B6183E.9020404@redhat.com> <k97k9f$6kf$1@ger.gmane.org>
	<20121129140401.GE674@soda.linbit>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDE69909CA89B5F412EA46B07"
In-Reply-To: <20121129140401.GE674@soda.linbit>
Subject: Re: [linux-lvm] How to handle Bad Block relocation with LVM?
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
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDE69909CA89B5F412EA46B07
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12-11-29 09:04 AM, Lars Ellenberg wrote:
>=20
> If you do
> pvs --unit s --segment -o vg_name,lv_name,seg_start,seg_size,seg_start_=
pe,pe_start,seg_pe_ranges

Right.  Let's assume I can find the PE.

> Having the PE number, you can easily do
> pvmove /dev/broken:PE /dev/somewhere-else

Right but that...


> Or with alloc anywhere even elsewhere on the same broken disk.

As well as that just puts a new PE in where the one with the damaged
block is but returns the PE with the damaged block back to the free list
to be allocated again at some point in the future, yes?

> # If you don't have an other PV available,
> # but there are free "healthy" extents on the same PV:
> # pvmove --alloc anywhere /dev/broken:PE /dev/broken
> Which would likely not be the smartest idea ;-)

Right because of the above, yes?  Or is there something else nasty about =
it?

> You should then create one LV named e.g. "BAD_BLOCKS",
> which you would create/extend to cover that bad PE,
> so that won't be re-allocated again later:
> lvextend VG/BAD_BLOCKS -l +1 /dev/broken:PE

Ahhh.  But in this case I want lvcreate -l 1 /dev/broken:PE since I
don't yet have my "badblocks" LV.  I would of course use lvextend next
time.  :-)

> Better yet, pvchange -an /dev/broken,
> so it won't be used for new LVs anymore,
> and pvmove /dev/broken completely to somewhere else.

Yeah, of course ideally.  But as I mentioned, I'm not terribly worried
about loss in this case.

> I'm unsure how pvmove will handle IO errors, though.

I thought I read somewhere about pvmove being persistent through IO
errors but I can't seem to find it any more.  I guess we'll see.  :-)

It seems the pvmove just powered through.  Sweet.

I confirmed, using Stuart Gathman's (very nifty!) lbatofile.py program
that the file that was producing a read error from before the pvmove
read with no error after it and now I have my bad PE in a "badblocks" LV.=


Super sweet!

Cheers,
b.



--------------enigDE69909CA89B5F412EA46B07
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iEYEARECAAYFAlC351MACgkQl3EQlGLyuXCZQgCg0TwmMqn7O1+FOpy674woq0xt
OmkAn0gVJSnLjUubyYuvm/Zc8ZGSrAGm
=2ybN
-----END PGP SIGNATURE-----

--------------enigDE69909CA89B5F412EA46B07--
