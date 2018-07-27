Date: Fri, 27 Jul 2018 12:58:18 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180727195818.xiqugi4akg5j3r6b@merlins.org>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23387.29464.233937.89557@quad.stoffel.home>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, john@stoffel.org
Cc: Zdenek Kabelac <zkabelac@redhat.com>

On Fri, Jul 27, 2018 at 03:31:36PM -0400, John Stoffel wrote:
> Why don't you run quotas on your filesystems?  Also, none of the
> filesystems in Linux land that I'm aware of supports shrinking the
> filesystem while live, it's all a unmount, shrink FS, shrink volume
> (carefully!) and then re-mount the filesystem.
 
Those filesystems can be umounted, so shrinking while live is not
something I need even if btrfs might actually support it.

> But again, I think you might really prefer quotas instead, unless you
> need complete logical seperation.

Since I know more than I wish I did about btrfs :) let me explain a bit
more

0) I will not be using lvm for its own snapshot capabilities, or resize.
I'm cheating by using overcommit with dm-thin and not wanting to worry
about segmenting space between each fileystem and having to worry about 
shrinking one to grow another one from time to time.

1) quotas don't work well on btrfs when you have snapshots, and by that
I mean btfrs snapshots. Because blocks are shared between snapshots,
calculating quotas is a performance problem.

2) I don't have a space or quota problem on btrfs, the problem I have is
I use btrfs send/receive a lot for backups (it's a backup server) and
history (go back a month ago or whatever).
http://marc.merlins.org/perso/btrfs/post_2014-03-22_Btrfs-Tips_-Doing-Fast-Incremental-Backups-With-Btrfs-Send-and-Receive.html
if you aren't familiar with btrfs send/receive backups.
Btrfs starts having performance problems for some operations (re-balance,
or fsck) when you have too many subvolumes (each snapshot creates a
subvolume).

3) I hit severe enough problems that filesystem checks were taking days
to complete, which was not workable. The only way around it is to have
fewer subvolumes.

4) because I still need the same amount of backups and want the same
amount of history, fewer subvolumes means moving each separate subvolume
into its own separate filesystem.

Then there is the last part that btrfs is still not super stable and can
have corruption problems (although in my case I had clear problems due
to an underlying unreliable SATA subsystem which caused writes not to
make it to all the blocks of each drive of a raid set, something that
even careful journalling does not deal with with).
So, I have:

5) when things go wrong with btrfs, you're better off having smaller
filesystems with less data as they are quicker to check and repair as
well we quicker to rebuild if they are corrupted beyond repair
(btrfs can easily get into a state where all or most of your data is
still there read only, but the filesystem has extent issues that can't
be fixed at this moment and require a rebuild)

Makes sense?

Am I crazy to want to use dm-thin the way I'm trying to? :)

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
