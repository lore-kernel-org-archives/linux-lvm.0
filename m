References: <20180726163145.pywehjailovwjv2a@merlins.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
Date: Fri, 27 Jul 2018 14:59:28 +0200
MIME-Version: 1.0
In-Reply-To: <20180726163145.pywehjailovwjv2a@merlins.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Marc MERLIN <marc@merlins.org>

Dne 26.7.2018 v 18:31 Marc MERLIN napsal(a):
> Still learning about thin volumes.
> Why do I want my thin pool to get auto extended? Does "extended" mean
> resized?

yes   extension == resize


> Why would I want to have thin_pool_autoextend_threshold below 100 and
> have it auto extend as needed vs having all of them be at 100, knowing
> that underlying block allocation will fail if I run out of physical
> blocks underneath?

Hi

man lvmthin.


In general -  do not calculate with 'running out of space on thin-pool' as 
your regular workflow how to use it daily.

Running out-of-space in thin-pool (data and even more on metadata) will have 
always MAJOR impact on usability of your system. It's always unpleasant moment 
and it's not even closely comparable with something like running out-of-space 
in your filesystem - it's much more problematic case - so you should at all 
cost try to avoid it.

If you want to be living on corner case of out-of-space, thin-pool is probably 
not the best technology for use.




> 
> 
> Details:
> I have a 14TB bcache block device.
> On top, I'd like to put multiple btrfs filesystems.

IMHO bad plan to combine 2 overprovisioning technologies together.

btrfs HAS its own built-in volume manager  (aka built-in it's own like lvm)


> There is however an issue with btrfs where it gets more unsafe (and
> slower) to use if you have too many snapshots (over 50, and especially
> over 100).

It's better to pair  thin-pool with ext4 of  XFS.

BTRFS will suffer great pain from problems of lvm2 snapshots - where btrfs 
will see the very same block device multiple times present in your system - so 
I'd highly discourage usage of thin-pool with btrfs unless you are very well 
aware of the weaknesses and you can avoid running into them...


> I'm looking at lvm.conf, and I'll be honest that it's not clear
> # Configuration option activation/thin_pool_autoextend_threshold.
> # Auto-extend a thin pool when its usage exceeds this percent.
> # Setting this to 100 disables automatic extension.
> # The minimum value is 50 (a smaller value is treated as 50.)
> # Also see thin_pool_autoextend_percent.
> # Automatic extension requires dmeventd to be monitoring the LV.
> #
> # Example
> # Using 70% autoextend threshold and 20% autoextend size, when a 1G
> # thin pool exceeds 700M, it is extended to 1.2G, and when it exceeds
> # 840M, it is extended to 1.44G:
> # thin_pool_autoextend_threshold = 70
> #
> thin_pool_autoextend_threshold = 100
> 
> What's the downside of just leaving it at 100?

Possible lose of your data in case you run out of space and you hit some 
corner cases - note just with 4.18 kernel will be fixed one quite annoying bug 
with usage of  TRIM and full pool which could have lead to some problematic 
metadata recovery.

Regards

Zdenek
