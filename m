Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j09KTIr08409
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 15:29:18 -0500
Received: from zippy.toger.us (zippy.toger.us [65.19.178.247])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j09KT597029941
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 15:29:11 -0500
Date: Sun, 9 Jan 2005 12:28:33 -0800
Subject: Re: [linux-lvm] she-bang doesn't work - bad interpreter: Permission
	denied
Message-ID: <20050109202833.GT1816@zippy.toger.us>
References: <20050109191257.6887.qmail@web52701.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LXsBfGm2MIDJcXyT"
Content-Disposition: inline
In-Reply-To: <20050109191257.6887.qmail@web52701.mail.yahoo.com>
From: Jason Martin <jhmartin@toger.us>
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


--LXsBfGm2MIDJcXyT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 09, 2005 at 11:12:57AM -0800, Patrick Bartkus wrote:
> When I try to excute a simple perl program on my
> /home/.../bin (which is on a logical volume partition)
> I get:
Make sure that /home isn't mounted noexec.

-Jason Martin
--=20
Confucius say: Man who run behind truck get exhausted.
This message is PGP/MIME signed.

--LXsBfGm2MIDJcXyT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: --no-verbose

iD8DBQFB4ZPwl2ODWuqVSBMRAkFpAJ9ZQK7gheX/0Aco6XrN0TJxjF1WkQCbBefm
/AXJv2TCBgWOu9LOpqSNAb4=
=PXRo
-----END PGP SIGNATURE-----

--LXsBfGm2MIDJcXyT--
