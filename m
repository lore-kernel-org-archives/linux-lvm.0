Return-Path: <treed@ultraviolet.org>
Date: Tue, 7 Aug 2001 00:41:22 -0700
From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010807004122.D29793@ultraviolet.org>
References: <20010807072327.A10691@vestdata.no> <Pine.LNX.4.33.0108070024270.18365-100000@chasqui.LaRed.net.pe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0108070024270.18365-100000@chasqui.LaRed.net.pe>; from carenas@chasqui.lared.net.pe on Tue, Aug 07, 2001 at 12:38:26AM -0500
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

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2001 at 12:38:26AM -0500, Carlo Marcelo Arenas Belon wrote:
> ATF is a pretty interesting hack, where you can virtualize the path to the
> LUNs on a failover configuration, but it is not as good as EMC's PowerPath
> (bundled with Symmetrix drivers) where you actually can do the same thing
> and also share bandwith using the different paths at the same time.

Yes, it is interesting. Although we avoid the Symmetrix line because it's
even more closed than the Clariion arrays. We are very independent and
slice and dice harware to our liking. I sometimes think EMC finds us
frustrating to deal with because we are so independent when they are used
to holding the customers hand and not letting them touch the box. :) We
share bandwidth using the different paths at the same time by distributing
the LUNs equally over the two SP's.

> i am not sure tough that this would be the right way to go as it is pretty
> hardware specific and IMHO too low level, the same could be done on
> software just like the Verita's DMP and probably the actual RedHat's
> multipath capabilities for md could be just a step on the right direction.

Yes, it is definitely hardware specific. I was just wondering if anyone
happened to know of drivers for Linux. We have a ton of money invested in
many of these arrays and md's multipath won't work for us...unless I can
somehow bind a LUN to both SP's at the same time but I'm pretty sure that
is not possible.

--=20
Tracy Reed      http://www.ultraviolet.org
Bill Gates to his broker: "You idiot, I said $150 million on
**SNAPPLE**!!!"

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjtvm6IACgkQ9PIYKZYVAq0jDQCgg14jt1Su3ipb1w+oFHHj4ACH
vSYAn1dlEmy0UrqpM7BAn//gQCYsAedZ
=1mjG
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
