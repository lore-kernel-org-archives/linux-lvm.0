Date: Fri, 27 Jul 2018 16:35:18 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180727233518.ncockmduihftg5do@merlins.org>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
	<20180727195818.xiqugi4akg5j3r6b@merlins.org>
	<23387.35362.249651.285808@quad.stoffel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23387.35362.249651.285808@quad.stoffel.home>
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stoffel <john@stoffel.org>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 27, 2018 at 05:09:54PM -0400, John Stoffel wrote:
> That's the key part that I didn't realize.  And this is why I'm still
> leary of btrfs (and zfs for that matter) since as you push the limits,
> they tend to fall off a cliff performance wise, instead of degrading
> more gracefully.  So you're obvisously also using source brtfs
> volume(s) for your data being backed up.  So can understand what
> you're trying to do...
> 
> So is it a single 14tb source btrfs volume, and did you make snapshots
> on a rotating basis to the destinations volumes?  
 
Maybe we should continue this on the btrfs list, I don't want to spam
people here who don't care about btrfs :) but I'll answer this and if we
continue, let's move lists if you don't mind.

btrfs send/receive needs a snapshot for each copy. I then have a script
that decides that I keep X of the older snapshots I don't need anymore
for send/receive to work, but that I keep around for posterity.

Snapshots do not actually cause performance issues that I've noticed day
to day with btrfs, but if you do quotas, or balance (which is a
complicated operation), or btrfsck, then the number of snapshots
matters, and performance gets hurt quite a bit if you have 270
snapshots, like I ended up having in the end :)

> Marc> 4) because I still need the same amount of backups and want the same
> Marc> amount of history, fewer subvolumes means moving each separate subvolume
> Marc> into its own separate filesystem.
> 
> So you're doing snapshots of source sub-volumes?  I figure you must be
> running into performance problems no matter which end you're talking
> about here, because the btrfs stuff is just going to bite you one way
> or another.
 
Not really, performance was fine. It was so much better than using
rsync (sometimes by 100x or more)
But yeah, send/receive makes a snapshots of the source, and leaves a
snapshot on the destination volume.
You can work with only 2 snapshots, but I keep more for historical
restores.

> Marc> Then there is the last part that btrfs is still not super stable
> Marc> and can have corruption problems (although in my case I had
> Marc> clear problems due to an underlying unreliable SATA subsystem
> Marc> which caused writes not to make it to all the blocks of each
> Marc> drive of a raid set, something that even careful journalling
> Marc> does not deal with with).  So, I have:
> 
> Man, you love living dangerously!  *grin*

It is a good time to say that I actually use all of this on one
filesystem?

mdadm raid5
bcache
dmcrypt
dm-thin
lvm
btrfs

:)

> I think you're a little crazy using btrfs in this way, *grin* since
> losing my data is a big no-no in my world.  Personally love my Netapps
> because they're super reliable and super easy to grow-shrink volumes
> and snapshots just work, along with cloning volumes across to other
> systems.
 
I used to work at netapp, they're great, but they don't work inside my
laptop, obviously they're not open source and I'd rather avoid using
NFS if I can at this point (ok, they also do iscsi).

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
