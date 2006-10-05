Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k95AaEt9009092
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 06:36:14 -0400
Received: from smtp2.enst.fr (revol2.enst.fr [137.194.2.14])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k95AaDPd002939
	for <linux-lvm@redhat.com>; Thu, 5 Oct 2006 06:36:13 -0400
Received: from localhost (localhost.enst.fr [127.0.0.1])
	by smtp2.enst.fr (Postfix) with ESMTP id 8FE9EB8293
	for <linux-lvm@redhat.com>; Thu,  5 Oct 2006 12:36:12 +0200 (CEST)
Received: from dhcp26-120.enst.fr (dhcp26-120.enst.fr [137.194.26.120])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(Client did not present a certificate)
	by smtp2.enst.fr (Postfix) with ESMTP id 61F60B8292
	for <linux-lvm@redhat.com>; Thu,  5 Oct 2006 12:36:10 +0200 (CEST)
Subject: Re: [linux-lvm] Avoiding disk changes
From: Fabien Jakimowicz <fabien@jakimowicz.com>
In-Reply-To: <4524071A.9000007@idealcorp.com>
References: <4524071A.9000007@idealcorp.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-LdpPW0aRuDqPys82TvYe"
Date: Thu, 05 Oct 2006 12:36:09 +0200
Message-Id: <1160044569.3850.2.camel@dhcp26-120.enst.fr>
Mime-Version: 1.0
Reply-To: fabien@jakimowicz.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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


--=-LdpPW0aRuDqPys82TvYe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2006-10-04 at 15:10 -0400, John Ward wrote:
> Question regarding disk changes for LVMs. Are there any known scenarios=20
> where the on disk information will change (automatically) after the=20
> device(s) are detected and probed by the system?
>=20
> My scenario is, I want to plug my LVM drive(s) into a different machine=20
> (via external USB) for analysis. I want the drives to remain 100%=20
> unmodified.
>=20
> I would like to setup my configuration such that no disk changes will=20
> occur.  Does anything within the LVM or DM realm modify the on-disk=20
> metadata under normal circumstances, or if a corrupted/broken LVM scheme=20
> is detected (partial or bad disk, etc.)?
>=20
> In an attempt to gain absolute control over the detection and mounting=20
> process, I've set the global configuration file to test mode:
>=20
> /etc/lvm/lvm.conf:
> ...
> global {
> ...
> 	test =3D 1
> ...
>=20
>=20
> After that, once I plug my device in, I set the LVM_SYSTEM_DIR env=20
> variable to point to my own configuration (because I don't want to=20
> twiddle with the system-wide one anymore than I have to).
>=20
> I then use "vgchange --partial -a y" to access the new device, and=20
> create the /dev nodes.
>=20
> In my custom lvm.conf (located in the $LVM_SYSTEM_DIR) I've set a few=20
> paranoid settings, including:
>=20
> 	filter =3D ... (only accept /dev/sd* devices)
> 	write_cache_state =3D 0
> 	backup =3D 0
> 	archive =3D 0
> 	locking_type =3D 0
>=20
> 	Setting test mode in this configuration wasn't allowing me to do the=20
> vgchange, so I left that off.
>=20
> Hope this isn't too open ended of a question, short if diving into the=20
> source code, I've tried to research to what extent LVM might=20
> automatically twiddle bits on the drive.
>=20
> Thanks in advance.

Try to use hdparm to set your hard-drive in read-only mode.

--=-LdpPW0aRuDqPys82TvYe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFJOAZzTD+AjVP2VIRAmXzAJ9PgQDqJthiGOKuYUxaEjizyj5PYwCgmW4p
mOOvCJ1MP6gu34Why/GJVsE=
=RkCH
-----END PGP SIGNATURE-----

--=-LdpPW0aRuDqPys82TvYe--
