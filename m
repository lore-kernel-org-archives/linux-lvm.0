Return-Path: <root@srv.sistina.com>
Date: Tue, 10 Jul 2001 15:45:30 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Message-ID: <20010710154530.A18025@sistina.com>
References: <20010705083402.D11805@vestdata.no> <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.33.0107050310570.1063-100000@toomuch.toronto.redhat.com>; from bcrl@redhat.com on Thu, Jul 05, 2001 at 03:35:31AM -0400
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

--=20

Regards,
Heinz    -- The LVM Guy --

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
