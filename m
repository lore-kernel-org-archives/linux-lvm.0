From: Anselm Kruis <A.Kruis@science-computing.de>
Subject: RE: [linux-lvm] snapshots of busy ext2 file system corrupt
In-Reply-To: <3303790000.1014842549@tiny>
Message-Id: <Pine.LNX.4.02.10203040940500.19760-100000@murnau.science-computing.de>
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
Date: Mon Mar  4 02:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, 27 Feb 2002, Chris Mason wrote:

> >> I think, the VFS patch has some principal problems. Creating=20
> >> a snapshot
> >> with the VFS-lock patch applied is more or less equivalent to=20
> >> unmounting=20
> >> the file system, creating the snapshot of the device and=20
> >> remounting the
> >> file system. That means that all ongoing write operations must be
> >> suspended until the filesystem is in a "clean" state. This can take
> >> some time. Up to 15 minutes from my observations and that is=20
> >> way too long.
> >> I think the right way is: use a jornaling file system, take a=20
> >> snapshot,
> >> make the snapshot writeable, replay the log, make the=20
> >> snapshot readonly
> >> and dump it to tape or whatever you want. No races, no deadlocks, no
> >> problems.
>=20
> There is a problem with this method, namely the FS you get after
> replaying the log will not be the same FS you had at the time of
> the snapshot.  Any transactions that had not been committed yet will
> not be replayed.  It will be consistent, but probably not the FS you
> were expecting.

It depends. For backups triggerd by cron that is not an issue, because i
only expect a snapshot of the filesystem at about 2am. For other purposes
it might be a problem. Would a call to sync prior to the lvcreate -s help?

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
