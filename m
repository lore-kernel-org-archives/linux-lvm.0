Subject: Re: [linux-lvm] Manegeability with LVM
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20020304223441.GA3489@localhost>
References: <20020304223441.GA3489@localhost>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1015288381.24623.11.camel@UberGeek>
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
Date: Mon Mar  4 18:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

XFS does support shriking..but not with LVM.=20

On Mon, 2002-03-04 at 16:34, Jos=E9 Luis Domingo L=F3pez wrote:
> On Monday, 04 March 2002, at 23:00:10 +0100,
> Anders Widman wrote:
>=20
> > As my need for diskspace increases all the time I was thinking of
> > using LVM so I could make use of all diskspace and grow/shrink/replace
> > drives as I need to.
> >=20
> Take into account that there are filesystem that by design doesn't
> support shrinking of filessytems (e.g. XFS). Some others allow you to
> both grow and shrink filesystems, but sometimes you will have to unmount
> the filesystem before modifying its size.
>=20
> On the LVM part, it was designed to allow growing and reducing LV sizes
> without being necessary to put your machine in some "maintenance" state.
>=20
> > The only downside to this is the possibility of massive dataloss if I
> > loose any of the 14 disks (drive fails to spin etc...). Would it be
> > possible to setup up a software redundancy like RAID5 with LVM so I
> > can keep this manageability LVM gives me?
> >=20
> Remember, nothing except regular _and_ verified backups of your valuable
> data can guarantee that your data will survive a hardware _or_ software
> error. I'm am not sure what I fear most, a damaged disk or a severe=20
> filesystem corruption. Some RAID levels give you additional hardware
> failure protection, but other levels increase your chances of lossing
> data. LVM can be seen as some sort of linear-RAID, and as such, usually
> increases the probability of a broken disk destroying your data.
>=20
> In other words, backups are (and will always be) the way to go.
>=20
> --=20
> Jos=E9 Luis Domingo L=F3pez
> Linux Registered User #189436     Debian Linux Woody (Linux
> 2.4.18-rc4aa1)
> =20
> jdomingo AT internautas DOT org   =3D>  Spam at your own risk
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
