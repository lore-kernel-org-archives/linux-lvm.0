Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F3C308BDB4
	for <linux-lvm@redhat.com>; Thu,  2 Aug 2018 17:42:20 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFE3C307D86A
	for <linux-lvm@redhat.com>; Thu,  2 Aug 2018 17:42:18 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q127-v6so2632986ljq.11
	for <linux-lvm@redhat.com>; Thu, 02 Aug 2018 10:42:18 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
In-Reply-To: <CAJCQCtS4iWKOybMmoVjHSbO2d3PSsZxHsb9hf-V1Fh0s2gxGkg@mail.gmail.com>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
	<CAJCQCtSmBF68LbvCF=qNT5hePaYFOcF7=jB8=MERXBvA-FUMhQ@mail.gmail.com>
	<23393.3545.410050.534764@quad.stoffel.home>
	<CAJCQCtS4iWKOybMmoVjHSbO2d3PSsZxHsb9hf-V1Fh0s2gxGkg@mail.gmail.com>
From: Chris Murphy <lists@colorremedies.com>
Date: Thu, 2 Aug 2018 11:42:16 -0600
Message-ID: <CAJCQCtToiKTnP851uG2gTyxdnbUc6g_6RHjKr8wABqhOBzN_XQ@mail.gmail.com>
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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

On Tue, Jul 31, 2018 at 8:43 PM, Chris Murphy <lists@colorremedies.com> wrote:
> On Tue, Jul 31, 2018 at 7:33 PM, John Stoffel <john@stoffel.org> wrote:
>>>>>>> "Chris" == Chris Murphy <lists@colorremedies.com> writes:
>>
>> Chris> On Fri, Jul 27, 2018 at 1:31 PM, John Stoffel <john@stoffel.org> wrote:
>>>>
>>>> Why don't you run quotas on your filesystems?  Also, none of the
>>>> filesystems in Linux land that I'm aware of supports shrinking the
>>>> filesystem while live, it's all a unmount, shrink FS, shrink volume
>>>> (carefully!) and then re-mount the filesystem.
>>
>> Chris> Btrfs supports grow and shrink resizes only when mounted. It's
>> Chris> not possible to resize when unmounted.
>>
>> That's... bizarre.  Good to know, but bizarre.  That does make it more
>> appealing to use in day to day situations for sure.  Any thoughts on
>> how stable this is in real life?
>
> I've never heard of it failing in many years of being on the Btrfs
> list. The resize leverages the same block group handling as balance
> code, so the relocation of block groups during resize is the same as
> you'd get with a filtered balance, it's integral to the file system's
> operation.
>
> The shrink operation first moves block groups in the region subject to
> shrink (the part that's going away), and this is an atomic operation
> per block group. You could pull the plug on it (and I have) in
> progress and you'd just get a reversion to a prior state before the
> last file system metadata and superblock commit (assumes the hardware
> isn't lying and some hardware does lie). Once all the block groups are
> moved, and the dev and chunk trees are updated to reflect the new
> location of those chunks (block groups), the superblocks are updated
> to reflect the new device size.
>
> Literally the shrink operation changes very little metadata, it's just
> moving block groups, and then the actual "resize" is merely a
> superblock change. The file system metadata doesn't change much
> because Btrfs uses an internal logical block addressing to reference
> file extents and those references stay the same during a resize. The
> logical block range mapping to physical block range mapping is a tiny
> update (maybe 1/2 dozen 16K leaf and node writes) and those updates
> are always COW, not overwrites. That's also how this is an atomic
> operation. If the block group copy fails, the dev and chunk trees that
> are used to translate between logical and physical block ranges never
> get updated.
>
>
> --
> Chris Murphy

Also, fs resize always happens when doing device add or device remove.
So resize is integral for Btrfs multiple device support. Device add
and remove can likewise only be done while the file system is mounted.
Removing a device means migrating block groups off that device,
shrinking the file system by an amount identical to the device size,
updating superblocks on remaining devices, and wiping the Btrfs
signature on the removed device. And there are similar behaviors when
converting block group profiles: e.g. from single to raid1, single to
DUP, DUP to single, raid5 to raid6 or vice versa and so on.
Conversions are only possible while the file system is mounted.

LVM pvmove isn't entirely different in concept. The LVM extents are
smaller (4MB by default) than Btrfs block groups (dynamically variable
in size but most typically they are 1GiB for data bg's and 256MB for
metadata bg's, and 32MB for system bg's. Btrfs block groups are
collections of extents.). But basically the file system just keeps on
reading and writing to its usual LBA's which are abstracted and
translated into real physical LBA's and a device by LVM. I don't know
how atomic pvmove is without the --atomic flag, and what the chances
of resuming pvmove in case of crash or an urgent reboot is.

The gotcha with ext4 and XFS is they put filesystem metadata in fixed
locations on a block device, so those all have to be relocated to new
fixed positions based on the new block device size as well as data.
The shrink operation is probably sufficiently complicated for ext234
that they just don't want concurrent read/write operations happening
while shrinking. And also the resize introduces inherent inefficiency
with subsequent operation. The greater the difference between mkfs
volume size and the resized size, the greater the inefficiency. That
applies to both ext4 and XFS whether shrink or grow, of course XFS
doesn't have shrink at all, the expectation for its more sophisticated
environment use cases was that it would only ever be grown.

Whereas Btrfs has no fixed locations for any of its block groups, so
from its perspective a resize is just not that unique of an operation,
leveraging code that's regularly exercised in normal operation anyway.
And it also doesn't suffer from any resize inefficiencies either; in
fact depending on the operation it might become more efficient.

Anyway, probably a better way of handling shrink with ext4 and XFS is
having them on LVM thin volumes, and just using fstrim to remove
unused LVM extents from the LV, releasing them back to the pool for
use by any other LV in that pool. It's not exactly the same thing as a
shrink of course, but if the idea is to let a file system use the
unused but "reserved" space of a second file system, merely trimming
the second file system on a thin LV does achieve that. Bigger issue
here is you can't then shrink the pool, so you can still get stuck in
some circumstances.

-- 
Chris Murphy
