From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] pvscan showing 0 free on all PV's.
Message-ID: <20030916143432.H27659@copilotconsulting.com>
References: <3F676739.13431.C25AFD2@localhost> <3F675CDB.80002@tupshin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Content-Disposition: inline
In-Reply-To: <3F675CDB.80002@tupshin.com>; from tupshin@tupshin.com on Tue, Sep 16, 2003 at 11:56:27AM -0700
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
Date: Wed Sep 17 07:07:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2003 at 11:56:27AM -0700, Tupshin Harper spake thusly:
> ext2resize to shrink it, followed by an lvreduce to reduce the size of=20
> the partition that the filesystem lives on, but *DANGER* *DANGER*=20
> *DANGER*. Reducing the size of an existing filesystem is inherently=20
> dangerous, so back up, tread with caution, and don't blame me when a=20
> meteorite flattens your house.

Inherently dangerous? Nonsense. It should not be inherently dangerous if
the resize tool and LVM do their jobs properly. Resizing should be a
perfectly safe operation when done properly.

> If you are using reiserfs, jfs, or xfs, you are probably out of luck, as=
=20
> these filesystems don't currently support reduction.

reiserfs supports reduction. I have done it many times. I wouldn't be
surprised if the others do too but I haven't used them yet.

--=20
Tracy Reed
http://copilotconsulting.com

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj9ngegACgkQ9PIYKZYVAq39GACdHpKe5qa1mSWGJIiBwSVS2Nxr
qFUAnR+OteSREuJ4NJzCyTAPOcQxBklt
=0OyG
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--
