Return-Path: <bg@blacknet.de>
Date: Tue, 27 Mar 2001 16:37:01 +0200
From: Goetz Bock <lvm@blacknet.de>
Message-ID: <20010327163701.B6980@dragon.blacknet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
Subject: [linux-lvm] Can I use snapshots for this?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

I'm sorry, if this whould haven been obvious by simply triing, but I did
can not remember to read anything in the docs:

I'm currently running a small 20GB RAID array and allow my users a
simple versioning by storing a copy of all files one an IDE drive in the
system every night at 4:00.

As 20GB are very small, we'll get a 180GB RAID in the next month.
Unfortunately there is no cheep 180GB ide drive do have this way of
verioning :-(.

But I thought about using LVMs snapshoots for this. Can I do so?

Thanks,
    Goetz.

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6wKWMf5srOMkjkQoRAhbsAJ4jCgqCEXEjxNno1rFZ30Cc38ECLACfaLaV
7zwo58Aj9Sxljq1zIpx5fb8=
=aiku
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
