Return-Path: <cduffy@mvista.com>
Date: Fri, 12 Jan 2001 22:36:00 -0800
From: Charles Duffy <cduffy@mvista.com>
Message-ID: <20010112223600.A846@mvista.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
Subject: [linux-lvm] LVM 0.9.1beta1 vgscan segfault when run with -d
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

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Howdy. I'm experiencing some difficulties while transitioning from LVM
0.8i to 0.9.

vgscan reports:

vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV": can't
get data of volume group "vg01" from physical volume(s)

When I try to recieve more info (by running vgscan with "-D"), I
recieve a segfault.

This appears to be happening inside pv_read_uuidlist, at the memset on
line 91 (I added some extra debug() calls to determine this). The
attached log (from the original, unpatched version) should help by
giving some context.

Frankly, I don't know why this is happening -- more than sufficient
space appears to be allocated beforehand -- but, as long as one rules
out a bug in debug(), I don't see any other way 'round it.

Thanks for your help.

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6X/dQr/O29KUQmJURAlLaAJoDdfUuLVKggBfDKdSlgqZEoT69pgCfe/iw
GbfeGq8mFg6MlYdWAceelhk=
=0QqA
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
