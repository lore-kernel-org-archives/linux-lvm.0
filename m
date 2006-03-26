Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2QCZDn1022658
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 07:35:13 -0500
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2QCZCam002868
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 07:35:12 -0500
Date: Sun, 26 Mar 2006 14:35:11 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] online resize
Message-ID: <20060326123511.GS31387@lug-owl.de>
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<200603260407.27160.krakrjak@volumehost.net>
	<20060326102653.GL14018@percy.comedia.it>
	<200603260537.00242.krakrjak@volumehost.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1IOPqZ3f1xe/JZlz"
Content-Disposition: inline
In-Reply-To: <200603260537.00242.krakrjak@volumehost.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--1IOPqZ3f1xe/JZlz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2006-03-26 05:36:59 -0600, Zac Slade <krakrjak@volumehost.net> wrot=
e:
> On Sunday 26 March 2006 04:26, Luca Berra wrote:
> > if you have any horror story, please share it, it will surely help other
> > users out there.
> Distribution: Gentoo
> Data: /home
> Target: Resize from 1GiB to 800MiB (plenty of free space)
> Filesystem: ext3
> Method: ext2resize with kernel patches and latest e2fsprogs
>=20
> Unmount /home in single user mode.  Resize using ext resizing utilities a=
nd=20
> spend the next 12 hours recovering inodes with fsck only to find a few=20
> hundred megs of data in /home/lost+found (with nonsensical names) and=20
> swearing off ext3 for mission critical data.

Nice story, but as a bug report, this is mostly useless:

  * After umount, did you run an e2fsck -f?

  * Do you have a script(1) log of the whole session? (You'd probably
    have this started as a last resort log then you started the
    fsck'ing after the resize.)

  * What exactly is "ext resizing utilities"? Did you save a copy of
    it (incl. sources to find out about additionally applied patches?)

  * These nonsensical names you refer to are the file's inode numbers,
    in decimal. For mission-critical systems, it's wise to regularly
    get inode listings with filenames. Did you compare those inode
    numbers with your backups?

  * Did you prepare an image-backup of your 1GB container beforehand?
    Helps for easy recovery as well as error reproduction (esp.
    because 1GB isn't all that hard to store on one CD when there's
    plenty of free space, which can be made to compress very well.)

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 f=C3=BCr einen Freien Staat voll Freier B=C3=BCrger"  | im Internet! |   i=
m Irak!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--1IOPqZ3f1xe/JZlz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEJop+Hb1edYOZ4bsRAsTKAJ4mwE/AmLHkz3wGW9VAo8mh87X2dwCfaxnw
sPbYksU0DYCmSGcDRyvJJac=
=Au5A
-----END PGP SIGNATURE-----

--1IOPqZ3f1xe/JZlz--
