From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] why I can't find lvm VG after reboot
Message-Id: <20020403123913.GC4957@sistina.com>
References: <3C4690E7.000029.23123@smtp2> <001d01c0bc34$a408df20$961471dc@XW>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
In-Reply-To: <001d01c0bc34$a408df20$961471dc@XW>
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
Date: Wed Apr  3 06:38:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 03, 2001 at 07:52:24PM +0800, netxiong wrote:
>I have setup a VG on a softraid system consist of 3 disks,I name the VG as=
 lvmraid and make a ext2 file system on it,It can be mounted to a dirctory =
and work well,but after I reboot the system,I can't find the VG,the proc sy=
stem also doesn't show it and I can't use vgremove to remove it.
>what is wrong with it,helllllllllllllllllllllp!!!this has troubled me for =
two days
>

is there a "vgchange -ay" somewhere in your init procedure?
is LVM a module or is it compiled staticly into the kernel?

http://www.sistina.com/lvm_howtos/lvm_howto/
Look at section 7.5

--=20
Ben Lutgens		http://people.sistina.com/~blutgens/=09
Sistina Software Inc.
 (mail -s "get -info" blutgens-info@sistina.com) for my gpg key, IM info
etc.

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8qvfwCpAw0ZoN3FkRAqJtAKCHJ4jFwKLKCLM1ccTq8pBTIaxckACgtuBh
0RylyuZGQ/muJNIHGH1m/FA=
=Ckrc
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
