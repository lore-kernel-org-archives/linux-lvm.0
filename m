Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CC92010CA4
	for <linux-lvm@redhat.com>; Wed,  1 Aug 2018 02:43:42 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5323E3082A32
	for <linux-lvm@redhat.com>; Wed,  1 Aug 2018 02:43:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id f18-v6so12201909lfc.2
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2018 19:43:41 -0700 (PDT)
MIME-Version: 1.0
Sender: chris@colorremedies.com
In-Reply-To: <23393.3545.410050.534764@quad.stoffel.home>
References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<23387.29464.233937.89557@quad.stoffel.home>
	<CAJCQCtSmBF68LbvCF=qNT5hePaYFOcF7=jB8=MERXBvA-FUMhQ@mail.gmail.com>
	<23393.3545.410050.534764@quad.stoffel.home>
From: Chris Murphy <lists@colorremedies.com>
Date: Tue, 31 Jul 2018 20:43:38 -0600
Message-ID: <CAJCQCtS4iWKOybMmoVjHSbO2d3PSsZxHsb9hf-V1Fh0s2gxGkg@mail.gmail.com>
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

On Tue, Jul 31, 2018 at 7:33 PM, John Stoffel <john@stoffel.org> wrote:
>>>>>> "Chris" == Chris Murphy <lists@colorremedies.com> writes:
>
> Chris> On Fri, Jul 27, 2018 at 1:31 PM, John Stoffel <john@stoffel.org> wrote:
>>>
>>> Why don't you run quotas on your filesystems?  Also, none of the
>>> filesystems in Linux land that I'm aware of supports shrinking the
>>> filesystem while live, it's all a unmount, shrink FS, shrink volume
>>> (carefully!) and then re-mount the filesystem.
>
> Chris> Btrfs supports grow and shrink resizes only when mounted. It's
> Chris> not possible to resize when unmounted.
>
> That's... bizarre.  Good to know, but bizarre.  That does make it more
> appealing to use in day to day situations for sure.  Any thoughts on
> how stable this is in real life?

I've never heard of it failing in many years of being on the Btrfs
list. The resize leverages the same block group handling as balance
code, so the relocation of block groups during resize is the same as
you'd get with a filtered balance, it's integral to the file system's
operation.

The shrink operation first moves block groups in the region subject to
shrink (the part that's going away), and this is an atomic operation
per block group. You could pull the plug on it (and I have) in
progress and you'd just get a reversion to a prior state before the
last file system metadata and superblock commit (assumes the hardware
isn't lying and some hardware does lie). Once all the block groups are
moved, and the dev and chunk trees are updated to reflect the new
location of those chunks (block groups), the superblocks are updated
to reflect the new device size.

Literally the shrink operation changes very little metadata, it's just
moving block groups, and then the actual "resize" is merely a
superblock change. The file system metadata doesn't change much
because Btrfs uses an internal logical block addressing to reference
file extents and those references stay the same during a resize. The
logical block range mapping to physical block range mapping is a tiny
update (maybe 1/2 dozen 16K leaf and node writes) and those updates
are always COW, not overwrites. That's also how this is an atomic
operation. If the block group copy fails, the dev and chunk trees that
are used to translate between logical and physical block ranges never
get updated.


-- 
Chris Murphy
