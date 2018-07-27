MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23387.35362.249651.285808@quad.stoffel.home>
Date: Fri, 27 Jul 2018 17:09:54 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20180727195818.xiqugi4akg5j3r6b@merlins.org>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
	<20180727195818.xiqugi4akg5j3r6b@merlins.org>
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
To: Marc MERLIN <marc@merlins.org>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Marc" == Marc MERLIN <marc@merlins.org> writes:

Marc> On Fri, Jul 27, 2018 at 03:31:36PM -0400, John Stoffel wrote:
>> Why don't you run quotas on your filesystems?  Also, none of the
>> filesystems in Linux land that I'm aware of supports shrinking the
>> filesystem while live, it's all a unmount, shrink FS, shrink volume
>> (carefully!) and then re-mount the filesystem.
 
Marc> Those filesystems can be umounted, so shrinking while live is not
Marc> something I need even if btrfs might actually support it.

>> But again, I think you might really prefer quotas instead, unless you
>> need complete logical seperation.

Marc> Since I know more than I wish I did about btrfs :) let me explain a bit
Marc> more

Marc> 0) I will not be using lvm for its own snapshot capabilities, or
Marc> resize.  I'm cheating by using overcommit with dm-thin and not
Marc> wanting to worry about segmenting space between each fileystem
Marc> and having to worry about shrinking one to grow another one from
Marc> time to time.

Marc> 1) quotas don't work well on btrfs when you have snapshots, and
Marc> by that I mean btfrs snapshots. Because blocks are shared
Marc> between snapshots, calculating quotas is a performance problem.

Marc> 2) I don't have a space or quota problem on btrfs, the problem I
Marc> have is I use btrfs send/receive a lot for backups (it's a
Marc> backup server) and history (go back a month ago or whatever).
Marc> http://marc.merlins.org/perso/btrfs/post_2014-03-22_Btrfs-Tips_-Doing-Fast-Incremental-Backups-With-Btrfs-Send-and-Receive.html
Marc> if you aren't familiar with btrfs send/receive backups.  Btrfs
Marc> starts having performance problems for some operations
Marc> (re-balance, or fsck) when you have too many subvolumes (each
Marc> snapshot creates a subvolume).

That's the key part that I didn't realize.  And this is why I'm still
leary of btrfs (and zfs for that matter) since as you push the limits,
they tend to fall off a cliff performance wise, instead of degrading
more gracefully.  So you're obvisously also using source brtfs
volume(s) for your data being backed up.  So can understand what
you're trying to do...

So is it a single 14tb source btrfs volume, and did you make snapshots
on a rotating basis to the destinations volumes?  

Marc> 3) I hit severe enough problems that filesystem checks were
Marc> taking days to complete, which was not workable. The only way
Marc> around it is to have fewer subvolumes.

Ouch!  This is not an easy space to be in.  

Marc> 4) because I still need the same amount of backups and want the same
Marc> amount of history, fewer subvolumes means moving each separate subvolume
Marc> into its own separate filesystem.

So you're doing snapshots of source sub-volumes?  I figure you must be
running into performance problems no matter which end you're talking
about here, because the btrfs stuff is just going to bite you one way
or another.

Marc> Then there is the last part that btrfs is still not super stable
Marc> and can have corruption problems (although in my case I had
Marc> clear problems due to an underlying unreliable SATA subsystem
Marc> which caused writes not to make it to all the blocks of each
Marc> drive of a raid set, something that even careful journalling
Marc> does not deal with with).  So, I have:

Man, you love living dangerously!  *grin*

Marc> 5) when things go wrong with btrfs, you're better off having smaller
Marc> filesystems with less data as they are quicker to check and repair as
Marc> well we quicker to rebuild if they are corrupted beyond repair
Marc> (btrfs can easily get into a state where all or most of your data is
Marc> still there read only, but the filesystem has extent issues that can't
Marc> be fixed at this moment and require a rebuild)

Ouch!  You really enjoy living on the edge.  :-)   

Marc> Am I crazy to want to use dm-thin the way I'm trying to? :)

I think you're a little crazy using btrfs in this way, *grin* since
losing my data is a big no-no in my world.  Personally love my Netapps
because they're super reliable and super easy to grow-shrink volumes
and snapshots just work, along with cloning volumes across to other
systems.

But I also agree that backups are a pain in the ass, no matter how you
look at it, and it's only gotten worse as filesystem size, and file
counts have gone up, but underlying filesystems and such haven't
managed to keep up.

Good luck for sure!
John
