Date: Mon, 27 Aug 2001 09:20:49 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Problems compiling lvm 1.0 and 2.4.x kernel
Message-ID: <20010827092049.A12065@sistina.com>
References: <Pine.A41.3.96.1010827154540.15862G-100000@hadron.tp2.ruhr-uni-bochum.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <Pine.A41.3.96.1010827154540.15862G-100000@hadron.tp2.ruhr-uni-bochum.de>; from peterd@tp2.ruhr-uni-bochum.de on Mon, Aug 27, 2001 at 03:51:00PM +0200
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
Cc: Peter Druck <Peter.Druck@tp2.ruhr-uni-bochum.de>

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2001 at 03:51:00PM +0200, Peter Druck wrote:
> Hallo,
> I want to update my lvm from 0.9xx to 1.0. I've downloaded a
> new kernel 2.4.9 (but I also tried it with 2.4.4). After I've
> applied the patch and compile the kernel I get the following
> error. Any idears what goes wrong?

Yep, basically what happened is Linus and some other guy decided to change
min and max to have three arguments instead of two, and did so without
telling anyone in 2.4.9.  Pretty nice, huh?  Anyway, Alan Cox has refused to
incorporate the changes 'cause it breaks almost every driver out there. See
the thread starting at
http://uwsg.iu.edu/hypermail/linux/kernel/0108.2/0117.html on the linux
kernel mailing list for more details.

This problem is fixed in the CVS and in 1.0.1-rc1.

> Here is what make says:
> lvm.c:2329: macro `min' used with only 2 args
> lvm.c:2343: macro `min' used with only 2 args
> lvm.c: In function `__extend_reduce':
> lvm.c:2329: parse error before `__x'
> lvm.c:2329: `__x' undeclared (first use in this function)
> lvm.c:2329: (Each undeclared identifier is reported only once
> lvm.c:2329: for each function it appears in.)
> lvm.c:2329: `__y' undeclared (first use in this function)
> lvm.c:2343: `old_stripe_size' undeclared (first use in this function)
> lvm.c:2343: parse error before `__x'
> lvm.c:2280: warning: `end' might be used uninitialized in this function
> lvm.c:2339: warning: `end' might be used uninitialized in this function
> make[3]: *** [lvm.o] Error 1
> make[2]: *** [first_rule] Error 2
> make[1]: *** [_subdir_md] Error 2
> make: *** [_dir_drivers] Error 2

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
"Memory is like gasoline. You use it up when you are running. Of
course you get it all back when you reboot..."; Actual explanation
obtained from the Micro help desk.
-----End Obligatory Humorous Quote------------------------------------------

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ildBpE6/iGtdjLERAgs9AJ0Z8Z3Y7844BQ+ufrKu2C3r9hlf3ACfU3/K
cNVDJt3n9dtxkDld0n9M/rI=
=lfEH
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
