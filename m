Return-Path: <smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] pvmove error
Date: Tue, 26 Jun 2001 09:05:50 -0400
Message-ID: <000101c0fe40$b9a60080$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010626141545.A26445@sistina.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ok, here's the info... i think there is an offset problem here:

fdisk -l: /dev/hdd1             1      4092   2062336+  8e  Linux LVM
pvdisplay -v:    00502 /dev/rootvg/mp3lv         02517   4116481

the pe size on this pv is 4MB, so the end of disk should be at
4124673, but as you see, fdisk reports only having 4124672.=20
unfortunately my other vg has striped lv's so i can't easily use its
space temporarily to move the data around, and this vg only has about
550MB unallocated... not enough room there to move around a 2GB
drive's data.  hey wait a sec... if i lvreduce the lv, it'll remove
from the end, right?  hmmm... perhaps that might work... let me try
that when the volume becomes inactive again.

i'll keep ya posted if this works.

thanks again!

- -----Original Message-----
From: linux-lvm-admin@sistina.com
[mailto:linux-lvm-admin@sistina.com]On
Behalf Of Heinz J. Mauelshagen
Sent: Tuesday, 26 June 2001 08:16
To: linux-lvm@sistina.com
Cc: mge@sistina.com
Subject: Re: [linux-lvm] pvmove error


On Tue, Jun 26, 2001 at 07:25:37AM -0400, S. Michael Denton wrote:
> =20
> Hm. OK, i checked the lv stats and that specific pe hadn't been
> read/written to just yet, so there's no data there.

All right, that makes sense.

> By your
> procedure it looks like an upgrade from beta7 to 1.0 won't fix the
> alignment errors either, correct?

Well, in case you created the PVs and extended existing VGs by them
or
created new VGs with them -> No, it won't :-(

> Oh and yes, I did initially create
> this with a prior version... 0.8i iirc.

In this case you *could* be fine using upcomming 1.0 without my
procedure,
presumed that the last PE is not misaligned/misallocated which
shouldn't be
the case, if you created the PV with < LVM 0.9.1 Beta 6.

You can get the sector offset of the beginning of your last PE with
"pvdisplay -v /dev/YourPVName | tail -3". The offset in 512 byte
units is
in the last column of that output.
"fdisk -l" on the whole block device (for eg. /dev/sdb) gives you the
disk
size to make sure, that the PE is not allocated beyond the end of the
underlying device.

>=20
> Thanks for the info!

You're welcome.

Regards,
Heinz    -- The LVM Guy --

>=20
> -----Original Message-----
> From: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Heinz J. Mauelshagen
> Sent: Tuesday, 26 June 2001 06:15
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] pvmove error
>=20
>=20
> On Mon, Jun 25, 2001 at 10:08:19PM -0400, S. Michael Denton wrote:
> > Hello,
> >=20
> > The attached log is of a pvmove -d -v /dev/hdd1:extent
> > /dev/hdb1:extent, where the source extent is the last pe on
> > /dev/hdd1.  I want to move this extent off the drive for
> > performance reasons, but it refuses to move.  The error also
> > makes me wonder if I could even use that pe, since it seems to be
> > smaller than lvm is expecting.
>=20
> Michael,
>=20
> this is caused by an alignment bug which has been fixed in the last
> couple
> of days and only showed up in specific disk sizes.
>=20
> > Is there a fix for this?
>=20
> No, I am sorry. Not so far.
>=20
> I am a little bit confused.
> You mention above, that you want to move the last PE away for
> performance
> reasons so I assume that it is already used. If so and the
> misalignment bug
> caused an invalid PE size for that very last PE you ant to move,
> you should
> already have seen trouble accessing it (like FS errors).
> If not so, the FS likely hasn't stored (meta)data in that PE which
> can't lead
> to performance bottlenecks on that PE.
>=20
> Anyway; the workaround for your problem is (presumed you have
> enough free
>         temporary disk space):
>=20
> - get LVM 1.0 once we release it (hopefully tonight :-) which has
>   fixes for the alignment bug and install it
> - create as many new PVs as needed to create a new LV of the size
> of the
>   LV containing the PE in questions
> - extent your VG by those
> - create a new LV (the destination) with the same size of the one
>   in question (the source)
> - close the source
> - dd the source over to the destination (which might expose I/O
> errors on
>   the last PE; do partital dd up to the end of the device then and
>   restart a dd from the next LE in the logical address space of the
> LV
>   after it
> - test the destination
> - remove the source
> - rename the destination to the sources name (if necessary)
>=20
> Eventually you should do the above for all PVs which might have
> misaligned PEs
> in order to make sure that the error doesn't ocur again later while
> you try
> to pvmove your data.
>=20
> We don't have hard data so far, if many users have that
> misalignment problem because it doesn't happen with *all* PV sizes.
>=20
> People who didn't create PVs with LVM 0.9.1 Beta[67] don't suffer
> from
> the problem anyway!
>=20
> Regards,
> Heinz    -- The LVM Guy --
>=20
>=20
> >=20
> > Thanks.
> >=20
> > Scott Denton
> > smdenton@bellsouth.net
>=20
> Content-Description: pvmove.err
> > <1> lvm_get_col_numbers -- CALLED
> > <22> lvm_check_number -- CALLED with "502"
> > <22> lvm_check_number -- LEAVING with ret: 502
<SNIP>
> > pvmove -- checking destination physical volume names in command
> > line pvmove -- checking volume group activity
> > pvmove -- moving physical extents in active volume group "rootvg"
> > pvmove -- starting to move extents away from physical volume
> > "/dev/hdd1" pvmove -- checking for enough free physical extents
> > in "rootvg"
> > pvmove -- /dev/hdd1 [PE 502 [mp3lv [LE 2517]] -> /dev/hdb1 [PE
> > 168] [1/1] =20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D-=3D-

Heinz Mauelshagen                                 Sistina Software
Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242
Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D-=3D-
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


-----BEGIN PGP SIGNATURE-----
Version: PGP 7.0.1

iQA/AwUBOziIrnC+DNfF0nVpEQLZwgCfdPCEtYhAyjHCbTAB757iMueUOPsAoP1M
H2KqvBxJiiBZ/buxSy4UsOBO
=3DLvPh
-----END PGP SIGNATURE-----
