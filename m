From: Anselm Kruis <A.Kruis@science-computing.de>
Subject: RE: [linux-lvm] snapshots of busy ext2 file system corrupt
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F0C6@cdserv.meridian-data.com>
Message-Id: <Pine.LNX.4.02.10203040947230.19760-100000@murnau.science-computing.de>
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
Date: Mon Mar  4 02:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Wed, 27 Feb 2002, Stephenson, Dale wrote:

> Anselm Kruis writes:
>=20
> [Of the VFS lock patch]
> >=20
> > It deadlocks for XFS on smp under heavy writeload. I use a writeable
> > snapshot patch and replay the log afterwards.
> >=20
> So if you don't have the patch, you don't have a deadlock?  I've been try=
ing
> to track down a problem with multiple snapshots of the same volume, but t=
he
> presence or absence of the lock patch doesn't seem to make a difference.

I don't have the deadlock without the VFS patch.

>=20
> > I think, the VFS patch has some principal problems. Creating=20
> > a snapshot
> > with the VFS-lock patch applied is more or less equivalent to=20
> > unmounting=20
> > the file system, creating the snapshot of the device and=20
> > remounting the
> > file system. That means that all ongoing write operations must be
> > suspended until the filesystem is in a "clean" state. This can take
> > some time. Up to 15 minutes from my observations and that is=20
> > way too long.
> > I think the right way is: use a jornaling file system, take a=20
> > snapshot,
> > make the snapshot writeable, replay the log, make the=20
> > snapshot readonly
> > and dump it to tape or whatever you want. No races, no deadlocks, no
> > problems.
> >=20
> Except that it's a lot more steps :->.

Or a small script. :-)

  I only wrote a writable snapshot
> patch because I wanted to use XFS with snapshots and they didn't have the
> nouuid,norecovery mount options at the time.  Is there any difference
> between doing the replay and just mounting norecovery?

I think so. The filesystem might be inconsistent if you don't replay the
log.


---
 Anselm Kruis                                 Tel. +49 (0)89-356386-74
 science + computing ag=09=09              FAX  +49 (0)89-356386-37
 Ingolst=E4dter Str. 22             mailto: A.Kruis@science-computing.de
 D-80807 M=FCnchen                 WWW: http://www.science-computing.de/

**********************************************************************
***     Wir freuen uns auf Ihren Besuch                            ***
***                                                                ***
***     CeBIT 2002                                                 ***
***     13.-20.03.2002, Messegel=E4nde Hannover, Halle 11, F 64      ***
***                                                                ***
***     Automotive Circle International                            ***
***     18.-19.04.2002, Bad Nauheim                                ***
***                                                                ***
***     VDI-Tagung: Berechnung und Simulation im Fahrzeugbau       ***
***     01.-02.10.2002, Congress-Centrum W=FCrzburg                  ***
***                                                                ***
**********************************************************************=20
