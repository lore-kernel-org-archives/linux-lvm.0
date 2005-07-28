Date: Thu, 28 Jul 2005 13:03:46 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] how to access the partition on LV?
Message-ID: <20050728180346.GI4954@null.msp.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
	<20050728164523.GF4954@null.msp.redhat.com>
	<1122570830.9888.10.camel@localhost.localdomain>
	<20050728173218.GH4954@null.msp.redhat.com>
	<1122572530.9888.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V8Y3+xXnhQGsvjWT"
Content-Disposition: inline
In-Reply-To: <1122572530.9888.26.camel@localhost.localdomain>
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
To: Ming Zhang <mingz@ele.uri.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


--V8Y3+xXnhQGsvjWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2005 at 01:42:10PM -0400, Ming Zhang wrote:
> On Thu, 2005-07-28 at 12:32 -0500, AJ Lewis wrote:
> > On Thu, Jul 28, 2005 at 01:13:50PM -0400, Ming Zhang wrote:
> > > the problem is that we export a LV via iscsi to a remote box and beco=
me
> > > a scsi disk. so it is partitioned and utilized. then it does have
> > > partition on it. even it is exported to a linux box, u possibly will
> > > use /dev/sdx1 instead of directly use /dev/sdx, rite?
> >=20
> > Ahh - I see.  Well, on the node exporting the LVs, you don't access it.=
  I
> > dunno if kpartx or some other partitioning tool could do it - it might.=
  But
> > as far as the standard partion handling code goes, LVs don't exist.  I =
know
> > why you're doing it this way - I don't know why you want to access the
> > partitions on the exporting (target) node.  Do you really need to?
> yes, i guess that is the only solution. we have end users want that
> feature. so i think a work around is to run a iscsi initiator at local
> site and access via iscsi again.

Could play with loopback devices too if you need to do it on the target - t=
hat
might get nasty quickly though.
=20
> > > i can not see this HOWTO, where u referenced it?
> >=20
> > It's at the bottom of all messages that go to the linux-lvm ML -
> > http://tldp.org/HOWTO/LVM-HOWTO/=20
>=20
> i guess this is because i got the email from u directly. so lvm list
> will not send to me again. and only email via it will have that link. i
> checked my archival and all emails via lvm list has that.

Heh - yep, that'd do it ;)=20

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat                                    E-Mail: alewis@redhat.com
One Main Street SE, Suite 209
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


--V8Y3+xXnhQGsvjWT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC6R4C9QxUqFeMhxURAnsTAKCA7hIHLamvFrvQVnt+7OWkQh4GhwCfetYj
nYRMQI3O7uWEnQiiqL2J67g=
=pnj6
-----END PGP SIGNATURE-----

--V8Y3+xXnhQGsvjWT--
