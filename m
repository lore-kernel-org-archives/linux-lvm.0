Return-Path: <defranco@cup.hp.com>
Message-ID: <3B6ECD70.8445A213@cup.hp.com>
Date: Mon, 06 Aug 2001 10:01:36 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM with multi-path disks?
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it> <20010805234715.A30768@vestdata.no>
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
To: linux-lvm@sistina.com

Ragnar Kj=EF=BF=BDrstad wrote:
>=20
> On Sun, Aug 05, 2001 at 08:25:58PM +0200, Luca Berra wrote:
> > in *redhat* kernels there is a patch that adds multipath support
> > to the md driver, you configure it as a raid-1 array, but it is
> > actually a multipath configuration.
>=20
> If I remember correctly, you configure as "multipath" not "raid1".
>=20
Do you know where the above is defined? I cannot find
anything in the raid documentation that talks about=20
multipath?

> > it is the only way i know of doing what you want.
> Another alternative is the linux-driver for the SUN T3. I haven't tried
> it myself, but supposedly one can use the same driver for other
> dual-path RAIDs as well.
And I'm using something similiar to this driver, which
is what is giving me problems.

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cheers
   -jdf
