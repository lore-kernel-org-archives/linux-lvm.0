Return-Path: <treed@ultraviolet.org>
Date: Tue, 7 Aug 2001 00:37:12 -0700
From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010807003712.C29793@ultraviolet.org>
References: <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it> <20010805234715.A30768@vestdata.no> <20010806184631.B31054@ultraviolet.org> <20010807072327.A10691@vestdata.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline
In-Reply-To: <20010807072327.A10691@vestdata.no>; from lvm@ragnark.vestdata.no on Tue, Aug 07, 2001 at 07:23:27AM +0200
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

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2001 at 07:23:27AM +0200, Ragnar Kj=F8rstad wrote:
> Pardon me for finding it amusing they call it Automatic Transparent
> Failover when it apperently is neither automatic nor transparent :-)

Actually, when installed properly on Solaris (easy to do) it actually is
automatic and transparent. I can shut down a RAID controller or yank the
fibre and it fails over to the other path and none of the applications
know it happened and the system keeps working as it should. We have it
installed on all of our Solaris systems with Clariion disk arrays. We have
never actually had a failover in production though. Overall it is very
nice but it is proprietary and expensive and requires a proprietary and
expensive Solaris or NT box to run it on.

--=20
Tracy Reed      http://www.ultraviolet.org
Bill Gates to his broker: "You idiot, I said $150 million on
**SNAPPLE**!!!"

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjtvmqgACgkQ9PIYKZYVAq1oAgCgnTs8Q7noOcX8q+//d2s1gMkw
z9wAn1qAPqZWlVg3Oe3mDgUAvwgxxfaj
=GbVp
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
