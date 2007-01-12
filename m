From: "Wilson, Christopher J" <chris.j.wilson@verizonbusiness.com>
Message-id: <500DD6DE2DFA8E40A33E5898D9471B97016D4FDE@ASHEVS006.mcilink.com>
MIME-version: 1.0
Content-class: urn:content-classes:message
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] RE: [dm-devel] [RFC] Multiple Snapshots -
	Manageability	problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Fri, 12 Jan 2007 22:08:26 -0000
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: device-mapper development <dm-devel@redhat.com>, evms-devel@lists.sourceforge.net, linux-lvm@redhat.com

I'm aware we're discussing file system cow snapshots here, 3PAR was just
a reference around the virtual pool concept. =20

Using one pool per origin helps and I do see the upside to that and I
don't discount it altogether.  A global pool shared across all devices
could be playing with fire.

My concern with the single pool is we're now starting to crossover into
the deduplication space, or what looks like the beginning of it.  The
issue with having all pointers looking at a central pool of storage goes
back to the garbage collection process.  This is an io bound unit of
work and if you think you've got performance issues now try and read
from a snap while garbage collection is going on.  Writes to it would be
equally as painful.  As I said, we use the dedup technology which uses a
single pool (not 3PAR, they're virtual primary disk and a damn good one)
and between backups and garbage collect and other block checking the
system is at its knees. =20

I would argue that sharing a cow pool doesn't make your snapshots
independent, it makes them dependant.  As with the dedup technology you
have to track which blocks are shared across all your cow snaps.  This
means that you can't garbage collect a shared block until the last cow
is expired.  You have a strong possibility that you'll have
defragmentation problems and your cow store may continue to grow, or at
least shrink begrudgingly and with lots of human intervention.

I think it goes back to why do this?  If people are keeping a weeks
worth of snaps then I think they need to look at their data protection
strategy and build a better mousetrap at that level.  As I said on the
other thread, I'd be uncomfortable with 7 day old cow snap if something
happened that was bad enough that I had to recover from them.  A 7 day
old block-by-block copy is much safer.  With the size of disk and
current rate of cost per GB (and falling) a cow strategy that did some
lazy migration to a clone based on time may be more useful.

-Chris

-----Original Message-----
From: dm-devel-bounces@redhat.com [mailto:dm-devel-bounces@redhat.com]
On Behalf Of Vijai Babu Madhavan
Sent: Thursday, January 11, 2007 11:47 PM
To: evms-devel@lists.sourceforge.net; device-mapper development;
linux-lvm@redhat.com
Subject: RE: [dm-devel] [RFC] Multiple Snapshots - Manageability problem

Hi Chris,

Thanks for the response. I am trying to keep my mails short as I believe
the lack of responses to my mails are probably due to the fact that they
are long, but its kinda difficult to keep them small and still convey
the various aspects. :)

>>> On 1/12/2007 at 3:04 AM, "Wilson, Christopher J"
<chris.j.wilson@verizonbusiness.com> wrote:
> I haven't read through all of these options yet (but I will).  I will=20
> say that synthesizing all your cow objects into one pool will be=20
> difficult.  You're going to have issues with garbage collection of old

> copies and may have to build in some scavenge or compress functions=20
> which will take system resources.  From my experience with disk based=20
> de-duplication technologies you're heading down a hole which can be a=20
> dark place.  There are performance issues and maintaining all those=20
> pointers is problematic.  The virtual pool sounds good, and works very

> will for primary storage functions (3PAR) but in practice for backup=20
> applications with virtual pools for deduplication it's not been so
hot.

I completely agree that its not going to be easy. But, I guess some
price needs to be paid to get the benefits. If snapshots could be
implemented at the file system level, we do not necessarily need to redo
lot of these, but building snapshot functionality into the file system
itself comes with the obvious drawback. If only we could build some
framework at the file system layer, but some thing that is not tied to
each file system would be good. I have not had a chance to spend time in
this space yet, do others have any ideas in this space?

> I'm not clear what the issue is with maintaining multiple cow
snapshots.
> Just exactly how many are users asking for?  Keeping more than a few=20
> cow snaps online is not using the function for what it was meant for.
> COW technology is for immediate rollback (to me) and not for long term

> backup images.

From what we see from the users/IT admins, I see two common uses of
snapshots.

a) Snapshots for backups
b) Snapshots as backups

In the first case, snapshots are obtained to avoid the open file errors,
etc and keeping few snapshots online is more than sufficient.

But, increasingly, we see lot of admins trying to deploy D2D2T
(Disk->Disk->Tape), to avoid the many problems associated with the tape
backups. And, Snapshots are one of the very efficient way of keeping the
disk backups to protect against logical failures (of course not for
hardware failures).

Hence, the second case is becoming a strong use-case, as admins want to
take 3-4 snapshots a day and recycle them after a week or two weeks.=20
Based on the frequency and the time a snapshot is kept alive, number of
snapshots easily get into double digit, in some cases, triple digit.

With the current DM snapshot code, with couple of snapshots, the system
comes down rapidly (The throughput numbers in the earlier mail thread
and the complaints from users reported in the list indicate this).

As we fix this multiple snapshots issue, it also makes sense to fix the
multiple snapshots management issue using a single cow device. Besides,
using a single cow device provides a very compelling efficient way to
share the blocks among snapshots. This also enables the snapshots to be
managed independently.

> Sizing is an issue that will not go away and is not resolvable in any=20
> low level OS code, this is a business/user issue.
> Most customers don't even know how much data they're going to have=20
> much less what their average write rates are, and I don't envision a=20
> cow pool as solving the sizing issue.

I totally agree. I guess most admins today are loading their servers
around 60-70% utilization to avoid these space issues. While this works
ok for primary servers, it is impractical to waste so much space in each
snapshot, especially with multiple snapshots. I think having a single
cow device for each (origin), preferably multiple origins sharing a
single cow device would help alleviate this.
=20
> If I had my way I'd rather see energy put into cow technology for use=20
> as a disk cache for backup applications and tighter integration with=20
> those apps.  Better still would be for interfaces from business level=20
> applications (Oracle, MySQL, etc) to quiece IO, flush buffers, and=20
> take a consistent copy of the application, state and all.  Putting=20
> together an application level copy on hardware, being able to move=20
> that through a tighter workflow to backup media through a common API=20
> would be my preference instead of having each user create their own=20
> individual "glue" code.  If you look into SNIA's SMI-S (Storage=20
> Management API) copy services package there may already be a template=20
> for this.  I'd say at least that supporting SMI-S Copy Services=20
> through that API is desirable because a lot of the SRM application
today are on their way to
> leveraging that code.  =20

I completely agree. Application co-ordinated snapshot facility is really
important and would really help lot of application developers and
admins.
It is going to be interesting and challenging to build a framework that
would satisfy diverse application needs. At Novell, we also have some
interest in this space, and we are going through some internal processes
and I believe we would come out some time soon.

Vijai

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

______________________________________________________________________
This e-mail has been scanned by Verizon Managed Email Content Service,
using Skeptic(tm) technology powered by MessageLabs. For more
information on Verizon Managed Email Content Service, visit
http://www.verizonbusiness.com.
______________________________________________________________________


______________________________________________________________________
This e-mail has been scanned by Verizon Managed Email Content Service, usin=
g Skeptic=EF=BF=BD technology powered by MessageLabs. For more information =
on Verizon Managed Email Content Service, visit http://www.verizonbusiness.=
com.
______________________________________________________________________
