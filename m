Return-Path: <smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Date: Tue, 24 Apr 2001 23:19:52 -0400
Message-ID: <000801c0cd36$988428e0$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010424104505.F9882@sistina.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, Apr 24, 2001 at 12:19:45PM -0300, Ernesto Silva wrote:
> Hi,
>=20
> 	In order to make things right I downloaded the 2.4.3 kernel and
> compiled it (i386).
>=20
> 	With the new kernel running (lvm-mod load ok) I'm trying to
> compile lvm tools, but there are lots of warinigs, all the same
> thing, the first of them is:
> -----------------------------------------------------------
> gcc -c -pipe -g -O2 -Wall -DDEBUG -I ../../tools/lib -I ../../tools
> - debug.o debug.c

Am I reading this right, there's a " - " in between the include line
and the object file?  That didn't seem to work all that well on my
gcc (2.95.2).  You might want to see what's putting the dash in
there... it probably wants to be a "-o"

> In file included from ../../tools/lib/liblvm.h:97
> 		from basename.c:34
> ../../tools/lib/lvm_log.h:47:59: warning: nothing can be pasted
> after this token=20
 <...snip...>=20
> Does anyone had a problem like this before???

Hmm...I don't get that at all!  Which version of GCC are you using?=20
Did you
download the 0.9.1_beta7 tarball or grab something from the cvs?

Regards,
- --=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261
0029 2648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple
sub-keys)

- -----Begin Obligatory Humorous
Quote----------------------------------------
THE LESSER-KNOWN PROGRAMMING LANGUAGES #16:
C- This language was named for the grade received by its creator when
he
submitted it as a class project in a graduate programming class.  C-
is
best described as a "low-level" programming language.  In fact, the
language generally requires more C- statements than machine-code
statements
to execute a given task.  In this respect, it is very similar to
COBOL.
- -----End Obligatory Humorous
Quote------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.0.1

iQA/AwUBOuZCWHC+DNfF0nVpEQJMVQCfWDINzWztoSaj/ayyOQvE9IRIa6QAoLVw
4/fh74fjjCMWQ4vRksVgKoEY
=3DSzDr
-----END PGP SIGNATURE-----
