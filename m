Return-Path: <ragnark@stine.vestdata.no>
Date: Mon, 6 Aug 2001 19:26:04 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010806192604.A31281@vestdata.no>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it> <20010805234715.A30768@vestdata.no> <3B6ECD70.8445A213@cup.hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3B6ECD70.8445A213@cup.hp.com>; from John DeFranco on Mon, Aug 06, 2001 at 10:01:36AM -0700
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

On Mon, Aug 06, 2001 at 10:01:36AM -0700, John DeFranco wrote:
> Ragnar Kj=EF=BF=BDrstad wrote:
> > On Sun, Aug 05, 2001 at 08:25:58PM +0200, Luca Berra wrote:
> > > in *redhat* kernels there is a patch that adds multipath support
> > > to the md driver, you configure it as a raid-1 array, but it is
> > > actually a multipath configuration.
> >=20
> > If I remember correctly, you configure as "multipath" not "raid1".
>=20
> Do you know where the above is defined? I cannot find
> anything in the raid documentation that talks about=20
> multipath?

You need to use the RH kernel to get the "multipath" option.
Unfortenately the md patch (from their source RPM) does not apply
cleanly to a standard kernel, and it didn't look trivial to fix :(



--=20
Ragnar Kjorstad
Big Storage
