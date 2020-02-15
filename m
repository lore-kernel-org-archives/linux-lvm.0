Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258272166B2A
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 20:50:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82AD78002C4
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 20:50:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t3so15059539wru.7
	for <linux-lvm@redhat.com>; Sat, 15 Feb 2020 12:50:15 -0800 (PST)
MIME-Version: 1.0
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
	<4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
	<b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
In-Reply-To: <b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
From: Chris Murphy <lists@colorremedies.com>
Date: Sat, 15 Feb 2020 13:49:58 -0700
Message-ID: <CAJCQCtSqVWu5wTj6=ZHS08SSVuOGJJfvx8xWSPR4qc4YBa9xRw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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

On Sat, Feb 15, 2020 at 12:22 PM Gionatan Danti <g.danti@assyoma.it> wrote:
>
> Il 2020-02-15 13:40 Zdenek Kabelac ha scritto:
> > It's worth to note lvm2 is solving way more issues then other similar
> > device technology (i.e. mdraid, btrfs....) where it's very simple to
> > cause big confusion and data corruptions (even unnoticed) once
> > duplicates appears in your system...
> >
> > Zdenek
>
> I never duplicate devices with mdraid, but BTRFS is so fragile that
> taking a simple LVM snapshot of a BTRFS component device can lead to
> data corruption.
>
> I really think the gold standard here is ZFS.

Are you referring to this known problem?
https://btrfs.wiki.kernel.org/index.php/Gotchas#Block-level_copies_of_devices

By default the snapshot LV isn't active, so the problem doesn't
happen. I've taken many LVM thinp snapshots of Btrfs file systems,
including while they're actively being written to, and never run into
this problem (or any other).

An LVM snapshot comes with FIFREEZE, and supported filesystems,
including Btrfs, should have a consistent snapshot created as a
result. I don't think ZFS supports FIFREEZE/FITHAW and if that's
correct, you're effectively getting a powerfail/crash type behavior
with an LVM snapshot of a ZFS file system, entirely trusting on its
own ability to maintain file system consistency.

My dualist opinion on mixing these layers: while it should work, and
if there's corruption then there's a bug somewhere, adding layers
increases complexity and thus risk. That's possibly a good idea in a
testing/qualification context, where you want something sensitive to
and consistently flags any discrepancy. That's not fragility.

-- 
Chris Murphy
