Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3M8hIDP006179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2016 04:43:18 -0400
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFAC5C062CE5
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2016 08:43:16 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id e185so12985031vkb.2
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2016 01:43:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5718A369.4060103@redhat.com>
References: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
	<5718A369.4060103@redhat.com>
Date: Fri, 22 Apr 2016 16:43:16 +0800
Message-ID: <CAAYit8T-RfgrG9=81ncbAMYfN4GLXafd9TtJ_H8NcGByt99Rqw@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2016-04-21 18:11 GMT+08:00 Alasdair G Kergon <agk@redhat.com>:
> On Thu, Apr 21, 2016 at 12:08:55PM +0800, Ming-Hung Tsai wrote:
>> However, it's hard to achieve that if the PV is busy running IO.
>
> So flush your data in advance of running the snapshot commands so there is only
> minimal data to sync during the snapshot process itself.
>
>> The major overhead is LVM metadata IO.
>
> Are you sure?  That would be unusual.  How many copies of the metadata have you
> chosen to keep?  (metadata/vgmetadatacopies)  How big is this metadata?  (E.g.
> size of /etc/lvm/backup/<vgname> file.)

My configurations:
- Only one PV in a volume group
- A thinpool with several thin volumes
- size of a metadata record is less than 16KB
- lvm.conf:
    metadata/vgmetadatacopies=1
    devices/md_component_detection=0 because it requires disk IO.
                                     Other filters are relatively faster.
    device/global_filter=[ "a/md/", "r/.*/" ]
    backup/retain_days=0 and backup/retain_min=30 so there are at most
30 backups

Despite there's no IO on the target volume to take snapshot, the system is
still doing IO on other volumes, which increases the latency of direct IOs
issued by LVM.

2016-04-21 17:54 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> On 21.4.2016 06:08, Ming-Hung Tsai wrote:
>
> Hmm do you observe taking a snapshot takes more then a second ?
> IMHO the largest portion of time should be the 'disk' synchronization
> when suspending  (full flush and fs sync)
> Unless you have lvm2 metadata in range of MiB (and lvm2 was not designed for
> that) - you should be well bellow a second...
>
> you will save couple
> disk reads - but this will not save your time problem a lot if you have
> overloaded disk I/O system.
> Note lvm2 is using direct I/O which is your trouble maker here I guess...

That's the point. I should not say "LVM metadata IO is the overhead".
LVM just suffered from the system loading, so it cannot finish metadata
direct IOs within seconds. I can try to manage data flushing and filesystem sync
before taking snapshots, but on the other hand, I wish to reduce
the number of IOs issued by LVM.

>
> Changing disk scheduler to deadline ?
> Lowering percentage of dirty-pages ?
>

In my previous testing on kernel 3.12, CFQ+ionice performs better than
deadline in this case, but now it seems that the schedulers for blk-mq are not
yet ready.
I also tried to use cgroup to do IO throttling when taking snapshots.
I can do some more testing.


>> 3. Why LVM uses such complex process to update metadata?
>>
> It's been already simplified once ;) and we have lost quite important
> property of validation of written data during pre-commit -
> which is quite useful when user is running on misconfigured multipath device...
>
> Each state has its logic and with each state we need to be sure data are
> there.
>
> The valid idea might be - to maybe support 'riskier' variant of metadata
> update

I'm not well understand the purpose of pre-commit. Why not write the metadata
then update the mda header immediately?. Could you give me an example?

>> 5. Feature request: could we take multiple snapshots in a batch, to reduce
>>     the number of metadata IO operations?
>
> Every transaction update here - needs  lvm2 metadata confirmation - i.e.
> double-commit   lvm2 does not allow to jump by more then 1 transaction here,
> and the error path also cleans 1 transaction.

How about setting the snapshots with same transaction_id ?

IOCTL sequence:
  LVM commit metadata with queued create_snap messages
  dm-suspend origin0
  dm-message create_snap 3 0
  dm-resume origin0
  dm-suspend origin1
  dm-message create_snap 4 1
  dm-resume origin1
  dm-message set_transaction_id 3 4
  LVM commit metadata with updated transaction_id

Related post: https://www.redhat.com/archives/dm-devel/2016-March/msg00071.html


>> 6. Is there any other way to accelerate LVM operation?
>>
> Reducing number of PVs with metadata in case your VG has lots of PVs
> (may reduce metadata resistance in case PVs with them are lost...)

There's only one PV in my case. For multiple PVs cases, I think I could
temporarily disable metadata writing on some PVs by setting --metadataignore.


> Filters are magic - try to accept only devices which are potential PVs and
> reject everything else. (by default every device is accepted and scanned...)

One more question: Why the filter cache is disabled when using lvmetad?
(comments in init_filters(): "... Also avoid it when lvmetad is enabled.")
Thus LVM needs to check all the devices under /dev when it start.

Alternatively, is there any way to let lvm_cache handles some specific
devices only, instead of check the entire directory?
(e.g, allow devices/scan=["/dev/md[0-9]*"], to filter devices at earlier
 stage. The current strategy is calling dev_cache_add_dir("/dev"),
 then checking individual devices, which requires a lot of unnecessary
stat() syscalls)

There's also an undocumented configuration devices/loopfiles. Seems for loop
loop device files.

> Disabling archiving & backup in filesystem (in lvm.conf) may help a lot if
> you run lots of lvm2 commands and you do not care about archive.

I know there's -An option in lvcreate, but now the system loading and direct IO
is the main issue.


Thanks,
Ming-Hung Tsai
