Return-Path: <ragnark@stine.vestdata.no>
Date: Thu, 22 Mar 2001 10:53:44 +0100
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Message-ID: <20010322105344.C11762@vestdata.no>
References: <01C0B04F.5EFB3400.smdenton@bellsouth.net> <3AB60D44.3036CD9C@wrkhors.com> <0103220954110L.00851@lyta>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0103220954110L.00851@lyta>; from Russell Coker on Thu, Mar 22, 2001 at 09:54:11AM +0100
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
Cc: Steven Lembark <lembark@wrkhors.com>

On Thu, Mar 22, 2001 at 09:54:11AM +0100, Russell Coker wrote:
> On Monday 19 March 2001 14:44, Steven Lembark wrote:
> > Escalade is a nice idea, but still runs afoul of the interrupt
> > & bus design of PC's.  for high-i/o applications "PC" hardware
> > doesn't work all that well.  main problem here is delivering the
> > raw datat to an Esc. controller through the existing PC.  the
> > add'l cpu load in this case comes from the bottom-half of drivers
> > on heavily loaded cards that spend too much time waiting for
> > access to the shared card.
> >
> > these are a distinct improvement over stock IDE or software RAID
> > but don't expect them to suddenly turn your PC into a SparcServer
> > or K400.
>=20
> What is a K400?
>=20
> Every test that I run shows SPARC machines running slower than desktop=20
> machines with IA32 CPUs.  My Athlon-800 machine has more memory bandwidth=
=20
> than an E450 according to the industry standard "streams" benchmark and=20
> according to a little memory benchmark I wrote.  Also a single IBM 46G AT=
A=20
> drive in my Athlon outperforms A1000 arrays in E450 class hardware.

I second this.
Every test we've run show that x86 linux boxes kick sparc but. :-)

x86 with scsi-scsi RAID controllers we se performance 5-6 times that of
E450s with A1000 RAID. Linux has a reputation for not matching other
systems on NFS performance, but our tests show x86 linux beeing faster than
both x86 freeBSD and SPARC Solaris (both client and server-side)

However: the escalade RAID-controller doesn't have any write-back cache,
does it? So performance actually be worse than on single disk systems
(in some situations - see thread on reiserfs-list), and won't even
compare to a real scsi-scsi or fc-scsi RAID-system.

Anyway - we're getting off-topic awfully fast here; please send
followups directly pr mail and remove lvm-list.



--=20
Ragnar Kj=EF=BF=BDrstad
Big Storage
