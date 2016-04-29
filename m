Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TBNEEZ015201
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 07:23:14 -0400
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57234421.5040902@redhat.com>
Date: Fri, 29 Apr 2016 13:23:13 +0200
MIME-Version: 1.0
In-Reply-To: <445afc4b9ae3fbf477f8f66db9d28580@dds.nl>
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
To: linux-lvm@redhat.com

On 28.4.2016 20:25, Xen wrote:
> Continuing from previous mail I guess. But I realized something.
>
>> A responsible sysadmin who chose to use thin pools might configure the
>> initial FS size to be some modest size well within the constraints of
>> the actual block store, and then as the FS hit say 85% utilization to
>> run a script that investigated the state of the block layer and use
>> resize2fs and friends to grow the FS and let the thin-pool likewise grow
>> to fit as IO gets issued. But at some point when the competing demands
>> of other FS on thin-pool were set to breach actual block availability
>> the FS growth would be denied and thus userland would get signaled by
>> the FS layer that it's out of space when it hit 100% util.
>
> Well of course what you describe here are increasingly complex strategies
> that require development and should not be put on invidual administrators
> (or even organisations) to devise and come up with.
>
> Growing filesystems? If you have a platform where continous thin pool
> growth is possible (and we are talking of well developed, complex setups
> here) then maybe you have in-house tools to take care of all of that.
>
> So you suggest a strategy here that involves both intelligent automatic
> administration of the FS layer as well as the block layer.
>
> A concerted strategy where for example you do have a defined thin volume
> size but you constrain your FS artificially AND depend its intelligence on
> knowledge of your thin pool size. And then you have created an
> intelligence where the "filesystem agent" can request growth, and perhaps
> the "block level agent" may grant or deny it such that FS growth is staged
> and given hard limits at every point. And then you have the same
> functionality as what I described other than that it is more sanely
> constructed at intervals.
>
> No continuous updating, but staged growth intervals or moments.

I'm not going to add much to this thread - since there is nothing really 
useful for devel.  But let me strike out few important moments:


Thin-provisioning is NOT about providing device to the upper
system levels and inform THEM about this lie in-progress.

That's complete misunderstanding of the purpose.

If you seek for a filesystem with over-provisioning - look at btrfs, zfs and 
other variants...

Device target is definitely not here to solve  filesystem troubles.
Thinp is about 'promising' - you as admin promised you will provide
space -  we could here discuss maybe that LVM may possibly maintain
max growth size we can promise to user - meanwhile - it's still the admin
who creates thin-volume and gets WARNING if VG is not big enough when all thin 
volumes would be fully provisioned.

And  THAT'S IT - nothing more.

So please avoid making thinp target to be answer to ultimate question of life, 
the universe, and everything - as we all know  it's 42...

>
>> But either way if you have a sudden burst of I/O from competing
>> interests in the thin-pool, what appeared to be a safe growth allocation
>> at one instant of time is not likely to be true when actual writes try
>> to get fulfilled.
>
> So in the end monitoring is important but because you use a thin pool
> there are like 3 classes of situations that change:
>
> * Filesystems will generally have more leeway because you are /able/ to
> provide them with more (virtual) space to begin with, in the assumption
> that you won't readily need it, but it's normally going to be there when
> it does.

So you try to design  'another btrfs' on top of thin provisioning?

> * Thin volumes do allow you to make better use of the available space (as
> per btrfs, I guess) and give many advantages in moving data around.


With 'thinp' you  want simplest  filesystem with robust metadata -  so in 
theory  -  'ext4' or  XFS without all 'improvements for rotational hdd that 
has accumulated over decades of their evolution.

> 1. Unless you monitor it directly in some way, the lack of information is
> going to make you feel rather annoyed and insecure
>
> 2. Normally user tools do inform you of system status (a user-run "ls" or
> "df" is enough) but you cannot have lvs information unless run as root.

You miss the 'key' details.

Thin pool is not constructing  'free-maps'  for each LV all the time - that's 
why tools like  'thin_ls'  are meant to be used from the user-space.
It IS very EXPENSIVE operation.

So before you start to present your visions here, please spend some time with 
reading doc and understanding all the technology behind it.


> Even with a perfect LVM monitoring tool, I would experience a consistent
> lack of feedback.

Mistake of your expectations

If you are trying to operate  thin-pool near 100% fullness - you will need to 
write and design completely different piece of software - sorry thinp
is not for you and never will...

Simply use 'fully' provisioned - aka - already existing standard volumes.

>
> Just a simple example: I can adjust "df" to do different stuff. But any
> program reporting free diskspace is going to "lie" to me in that sense. So
> yes I've chosen to use thin LVM because it is the best solution for me
> right now.

'df'  has nothing in common with  'block' layer.


> Technically I consider autoextend not that great of a solution either.
>
> It begs the question: why did you not start out with a larger volume in
> the first place? You going to keep adding disks as the thing grows?

Very simple answer and related of to misunderstanding of the purpose.

Take it as motivation like you want to reduce amount of active device in your 
i.e. 'datacenter'.

So you start with 1TB volume - while the user may immediately create and 
format and use i.e. 10TB volume.   As the volume fill over the time - you add 
more devices to your vg (buy/pay for more disk space/energy).
But user doesn't have to resize his filesystem or have other costs with 
maintenance of slowly growing filesystem.

Of course if the first thing user will do is to i.e.  'dd'  full 10TB volume 
the are not going to be any savings!

But if you've never planned to buy 10TB - you should have never allow to 
create such big volume in the first place!

With thinp  you basically postpone or skip (fsresize) some operations.

> An overprovisioned system with individual volumes that individually cannot
> reach their max size is a bad system.

Yes - it is bad system.

So don't do it - and don't plan to use it - it's really that simple.

ThinP is NOT virtual disk-space for free...

> Thin pools lie. Yes. But it's not a lie of the space is available. It's
> only a lie if the space is no longer available!!!!!!!.
>
> It is not designed to lie.

Actually it's the core principle!
It lies (or better say uses admin's promises) that there is going to be a disk 
space. And it's admin responsibility to fulfill it.

If you know in front you will need quickly all the disk space - then using 
thinp and expecting miracle is not going to work.


Regards

Zdenek
