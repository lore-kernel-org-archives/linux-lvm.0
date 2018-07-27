Date: Fri, 27 Jul 2018 11:26:58 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180727182658.GI23157@merlins.org>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,

Thanks for your helpful reply.

On Fri, Jul 27, 2018 at 02:59:28PM +0200, Zdenek Kabelac wrote:
> Dne 26.7.2018 v 18:31 Marc MERLIN napsal(a):
> >Still learning about thin volumes.
> >Why do I want my thin pool to get auto extended? Does "extended" mean
> >resized?
> 
> yes   extension == resize
 
Gotcha. Then I don't want to have to worry about my filesystem being resized
multiple times, especially since I'm not sure how it will help.
 
> man lvmthin.
 
Thanks. Had read it, but not carefully enough.
So, I just re-read "Automatic extend settings"
I'm still I'm not entirely sure how using extension would help me there. I
can't set it to 10% for all 10 filesystems (50% is minimum).
If I set it to anything less than 100%, it could later that it can block,
and try to extend and resize later, but ultimately I'll still have multiple
filesystems that together exceed the space available, so I can run out.
I'm not seeing how the automatic extend setting is helpful, at least in my case.
Am I missing something?

To be clear, my case is that I will have 10 filesystems in a place where the
same data was in a single filesystem that sadly I must segment now. More
than a few will take more than 1/10th of the space, but I don't want to have
to worry about which ones are going to use how much as long as all together
they stay below 100% of course.
I don't want to have to manage space for each of those 10 and have to resize
them by hand multiple times up and down to share the space, hence dm-thin.

My understanding is that I have to watch this carefully
  LV Name                thinpool2  
  VG Name                vgds2
  LV Pool metadata       thinpool2_tmeta
  LV Pool data           thinpool2_tdata
  LV Status              available
  # open                 8
  LV Size                14.50 TiB
  Allocated pool data    20.26%
  Allocated metadata     10.66%

I'll have to make sure to run fstrim so that 'Allocated pool data' never 
gets too high.
Metadata, I need to read more about to see whether that may become a problem.
I think as long as I don't use LVM snapshots I should be ok (and I won't).

> Running out-of-space in thin-pool (data and even more on metadata) will 
> have always MAJOR impact on usability of your system. It's always 
> unpleasant moment and it's not even closely comparable with something like 
> running out-of-space in your filesystem - it's much more problematic case - 
> so you should at all cost try to avoid it.
 
Thanks for confirming.
I suppose in my case I should set 'errorwhenfull y' so that the FS immmediately 
remounts read only on write failure. Delaying for up to 60 seconds is not
going to help in my case.

> If you want to be living on corner case of out-of-space, thin-pool is 
> probably not the best technology for use.
 
I don't want to be using dm-thin at all, but I have too many subvolumes for
a single btrfs filesystem, so I need to segement my btrfs filesystem in 10
or so, to be safe (as discussed with btrfs developers)
 
> IMHO bad plan to combine 2 overprovisioning technologies together.
> btrfs HAS its own built-in volume manager  (aka built-in it's own like lvm)
 
btrfs does not over provision, and sadly I found out that if you have more
than 50 or 100 snapshots, you are going to run into problems with balancing,
and bigger problems with filesystem corruption and repair later (as I found
out over the last 3 weeks dealing with this)
 
> >There is however an issue with btrfs where it gets more unsafe (and
> >slower) to use if you have too many snapshots (over 50, and especially
> >over 100).
> 
> It's better to pair  thin-pool with ext4 of  XFS.
 
I need btrfs send/receive, so that's not an option.

> BTRFS will suffer great pain from problems of lvm2 snapshots - where btrfs 

I will not be using lvm snapshots at all.

> will see the very same block device multiple times present in your system - 
> so I'd highly discourage usage of thin-pool with btrfs unless you are very 
> well aware of the weaknesses and you can avoid running into them...

I'm only using thin-pool to allow dynamic block allocation for over
provisioning. I will use no other LVM feature. Is that ok?

> Possible lose of your data in case you run out of space and you hit some 
> corner cases - note just with 4.18 kernel will be fixed one quite annoying 
> bug with usage of  TRIM and full pool which could have lead to some 
> problematic metadata recovery.

So, as long as I run trim in btrfs and make very sure I don't run out of blocks
on the VG side, should I be safe-ish enough?

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/  
