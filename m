Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Apr 2001 14:47:06 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
Message-ID: <20010424144706.E31988@sistina.com>
References: <200104191945.f3JJjKRn015661@webber.adilger.int> <Pine.LNX.4.33.0104200218460.1083-100000@fogarty.jakma.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.33.0104200218460.1083-100000@fogarty.jakma.org>; from paul@jakma.org on Fri, Apr 20, 2001 at 02:29:09AM +0100
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Apr 20, 2001 at 02:29:09AM +0100, Paul Jakma wrote:
> On Thu, 19 Apr 2001, Andreas Dilger wrote:
>=20
> > went in, but not other stuff.  Also, it doesn't appear that any of the
> > LVM changes are making it into the stock kernel, which is basically a
> > recepie for disaster.
>=20
> agreed... after the problematic inclusion of 0.9 into the kernel i
> asked on sistina LVM list whether they could try to be a bit more
> proactive about feeding patches on to linus, to make life easier for
> LVM users - they had fixes for the problems of 0.9 but never, and
> still to this day have not, fed the code on.
>=20
> Still to this day, nothing from them but announcements on l-k of
> various betas. AFAIK all the patches for LVM submitted to linus since
> 0.8 went in have been from core linux developers (Andrea, Jens,
> etc.), not sistina.

This is not true.
I've fed patches multiple times to Linus and didn't even get an answer
telling me that the patch is too huge or otherwise crappy.

As stated multiple times already: in order to address the need for smaller
patches which are easier to read etc. there's work in progress to deploy th=
ose.

>=20
> shame... their LVM is really nice to use. Just frustrating that they
> do want to feed the code on... more frustrating still when you
> consider the lobbying that went on to try persuade l-k that LVM
> should go in.

Excuse me: this statement is completely misleading because you misunderstood
           misunderstood the situation at that time obviously!

There was no such thing as lobbying at all.

The truth is that Linux LVM which was my personal GPLed project back in tho=
se
days didn't have a chance to get integrated into the kernel even though
literally thousands of people throughout the Web recommended that.

That's why a helpful soul came up with the idea of a petition with
the goal to convince Linus et al.

I'll not follow the path of other's complaining about bad code in the Linux
kernel but a lot of us know, that much less sofisticated code got accepted
into the vanilla kernel than LVM's.

Calling that petition "lobbying" means spitting into the faces of all the
underwriters of that petition IMNSHO!

I'm convinced that we'll overcome problems which showed up for eg. caused by
the fact that there are=20

 a. more people now than before who want to contribute

 b. more code than before (thanks god!).

I'm pretty convinced that we'll overcome problems related to people almost
not contributing at all, but yelling really loud in order to compensate
the lack of help to fix problems they expose!

You know who you are.


In general: none of your submitted patches have been ignored at all=20
            as I already stated in one of my previous emails.
            The submitter has been informed personally about the status
            of the patch.
            Our fault was that we didn=EF=BF=BDt discuss that in public tho=
ugh.
            This changes; trust me ;-)



>=20
> > Cheers, Andreas
>=20
> obHiddenCode: lm-sensors... used to use this a long time ago.
>=20
> regards,
> --=20
> Paul Jakma	paul@clubi.ie	paul@jakma.org
> PGP5 key: http://www.clubi.ie/jakma/publickey.txt
> -------------------------------------------
> Fortune:
> Happiness is twin floppies.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
