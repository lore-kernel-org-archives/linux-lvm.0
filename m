From: "Gregory K. Ruiz-Ade" <gregory@castandcrew.com>
Subject: Re: [linux-lvm] RAID 1 on Device Mapper - best practices?
References: <20031021171817.GA28462@mail.parplies.de>
In-Reply-To: <20031021171817.GA28462@mail.parplies.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_d67u//89Inbya+t";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200311191103.57697.gregory@castandcrew.com>
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
Date: Thu Nov 20 07:20:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-02=_d67u//89Inbya+t
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Tuesday 21 October 2003 10:18 am, wopp@parplies.de wrote:
> > Ahh, but that's the beauty of RAID and LVM, what you end up with is
> > just another block device. Which ever way you do it you'll get the same
> > benefit.
>
> I believe that is not true. How do you resize a RAID device? The only
> option I can think of is to re-create it, which is clearly beside the
> point. With LVM on top of RAID, you can lvextend (or lvreduce), pvmove
> and so on - where's the problem?

At the risk of saying something _way_ past the point that this thread seems=
=20
to have died down (hey, I'm only now catching up on email!):

You don't extend the RAID device, you add a new one, and add it as a new=20
physical volume to your volume group, and _then_ you can extend your=20
volumes onto the new underlying RAID device.

And _THAT_ is the beauty of LVM.

>      +------+   +------+
>
>      | hda1 | + | hdb1 |  -> md0 \
>
>      +------+   +------+          +- VG0
>
>      | hda2 | + | hdb2 |  -> md1 /
>
>      +------+   +------+

Personally, I'd do it this way:

+------+   +------+    +-----+
| hda1 | + | hdc1 | -> | md0 | =3D /boot
+------+   +------+    +-----+
+------+   +------+    +-----+    +------+
| hda2 | + | hdc2 | -> | md1 | -> | vg00 |
+------+   +------+    +-----+    +------+

vg00 would then contain logical volumes for all the remaining filesystems.

Two points, though.  First, if you're going to do mirroring on IDE drives,=
=20
regardless of how hooptie your IDE controller is, _always_ put the drives=20
as masters on _seperate_ channels, otherwise all your writes could take up=
=20
to twice as long, since only one device on an IDE channel can be accessed=20
at a time.

Second, the beauty of LVM is that you can add a new physical volume to the=
=20
volume group whenever you feel like it, and then extend your logical=20
volumes into that new space.  So, you buy a Promise 2-channel IDE=20
controller, and add two 250GB drives to them.  Then, you create a new RAID=
=20
mirror set with those.

+------+   +------+    +-----+
| hde1 | + | hdg1 | -> | md2 |
+------+   +------+    +-----+

You can then add that to your VG:

+------+   +------+    +-----+
| hda2 | + | hdc2 | -> | md1 |       +------+
+------+   +------+    +-----+ \_____| vg00 |
+------+   +------+    +-----+ /     |      |
| hde1 | + | hdg1 | -> | md2 |       +------+
+------+   +------+    +-----+

You don't lose anything in terms of reliability, unless you lose an IDE=20
controller, in this case.

this way, you're leveraging the capabilities of both the RAID and LVM=20
subsystems.

In terms of mirror resync times, I personally have not had to deal with=20
that, either because so far haven't had a hard drive in a software raid=20
system fail on me yet.  Either I'm lucky or careful to buy good hard=20
drives, but I'm honestly not sure which it is. :)

Doesn't MD allow background resyncs, anyway?  Sure, it might suck the livin=
g=20
daylights out of system performance, but at least it should be usable.

Gregory=20

=2D-=20
Gregory K. Ruiz-Ade <gregory@castandcrew.com>
Sr. Systems Administrator
Cast & Crew Entertainment Services, Inc.

--Boundary-02=_d67u//89Inbya+t
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/u76d9ZaxfPwtFvURAsfiAJ49MZetb0D92RrilESN45IHlXIlugCfU0pX
roSJgUZCa2wvgnpm+sSq0Z4=
=fNEy
-----END PGP SIGNATURE-----

--Boundary-02=_d67u//89Inbya+t--
