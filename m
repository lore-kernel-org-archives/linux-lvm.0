Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3KJ7Np17955
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 15:07:23 -0400
Received: from simmts6-srv.bellnexxia.net (simmts6.bellnexxia.net
	[206.47.199.164])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3KJ7MMc001673
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 15:07:23 -0400
Received: from [192.168.100.80] ([198.164.220.74])
	by simmts6-srv.bellnexxia.net
	(InterMail vM.5.01.06.05 201-253-122-130-105-20030824) with ESMTP id
	<20040420190715.JQKJ8424.simmts6-srv.bellnexxia.net@[192.168.100.80]>
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 15:07:15 -0400
From: Roy Nicholl <RNicholl@NBNet.nb.ca>
Date: Tue, 20 Apr 2004 16:07:18 -0300
References: <20040420153405.E99EE73D4C@hormel.redhat.com>
In-Reply-To: <20040420153405.E99EE73D4C@hormel.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_yTXhA/51ys5jTHY";
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200404201607.30967.RNicholl@NBNet.nb.ca>
Subject: [linux-lvm] Help recovering metadata
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
To: linux-lvm@redhat.com


--Boundary-02=_yTXhA/51ys5jTHY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline


This should actually be titled, "Help recovering from stupidity ... why=20
not to use GUI administration tools"

I recently had a box fail [VRM on the MB] and moved it's drive into=20
another machine running SuSE 9.0.  On this drive where separate=20
patitions for boot,root,swap and one partition comprised of a VG=20
(system)  containing eight LVs (usr, opt, var, tmp, local, home,=20
mirror, & vmware).  Each logical volume contains a JFS filesystem.

When I went to view the VG using the LVM tool under YaST, I somehow=20
managed to re-inistalize the VG on the disk partition [read: blew away=20
the existing metadata] ... Lesson ... use the command-line, Luke.

Now of course there is data on this disk that I really need (in home,=20
mirror and vmware) and I know that it is still there - I make an image=20
of the disk using EnCase and walked through it.  EnCase does not appear=20
to undestand the Linux LVM or the JFS filesystem, so I was unable to=20
put humpty dumpty back together again.

Since all I did (irony intended) was re-initialise the VG descriptor and=20
metadata, the LVs and their respective filesystems must still be there=20
[my snoop with EnCase would appear to confirm this hypothesis].  How do=20
I go about finding the beginning of each LV/filesystem and re-creating=20
the former VG metadata ... and before you ask, now I do not have=20
vgcfgbackup file [but I still have the device nodes and the=20
correspnding 'group' file].

Help would be most appreciated.

Roy


=2D-=20
Roy Nicholl
283-A Connaught St.           =20
=46redericton, NB		=09
Canada	E3B 2B3
E-mail: RNicholl@NBNet.nb.ca

--Boundary-02=_yTXhA/51ys5jTHY
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAhXTyResFzEV6sgcRArzKAJ4w4yEcZkC9Otr5ohE9/mFwhvy3JwCgiNJt
qwMSdM5Kc/+i0lkOKfcw+uY=
=aXR7
-----END PGP SIGNATURE-----

--Boundary-02=_yTXhA/51ys5jTHY--
