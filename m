Date: Thu, 13 Mar 2014 13:20:25 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140313172025.GA6835@redhat.com>
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
	<20140312233505.GA1660@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140312233505.GA1660@redhat.com>
Subject: Re: [linux-lvm] thinpool metadata size
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
To: "Paul B. Henson" <henson@acm.org>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

On Wed, Mar 12 2014 at  7:35pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Wed, Mar 12 2014 at  5:21pm -0400,
> Paul B. Henson <henson@acm.org> wrote:
> 
> > While researching thinpool provisioning, it seems one of the issues is that
> > the size of the metadata is fixed as of creation, and that if the metadata
> > allocation fills up, your pool is corrupted? In many of the places that
> > concern was mentioned, it was also said that extending the size of the
> > metadata lv was a feature coming soon, but I didn't find anything confirming
> > whether or not that functionality had been released. Is the size of the
> > metadata lv still fixed?
> 
> No, metadata resize is now available.  But you definitely want to be
> using the latest kernel (there have been various fixes for this
> feature).
> 
> Completely exhausting all space in the metadata device will expose you
> to a corner case that still needs work... so best to avoid that by
> sizing your metadata device conservatively (larger).
> 
> We'll soon be assessing whether a fix is needed for metadata resize once
> all metadata space is exhausted (but last I knew we have a bug lurking
> in dm-persistent-data for this case).

Yes, we're still unable to resize after metadata has been completely exhausted:

(NOTE: this is with a hacked 3.14-rc6 kernel that comments out the
dm_pool_metadata_set_needs_check() block in
drivers/md/dm-thin.c:abort_transaction().. otherwise this test would
short-circuit on the 'needs_check' flag being set and would never
attempt the resize)

# dmtest run --suite thin-provisioning -n /resize_metadata_after_exhaust/
Loaded suite thin-provisioning
Started
test_resize_metadata_after_exhaust(MetadataResizeTests): metadata_size = 512k
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: reached low water mark for metadata device: sending event.
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: space map metadata: unable to allocate new metadata block
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: metadata operation 'dm_pool_alloc_data_block' failed: error = -28
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: aborting current metadata transaction
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: switching pool to read-only mode
wipe_device failed as expected
resizing...
Mar 13 12:57:44 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186096
Mar 13 12:57:44 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186096
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: switching pool to write mode
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 128 to 192 blocks
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: space map metadata: unable to allocate new metadata block
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: metadata operation 'dm_pool_commit_metadata' failed: error = -28
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: aborting current metadata transaction
Mar 13 12:57:44 rhel-storage-02 kernel: device-mapper: thin: 251:5: switching pool to read-only mode
Mar 13 12:57:44 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:44 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:44 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:44 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:45 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:45 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:45 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186111
Mar 13 12:57:45 rhel-storage-02 kernel: Buffer I/O error on device dm-6, logical block 4186104
metadata_size = 768k
wipe_device failed as expected
resizing...
Mar 13 12:57:46 rhel-storage-02 kernel: device-mapper: thin: 251:5: switching pool to write mode
Mar 13 12:57:46 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 128 to 256 blocks
Mar 13 12:57:46 rhel-storage-02 kernel: device-mapper: space map metadata: unable to allocate new metadata block
Mar 13 12:57:46 rhel-storage-02 kernel: device-mapper: thin: 251:5: metadata operation 'dm_pool_commit_metadata' failed: error = -28
Mar 13 12:57:46 rhel-storage-02 kernel: device-mapper: thin: 251:5: aborting current metadata transaction
Mar 13 12:57:46 rhel-storage-02 kernel: device-mapper: thin: 251:5: switching pool to read-only mode

Good news is online metadata resize works fine as long as metadata space
hasn't been exhausted:

# dmtest run --suite thin-provisioning -n /resize_metadata_with_io/
Loaded suite thin-provisioning
Started
test_resize_metadata_with_io(MetadataResizeTests):
Mar 13 13:19:10 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 256 to 512 blocks
Mar 13 13:19:11 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 512 to 1024 blocks
Mar 13 13:19:12 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 1024 to 1536 blocks
Mar 13 13:19:14 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 1536 to 2048 blocks
Mar 13 13:19:15 rhel-storage-02 kernel: device-mapper: thin: 251:5: growing the metadata device from 2048 to 2560 blocks
.

Finished in 11.653548028 seconds.
