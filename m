Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IG5kN8011209
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 12:05:46 -0400
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8IG5aCt029494
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 12:05:36 -0400
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.69)
	(envelope-from <mwood@IUPUI.Edu>) id 1Mofxn-0007Z3-Ea
	for linux-lvm@redhat.com; Fri, 18 Sep 2009 12:05:35 -0400
Date: Fri, 18 Sep 2009 12:05:35 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
Message-ID: <20090918160535.GB24540@IUPUI.Edu>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
	<1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
	<1253201655.2339.178.camel@pc.interlinx.bc.ca>
	<Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
	<4AB2C5BC.5040804@gmail.com>
	<Pine.LNX.4.64.0909172041590.9233@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0909172041590.9233@bmsred.bmsi.com>
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
To: linux-lvm@redhat.com


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2009 at 08:58:08PM -0400, Stuart D. Gathman wrote:
> A high end SAN server means you allocate "disks" from the SAN instead
> of buying physical disks.  Adding another "disk" to a server can be as
> simple as allocating another "LV" (or whatever the SAN software calls it)
> and attaching it.  The OP would simply clone his disk in the SAN
> (and needn't worry about the duplicate VGID as long he doesn't attach=20
> the clone) before doing the upgrade.

Dunno if I'd call our HP MSA1510i "high end" but it works like that.
Just define an initiator, slice off some storage, and assign it.

I usually think of the FC-based stuff as "high end" since a single
fiber switch tends to cost more than we paid for our whole ~16TB iSCSI
SAN.  (Now expanded to more like 40TB and we should be able to take it
up to around 80TB.)

> I have one client with a SAN system, and it seems to perform well.
> It is one client that never needs to install a physical disk on a
> server I maintain for them.  (Caveat, booting from iSCSI requires
> bringing up a Nic - which is tricky to do for linux in initrd.)

A few (more pricey) NICs include iSCSI on the card and would appear to
serve as a normal boot disk so far as the host is concerned.  I
haven't tried that yet.  FC HBAs all seem to have this (and for what
they cost, they should).

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Friends don't let friends publish revisable-form documents.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEAREDAAYFAkqzr88ACgkQs/NR4JuTKG+jEQCfVP5muJEHoFAp0INW5PYZE6Ed
pVcAnR24PQTro0V1lXgbIpoOXYxjMOvG
=Y2z/
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
