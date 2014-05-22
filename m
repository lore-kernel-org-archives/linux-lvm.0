Date: Thu, 22 May 2014 14:04:05 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140522180405.GA6361@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140522154946.GD14236@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, May 22 2014 at 11:49am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> 
> It works once I use a single VG.
> 
> However the performance is exactly the same as the backing hard disk,
> not the SDD.  It seems I'm getting no benefit ...
> 
> # lvs
> [...]
>   testoriginlv           vg_guests Cwi-a-C--- 100.00g lv_cache [testoriginlv_corig]                                 
> 
> # mount /dev/vg_guests/testoriginlv /tmp/mnt
> # cd /tmp/mnt
> 
> # dd if=/dev/zero of=test.file bs=64K count=100000 oflag=direct
> 100000+0 records in
> 100000+0 records out
> 6553600000 bytes (6.6 GB) copied, 57.6301 s, 114 MB/s
> 
> # dd if=test.file of=/dev/zero bs=64K iflag=direct
> 100000+0 records in
> 100000+0 records out
> 6553600000 bytes (6.6 GB) copied, 47.6587 s, 138 MB/s
> 
> (Exactly the same numbers as when I tested the underlying HDD, and
> about half the performance of the SDD.)

By default dm-cache (as is currently upstream) is _not_ going to cache
sequential IO, and it also isn't going to cache IO that is first
written.  It waits for hit counts to elevate to the promote threshold.
So dm-cache effectively acts as a hot-spot cache by default.

If you want dm-cache to be more aggressive for initial writes, you can:
1) discard the entire dm-cache device before use (either with mkfs,
   blkdiscard, or fstrim)
2) set the dm-cache 'write_promote_adjustment' tunable to 0 with the DM
   message interface, e.g.: 
   dmsetup message <mapped device> 0 write_promote_adjustment 0

Additional documentation is available in the kernel tree:
Documentation/device-mapper/cache.txt
Documentation/device-mapper/cache-policies.txt

Joe Thornber is also working on significant bursty write performance
improvements for dm-cache.  Hopefully they'll be ready to go upstream
for the Linux 3.16 merge window.

Mike
