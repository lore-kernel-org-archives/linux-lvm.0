From: Tracy R Reed <treed@ultraviolet.org>
Message-Id: <20020123172346.L8275@ultraviolet.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
    protocol="application/pgp-signature";
    boundary="2xeD/fx0+7k8I/QN"
Content-Disposition: inline
Subject: [linux-lvm] Automatically GROW an LV to max size
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
Date: Wed Jan 23 19:24:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm the system administrator for MP3.com. I talked to some Sistina
developers who visited the office a year or so ago but don't recall their
names now, sorry. One if the things I asked for in LVM (and would still
like to see) is a switch to create an LV that is as big as the remaining
disk space available.=20

We have a redhat based kickstart install that sets up a basic / and then
creates an LV out of the rest of the disk. Currently we have hard coded
the size of the remaining disk but it would be really slick if we could
just pass an option to lvcreate which would just create an lv with the
most space possible.=20

Right now if we ever install on anything other than one of our standard
36G disks we have to delete the lv that was made and resize it or if the
disk is smaller than 36G the hard coded lvcreate size will fail due to
lack of space.=20

There's got to be a cleaner way to do it.

--=20
Tracy Reed      http://www.ultraviolet.org

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjxPYiEACgkQ9PIYKZYVAq0TMgCbBPVkR4XBGhPCSiq6giuQh7sA
jTwAoKBiR5eFJeZyTa1vjhpTKZCA5nsK
=1e/p
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
