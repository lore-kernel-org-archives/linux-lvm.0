Subject: Re: [linux-lvm] Strange hard drive behaviour
Message-ID: <20030405173116.GA27048@mitethe.eudyptes>
References: <Pine.LNX.4.44.0304051859320.7718-100000@omega.telia.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0304051859320.7718-100000@omega.telia.net>
From: idsfa@visi.com
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
Date: Thu Apr 10 09:10:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 05, 2003 at 07:18:11PM +0200, vegh@omega.telia.net wrote:

> I have a question regarding strange hard drive behaviour with an LVM=20
> volume. When I am creating the ext2 file system over my volume, the=20
> process takes much more time than expected, and the hard drive makes
> a strange noise, it sounds like its head is jumping back and forth all
> the time.

That nasty click is an IDE drive resetting itself.  Failure may be
moments away.  In the hardware RAID you described, it may be a bit
harder to isolate which drive is dying ... you may actually have to
get your head next to each one to find it.

The problem then is that you need to evacuate that PV (which may be the
whole array from your description of the setup) and replace the faulty
drive.  You may be able to take less drastic action, depending upon the
capabilities of your RAID card.

If you are mirroring, you can also get this if one of the drives in the
mirror is slower than the other (also happens if you are striping, but
you said that you weren't).

While drives can live for months this way, they drag your system
performance to the ground and eventually fail anyway.  Get out
while you can still save your data!


Michael Kellen
--=20
Think Locally, Act Globally: =20
"It's cold in here ... I'd better release a few million tons of CFCs!"

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+jxLkzCEwIKHWl1kRAlWMAJwKHX1vtXfMahhPCliN3mPnKuF/gwCfWDu4
0CUKWpho3j9w1LMh9ytxHoE=
=ImZC
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
