Message-ID: <3F9EE7D6.9090403@gbrmpa.gov.au>
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Drive gone bad, now what?
References: <20031021171817.GA28462@mail.parplies.de>	 <3F985B2D.5060008@xs4all.nl> <16280.27367.874758.610758@gargle.gargle.HOWL>	 <3F98B691.7090902@webhackande.se> <3F9989C9.1070909@xs4all.nl>	 <16285.12868.20878.180441@gargle.gargle.HOWL> <3F9DB7D8.5080502@xs4all.nl>	 <20031028081933.GA1629@tykepenguin.com>  <3F9EC8AA.7080603@xs4all.nl> <1067371611.4584.10.camel@jayson.NTSERVER1> <3F9ED172.3000704@xs4all.nl>
In-Reply-To: <3F9ED172.3000704@xs4all.nl>
Content-Transfer-Encoding: 7bit
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
Date: Tue Oct 28 16:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Gert van der Knokke wrote:
 > Mind this, I'm just stirring up things a bit to get some perspective
 > view of cost versus reliability.

Here's my AU$0.02.

We have roughly 400Gb of disk spread across 7 SMTP/IMAP/Oracle/GIS/
Web servers. We've just bought a Sun 3510 16-bay FC/SCSI RAID box to
serve as a baby-SAN to 5 of the servers and will consolidate the rest.
There's another 5 servers which have about half that but are squid or
CDROM servers and as such don't need full backups.

Right now we back up to two DLT drives, a Mamoth, and a Mamoth2,
several of them across the network to a machine with a physical
drive.

This is expensive and prone to failure.

Our solution is to buy a cheap Arena PA-8211 FC/IDE RAID box, connect
it to a cheap Intel/Debian server with Gb ethernet and rsync all the
servers to it several times per day. We can do a final rsync then
take a snapshot early AM when the rsync will be as consistant as it
will get, and back that up to a 7-tape autoloader for the Mamoth2.

This is still expensive - those Mamoth2 tapes are worth their weight
in gold. The chance of failure is much reduced, however.

The next stage is to buy a new tape drive, one of the new ones which
does 300Gb native, which will keep us to only two tapes for a full
backup. With a 5 or 10 slot autoloader, it should keep us going for
maybe two years before we need to look at a new tape drive.

Since the Arena box has a maximum capacity of 3.5Tb with 250Gb disks,
way above the Sun box, we intend to also take hourly/daily snapshots
as each rsync is done to reduce the need for restoring from tape.
(That was the on-topic LVM part of this post!)

Hey, while I have your attention, has anyone written some scripts to
check free space on a number of snapshots and add PE's as needed to
keep the snapshot valid, deleting the oldest as needed to free PE's?

Alternately, are there plans to add a trigger to a snapshot to do this
automatically, so the script only needs to keep an eye on the total free
PE's and delete the oldest snapshot as necessary? That would be *much*
nicer!

Cheers, glen.
