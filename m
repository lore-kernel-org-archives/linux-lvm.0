References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
Date: Tue, 12 Sep 2017 13:01:13 +0200
MIME-Version: 1.0
In-Reply-To: <872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 11.9.2017 v 23:59 Gionatan Danti napsal(a):
> Il 11-09-2017 12:35 Zdenek Kabelac ha scritto:
>> The first question here is - why do you want to use thin-provisioning ?
> 
> Because classic LVM snapshot behavior (slow write speed and linear performance 
> decrease as snapshot count increases) make them useful for nightly backups only.
> 
> On the other side, the very fast CoW thinp's behavior mean very usable and 
> frequent snapshots (which are very useful to recover from user errors).
> 

There is very good reason why thinLV is fast - when you work with thinLV -
you work only with data-set for single thin LV.

So you write to thinLV and either you modify existing exclusively owned chunk
or you duplicate and provision new one.   Single thinLV does not care about
other thin volume - this is very important to think about and it's important 
for reasonable performance and memory and cpu resources usage.

>> As thin-provisioning is about 'promising the space you can deliver
>> later when needed'� - it's not about hidden magic to make the space
>> out-of-nowhere.
> 
> I fully agree. In fact, I was asking about how to reserve space to *protect* 
> critical thin volumes from "liberal" resource use by less important volumes. 

I think you need to think 'wider'.

You do not need to use a single thin-pool - you can have numerous thin-pools,
and for each one you can maintain separate thresholds (for now in your own
scripting - but doable with today's  lvm2)

Why would you want to place 'critical' volume into the same pool
as some non-critical one ??

It's simply way easier to have critical volumes in different thin-pool
where you might not even use over-provisioning.


> I do *not* want to run at 100% data usage. Actually, I want to avoid it 
> entirely by setting a reserved space which cannot be used for things as 
> snapshot. In other words, I would very like to see a snapshot to fail rather 
> than its volume becoming unavailable *and* corrupted.

Seems to me - everyone here looks for a solution where thin-pool is used till 
the very last chunk in thin-pool is allocated - then some magical AI step in,
decides smartly which  'other already allocated chunk' can be trashed
(possibly the one with minimal impact  :)) - and whole think will continue
run in full speed ;)

Sad/bad news here - it's not going to work this way....

> In ZFS words, there are object called ZVOLs - ZFS volumes/block devices, which 
> can either be "fully-preallocated" or "sparse".
>
> By default, they are "fully-preallocated": their entire nominal space is 
> reseved and subtracted from the ZPOOL total capacity. Please note that this 

Fully-preallocated - sounds like thin-pool without overprovisioning to me...


> # Snapshot creating - please see that, as REFER is very low (I did write 
> nothig on the volume), snapshot creating is allowed

lvm2 also DOES protect you from creation of new thin-pool when the fullness
is about lvm.conf defined threshold - so nothing really new here...


> [root@blackhole ~]# zfs destroy tank/vol1@snap1
> [root@blackhole ~]# dd if=/dev/zero of=/dev/zvol/tank/vol1 bs=1M count=500 
> oflag=direct
> 500+0 records in
> 500+0 records out
> 524288000 bytes (524 MB) copied, 12.7038 s, 41.3 MB/s
> [root@blackhole ~]# zfs list -t all
> NAME������� USED� AVAIL� REFER� MOUNTPOINT
> tank������� 622M�� 258M��� 96K� /tank
> tank/vol1�� 621M�� 378M�� 501M� -
> 
> # Snapshot creation now FAILS!

ZFS is filesystem.

So let's repeat again :) amount of problems inside a single filesystem is not 
comparable with block-device layer - it's entirely different world of problems.

You can't really expect filesystem 'smartness' on block-layer.

That's the reason why we can see all those developers boldly stepping into the 
'dark waters' of  mixed filesystem & block layers.

lvm2/dm trusts in different concept - it's possibly less efficient,
but possibly way more secure - where you have different layers,
and each layer could be replaced and is maintained separately.

> The above surely is safe behavior: when free, unused space is too low to 
> guarantee the reserved space, snapshot creation is disallowed.


ATM thin-pool cannot somehow auto-magically 'drop'  snapshots on its own.

And that's the reason why we have those monitoring features provided with 
dmeventd.   Where you monitor  occupancy of thin-pool and when the
fullness goes above defined threshold  - some 'action' needs to happen.

It's really up-to admin to decide if it's more important to make some
free space for existing user writing his 10th copy of 16GB movie :) or erase
some snapshot with some important company work ;)

Just don't expect it will be some magical AI built-in into thin-pool to do 
such decision :)

User already has ALL the power to do this work - the main condition here is - 
this happens much earlier then your thin-pool gets exhausted!

It's really pointless trying to solve this issue after you are already 
out-of-space...

> Now leave ZWORLD, and back to thinp: it would be *really* cool to provide the 
> same sort of functionality. Sure, you had to track space usage both at pool 
> and a volume level - but the safety increase would be massive. There is an big 
> difference between a corrupted main volume and a failed snapshot: while the 
> latter can be resolved without too much concert, the former (volume 
> corruption) really is a scary thing.

AFAIK current kernel (4.13) with thinp & ext4 used with remount-ro on error 
and lvm2 is safe to use in case of emergency - so surely you can lose some 
uncommited data but after reboot and some extra free space made in thin-pool 
you should have consistent filesystem without any damage after fsck.

There are not known simple bugs in this case - like system crashing on dm 
related OOPS (like Xen seems to suggest... - we need to see his bug report...)

However - when thin-pool gets full - the reboot and filesystem check is 
basically mandatory  -  there is no support  (and no plan to start support 
randomly dropping allocated chunks from other thin-volumes to make space for 
your running one)

> Thin volumes are really cool (and fast!), but they can fail deadly. A 

I'd like to still see what you think is  'deadly'

And also I'd like to be explained what better thin-pool can do in terms
of block device layer.

As said in past - if you would modify filesystem to start to reallocate its 
metadata and data to provisioned space - so FS would be AWARE which blocks
are provisioned or uniquely owned... and start working with 'provisioned' 
volume differently  - that would be a very different story - it essentially 
means you would need to write quite new filesystem, since  extX not xfs is not 
really perfect match....

So all I'm saying here is - 'thin-pool' on block layer is doing 'mostly' its 
best to avoid losing user's committed!  data - but of course  if 'admin' has 
failed to fulfill his promise  and add more space to overprovisioned 
thin-pool, something not-nice will happen to the system -  and there is no way 
thin-pool on its own may resolve it  - it should have been resolved much much 
sooner with monitoring via dmeventd   - that's the place you should focus on 
implementing smart way how to protect you system going ballistic....


Regards

Zdenek
