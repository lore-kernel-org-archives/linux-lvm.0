From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] Just for information ....
Message-ID: <20011120153717.G9141@wookimus.net>
References: <3BFAA389.24AAB2A1@LTUtech.com> <20011120125632.Z1308@lynx.no> <20011120214104.A24005@cistron.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline
In-Reply-To: <20011120214104.A24005@cistron.nl>
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
Date: Tue Nov 20 15:36:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2001 at 09:41:04PM +0100, Wichert Akkerman wrote:
> Previously Andreas Dilger wrote:
> > Yes.  You will need to do a vgscan to find the new disks.  Hopefully th=
ey
> > will not have the same VG name as another VG on that system.
>=20
> What if they do?

Nothing, originally.  Your last "vgchange -a y" should populate the
/etc/lvmtab.d directory with the current working volume group data.
Even if you have two vg's of the same name, your last one should be the
active one.

I had to go back to the original system and do a vgexport <vgname> in
order to import it on the new system.  I've considered naming vg's after
their host (and possibly media type).  That way, I'll know I have at
least a stub of a unique name for the vg.

As far as keeping VG's separate based on media...  I'm torn.  It's a
simple way of making sure I don't loose data if the IDE disk goes bad --
which has happened to me -- while the SCSI disk remains fine.

Unless I'm using RAID, grouping multiple physical disks together in one
VG means I have to pay extra special attention to where the LV's
allocate their PE's.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint =3D B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD


--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7+s0NDMcLGCBsWv0RApK8AJ4jHJeHT9qcxdWXH3st5Zk7MANFswCgl3yt
DCncl/LtjTSBKkHLLu1DUGc=
=Lk57
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
