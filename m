Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3M9niaF011109
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2016 05:49:45 -0400
References: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
	<5718A369.4060103@redhat.com>
	<CAAYit8T-RfgrG9=81ncbAMYfN4GLXafd9TtJ_H8NcGByt99Rqw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5719F3B8.2070208@redhat.com>
Date: Fri, 22 Apr 2016 11:49:44 +0200
MIME-Version: 1.0
In-Reply-To: <CAAYit8T-RfgrG9=81ncbAMYfN4GLXafd9TtJ_H8NcGByt99Rqw@mail.gmail.com>
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

On 22.4.2016 10:43, Ming-Hung Tsai wrote:
> 2016-04-21 18:11 GMT+08:00 Alasdair G Kergon <agk@redhat.com>:
>> On Thu, Apr 21, 2016 at 12:08:55PM +0800, Ming-Hung Tsai wrote:
>>> However, it's hard to achieve that if the PV is busy running IO.
>>
>> So flush your data in advance of running the snapshot commands so there is only
>> minimal data to sync during the snapshot process itself.
>>
>>> The major overhead is LVM metadata IO.
ote lvm2 is using direct I/O which is your trouble maker here I guess...
>
> That's the point. I should not say "LVM metadata IO is the overhead".
> LVM just suffered from the system loading, so it cannot finish metadata
> direct IOs within seconds. I can try to manage data flushing and filesystem sync
> before taking snapshots, but on the other hand, I wish to reduce
> the number of IOs issued by LVM.
>
>>
>> Changing disk scheduler to deadline ?
>> Lowering percentage of dirty-pages ?
>>
>
> In my previous testing on kernel 3.12, CFQ+ionice performs better than
> deadline in this case, but now it seems that the schedulers for blk-mq are not
> yet ready.
> I also tried to use cgroup to do IO throttling when taking snapshots.
> I can do some more testing.
>

yep - if simple set of  I/O do take several seconds - it's not really
a problem lvm2 can solve.

You should consider lowering the amount of dirty pages so you are
not using system with with  the extreme delay in write-queue.

Defaults are like 60% of RAM can be dirty and if you have a lot or RAM - it
may take quite while to sync all this to device - and that's
what will happen with 'suspend'

You may just try to measure it with plain 'dmsetup suspend/resume'
on a device you want to make a snapshot on your loaded hw.

Interesting thing to play with could be 'dmstats' (relatively recent addition)
for tracking latencies and i/o load on disk areas...


>>> 3. Why LVM uses such complex process to update metadata?
>>>
>> It's been already simplified once ;) and we have lost quite important
>> property of validation of written data during pre-commit -
>> which is quite useful when user is running on misconfigured multipath device...
>>
>> Each state has its logic and with each state we need to be sure data are
>> there.
>>
>> The valid idea might be - to maybe support 'riskier' variant of metadata
>> update
>
> I'm not well understand the purpose of pre-commit. Why not write the metadata
> then update the mda header immediately?. Could you give me an example?


You need to see  'command'  and 'activation/locking' part as 2 different
entities/processes - which may not have any common data.

Command knows data and does some operation on them.

Locking code then only sees data written on disk (+couple extra bits of passed 
info).

So in cluster one node runs command and different node might be activating
a device purely from written metadata - having no common structure with 
command code.
Now there are 'some' bypass code paths to avoid reread of info if it is a 
single command doing also locking part...

The 'magic' is a 'suspend' operation - which is the ONLY operation that
sees 'committed' & 'pre-commited'  metadata  (lvm2 has 2 slots)
If anything fails in  'pre-commit' -  metadata are dropped
and state remains at 'committed' state.
When pre-commit suspend is successful - then we may commit and resume
now committed metadata.

It's quite complicated state machine with many constrains and obviously still 
with some bugs and tweaks.

Sometime we do miss some bits of information and trying to remaining 
compatible is making it challenging....


>
>>> 5. Feature request: could we take multiple snapshots in a batch, to reduce
>>>      the number of metadata IO operations?
>>
>> Every transaction update here - needs  lvm2 metadata confirmation - i.e.
>> double-commit   lvm2 does not allow to jump by more then 1 transaction here,
>> and the error path also cleans 1 transaction.
>
> How about setting the snapshots with same transaction_id

Yes - that's how it will work - it's in plan....
It's the error path handling that needs some thinking.
First I want to improve check for free space in metadata to be matching
kernel logic more closely..


>> Filters are magic - try to accept only devices which are potential PVs and
>> reject everything else. (by default every device is accepted and scanned...)
>
> One more question: Why the filter cache is disabled when using lvmetad?
> (comments in init_filters(): "... Also avoid it when lvmetad is enabled.")
> Thus LVM needs to check all the devices under /dev when it start.

lvmetad is only "cache" for lvmetad - however we do not 'treat' lvmetad
is trustful source of info for many reason - primarily 'udevd' is toy-tool 
process with many unhandled corner cases - particularly whenever you have
duplicate/dead devices - it's getting useless...

So the purpose is avoid looking for metadata - but whenever we write new 
metadata - we grab protecting locks and need to be sure there are not racing 
commands - this can't be ensure by udev controlled lvmetad with completely 
unpredictable update timing and synchronization
(udev has built-in 30sec timeout for rule processing which might be far too 
small on loaded system...)

In other words - 'lvmetad' is somehow useful for 'lvs', but cannot be trusted 
for lvcreate/lvconvert...


> Alternatively, is there any way to let lvm_cache handles some specific
> devices only, instead of check the entire directory?
> (e.g, allow devices/scan=["/dev/md[0-9]*"], to filter devices at earlier
>   stage. The current strategy is calling dev_cache_add_dir("/dev"),
>   then checking individual devices, which requires a lot of unnecessary
> stat() syscalls)
>
> There's also an undocumented configuration devices/loopfiles. Seems for loop
> loop device files.

Always best opening  RHBZ for such items so they are not lost...

>> Disabling archiving & backup in filesystem (in lvm.conf) may help a lot if
>> you run lots of lvm2 commands and you do not care about archive.
>
> I know there's -An option in lvcreate, but now the system loading and direct IO
> is the main issue.

Direct IO is mostly mandatory - since many caching layers these day may ruin
everything - i.e. using   qemu over SAN - you may get completely unpredicatble
races without directio.
But maybe supporting some 'untrustful' cached write might be usable for
some users... not sure  - but I'd image an lvm.conf option for this.
Just such lvm2 would not be then supportable for customers...
(so we would need to track user has been using such option...)

Regards

Zdenek
