Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 13:27:27 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <20010717132727.C17345@sistina.com>
References: <85063BBE668FD411944400D0B744267A643417@AUSMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <85063BBE668FD411944400D0B744267A643417@AUSMAIL>; from austin@coremetrics.com on Mon, Jul 16, 2001 at 03:35:35PM -0500
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

On Mon, Jul 16, 2001 at 03:35:35PM -0500, Gonyou, Austin wrote:
> >From the XFS list.=20
>=20

Austin,
I stated to Ben's unserious mail you included at the end below but didn't g=
et a
serious asnwer back so far :-(

Don't get me wrong: I really appreciate to get reasonable proposals.

Regards,
Heinz    -- The LVM Guy --


On Thu, Jul 05, 2001 at 03:35:31AM -0400, Ben LaHaise wrote:
> On Thu, 5 Jul 2001, Ragnar Kj=EF=BF=BDrstad wrote:
>=20
> > What do you mean?
> > Is it not feasible to fix this in LVM as well, or do you just not know
> > what needs to be done to LVM?
>=20
> Fixing LVM is not on the radar of my priorities.  The code is sorely in
> need of a rewrite and violates several of the basic planning tenents that
> any good code in the block layer should follow.  Namely, it should have 1)
> planned on supporting 64 bit offsets,

What is the particular problem with 1?
Changes need to take place in the whole block device layer during 2.5
development in order to be 64 bit clean.

LVM will just be one member of the bunch :-)

> 2) never used multiplication,
> division or modulus on block numbers,

I assume that you mean an advice ("never use") rather than a statement
that you never used it, right?

FYI: this takes place in multiple block device layer functions.

For sure you can argue that this is supposed to vanish in 2.5 but
were's the document recommending this and defining how to do it?

> and 3) don't allocate memory
> structures that are indexed by block numbers.

Why?

Remapping block devices do that!
Checks against index mismatches are in LVM already.

> Even LVM failed on all three of
> these -- and this si just what I noticed in a quick 5 minute glance
> through the code.  Sorry, but LVM is obsolete by design.

Sorry but you are argueing weakly in a political manor.

Please speak up clearly and talk about the caveats you see and change reque=
st
you recommend as an expert or say nothing!

> It will continue
> to work on 32 bit block devices, but if you try to use it beyond that, it
> will fail.

As I said above.
During the 2.5 development cycle it will be addressed.

> That said, we'll have to make sure these failures are graceful
> and occur prior to the user having a chance at loosing any data.

Once 64 bit support will be implemented in the block device layer
and the VFS, LVM as a block device layer entity will support it as well :-)

>=20
> Now, thankfully there are alternatives like ELVM, which are working on
> getting the details right from the lessons learned.

ELVM is not in production so far...
If you would have read the EVMS kernel code, you had realized that they do
modulo calculations as well and I think they are doing right!


> Given that, I think
> we'll be in good shape during the 2.5 cycle.

I agree (from a different standpoint though ;-)

Waiting for your serious advice...

>=20
> 		-ben
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


> --=20
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com=20
>=20
> > -----Original Message-----
> > From: Ric Tibbetts [mailto:ric@pipcws.ca.boeing.com]
> > Sent: Monday, July 16, 2001 3:09 PM
> > To: Linux XFS Mailing List; JFS Discussion List
> > Subject: LVM on Linux
> >=20
> >=20
> > For anyone considering using LVM on Linux. You might want to take a=20
> > second to look at the following "short" article. It casts a=20
> > questionalble light on the current state of the LVM code.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > 0 Jun - 5 Jul (8 posts) Archive Link: [RFC][PATCH] first cut=20
> > 64 bit block
> > support
> >                   Summary by Zack Brown
> >=20
> > Ben LaHaise posted a patch and announced, "Below is the first=20
> > cut at making
> > the block size limit configurable to 64 bits on x86, as well=20
> > as always 64
> > bits on 64 bit machines. The audit isn't complete yet, but a=20
> > good chunk of
> > it is done." [..] "The following should be 64 bit clean now:=20
> > nbd, loop,
> > raid0, raid1, raid5." He gave links to two homepages at
> > http://people.redhat.com/bcrl/lb/ and
> > http://www.kvack.org/~blah/lb/. He added, "Ugly bits: I had=20
> > to add libgcc.a
> > to satisfy the need for 64 bit division. Yeah, it sucks, but=20
> > RAID needs some
> > more massaging before I can remove the 64 bit division=20
> > completely. This will
> > be fixed." Chris Wedgwood proposed some changes to libgcc.a=20
> > to be less ugly,
> > and Ben replied, "I'm getting rid of the need for libgcc=20
> > entirely. That's
> > what "This will be fixed" means. If you want to expedite the=20
> > process, send a
> > patch. Until then, this is Good Enough for testing purposes."
> >=20
> > Elsewhere, Ragnar Kjarstad was very happy about Ben's work,=20
> > asking if LVM
> > was also 64-bit clean. Ben replied cryptically, "Errr, I'll=20
> > refrain from
> > talking about LVM." Ragnar wanted some clarification, and Ben=20
> > explained:
> >=20
> > Fixing LVM is not on the radar of my priorities. The code is=20
> > sorely in need
> > of a
> > rewrite and violates several of the basic planning tenents=20
> > that any good
> > code in the block layer should follow. Namely, it should have=20
> > 1) planned on
> > supporting 64 bit offsets, 2) never used multiplication,=20
> > division or modulus
> > on block numbers, and 3) don't allocate memory structures=20
> > that are indexed
> > by block numbers. LVM failed on all three of these -- and=20
> > this si just what
> > I noticed in a quick 5 minute glance through the code. Sorry,=20
> > but LVM is
> > obsolete by design. It will continue to work on 32 bit block=20
> > devices, but if
> > you try to use it beyond that, it will fail. That said, we'll=20
> > have to make
> > sure these failures are graceful and occur prior to the user=20
> > having a chance
> > at loosing any data.
> >=20
> > Now, thankfully there are alternatives like ELVM, which are working on
> > getting the
> > details right from the lessons learned. Given that, I think=20
> > we'll be in good
> > shape
> > during the 2.5 cycle.
> >=20
> > End Of Thread (tm).
> >=20
> >=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
