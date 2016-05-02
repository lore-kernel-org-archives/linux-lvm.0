Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u42DeLLC019742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 2 May 2016 09:40:21 -0400
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38F598111F
	for <linux-lvm@redhat.com>; Mon,  2 May 2016 13:40:19 +0000 (UTC)
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.85)
	(envelope-from <mwood@IUPUI.Edu>) id 1axDjo-0004gi-T6
	for linux-lvm@redhat.com; Mon, 02 May 2016 09:18:12 -0400
Date: Mon, 2 May 2016 09:18:12 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Message-ID: <20160502131812.GA1949@IUPUI.Edu>
References: <1714078834.3820492.1461944731537.JavaMail.yahoo.ref@mail.yahoo.com>
	<1714078834.3820492.1461944731537.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <1714078834.3820492.1461944731537.JavaMail.yahoo@mail.yahoo.com>
Subject: Re: [linux-lvm] about the lying nature of thin
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


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2016 at 03:45:31PM +0000, matthew patton wrote:
> > ~35GB each, meaning 35000 GB is available and 25000 is=20
> > in use, then it is not a lie to say to any individual customer: you can=
=20
> > use 50GB if you want.
>=20
> If enough of your so-called customers decide to use the space you promise=
d them AND THAT THEY PAID FOR and instead they get massive data loss and ou=
tages, you can bet your hiney they'll sue you silly.

Executive summary:  you shouldn't just take a wild guess and then turn
your back on a thin-provisioned setup; you must understand your
consumers and monitor your resources.

It's reasonable in certain circumstances for a service provider to
over-subscribe his hardware.  He would be well advised to monitor
actual allocation closely, to keep some cash or ready credit on hand
for quick expansion of his real hardware, and to respond promptly by
adding capacity when usage nears real hardware limits.  He is taking a
risk, betting that most customers won't max out their promised
storage, and should manage that risk.  Indeed, he should first gather
statistics to understand the behavior of typical customers and
determine whether he would be taking a *foolish* risk.

Failure to adequately manage resources to redeem contracted promises
is the provider's lie, not LVM's.  Failure to plan is planning to
fail.

If that's too scary, don't use thin provisioning.

--=20
Mark H. Wood
Lead Technology Analyst

University Library
Indiana University - Purdue University Indianapolis
755 W. Michigan Street
Indianapolis, IN 46202
317-274-0749
www.ulib.iupui.edu

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABEIAAYFAlcnU5QACgkQs/NR4JuTKG8HCQCdGZzlQyElN310CGHjKaFLrCAO
iVEAn2geUec9ARHbLGWI3GG4X5W/fTXQ
=QcEv
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
