Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBFIG1r19086
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 13:16:01 -0500
Received: from zippy.toger.us (zippy.toger.us [65.19.178.247])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBFIFouJ017066
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 13:15:56 -0500
Date: Wed, 15 Dec 2004 10:15:46 -0800
Subject: Re: [linux-lvm] How to increase/decrease space
Message-ID: <20041215181546.GC22568@zippy.toger.us>
References: <OF18FEB14B.36F3D16B-ON86256F6B.00629DBA-86256F6B.0063EE24@schneider.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AWI++RYR8LQhrg5F"
Content-Disposition: inline
In-Reply-To: <OF18FEB14B.36F3D16B-ON86256F6B.00629DBA-86256F6B.0063EE24@schneider.com>
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


--AWI++RYR8LQhrg5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2004 at 12:11:30PM -0600, AdabalaP@schneider.com wrote:
> (1) Added more space (350 meg) to /usr using the command "lvresize -L+350=
".
> When i display the volume group using "lvdisplay" it shows 2.3 gb, But wh=
en
> i use "df -m" it is still at 1.9 gb and 92% used state.
You've resized the volume but not the filesystem sitting on top
of it. Some filesystems can be resized online while others must
be unmounted. Some may not be resizable at all.

See http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html.

-Jason Martin
--=20
This message is PGP/MIME signed.

--AWI++RYR8LQhrg5F
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: --no-verbose

iD8DBQFBwH9Sl2ODWuqVSBMRAofiAJwLCz2f18sasdFPedX9MD41dOL3HQCffLD/
rOLUBYRFUwc+CJl/Wqt5njk=
=68hI
-----END PGP SIGNATURE-----

--AWI++RYR8LQhrg5F--
