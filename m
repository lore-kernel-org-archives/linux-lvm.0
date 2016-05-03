References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57287339.7070802@redhat.com>
Date: Tue, 3 May 2016 11:45:29 +0200
MIME-Version: 1.0
In-Reply-To: <CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin handling of available space
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
To: LVM general discussion and development <linux-lvm@redhat.com>, mark.mielke@gmail.com

On 2.5.2016 16:32, Mark Mielke wrote:
>
> On Fri, Apr 29, 2016 at 7:23 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>
>     Thin-provisioning is NOT about providing device to the upper
>     system levels and inform THEM about this lie in-progress.
>     That's complete misunderstanding of the purpose.
>
>
> I think this line of thought is a bit of a strawman.
>
> Thin provisioning is entirely about presenting the upper layer with a logical
> view which does not match the physical view, including the possibility for
> such things as over provisioning. How much of this detail is presented to the
> higher layer is an implementation detail and has nothing to do with "purpose".
> The purpose or objective is to allow volumes that are not fully allocated in
> advance. This is what "thin" means, as compared to "thick".
>
>     If you seek for a filesystem with over-provisioning - look at btrfs, zfs
>     and other variants...
>
>
> I have to say that I am disappointed with this view, particularly if this is a
> view held by Red Hat. To me this represents a misunderstanding of the purpose


Hi

So first - this is  AMAZING deduction you've just shown.

You've cut sentence out of the middle of a thread and used as kind of evidence
that Red Hat is suggesting usage of ZFS, Btrfs  - sorry man - read this thread 
again...

Personally I'd  never use those 2 filesystems as they are to complex for 
recovery. But I've no problem to advice users to try them if that's what fits 
their needs best and they believe into 'all in once logic'
('Hit the wall' is best learning exercise in  Xen case anyway...)


> When a storage provider providers a block device (EMC, NetApp, ...) and a
> snapshot capability, I expect to be able to take snapshots with low overhead.
> The previous LVM model for snapshots was really bad, in that it was not low
> overhead. We use this capability for many purposes including:


This usage is perfectly fine. It's been designed this way from day 1.


> 1) Instantiating test environments or dev environments from a snapshot of
> production, with copy-on-write to allow for very large full-scale environments
> to be constructed quickly and with low overhead. In one of our examples, this
> includes an example where we have about 1 TByte of JIRA and Confluence
> attachments collected over several years. It is exposed over NFS by the NetApp
> device, but in the backend it is a volume. This volume is snapshot and then
> exposed as a different volume with copy-on-write characteristics. The storage
> allocation is monitored, and if it is exceeded, it is known that there will be
> particular behaviour. I believe in our case, the behaviour is that the
> snapshot becomes unusable.


Thin pool does not make a difference between snapshot and origin.
All thin-volumes share the same volume space.

It's up to monitoring application to decide if some snapshots could be erased
to reclaim some space in thin-pool.

Recent tool  thin_ls  is showing info how much data are exclusively held by 
individual thin volumes.

It's major difference compared with old snapshots and it's 'Invalidation' logic.


>
> 2) Frequent snapshots. In many of our use cases, we may take snapshots every
> 15 minutes, every hour, and every day, keeping 3 or more of each. If this
> storage had to be allocated in full, this amounts to at least 10X the storage
> cost. Using snapshots, and understanding the rate of churn, we can use closer
> to 1X or 2X the storage overhead, instead of 10X the storage overhead.


Sure - snapper...  whatever you name.
It's just for admin to maintain space availability in thin-pool.


> 3) Snapshot as a means of achieving a consistent backup at low cost of outage
> or storage overhead. If we "quiesce" the application (flush buffers, put new
> requests on hold, etc.) take the snapshot, and then "resume" the application,
> this can be achieved in a matter of seconds or less. Then, we can mount the
> snapshot at a separate mount point and proceed with a more intensive backup
> process against a particular consistent point-in-time. This can be fast and
> require closer to 1X the storage overhead, instead of 2X the storage overhead.
>
> In all of these cases - we'll buy more storage if we need more storage. But,
> we're not going to use BTRFS or ZFS to provide the above capabilities, just


And where exactly I'd advised to you specifically to switch to those filesystem?

My advice is clearly given to a user who seeks for filesystem COMBINED with 
block layer.


> because this is your opinion on the matter. Storage vendors of reputation and
> market presence sell these capabilities as features, and we pay a lot of money
> to have access to these features.
>
> In the case of LVM... which is really the point of this discussion... LVM is
> not necessarily going to be used or available on a storage appliance. The LVM
> use case, at least for us, is for storage which is thinly provisioned by the
> compute host instead of the backend storage appliance. This includes:
>
> 1) Local disks, particularly included local flash drives that are local to
> achieve higher levels of performance than can normally be achieved with a
> remote storage appliance.
>
> 2) Local file systems, on remote storage appliances, using a protocol such as
> iSCSI to access the backend block device. This might be the case where we need
> better control of the snapshot process, or to abstract the management of the
> snapshots from the backend block device. In our case, we previously use an EMC
> over iSCSI for one of these use cases, and we are switching to NetApp.
> However, instead of embedding NetApp-specific logic into our code, we want to
> use LVM on top of iSCSI, and re-use the LVM thin pool capabilities from the
> host, such that we don't care what storage is used on the backend. The
> management scripts will work the same whether the storage is local (the first
> case above) or not (the case we are looking into now).
>
> In both of these cases, we have a need to take snapshots and manage them
> locally on the host, instead of managing them on a storage appliance. In both
> cases, we want to take many light weight snapshots of the block device. You
> could argue that we should use BTRFS or ZFS, but you should full well know
> that both of these have caveats as well. We want to use XFS or EXT4 as our
> needs require, and still have the ability to take light-weight snapshots.


