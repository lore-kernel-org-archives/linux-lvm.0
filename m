From: Mike Williams <mike@gaima.co.uk>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D49@s99mail06> <1070853946.1558.17.camel@avalon> <20031208162615.GJ2015@zaurak.cedar.Buffalo.EDU>
In-Reply-To: <20031208162615.GJ2015@zaurak.cedar.Buffalo.EDU>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200312082008.05785.mike@gaima.co.uk>
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
Date: Mon Dec  8 14:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 08 December 2003 16:26, Ajay Shekhawat wrote:
> Since noone has mentioned XFS, let me throw in my recommendation for XFS.
> XFS (like, probably, IBM's JFS) is a top-notch filesystem.
> Try it out in your scenario, you might like it.

XFS filesystems can't be shrunk, which I see as a *major* "flaw".
I agree that it's a very nice filesystem, but not being to resize it as I n=
eed=20
rules it out entirely.

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/1NolInuLMrk7bIwRAu7MAJ9vlxw2T8YMc7ad4t8zNBsALDgx5gCeNED6
kmCwkAEMPpC8cbLFAs5UDVc=3D
=3DzqwS
=2D----END PGP SIGNATURE-----
