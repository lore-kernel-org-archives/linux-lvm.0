Message-ID: <3F9ED74D.3050709@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Drive gone bad, now what?
References: <20031021171817.GA28462@mail.parplies.de> <3F985B2D.5060008@xs4all.nl> <16280.27367.874758.610758@gargle.gargle.HOWL> <3F98B691.7090902@webhackande.se> <3F9989C9.1070909@xs4all.nl> <16285.12868.20878.180441@gargle.gargle.HOWL> <3F9DB7D8.5080502@xs4all.nl> <20031028081933.GA1629@tykepenguin.com> <3F9EC8AA.7080603@xs4all.nl>
In-Reply-To: <3F9EC8AA.7080603@xs4all.nl>
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
Date: Tue Oct 28 14:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

(orginally wasn't going to send this.. but changed my mind)
First, let me say that 100's of GB is nothing today.
A good LTO2 unit will do the trick quite nicely.  The problem
is that we are talking about 100's of TB now.  Even if
you have a 100 tape LTO2 drive or multiple LTO2 arrays
capable of moving 50M/sec+... you still end up in a crunch.

SAN folks will tell you to live mirror to a remote DR site...
but the pipe between sites could be VERY expensive (if you
have the money, it is definitely something worth considering
though).  What I'm suggesting below.. and I've tried to
use LVM... is the use of mirrored drives and the idea of
archival of hard disk storage.

Gert van der Knokke wrote:
...
> Now we have to find a reliable resizable/expandable filesystem (or 
> resizable/expandable block device system) on this hardware.

Mirrored drives.  So a logical drive includes a mirror as well.
You'll need a raid controller that can configure many drive instances
(drive + mirror).  Use LVM to add new logical drives into your
volume group, then extend your volumes and resize your filesystems.

(ascii art)

   pv1       pv2
+-----+   +-----+
| d 1 |   | d 2 |
+-----+   +-----+
| m 1 |   | m 2 |
+-----+   +-----+

pvcreate on pv1 and pv2 (can add pv3, etc later as needed)
put pv1, pv2 into a vg (extend with additional pv's later)
(if you like the pv's could be a set of mirrored drives
which are also striped).

Mirrored set could be pulled and archived at a storage center or
moved to a disaster recovery site.  Of course, this does imply
the ability to take out the entire range of mirrors safely.
You'll have to look at your HW raid controller to see what
is possible.  Afterwards, replace the "m" drives and let them
rebuild.

You may ask about joining the drives at the HW RAID level.. but as
mentioned, this might not give you the flexibility desired (see
the idea of striped sets mentioned earlier).

There are probably better solutions to this... obviously some
high end SAN devices may be better suited... not sure about
Linux filesystem compatibility though).

Just an idea.

Today, we're using a 5 TB disk based cache feeding into a
72 tape LTO library with 2 drives... adequate for our needs,
but we just don't have the storage needs that some require.
Moving forward, the idea of using off site disk storage,
off site DR replication or live DR mirroring are things we'll
haved to look at.