Which is exactly actual Red Hat strategy. XFS is strongly pushed forward.


> Generally, I've seen the people who argue that thin provisioning is a "lie",
> tend to not be talking about snapshots. I have a sense that you are talking
> more as storage providers for customers, and talking more about thinly
> provisioning content for your customers. In this case - I think I would agree
> that it is a "lie" if you don't make sure to have the storage by the time it


Thin-provisioning simply requires  RESPONSIBLE admins - if you are not willing 
to take care about your thin-pools - don't use them - lots of kitten may die 
and that's all what this thread was about  -  it had absolutely nothing to do 
with Red Hat and any of your conspiracy theories like it would be pushing you 
to switch to a filesystem you don't like...


>     Device target is definitely not here to solve  filesystem troubles.
>     Thinp is about 'promising' - you as admin promised you will provide
>     space -  we could here discuss maybe that LVM may possibly maintain
>     max growth size we can promise to user - meanwhile - it's still the admin
>     who creates thin-volume and gets WARNING if VG is not big enough when all
>     thin volumes would be fully provisioned.
>     And  THAT'S IT - nothing more.
>     So please avoid making thinp target to be answer to ultimate question of
>     life, the universe, and everything - as we all know  it's 42...
>
>
> The WARNING is a cover-your-ass type warning that is showing up
> inappropriately for us. It is warning me something that I should already know,
> and it is training me to ignore warnings. Thinp doesn't have to be the answer
> to everything. It does, however, need to provide a block device visible to the
> file system layer, and it isn't invalid for the file system layer to be able
> to query about the nature of the block device, such as "how much space do you
> *really* have left?"


This is not so useful information - as this state is dynamic.
The only 'valid' query is -  are we out-of-space...
And that's what you get from block layer now  - ENOSPC.
Filesystems may have different reaction then to plain EIO.


I'd be really curious what would be the use case of this information even ?

If you care about i.e. 'df' - then let's fix  'df'  - it may check fs is 
thinly provisioned volume and may ask provisioner about free space in pool and 
combine result in some way...
Just DO NOT mix this with filesystem layer...

What would the filesystem do with this info ?

Should this randomly decide to drop files according to thin-pool workload ?

Would you change every filesystem in kernel to implement such policies ?

It's really the thin-pool monitoring which tries to add some space when it's 
getting low and may implement further policies to i.e. drop some snapshots.

However what is being implemented is better 'allocation' logic for pool chunk 
provisioning (for XFS ATM)  - as rather 'dated' methods for deciding where to 
store incoming data do not apply with provisioned chunks efficiently.


> This seems to be a crux of this debate between you and the other people. You
> think the block storage should be as transparent as possible, as if the
> storage was not thin. Others, including me, think that this theory is
> impractical, as it leads to edge cases where the file system could choose to


It's purely practical and it's the 'crucial' difference between

i.e. thin+XFS/ext4     and   BTRFS.


> fail in a cleaner way, but it gets too far today leading to a more dangerous
> failure when it allocates some block, but not some other block.


The best thing to do is to stop immediately on error and do 'read-only' fs -
what is exactly  'ext4 + remount-ro'

Your proposal to make  XFS a different kind of BTRFS monster is simply not 
going to work -  that's exactly what BTRFS is doing - waste of time to do it 
again.

BTRFS has built-in volume manager and combines fs layer with block layer
(making many layers in kernel quite ugly - i.e. device major:minor)

This is different logic lvm2 takse - where layers are separated with clearly 
defined logic.

So again - if you don't like separate thin block layer + XFS fs layer and you 
want to see 'merged' technology - there is BTRFS/ZFS/.... which tries to 
combine raid/caching/encryption/snapshot... - but there are no plans to 
'reinvent' the same from the other side with lvm2/dm....


> Exaggerating this to say that thinp would become everything, and the answer to
> the ultimate question of life, weakens your point to me, as it means that you
> are seeing things in far too black + white, whereas real life is often not
> black + white.


Yes we prefer clearly defined borders and responsibilities which could be well 
tested and verified..

Don't compare life with software :)


>
> It is your opinion that extending thin volumes to allow the file system to
> have more information is breaking some fundamental law. But, in practice, this
> sort of thing is done all of the time. "Size", "Read only", "Discard/Trim
> Support", "Physical vs Logical Sector Size", ... are all information queried
> from the device, and used by the file system. If it is a general concept that
> applies to many different device targets, and it will help the file system
> make better and smarter choices, why *shouldn't* it be communicated? Who
> decides which ones are valid and which ones are not?


lvm2 is  logical volume manager. Just think about it.

In future your thinLV might be turned  into plain  'linear' LV as well as your 
linearLV would become a member of thin-pool  (planned features).

Your LV could be pvmove(ed) to completely different drive with different 
geometry...

These are topics for lvm2/dm.

We are not designing filesystem - and we do plan to stay transparent for them.

And it's up to you to understand the reasoning.


> I didn't disagree with all of your points. But, enough of them seemed to be
> directly contradicting my perspective on the matter that I felt it important
> to respond to them.


It is an Open Souce World - "so send a patch" and implement your visions - 
again it is that easy - we do it every day in Red Hat...


> Mostly, I think everybody has a set of opinions and use cases in mind when
> they come to their conclusions. Please don't ignore mine. If there is
> something unreasonable above, please let me know.


It's not about ignoring - it's about having certain amount of man-hours for 
work and you have to chose how to 'spend' them.

And in this case and your ideas you will need to spend/invest your time....
(Just like Xen).


Regards

Zdenek
