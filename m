From: Paul Dickson <dickson@permanentmail.com>
Subject: Re: [linux-lvm] lvm-1.0.1-rc4 and 2.4.13
Message-Id: <20011103031955.3732128d.dickson@permanentmail.com>
In-Reply-To: <20011029084424.D4182@tykepenguin.com>
References: <20011026005405.A21775@sky.net>
	<20011026095641.C587@tykepenguin.com>
	<20011026213005.C928@sky.net>
	<20011029084424.D4182@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 boundary="=.NXA_NowC7OQrNE"
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
Date: Sat Nov  3 04:21:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=.NXA_NowC7OQrNE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Oct 2001 08:44:24 +0000, Patrick Caulfield wrote:

> On Fri, Oct 26, 2001 at 09:30:05PM +0200, Ulrich Wiederhold wrote:
> > * Patrick Caulfield <caulfield@sistina.com> [011026 10:56]:
> > > On Fri, Oct 26, 2001 at 12:54:05AM +0200, Ulrich Wiederhold wrote:
> >=20
> > Two questions:
> > 1. Why isn=EF=BF=BDt lvm-1.0.1-rc4 in the current Linux-Kernel? Why do =
I still
> > need to patch? I think this version is already stable and better than
> > the older one, isn=EF=BF=BDt it?
>=20
> It just isn't :-( we've submitted (most of) it to Alan Cox and his kernel=
 is
> *much* more up-to-date than Linus'. I don't know just why the patches hav=
en't
> been accepted by Linus. He is apparently happy to completely replace the =
VM but
> won't fix some fairly serious bugs elsewhere...bizarre.

Did Linus say why?

I ask this because Linus' submission policy is that you send patches to
him repeatedly (ever two or three weeks) until he acknowledges them.=20
Linus frequently gets behind in his E-mail, so he just deletes everything
he hasn't seen.

I have included below a message from Linus which I saved about sending
patches to him.

	-Paul



On Wed, 25 Apr 2001 14:31:30 -0700 (PDT), Linus Torvalds wrote to LKML:

> Most importantly, when sending patches to me:
>=20
>  - specify clearly that you really want to see them in the standard
>    kernel, and why. I occasionally get patches that just say "this is a
>    good idea". I don't apply them. Especially if they are cc'd to somebody
>    else too, in which case I pretty much assume that it's a RFC, not a
>    "real patch".
>=20
>  - do NOT send patches in attachements. Send one patch per mail, in
>    clear-text under your message, so that I can easily see the patch and
>    decide then-and-there whether it looks ok. And if it doesn't look ok,
>    and I do a "reply", the patch gets included in the reply so that I can
>    point out which part of the patch I dislike.
>=20
>    Don't worry about sending me five emails. That's FINE. I much prefer
>    seeing five consecutive emails from the same person with five distinct
>    subject lines and five distinct patches, than seeing one email with
>    five attachements to it.
>=20
>  - if your email system is broken, and you want to send patches as
>    attachements to avoid whitspace damage, then please FIX YOUR EMAIL
>    SYSTEM INSTEAD.
>=20
>  - Don't point to web-sites. If I have to move the mouse outside my email
>    xterm to work on the email, your email just got ignored.
>=20
>  - Make your patches one sub-directory under the source tree you're
>    working on. In short, your patches should look like something like
>=20
> 	--- clean/fs/inode.c ...
> 	+++ linux/fs/inode.c ..
> 	@@ -179,7 +179,7 @@
> 	...
>=20
>    so that I can (regardless of where my source tree is) apply them
>    with "patch -p1" from my linux top directory. Then I can just do a
>=20
> 	cd v2.4/linux
> 	patch -p1 < ~/multiple-emails-with-multiple-accepted-patches
>=20
>    and not have to worry about three patches being based on
>    /usr/src/linux, while two others not having a path at all and being
>    individual filenames in linux/drivers/net.
>=20
>  - and finally: re-send. If I had laser-eye surgery the fay you sent the
>    patches, I won't have applied them. If I took a day off and spent it
>    with the kids at the pool instead, I won't have applied them. If I
>    decided that this weekend I'm not going to read email for a change, I
>    won't have applied them.
>=20
>    And when I come back to work a day or two later, I will have several
>    hundred other emails to work through. I never go backwards in my
>    emails.

--=.NXA_NowC7OQrNE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)

iD8DBQE748TW8BiPBVpHKeYRAu+hAJ4oH4GO9PRxLJdMYsETVsUEnavyEQCg4pc1
t0/fRCrahLvEqjJZF6CffVE=
=NOFN
-----END PGP SIGNATURE-----

--=.NXA_NowC7OQrNE--
