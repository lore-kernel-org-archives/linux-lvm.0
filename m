From: Anselm Kruis <A.Kruis@science-computing.de>
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
In-Reply-To: <20011216202511.D26924@tiger.bigcats.invalid>
Message-ID: <Pine.LNX.4.02.10112171006180.8848-100000@murnau.science-computing.de>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Date: Mon Dec 17 03:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi Wolfgang,

On Sun, 16 Dec 2001, Wolfgang Weisselberg wrote:

> Hi, Steve!
>=20
> Steve Wray (steve.wray@the.net.nz) wrote 70 lines:
>=20
> > - take a snapshot, install something or try something out
> > that might break something, then restore *directly* from
> > the snapshot if anything goes wrong; without having to actually
> > back it up to media and restore it.
>=20
> Even better would be writable snapshots for that:=20
> - make a snapshot of (everything where the install writes to
> - install the program
> - test it on the snapshot
> - junk the snapshot if the install is bad
>=20
> and, of course, you might want to migrate changes from the
> snapshot to the original FS (or vice versa).  That however
> is a second feature.  Until then you'd have to do the install
> all over again -- once we actually get writable shnapshots.

I posted a patch for writeable snapshots about a month ago. Look for the
subject "[PATCH] writeable snapshots". The patch sould apply clean against
current LVM.

-Anselm

>=20
> -Wolfgang
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=20

---
 Anselm Kruis                                 Tel. +49 (0)89-356386-74
 science + computing ag=09=09              FAX  +49 (0)89-356386-37
 Ingolst=E4dter Str. 22             mailto: A.Kruis@science-computing.de
 D-80807 M=FCnchen                 WWW: http://www.science-computing.de/

**********************************************************************
***     CeBIT 2002                                                 ***
***     Besuchen Sie uns auf der CeBIT vom 13.-20.03.2002          ***
***     auf dem Messegel=E4nde in Hannover, Halle 11                 ***
**********************************************************************
