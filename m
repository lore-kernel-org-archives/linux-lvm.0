Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A6434FB@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] LVM vs. md: Benefits in RAID0?
Date: Wed, 25 Jul 2001 10:57:13 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

What I see in my mind is this should work the same way veritas or =
hardware
raid should work. Adding a new partition to a stripe set shouldn't get
concatenated. The data should get re-striped to include the new disk, =
and as
time goes on, data will be then evened out to include this new =
partition and
stripe proplerly. Doing this approach preserves the stripe, at a small =
cost
of CPU during the slow re-stripe. The alternative is to have quick
re-restripes occurr, and to have XX% of cpu allocated to making that =
happen.
That way you can say, I want to give 98% of my cpu to the re-stripe
operation, but I know that my system will be unuseable during that
time(mostly), but it will take less time than say several hours where
re-striping would occurr slowly as data or accesses occurr and bits are
remapped. This of course means that you need a small amount of =
freespace not
allocated at the time of stripe creation. Adaptec and AMI accomplishes =
this
by setting about 4MB per volume in the striped set or raid x, as unused
automatically. That way, even if you have a raid set which is full of =
data
and perhaps <1% left, you still have these "swap regions" for use =
during
dynamic reallocation/restriping. This is what I see LVM being able to =
do in
the future, since it is already done in software from other vendors =
anyway.=20

--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com=20

> -----Original Message-----
> From: Jason Tackaberry [mailto:tack@linux.com]
> Sent: Tuesday, July 24, 2001 6:33 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM vs. md: Benefits in RAID0?
>=20
>=20
> Hi Jos=E9, thanks for your reply.  I have a few questions:
>=20
> On 24 Jul 2001 22:46:56 +0000, Jos=E9 Luis Domingo L=F3pez wrote:
> > The quick and dirty hack to get resizable RAIDed storage devices =
is:
> >=20
> > a) Layer LVM on top of (hard/soft) RAID
>=20
> The problem I see with this is that if you extend the volume group by
> adding a new partition, the new partition must be linearly=20
> concatenated
> and so it won't be part of the stripe set.  So while you can=20
> technically
> extend this configuration, you're not truly resizing the RAID device.
> Suppose you start off with an md stripe set with sda1 and=20
> sdb1, and then
> later on you want to add sdc1, you get something like this:
>=20
> <lame ASCII art>
> +----------------------------+
> |         logical_vol01      |
> +----------------------------+
> |         volume_group01     |
> +-------------------+--------+
> |     md0 RAID0     |        |
> +-------------------+  sdc1  |
> |   sda1   |  sdb1  |        |
> +----------+--------+--------+
> </lame ASCII art>
>=20
> So yes, you can extend your logical volume, but you're not extending
> your stripe set.  I guess this has the advantage over linear
> concatenation in that at least for sda1 and sdb1 you'll get the
> performance benefit.
>=20
> > b) Layer sotfware RAID on top of software LVM
>=20
> I'm just not sure how this would work?  You can't extend md=20
> devices, as
> far as I know.  So you can extend the underlying logical volume, but
> then from the RAID layer on top, it just sees one device, so it's not
> really RAID at all.  Can you clarify on this one?
>=20
> Cheers,
> Jason.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
