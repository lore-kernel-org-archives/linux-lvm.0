From: Wiktor Wodecki <wodecki@gmx.de>
Subject: Re: [linux-lvm] disk info
Message-ID: <20030806193100.GH710@gmx.de>
References: <200308061457.22773.vk@mail.lepp.cornell.edu> <20030806191026.GA11612@www.13thfloor.at> <200308061520.06784.vk@mail.lepp.cornell.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <200308061520.06784.vk@mail.lepp.cornell.edu>
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
Date: Mon Aug 11 07:36:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: herbert@13thfloor.at

--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2003 at 03:20:06PM -0400, Valentine Kouznetsov wrote:
> Herbert,
> thanks for tip. I've look at resize2fs, but at least for ext2/ext3 I
> need to unmount my partition first. How about situation if root partion
> is on LVM and I want to resize it as well.
> Thanks,
> V.

well, in that case you need to boot of a floppy, cdrom or something else
which provides you all the tools you need. Why on the first hand did you
install root on an lvm? I for my part don't see the need. My root is
about 75 mb, with everything else (/usr, /var, /home) on seperate
partitions.

>=20
> On Wed August 6 2003 15:10, you wrote:
> > On Wed, Aug 06, 2003 at 02:57:22PM -0400, Valentine Kouznetsov wrote:
> > > Hi,
> > > I'm newbie of using LVM. I'm having the following "strange" behaviour:
> > > I can lvextend my volumes, but I cannot see the changes using df
> > > command. Actually df output is different from LV size of lvdisplay
> > > output. Is it known bug and/or I'm missing something.
> >
> > you have to resize the filesystem on the lvm lv
> > after you extended it ...
> >
> > for ext2/ext3 this would be resize2fs ...
> >
> > HTH,
> > Herbert
> >
> > > My configuration:
> > > RedHat 9, kernel 2.4.21 or 2.4.20-19-9 (from RedHat), lvm-1.0.3-12 (f=
rom
> > > RedHat 9)
> > >
> > > I would appreciate if you cc me to vk@mail.lepp.cornell.edu
> > >
> > > Thanks,
> > > Valentine.
> > >
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
Regards,

Wiktor Wodecki

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/MVd06SNaNRgsl4MRAl5LAJ4ol2DnLFhrIXg/4yfZ5grNrPotuQCguLlz
KUk0IQhYk1uqNXF4Why1Xs4=
=0CMo
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
