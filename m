Return-Path: <hopper@omnifarious.mn.org>
Date: Tue, 27 Mar 2001 14:45:38 -0600
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] lvmgui 0.2 release
Message-ID: <20010327144538.A25796@omnifarious.mn.org>
References: <3ABDD38D.A841FFD3@ida.xs4all.nl> <wxx1yrkklzx.fsf@fjorir.ifi.uio.no> <20010327122311.A25656@d3.front>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20010327122311.A25656@d3.front>; from ralph@oro.net on Tue, Mar 27, 2001 at 12:23:11PM -0800
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
Cc: Ralph Jennings <ralph@oro.net>

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2001 at 12:23:11PM -0800, Ralph Jennings wrote:
> On Tue, Mar 27, 2001 at 04:02:10AM +0200, Terje Kvernes wrote:
> > Jorg de Jong <jorg.de.jong@ida.xs4all.nl> writes:
> > > + New Features / Enhancements / Bug Fixes
> > >=20
> > > - added images for LV and PV.=20
> > > - extend/reduce a VG
> > > - extend/reduce a LV
> > > - added vgscan in menu
> > > - changed File->Rescan to File->Refresh
> >=20
> >   sounds cute. I was actually thinking of writing something like this
> >   myself, but can't really decide on what language to do it in. :)
>=20
> How about Tcl/Tk?  Quick and easy to learn (a bit C, and Perl combined).
> I picked it up quick by hacking allready made scripts, and I didn't know
> any perl, but I know some C.  And you've got a good one allready made,
> "/usr/src/linux/scripts/kconfig.tk" (might have to do "make xconfig" to
> create it though).  Not as pretty as java, or C, but much faster than C
> to create, and will run on most systems.

	:-P

	Tcl/Tk has got to be the ickiest language I've ever had the
displeasure of writing a program in this side of BASIC.  It combines the
obtuseness of lisp with the execution speed of Javascript.

	Might I humbly suggest Python.  :-) Python is much cleaner than
Tcl/Tk.  You can even use Tcl/Tk from Python without having to write any
Tcl code.  Or, you could use PyGTK or PyGNOME and have a nicer looking
interface.  :-) It's also nearly as fast to develop in as Tcl/TK.  It
has a command line interpreter and a very regular set of rules.

Have fun (if at all possible),
--=20
The best we can hope for concerning the people at large is that they
be properly armed.  -- Alexander Hamilton
-- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hoppe=
r) --

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6wPvyG4QeWBeRdS8RAntuAJ9TqN45RZ9ip3453tZnOBmxgthtwQCg6lrk
IfeP6Mc/l6rcT8Jd2dWGcmw=
=0dXG
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
