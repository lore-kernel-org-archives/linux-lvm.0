Subject: Re: [linux-lvm] LVM causing IO contention or slowdown?
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <3C4AD059.4070800@sgi.com>
References: <3C4AD059.4070800@sgi.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-AGaImqU3oClFhM+7B4O1"
Message-Id: <1011592472.15963.4.camel@UberGeek>
MIME-Version: 1.0
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
Date: Sun Jan 20 23:55:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-AGaImqU3oClFhM+7B4O1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thanks for the info Steve. The biggest part about this was that just
putting the HW RAID0 under LVM control caused a major slowdown. Even if
it is from 100MB/s to 80MB/s. I really expect none, or just a small
amount. e.g. from 100MB/s to 95MB/s, not 80MB/s or less.=20

It was just very relieving to see that even though I was using LVM, if I
added logbufs=3D8 to my mount line for a given filesystem it certainly
relieved MUCH contention. I just wish I knew why LVM was dogging it so
bad.=20

On Sun, 2002-01-20 at 08:12, Stephen Lord wrote:
> Austin Gonyou wrote:
>=20
> >As a follow up to this I've done some more testing, and will test the
> >rest of this weekend, using AIM db benchmark.=20
> >
> >What I've found is that when mounting with logbufs=3D8 on my Quad Xeon
> 2MB
> >cache 6450 with 8 Ultra-2 Drives, 4 RAID0 volumes, two of 3 disks each
> >and two of 1 disk each.=20
> >
> >The larger Volumes, the more "costly" volumes, when mounted using
> >logbufs=3D8, outperformed the same volume addressed when not under LVM
> >control. Not only did it out perform itself, but either WITH or WITHOUT
> >LVM controlling the volume, I nearly doubled my throughput to those
> >drives.=20
> >
> >Here is what I'm talking about:
> >
> >#With LVM management
> >Throughput 109.715 MB/sec (NB=3D137.144 MB/sec  1097.15 MBit/sec)  200
> >procs
> >
> >#Without LVM management
> >Throughput 100.803 MB/sec (NB=3D126.004 MB/sec  1008.03 MBit/sec)  200
> >procs
> >
> >
> >This only happened once though and I'm not sure exactly why. Still, the
> >max I could get out of it for the same test more than once with LVM
> >enabled was around 80-85 MB/s. Still a HUGE improvement over 43/44
> MB/s.
> >
>=20
> Off topic for the lvm list, but....
>=20
> The logbufs=3D8 parameter basically means you have 8 buffers capable of=20
> pushing
> transactions out to disk. If you have lots of threads going at once in=20
> xfs then the
> transactions tend to get throttled waiting for a buffer to do a log=20
> write into, so
> adding more is good.
>=20
> There is a perl script in the cmd/xfsmisc directory called xfs_stats.pl=20
> if you
> run this it will format the output of the xfs /proc kernel statistics.=20
> You will
> see a parameter called xs_log_noiclogs near the bottom of the first
> column.
> This number means a transaction finished, but then had to wait for a log
> buffer before it could hand off its data.
>=20
> The downside of increasing the number of logbuffers is the amount of
> data
> which can be lost after a crash (i.e. how many ops in the filesystem are
> effectively undone by recovery). However,  looking at stats on my box,
> each log write contains about 5 transactions, so you can never loose
> much.
>=20
> We have found adding more than 8 usually does not help, making them
> bigger would be a different story, but that is actually a very
> non-trivial
> change.
>=20
> Steve
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb

--=-AGaImqU3oClFhM+7B4O1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8S60X94g6ZVmFMoIRArVvAJ9ZEf0GIeYqpFjFPhYGXUXFABr2NQCfSseI
Hom3bwipLHK4NFNS1RzGWcI=
=kLtE
-----END PGP SIGNATURE-----

--=-AGaImqU3oClFhM+7B4O1--
