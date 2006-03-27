Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2R7SZ8J015287
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 02:28:35 -0500
Received: from lug-owl.de (lug-owl.de [195.71.106.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2R7SRhr006614
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 02:28:28 -0500
Date: Mon, 27 Mar 2006 09:28:26 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] online resize
Message-ID: <20060327072826.GY31387@lug-owl.de>
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<200603260537.00242.krakrjak@volumehost.net>
	<20060326123511.GS31387@lug-owl.de>
	<200603262350.53701.krakrjak@volumehost.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gu8wNMO+QVC0jLZM"
Content-Disposition: inline
In-Reply-To: <200603262350.53701.krakrjak@volumehost.net>
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
To: linux-lvm@redhat.com


--gu8wNMO+QVC0jLZM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2006-03-26 23:50:53 -0600, Zac Slade <krakrjak@volumehost.net> wrot=
e:
> >   * Do you have a script(1) log of the whole session? (You'd probably
> >     have this started as a last resort log then you started the
> >     fsck'ing after the resize.)
> No.  The session was not run through script(1).

That's something I learned the hard way, too. Though that was not a
Linux session.

> >   * These nonsensical names you refer to are the file's inode numbers,
> >     in decimal. For mission-critical systems, it's wise to regularly
> >     get inode listings with filenames. Did you compare those inode
> >     numbers with your backups?
> I know they are inode numbers, but they don't help you much in that situa=
tion. =20
> You think people keep inode listings with backups?  What a perfect world =
you=20
> live in.  I think it's not superflous information, but it is not a part o=
f=20
> your average backup.  As a matter of fact I've not incountered a system t=
hat=20
> does this.  Sure you can do this on your own and it sort of makes sense. =
=20
> This just seems like a strange suggestion to me.

inode/filename listings are rarely heared of, but I have them at my
hands for the backups I drive. Learned that the hard way, too...
Again, not on a Linux box.

> >   * Did you prepare an image-backup of your 1GB container beforehand?
> >     Helps for easy recovery as well as error reproduction (esp.
> >     because 1GB isn't all that hard to store on one CD when there's
> >     plenty of free space, which can be made to compress very well.)
> I did restore the data eventually.  I apologize if that was not clear.  I=
 was=20
> frustrated that the tool did not perform as expected and it is something =
I=20
> should have followed up on with a bug report.  I should go back and do so=
me=20
> experimenting with the current e2fsprogs and see if they behave better no=
w.

So at least you had no data loss. That's most important.

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

--gu8wNMO+QVC0jLZM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEJ5QaHb1edYOZ4bsRAhotAJ4mp68c8Fk9OazeNJ1moInOd5yW1QCfXFOE
jvWDdU/b30km5m0E60rchKo=
=vW3k
-----END PGP SIGNATURE-----

--gu8wNMO+QVC0jLZM--
