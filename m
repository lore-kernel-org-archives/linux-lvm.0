Return-Path: <hopper@omnifarious.mn.org>
Date: Wed, 15 Aug 2001 12:21:49 -0500
From: "Eric M. Hopper" <hopper@omnifarious.org>
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
Message-ID: <20010815122149.A27137@omnifarious.org>
References: <20010815175659.A29749@sistina.com> <20010815182548.U3941@gum01m.etpnet.phys.tue.nl> <20010815185005.A32239@sistina.com> <20010815190428.A11146@athlon.random>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20010815190428.A11146@athlon.random>; from andrea@suse.de on Wed, Aug 15, 2001 at 07:04:28PM +0200
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

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2001 at 07:04:28PM +0200, Andrea Arcangeli wrote:
> On Wed, Aug 15, 2001 at 06:50:05PM +0200, Heinz Mauelshagen wrote:
> > offset. No known way around this.
>=20
> As said in the attached email (never got a reply about it yet btw)
> there's definitely a way around it, there's no magic in the beta7
> lvmtools, anything they can do can be done as well in the new lvmtools
> if we want to (and I believe we want to). I understand you don't want to
> clobber the core code with backwards compatibility cruft, but a new
> backwards compatibility utility, even in a new directory to make obvious
> nothing gets clobbered, could be developed and it would solve the
> problem.

	I, frankly, won't be upgrading LVM from my 0.9 beta 7 release
until something like this exists.  The whole concept of needing some
extra special process with several steps to do the migration scares the
willies out of me.  I keep important data on my computer.  I have no
desire to lose it.

	LVM should refuse to access VGs that have PVs that have this
problem, and there should be a straighforward, single-step migration
tool that comes with the release.

--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.2 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7eq+tjtsvlOwvazYRAlDKAJ41e0+lLtp3oK0dujzveyiSoypn5QCfUn/P
79jkxR7IXuw4u+d/89LbRBg=
=ogWK
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
