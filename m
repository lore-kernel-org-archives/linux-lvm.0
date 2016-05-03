References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
	<57287339.7070802@redhat.com>
	<CALm7yL3K6pXi4-1cwtW2dVra9SR1FPBzy9sqVLWjLC8Qf=Hi2Q@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <572888FC.4010305@redhat.com>
Date: Tue, 3 May 2016 13:18:20 +0200
MIME-Version: 1.0
In-Reply-To: <CALm7yL3K6pXi4-1cwtW2dVra9SR1FPBzy9sqVLWjLC8Qf=Hi2Q@mail.gmail.com>
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
To: Mark Mielke <mark.mielke@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 3.5.2016 12:41, Mark Mielke wrote:
> On Tue, May 3, 2016 at 5:45 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>
>     On 2.5.2016 16:32, Mark Mielke wrote:
>
>              If you seek for a filesystem with over-provisioning - look at
>         btrfs, zfs
>              and other variants...
>
>         I have to say that I am disappointed with this view, particularly if
>         this is a
>         view held by Red Hat. To me this represents a misunderstanding of the
>         purpose
>
>
>     So first - this is  AMAZING deduction you've just shown.
>
>     You've cut sentence out of the middle of a thread and used as kind of evidence
>     that Red Hat is suggesting usage of ZFS, Btrfs  - sorry man - read this
>     thread again...
>
>
> My intent wasn't to cut a sentence in the middle. I responded to the each
> sentence in its place. I think it really comes down to this:
>
>         This seems to be a crux of this debate between you and the other
>         people. You
>         think the block storage should be as transparent as possible, as if the
>         storage was not thin. Others, including me, think that this theory is
>         impractical, as it leads to edge cases where the file system could
>         choose to
>
>
>     It's purely practical and it's the 'crucial' difference between
>
>     i.e. thin+XFS/ext4     and   BTRFS.
>
>
>
> I think I captured the crux of this pretty well. If anybody suggests that
> there could be value to exposing any information related to the nature of the
> "thinly provisioned block devices", you suggest that the only route forwards
> here is BTRFS and ZFS. You are saying directly and indirectly, that anybody
> who disagrees with you should switch to what you feel are the only solutions
> that are in this space, and that LVM should never be in this space.
>
> I think I understand your perspective. However, I don't agree with it. I don't

The perspective of lvm2 team is pretty simple as a small team there is 
absolutely no time to venture into this road-path.

Also technically you are crying on the wrong grave/barking up the wrong tree.

Try to push you visions to some filesystem developers.

> agree that the best solution is one that fails at the last instant with ENOSPC
> and/or for the file system to become read-only. I think there is a whole lot
> of grey possibilities between the polar extremes of "BTRFS/ZFS" vs
> "thin+XFS/ext4 with last instant failure".

The other point is technical difficulties are very high and you are really 
asking for Btrfs logic, you just fail to admit this to yourself.

It's been the 'core' idea of Btrfs to combine volume management and filesystem 
together for a better future...


> What started me on this list was the CYA mandatory warning about over
> provisioning that I think is inappropriate, and causing us tooling problems.
> But seeing the debate unfold, and having seen some related failures in the
> Docker LVM thin pool case where the system may completely lock up, I have a
> conclusion that this type of failure represents a fundamental difference in
> opinion around what thin volumes are for, and what place they have. As I see
> them as highly valuable for various reasons including Docker image layers
> (something Red Hat appears to agree with, having targeted LVM thinp instead of


As you mention Docker - again I've no idea why do you think there is 'one-way' 
path ?

Red Hat is not political party with a single leading direction.

Many variant are being implemented in parallel (yes even in Red Hat) and the 
best one will win over the time - but there is no single 'directive' decision. 
It really is the open source way.


> the union file systems), and the snapshot use cases I presented prior, I think
> there must be a way to avoid the worst scenarios, if the right people consider
> all the options, and don't write off options prematurely due to preconceived
> notions about what is and what is not appropriate in terms of communication of
> information between system layers.
>
> There are many types of information that *are* passed from the block device
> layer to the file system layer. I don't see why awareness of thin volumes,
> should not be one of them.
>


Find a use-case, build a patch, show results and add info what the filesystem 
shall be doing when the filesystem underlying device changes its characteristic.

There is an API between block-layer and fs-layer - so propose extension
with a patch for a filesystem with clearly defined benefit.

That's my best advice.


> communicating this to the volume layer. The naive approach here might be to
> preallocate these critical blocks before proceeding with any updates to these
> blocks, such that the failure situations can all be "safe" situations, where
> ENOSPC can be returned without a danger of the file system locking up or going
> read-only.
>
> Or, maybe I am out of my depth, and this is crazy talk... :-)


Basically you are not realizing how much work is behind all those simple 
sentences.   At this moment there is 'fallocate' being in discussion...
But it's most or less 'nuclear weapon' for thin provisioning.


>
> (Personally, I'm not really needing a "df" to approximate available storage...
> I just don't want the system to fail badly in the "out of disk space"
> scenario... I can't speak for others, though... I do *not* want BTRFS/ZFS... I
> just want a sanely behaving LVM + XFS...)

Yes - that's what we try to improve  daily.


Regards

Zdenek
