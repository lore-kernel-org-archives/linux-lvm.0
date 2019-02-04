Date: Mon, 4 Feb 2019 11:25:27 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190204162527.GA2896@redhat.com>
References: <CAMRbyyv5qcsqmmP0uk+hEBmZJfZ-stV7XWUH23eJDnNMZYs7QA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRbyyv5qcsqmmP0uk+hEBmZJfZ-stV7XWUH23eJDnNMZYs7QA@mail.gmail.com>
Subject: Re: [linux-lvm] Mixing devices with different logical or physical
 block size in oVirt LVM based storage
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
To: Nir Soffer <nsoffer@redhat.com>
Cc: David Teigland <teigland@redhat.com>, Vojtech Juranek <vjuranek@redhat.com>, Denis Chaplygin <dchaplyg@redhat.com>, linux-lvm@redhat.com

On Sat, Feb 02 2019 at  6:54pm -0500,
Nir Soffer <nsoffer@redhat.com> wrote:

>    We working on enabling 4k block size in oVirt block storage domain, built
>    using VG
>    on multipath devices on shared storage.
>    We have incomplete support for 4k, added in 2011, for this bug:
>        [1]https://bugzilla.redhat.com/732980
>    When creating or extending a VG, we check that all PVs are using same
>    logical and
>    phyisical block size, and we store both logical and physical block size in
>    the VG tags.
>    We get the block sizes from
>    /sys/block/dm-X/queue/{logical,physical}_block_size.
>    We also enforce that device physical block size is not smaller than
>    logical block size,
>    This check was added in this patch, trying to enable block size != 512.
>    There is no
>    explanation in the patch or in the review comments why we need to validate
>    this.
> 
>    [2]https://github.com/oVirt/vdsm/commit/7e79153705891a91a06eb31cd642fb209d10ff86
>    When we start to use a VG, we validate that all the devices are using the
>    stored logical
>    and physical block size.
>    In vdsm itself, we use the logical block size to manage vdsm metadata,
>    assuming that writing
>    and reading one block of logical block size bytes is atomic, and we can
>    read and write
>    different blocks from different hosts at the same time.
>    The relevant code validating PV block sizes is here:
> 
>    [3]https://github.com/oVirt/vdsm/blob/8b043e402f41d8a82b9f832be5f582b8520b38bc/lib/vdsm/storage/lvm.py#L1110
>    Reading the comments in bug 732980, I don't see anything about physical
>    block size. It looks
>    like this is unnecessary check, and we should check only the logical block
>    size.
>    Regarding mixing devices with different logical block size, according to
>        [4]https://bugzilla.redhat.com/show_bug.cgi?id=732980#c8
>    We should not extend an LV over devices with different block size, as this
>    will change the device
>    logical block size (e.g change from 512 to 4k), and the change may break
>    the upper layer that
>    already use the device and assume the previous logical block size.

This idea that 4K writes to a 512b physical drive aren't going to be
atomic, and that that is going to be the basis for some upper level
failure is handwaving and overly paranoid TBH.

>    Based on this, I think we are ok with limiting VG to devices with same
>    logical block size, so any
>    LV can be extended to any device.
>    I think this code should change to:
>    1. When creating a VG, check that all PVs use the same logical block size
>    2. Store the logical block size in the VG tag
>    3. When extending the VG, check that the new PVs use the same logical
>    block size
>    4. When starting to use a VG, check that stored logical block size matches
>    PVs logical block size
>    What do you think?

I think you shouldn't care.  Or please show me a case where all this
concern matters.

Mike
