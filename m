From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] disk naming
Message-ID: <20030104184056.GF26298@kluge.net>
References: <1041610095.19844.45.camel@mosix> <20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix> <1023440000.1041619125@[192.168.200.4]> <20030103192045.GI18613@tykepenguin.com> <1121550000.1041664663@[192.168.200.4]> <20030104100014.GA11424@tykepenguin.com> <1216750000.1041705320@[192.168.200.4]>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Content-Disposition: inline
In-Reply-To: <1216750000.1041705320@[192.168.200.4]>
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
Date: Sat Jan  4 12:40:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 04, 2003 at 12:35:20PM -0600, Steven Lembark wrote:
> Try this on a system with two scsi cards and you'll see what
> I mean: without changing anything else, switch which of the
> cards the two disk chains connect to (i.e., disks on bus0
> are now on bus1). Reboot the machine and see if it will boot
> successfully.

You're arguing about something different.  Will LVM work if you move disks
around?  Yes.  Will the box boot if you move disks around?  Depends if
you setup the box to do that.  Booting has nothing to do with LVM.

--=20
Randomly Generated Tagline:
"Ever heard of .cshrc?
 That's a city in Bosnia.  Right?"      - Unknown

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+Fyq4AuOQUeWAs2MRAvLxAJ9HF2YoDU7o9mHvx0tWYjoT683wnwCg1CUW
1o5wbEjYUYVjWWVF2HwiEF8=
=dJiD
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--
