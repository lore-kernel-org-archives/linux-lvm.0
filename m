Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A64361F@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] LVM with multi-path disks?
Date: Mon, 6 Aug 2001 13:02:07 -0500 
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

Perhaps, if I can say, use the RH 7.2 kernel? It is 2.4.6 I believe.=20

--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com=20

> -----Original Message-----
> From: Ragnar Kj=F8rstad [mailto:lvm@ragnark.vestdata.no]
> Sent: Monday, August 06, 2001 12:26 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM with multi-path disks?
>=20
>=20
> On Mon, Aug 06, 2001 at 10:01:36AM -0700, John DeFranco wrote:
> > Ragnar Kj=F8rstad wrote:
> > > On Sun, Aug 05, 2001 at 08:25:58PM +0200, Luca Berra wrote:
> > > > in *redhat* kernels there is a patch that adds multipath =
support
> > > > to the md driver, you configure it as a raid-1 array, but it is
> > > > actually a multipath configuration.
> > >=20
> > > If I remember correctly, you configure as "multipath" not =
"raid1".
> >=20
> > Do you know where the above is defined? I cannot find
> > anything in the raid documentation that talks about=20
> > multipath?
>=20
> You need to use the RH kernel to get the "multipath" option.
> Unfortenately the md patch (from their source RPM) does not apply
> cleanly to a standard kernel, and it didn't look trivial to fix :(
>=20
>=20
>=20
> --=20
> Ragnar Kjorstad
> Big Storage
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20
