From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] df and lvscan show differnet sizes
Message-ID: <20011129085506.A3622@omnifarious.org>
References: <OF05414B2E.B23B3CDB-ON86256B12.007DCDB5@TEXASMUTUAL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <OF05414B2E.B23B3CDB-ON86256B12.007DCDB5@TEXASMUTUAL.COM>; from JPolache@texasmutual.com on Thu, Nov 29, 2001 at 08:26:28AM -0600
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
Date: Thu Nov 29 08:53:08 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2001 at 08:26:28AM -0600, Jonathan S. Polacheck wrote:
> I am running Mandrake 8.1 w/devfs. df shows the original size of
> /dev/vol_usr and /dev/vol_var.  lvscan shows sizes after lvextend.  I have
> rebooted.

	You have to run a filesystem resize utility to get the
filesystems to change size and occupy the whole lv.  In reiserfs,
extending a filesystem can be done while the filesystem is online.  With
ext2 and ext3, extending the fs online requires a special kernel patch,
but can be done while the filesystem is unmounted.

	In all such cases, rebooting is totally unecessary.  You can do
it all online.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8BkxKjtsvlOwvazYRAgBkAKDp7mviz7Fz9Awzmo0kq7sw7EC2ZQCeNH9O
IPsTgPzopI/3RkNHYibAKNU=
=MhWz
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
