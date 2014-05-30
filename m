Date: Fri, 30 May 2014 14:16:48 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140530181648.GA10285@redhat.com>
References: <20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com> <53888DA9.6090003@redhat.com>
	<20140530142602.GN1302@redhat.com>
	<20140530142926.GA9219@redhat.com>
	<20140530143659.GP1302@redhat.com>
	<20140530144453.GD9219@redhat.com>
	<20140530145152.GQ1302@redhat.com>
	<20140530145802.GA9373@redhat.com>
	<20140530152858.GR1302@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530152858.GR1302@redhat.com>
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
Cc: Heinz Mauelshagen <heinzm@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Fri, May 30 2014 at 11:28am -0400,
Richard W.M. Jones <rjones@redhat.com> wrote:

> I did in fact recreate the ext4 filesystem, because I didn't read your
> email in time.
> 
> Here are the commands I used to create the whole lot:
> 
> ----------------------------------------------------------------------
> lvcreate -L 800G -n testorigin vg_guests @slow
> mkfs -t ext4 /dev/vg_guests/testorigin
> # at this point, I tested the speed of the uncached LV, see below
> lvcreate -L 1G -n lv_cache_meta vg_guests @ssd
> lvcreate -L 200G -n lv_cache vg_guests @ssd
> lvconvert --type cache-pool --chunksize 32k --poolmetadata vg_guests/lv_cache_meta vg_guests/lv_cache
> lvconvert --type cache --cachepool vg_guests/lv_cache vg_guests/testorigin
> dmsetup message vg_guests-testorigin 0 sequential_threshold 0
> dmsetup message vg_guests-testorigin 0 read_promote_adjustment 0
> dmsetup message vg_guests-testorigin 0 write_promote_adjustment 0
> # at this point, I tested the speed of the cached LV, see below
> ----------------------------------------------------------------------
> 
> To test the uncached LV, I ran the same fio test twice on the mounted
> ext4 filesystem.  The results of the second run are in the first
> attachment.
> 
> To test the cached LV, I ran these commands 3 times in a row:
> 
> md5sum virt.*
> echo 3 > /proc/sys/vm/drop_caches
> 
> then I ran the fio test twice.  The results of the second run are
> attached.
> 
> This time the LVM cache test is about 10% slower than the HDD test.
> I'm not sure what to make of that at all.

It could be that the 32k cache blocksize increased the metadata overhead
enough to reduce the performance to that degree.

And even though you recreated the filesystem it still could be the case
that the IO issued from ext4 is slightly misaligned.  I'd welcome you
going to back to a blocksize of 64K (you don't _need_ to go to 64K but it
seems you're giving up quite a bit of performance now).  And then
collecting blktraces of the origin volume for the fio run -- to see if
64K * 2 IOs are being issued for each 64K fio IO.  I would think it
would be fairly clear from the blktrace but maybe not.

It could be that a targeted debug line in dm-cache would serve as a
better canary for whether misalignment is a concern.  I'll see if I can
come up with a patch that helps us assess misalignment.

Joe Thornber will be back from holiday on Monday so we may get some
additional insight from him soon enough.

Sorry for your troubles but this is good feedback.
