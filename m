From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] RAID 1 recontruct
Message-ID: <20020823224424.GB6812@kluge.net>
References: <Pine.A41.4.43.0208231621580.45552-100000@hera.itg.uiuc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <Pine.A41.4.43.0208231621580.45552-100000@hera.itg.uiuc.edu>
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
Date: Fri Aug 23 17:45:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2002 at 04:26:07PM -0500, Alexander Lazarevich wrote:
> How do I tell the system about the new drive and reconstruct the RAID 1
> array? The replacement drive is a known good drive.

Unless this have changed since the last time I used SW RAID, there is
no auto-rebuild support.  You have to partition the new disk, then do
a raidhotadd to get the partition into the array.  Then it'll rebuild.
Read the man page on raidhotadd for more info. :)

--=20
Randomly Generated Tagline:
There's something to be said for returning the whole syntax tree.
              -- Larry Wall in <199710221833.LAA24741@wall.org>

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ZrrIAuOQUeWAs2MRAvyyAKCiQvQkSQMvCn9WAW45T1Yc9mUmwwCg3cWE
ffNCAGE+y71aFZwAKIsK8vY=
=9g+j
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
