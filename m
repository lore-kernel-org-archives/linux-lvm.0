From: Wiktor Wodecki <wodecki@gmx.de>
Message-ID: <20030628115033.GA660@gmx.de>
References: <20030627202130.066c183b.akpm@digeo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20030627202130.066c183b.akpm@digeo.com>
Subject: [linux-lvm] Re: 2.5.73-mm2
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
Date: Mon Jun 30 09:51:10 2003
List-Id: <linux-lvm.redhat.com>
To: Andrew Morton <akpm@digeo.com>
Cc: linux-lvm@sistina.com

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 27, 2003 at 08:21:30PM -0700, Andrew Morton wrote:
> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.5/2.5.73/2.5.=
73-mm2/
>=20
> Just bits and pieces.

I have problems with lvm2 and the 2.5.73-mm2 patchset. I have two volume
groups, one with 4 lv's (lvm2 metadata) the other one with only one lv
(lvm2, too). When I boot the 2.5.73 stock kernel everything seems to be
fine, however when I boot into -mm2 only the first lv of the first vg is
found. A subsequent lvscan doesn't find anything.  I've seen this bug a
couple of kernel releases ago in your tree (I think it was
2.5.69-mmsomething) but I didn't had time to look into it then, I had
other 2.5 problems back then.  There are more things in my lvm
configuration (some pv's beeing md devices) but I don't think that is
important, since the raid stuff comes up properly.=20
Booting into stock 2.5.73 brings up the lv's as expected.

I'm running debian testing on x86 with the lvm2 package installed.
LVM version:     1.95.15 (2003-01-10)
Library version: 0.96.07-ioctl-cvs (2002-11-21)
Driver version:  1.0.6

If you need more infos or patches to be tested I'd be happy to help.

--=20
Regards,

Wiktor Wodecki

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+/YEJ6SNaNRgsl4MRAq6RAKDOTTYClMgZ2TfdEZSgW8BDtQM5mACgqfEO
dsAx0Sy27wRhBcrwAIyY2Wo=
=U1l8
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
