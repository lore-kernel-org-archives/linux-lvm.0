From: Anselm Kruis <A.Kruis@science-computing.de>
Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
In-Reply-To: <m28z9guz53.fsf@isnogud.escape.de>
Message-Id: <Pine.LNX.4.02.10202270943080.8818-100000@murnau.science-computing.de>
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
Date: Wed Feb 27 03:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On 26 Feb 2002, Urs Thuermann wrote:

> I tried creating a snapshot of a ext2 file system on a LV.  I expected
> a fsck on the snapshot device to give no errors, i.e. a consistent
> file system.  This is ok, as long as there is no (or little) load on
> the file system when creating the snapshot.
>=20
> However, on a busy file system, the created snapshot has lots of
> errors found by fsck.
>=20
> Is it this what the VFS lock patch is for?  If so, why hasn't it been
> integrated into the standard kernel?  Has it flaws in it?  Maybe
> performance wise?

It deadlocks for XFS on smp under heavy writeload. I use a writeable
snapshot patch and replay the log afterwards.

I think, the VFS patch has some principal problems. Creating a snapshot
with the VFS-lock patch applied is more or less equivalent to unmounting=20
the file system, creating the snapshot of the device and remounting the
file system. That means that all ongoing write operations must be
suspended until the filesystem is in a "clean" state. This can take
some time. Up to 15 minutes from my observations and that is way too long.
I think the right way is: use a jornaling file system, take a snapshot,
make the snapshot writeable, replay the log, make the snapshot readonly
and dump it to tape or whatever you want. No races, no deadlocks, no
problems.

Anselm


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
