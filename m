Return-Path: <cduffy@mvista.com>
Date: Tue, 16 Jan 2001 12:10:46 -0800
From: Charles Duffy <cduffy@mvista.com>
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
Message-ID: <20010116121046.E2709@mvista.com>
References: <20010113114507.D15915@linuxcare.com> <200101130143.f0D1hNF19829@webber.adilger.net> <20010113170616.B22699@caldera.de> <20010116085117.A696@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline
In-Reply-To: <20010116085117.A696@tykepenguin.com>; from caulfield@sistina.com on Tue, Jan 16, 2001 at 08:51:18AM +0000
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

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2001 at 08:51:18AM +0000, Patrick Caulfield wrote:
> On Sat, Jan 13, 2001 at 05:06:16PM +0100, Christoph Hellwig wrote:
> > On Fri, Jan 12, 2001 at 06:43:23PM -0700, Andreas Dilger wrote:
> > > > Would it be possible to clean up the ioctl interface so we
> > > > dont need such large hacks for LVM support? I can do the work
> > > > but I want to be sure you guys will agree to it.
>=20
> If you're prepared to do the work we'd be glad to accept the patch -
> please send it to me or the list so I can check over it before
> committing it. As we don't have an UltraSPARC available for testing
> it's probably better done by someone who does !

I have an Ultra-1 available, presently in use as a prototyping system.
It's not currently using LVM and there's no unpartitioned space on the
drive, but if one of the core developers (or otherwise someone I have
reason to trust) wants to try testing LVM over loopback (or something
of that sort), I can provide access.

I don't have the time to do testing myself, unless someone can provide
a specific set of instructions (ie. the nature of an expected bug is
known; the only question is its presence).

Btw, I can only promise availability for about a week or so; the
machine may become a production system after that time.

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6ZKrGr/O29KUQmJURAgJ2AKCypzVywkPVmQ2DMoMJHn4y6jZNpgCfRetI
n7AsmHPukOigyCdPCZ9vTYY=
=geP1
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
