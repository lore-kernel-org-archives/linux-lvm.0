Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3L9snPm022794
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 05:54:49 -0400
References: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5718A369.4060103@redhat.com>
Date: Thu, 21 Apr 2016 11:54:49 +0200
MIME-Version: 1.0
In-Reply-To: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why LVM metadata locations are not properly aligned
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
To: linux-lvm@redhat.com

On 21.4.2016 06:08, Ming-Hung Tsai wrote:
> Hi,
>
> I'm trying to find any opportunity to accelerate LVM metadata IO, in order to
> take lvm-thin snapshots in a very short time. My scenario is connecting
> lvm-thin volumes to a Windows host, then taking snapshots on those volumes for
> Windows VSS (Volume Shadow Copy Service). Since that the Windows VSS can only
> suspend IO for 10 seconds, LVM should finish taking snapshots within 10 seconds.
>

Hmm do you observe taking a snapshot takes more then a second ?
IMHO the largest portion of time should be the 'disk' synchronization
when suspending  (full flush and fs sync)
Unless you have lvm2 metadata in range of MiB (and lvm2 was not designed for 
that) - you should be well bellow a second...

> However, it's hard to achieve that if the PV is busy running IO. The major

Changing disk scheduler to deadline ?
Lowering percentage of dirty-pages ?


> overhead is LVM metadata IO. There are some issues:

While your questions are valid points for discussion - you will save couple 
disk reads - but this will not save your time problem a lot if you have 
overloaded disk I/O system.
Note lvm2 is using direct I/O which is your trouble maker here I guess...

>
> 1. The metadata locations (raw_locn::offset) are not properly aligned.
>     Function _aligned_io() requires the IO to be logical-block aligned,
>     but metadata locations returned by next_rlocn_offset() are 512-byte aligned.
>     If a device's logical block size is greater than 512b, then LVM need to use
>     bounce buffer to do the IO.
>     How about setting raw_locn::offset to logical-block boundary?
>     (or max(logical_block_size, physical_block_size) for 512-byte logical-/4KB
>      physical-block drives?)

This looks like a bug - lvm2 should start to write metadata always on physical 
block aligned position.


> 2. In most cases, the memory buffers passed to dev_read() and dev_write() are
>     not aligned. (e.g, raw_read_mda_header(), _find_vg_rlocn())
>
> 3. Why LVM uses such complex process to update metadata?
>     The are three operations to update metadata: write, pre-commit, then commit.
>     Each operation requires one header read (raw_read_mda_header),
>     one metadata checking (_find_vg_rlocn()), and metadata update via bounce
>     buffer. So we need at least 9 reads and 3 writes for one PV.
>     Could we simplify that?

It's been already simplified once ;) and we have lost quite important property
of validation of written data during pre-commit - which is quite useful when
user is running on misconfigured multipath device...

Each state has its logic and with each state we need to be sure data are 
there.  This doesn't sound like a problem with a single PV - but in a server 
world of many different kind of misconfiguration and failing devices it may be 
more important then you might think.

The valid idea might be - to maybe support 'riskier' variant of metadata 
update, where lvm2 might skip some disk security checking, but may not catch 
all trouble associated - thus you may run for days with dm table you will not 
find then in your lvm2 metadata....


>
> 4. Commit fb003cdf & a3686986 causes additional metadata read.
>     Could we improve that? (We had checked the metadata in _find_vg_rlocn())

Fight with disk corruption and duplications is a major topic in lvm2....
But ATM are fishing for bigger fish :)
So yes this optimizations are in a queue - but not as top priority.

>
> 5. Feature request: could we take multiple snapshots in a batch, to reduce
>     the number of metadata IO operations?
>     e.g., lvcraete vg1/lv1 vg1/lv2 vg1/lv3 --snapshot
>     (I know that it would be trouble for the --addtag options...)

Yes another already existing and planned RFE - to have support for
atomic snapshot for multiple device at once - in a queue.

>
>     This post mentioned that lvresize will support resizing multiple volumes,

It's not about resizing mutliple volume with once command,
it's about resizing data & metadata in one command via policy more correctly/

>     but I think that taking multiple snapshots is also helpful.
>     https://www.redhat.com/archives/linux-lvm/2016-February/msg00023.html
>     > There is also some ongoing work on better lvresize support for more then 1
>     > single LV. This will also implement better approach to resize of lvmetad
>     > which is using different mechanism in kernel.
>
>     Possible IOCTL sequence:
>       dm-suspend origin0
>       dm-message create_snap 3 0
>       dm-message set_transaction_id 3 4

Every transaction update here - needs  lvm2 metadata confirmation - i.e. 
double-commit   lvm2 does not allow to jump by more then 1 transaction here,
and the error path also cleans 1 transaction.


>       dm-resume origin0
>       dm-suspend origin1
>       dm-message create_snap 4 1
>       dm-message set_transaction_id 4 5
>       dm-resume origin1
>       dm-suspend origin2
>       dm-message create_snap 5 2
>       dm-message set_transaction_id 5 6
>       dm-resume origin2
>       ...
>
> 6. Is there any other way to accelerate LVM operation? I had enabled lvmetad,
>     setting global_filter and md_component_detection=0 in lvm.conf.

Reducing number of PVs with metadata in case your VG has lots of PVs
(may reduce metadata resistance in case PVs with them are lost...)

Filters are magic - try to accept only devices which are potential PVs and 
reject everything else. (by default every device is accepted and scanned...)

Disabling archiving & backup in filesystem (in lvm.conf) may help a lot if you 
run lots of lvm2 commands and you do not care about archive.

Checking /etc/lvm/archive is not full of thousands of files.

Checking with  'strace -tttt' what delays your command.

And yes - there are always couple on going transmutation in lvm2 which may 
have introduced some performance regression - so open BZ is always useful if 
you spot such thing.

Regards

Zdenek
