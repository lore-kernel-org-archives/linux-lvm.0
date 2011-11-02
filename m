Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2E2MRf019820
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:02:22 -0400
Received: from mhw.ulib.iupui.edu (mhw.ulib.iupui.edu [134.68.171.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2E2LRn030290
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:02:21 -0400
Received: from mwood by mhw.ulib.iupui.edu with local (Exim 4.76)
	(envelope-from <mwood@IUPUI.Edu>) id 1RLbOW-0006CR-K7
	for linux-lvm@redhat.com; Wed, 02 Nov 2011 10:02:20 -0400
Date: Wed, 2 Nov 2011 10:02:20 -0400
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Message-ID: <20111102140220.GB17976@IUPUI.Edu>
References: <4EB04692.3060705@alteeve.com>
	<151363651.1656354.1320177081644.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <151363651.1656354.1320177081644.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

BTW I wouldn't call it a "logical volume group".  It's not a group of
logical volumes, but of physical volumes to be treated as a single
slab of storage capacity.  You pile 1-n physical volumes together as a
volume group and then slice off various amounts of the group's
capacity in which to make logical volumes.

A group of one PV may seem strange at first, but it makes things
easier than having to make the LV layer understand *both* the VG and
PV layers.  Not to mention the sysadmin having to understand and
remember two different layerings.

I operate a bunch of boxes with hardware RAID and every one of them is
currently set up as 1 PV : 1 VG : n LV.  (None has enough disks to
make multiple RAID sets worthwhile, or in most cases even possible.)
I see the VG abstraction as capacity to deal with problems that just
haven't come to our shop yet.

--=20
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Asking whether markets are efficient is like asking whether people are smar=
t.

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEAREDAAYFAk6xTWwACgkQs/NR4JuTKG+NhgCfdXvmT08OQ8bF82uzNLsz20wJ
N2oAnA/t8vnT4wNDS/89Z6ABA2qKF8tT
=Zu2a
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
