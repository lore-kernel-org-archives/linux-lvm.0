Return-Path: <ragnark@stine.vestdata.no>
Date: Tue, 7 Aug 2001 07:23:27 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010807072327.A10691@vestdata.no>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it> <3B6D85EB.4AFF6D2D@cup.hp.com> <20010805202558.A13863@colombina.comedia.it> <20010805234715.A30768@vestdata.no> <20010806184631.B31054@ultraviolet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010806184631.B31054@ultraviolet.org>; from Tracy R Reed on Mon, Aug 06, 2001 at 06:46:31PM -0700
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

On Mon, Aug 06, 2001 at 06:46:31PM -0700, Tracy R Reed wrote:
> On Sun, Aug 05, 2001 at 11:47:16PM +0200, Ragnar Kj=EF=BF=BDrstad wrote:
> > If I remember correctly, you configure as "multipath" not "raid1".=20
>=20
> Cool! I think I've heard about this patch once before. I will have to give
> it a try.  Dual-pathing is something we have been wanting for a long time.
> Do you think this patch something that is likely to one day be merged with
> the kernel such that we can count on it being with us for a while?

I'm just speculating but I can't see why not? Except for LVM
implementing mutlipath and making it obsolete, of course.

> Does anyone know of any driver for Clariion based disk arrays? I don't
> think the Sun T3 uses Clariion does it? We have a ton (many tons,
> literally :) that we are currently using with Solaris that we would love
> to be able to attach to Linux systems. These things are hardware RAID
> arrays with dual RAID controllers in them. When one RAID controller fails
> something special has to be done to transfer the LUNs from the dead
> controller over to the live one. They call this "ATF" or "Automatic
> Transparent Failover" and they don't seem to ship it for Linux. Only NT
> and Solaris. I've tried talking them into considering it but not had any
> success.

Pardon me for finding it amusing they call it Automatic Transparent
Failover when it apperently is neither automatic nor transparent :-)


--=20
Ragnar Kjorstad
Big Storage
