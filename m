From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] DM: Possible disk corruption?
Message-ID: <20030107155024.GJ2529@lug-owl.de>
References: <20030107092849.GE2529@lug-owl.de> <20030107145249.A13660@uk.sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Content-Disposition: inline
In-Reply-To: <20030107145249.A13660@uk.sistina.com>
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
Date: Tue Jan  7 09:50:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-01-07 14:52:49 +0000, Alasdair G Kergon <agk@uk.sistina.com>
wrote in message <20030107145249.A13660@uk.sistina.com>:
> On Tue, Jan 07, 2003 at 10:28:50AM +0100, Jan-Benedict Glaw wrote:
> > The first 512 byted of mentioned boot HDD where overwritten by some
> > Samba log! This is followed by some KB of 0x00.
>=20
> If you read/write directly to /dev/hda do you see any corruption?

I've not seen any. The system is quite busy at at some time swapping.
Swapspace is on hda so I would have seen killed processes. But despite
not booting at some time, the box is rock solid.

> Do you see any errors for the device in the system logs?

No.

> Nevertheless, you can block LVM2 userspace from reading/writing
> to/from /dev/hda and its partitions by adding a filter to lvm.conf=20
> (see example.conf) e.g. "r|^/dev/hda|"
> and then running vgscan to apply the new filter.
> [Personally I recommend using a positive filter though - (a)ccept
> the devices you want to use with LVM2 and (r)eject everything else.]

As the box isn't really productive, I can continue to play with it. I'll
do some DM/LVM activity and occassionally sfdisk -l /dev/hda.

> Did you keep a complete log of the commands you ran so you can check
> retrospectively for typos?  (e.g. "/dev/hda" where "/dev/hda2" was
> intended)  [Always a good idea to set shell history to a big number,
> or (esp. on a shared box) to use 'sudo' to record all commands=20
> run as root.]

Sorry, nothing there:
mirror:~# cat .bash_history |egrep '(vg|lv|pv)'
pvdisplay -v |less -S
cat /etc/resolv.conf=20

This has been the second scribbled boot sector on this box. Using LVM on
daily basis (and on more than only that one box) I don't think that I
did the same mistake twice.

Well, I have to do some LVM administration in near future, I'll pay
attention to my /dev/hda:-)

Basically, I liked to know if there are known bugs which could have lead
to such a corruption.

Oh, the samba los snipplet should have gone to
/var/log/samba/<some_file_name>, which is on /dev/hda3. /dev/hda2 is
swap and /dev/hda1 is /boot. So the block ended up in a wrong partition,
at a wrong offset but on the right device (hey, at least one out of
three is right:-)

I'll have an eye on it.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+GvdAHb1edYOZ4bsRAnRgAJ90dAX9I+1WVDnll0oJvFAPgQLnCACePJl0
V8BHWpJ1ZQqYPBVOlbSqABw=
=zNWv
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
