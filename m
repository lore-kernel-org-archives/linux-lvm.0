Message-ID: <4DA561C3.9070808@redhat.com>
Date: Wed, 13 Apr 2011 10:41:39 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <20110412234706.GA11244@redhat.com>
	<20cf301cbef67d323104a0c2ff52@google.com>
In-Reply-To: <20cf301cbef67d323104a0c2ff52@google.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing TRIM with LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>, DarkNovaNick@gmail.com

Dne 13.4.2011 03:47, DarkNovaNick@gmail.com napsal(a):
> On Apr 12, 2011 6:47pm, Mike Snitzer <snitzer@redhat.com> wrote:
>> On Tue, Apr 12 2011 at 10:59am -0400,
> 
>> DarkNovaNick@gmail.com DarkNovaNick@gmail.com> wrote:
> 
> 
> 
>> > I recently purchased a Crucial C300 SSD and set it up as my primary
> 
>> > drive. I wanted to use LVM, and my reading indicates that LVM added
> 
>> > support to pass-through TRIM commands with kernel 2.6.37. I'm
> 
>> > running Ubuntu 10.10, but I installed the latest 11.04 kernel, so
> 
>> > I'm running kernel 2.6.38-8. I added "discard" to fstab so my
> 
>> > mountpoint looks like:
> 
>> >
> 
>> > /dev/mapper/vg0-vol0 on / type ext4
> 
>> > (rw,noatime,nodiratime,errors=remount-ro,discard,commit=0)
> 
> 
> 
>> If the discards aren't working then ext4 will print a warning and stop
> 
>> issuing them, see: http://git.kernel.org/linus/a30eec2a8650a77f7
> 
> 
> 
>> So if you don't see "discard not supported, disabling" in your dmesg (or
> 
>> /var/log/messages) then TRIM is likely working as expected.
> 
> 
> 
>> > I found directions on various sites like:
> 
>> >
>> http://duopetalflower.blogspot.com/2010/11/enterprise-kernel-6-has-ssd-trim.html
>>
> 
>> > on how to confirm if TRIM is working. I ran (as root):
> 
>> >
> 
>> > dd if=/dev/urandom of=tempfile count=100 bs=512k oflag=direct
> 
>> > hdparm --fibmap tempfile
> 
>> > (then took the first begin_LBA)
> 
>> > hdparm --read-sector 191710208 /dev/sda
> 
>> >
> 
>> > and it printed:
> 
>> >
> 
>> > /dev/sda:
> 
>> > reading sector 191710208: succeeded
> 
>> > 3254 3a32 3834 313a 2b36 3030 303a 2030
> 
>> > 4544 5542 2047 3728 3a29 5320 7661 6e69
> 
>> > 2067 6e69 6564 2078 6f66 2072 7270 646f
> 
>> > ............
> 
>> >
> 
>> > Then I ran:
> 
>> > rm tempfile
> 
>> > sync
> 
>> > hdparm --read-sector 191710208 /dev/sda
> 
>> >
> 
>> > and it still returned:
> 
>> > /dev/sda:
> 
>> > reading sector 191710208: succeeded
> 
>> > 3254 3a32 3834 313a 2b36 3030 303a 2030
> 
>> > 4544 5542 2047 3728 3a29 5320 7661 6e69
> 
>> > 2067 6e69 6564 2078 6f66 2072 7270 646f
> 
>> > .............
> 
>> >
> 
>> > If TRIM is working, the sector is supposed to contain all zeros.
> 
> 
> 
>> That is only if the SSD implements TRIM so that it zeroes the discarded
> 
>> blocks. You can check if the device at least knows enough to report
> 
>> discard_zeroes_data:
> 
> 
> 
>> cat /sys/block/sda/queue/discard_zeroes_data
> 
> 
> 
>> Also, even if the SSD does zero, it may take some time -- well after the
> 
>> discard has completed -- for the SSD to actually zero the blocks (this
> 
>> is true of some lesser quality SSDs).
> 
> 
> 
>> > Am I doing something wrong or do I need to do something more to get
> 
>> > LVM to pass down the TRIM command?
> 
> 
> 
>> LVM (device mapper specifically) passes discards perfectly well. But
> 
>> the snapshot and dm-crypt targets don't have discard support. All other
> 
>> targets do have discard support. What is your output for: dmsetup table
> 
> 
> 
>> Mike
> 
> 
> 
> 
> I get 0 back when I do "cat /sys/block/sda/queue/discard_zeroes_data" so does
> this mean that my drive doesn't zero out the TRIMed blocks? I don't really
> care if it does or does not, I just want to make sure the drive is getting the
> TRIM commands as the benchmarks I've seen show performance degradation if they
> aren't used.

As I've the same drive - what kind of performance degradation do you see?

Note: this drive (unlike many others) is processing TRIM command on
background. So 'traditional' benchmark do not provide valuable results.
(As we've been evaluating this drive somewhat to compare with Intel).

Outcome is - when you issue TRIM command - it's immediately finished - but the
performance of drive is temporarily decreased while the drive is performing
block trimming for some time.  Thus you might get 'impressive' results when
some benchmarks are evaluating TRIM performance ;)

Zdenek
