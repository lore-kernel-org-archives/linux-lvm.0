Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FLSpr24700
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 17:28:51 -0400
Received: from clown.omnifarious.org (dsl231-056-102.sea1.dsl.speakeasy.net
	[216.231.56.102])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9FLSeLW003446
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 17:28:46 -0400
Date: Fri, 15 Oct 2004 14:28:34 -0700
From: Eric Hopper <hopper@omnifarious.org>
Subject: Re: [linux-lvm] LVM2 features
Message-ID: <20041015212834.GD6352@omnifarious.org>
References: <20041010032631.GO32455@omnifarious.org>
	<a06110401bd95356589a8@[192.168.10.11]>
	<20041015150823.GB6352@omnifarious.org>
	<1097862178.21375.20.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline
In-Reply-To: <1097862178.21375.20.camel@localhost>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2004 at 10:42:58AM -0700, Clint Byrum wrote:
> As a user on the outside who loved LVM1, and has grown to love LVM2, I
> have to say I disagree with your points. This one, for instance, isn't
> true. The hard data is that the allocation routines in pvmove don't
> yet understand how to split the destination among two non-contiguous
> blocks of physical extents. So, even if vgdisplay shows 100GB free,
> and you only want to move 30GB .. you *might* have to move it in
> pieces, if the free space isn't in a contiguous block.

That implies another weird problem, which is that you can't pvmove
something in a single chunk unless you have the much free space, which
is also somewhat non-intuitive.

> Is that as nice as pvmove in lvm1? No. Are the other positives in LVM2
> worth dealing with this minor inconvenience? IMHO, Yes!

What are those positives?  I don't deny that they exist.  I know, for
example, the the whole idea of having device mapper for doing the raw
block mapping, and actually doing most of the work of keeping track of
LVM objects and structures in userland is an excellent idea, and is a
much cleaner split than the LVM1 userland/kernel split.

> I haven't seen any dodging. What I've seen is a tad less active
> participation in the mailing list by the developers. This makes sense
> to me.. they're busy making LVM2 better.

Maybe the user community is changing, so the quality of the questions
and the percentage of high quality answers is going down.  Since it
isn't so much of a cutting edge thing anymore, the scaling from
developer to user is no longer quite so smooth.  That observation is not
meant as a negative reflection of the user community.  This happens to
every piece of software as it enters widespread use.  Not everybody can
be experts in everything.

> This attitude confuses me. Open Source code doesn't really get "rushed
> to production".

Actually, it does.  The Linux kernel development model has tended to
cause things to get pushed into 'production' (i.e. major .even kernel
releases).  Perhaps if kernel release cycles were shorter, this effect
wouldn't be so pronounced.

> If it sucks, people don't use it.  There are no big emotional
> attachments to it like with commercial software, where huge amounts of
> licensing costs get spent on bad software. I haven't seen anything
> "wrong." Bugs happen, and they're being fixed fairly quickly.

Well, the developers themselves usually have a pretty strong attachment
to the idea of widespread usage of their software.  I know that's my
biggest reward as a developer.

> Maybe its just that this list has reduced in importance wrt LVM2?

I'm guessing that's the case because of the user community changes I
mentioned earlier.

Have fun (if at all possible),
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBcEECjtsvlOwvazYRAlEcAJ96MqfE/lr3tQcHO18KOL0MrhwVUQCggx6y
FpuOM3Uil9NLw+abS23qGu0=
=mxjM
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
