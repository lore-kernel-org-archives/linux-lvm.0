Date: Tue, 4 Sep 2001 21:19:58 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] defragging logical volumes
Message-ID: <20010904211958.B20195@omnifarious.org>
References: <3B9586AD.D38A9524@carolina.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <3B9586AD.D38A9524@carolina.rr.com>; from jedgecombe@carolina.rr.com on Tue, Sep 04, 2001 at 09:58:05PM -0400
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

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2001 at 09:58:05PM -0400, Jason Edgecombe wrote:
> hi,
>=20
>   how can I rearrange logical volumes so that they are contiguous? does
> it matter if the root LV isn't contiguous?

	I've thought of this too, and I bet it matters some, but not
very much.  The extents in question are 4M in size.  If you are
concerned about it, you could try increasing the extent size to 32M and
not lose much in the way of resize granularity.

	The only time it matters is when a normally contiguous read
crosses a logical extent boundary.  So, larger logical extents make this
less likely.  Also, LVM tends to allocate things contiguously anyway.

	Still, the pvmove mechanism provides a way to defragment if
you're concerned about it.  I don't think such a utility exists, but,
given the existence of pvmove, I doubt it would be too hard to write.
'tsort' is your friend.  :-)

	Of course, pvmoving things while the filesystem is still running
is a little dangerous as LVM doesn't do any kind of journalling of
metadata that I know of.  If the power goes out during a move..
*shudder*

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7lYvOjtsvlOwvazYRAmW4AJ45L9zlzBbUDSOgHHCWjVkXEbSTsgCgsuUU
5COJ31bTkoR31MaHMfruI0Y=
=VSAn
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
