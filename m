Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C62472026983
	for <linux-lvm@redhat.com>; Sun, 16 Feb 2020 15:28:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D6A8800180
	for <linux-lvm@redhat.com>; Sun, 16 Feb 2020 15:28:12 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 16 Feb 2020 16:28:03 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CAJCQCtSqVWu5wTj6=ZHS08SSVuOGJJfvx8xWSPR4qc4YBa9xRw@mail.gmail.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
	<4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
	<b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
	<CAJCQCtSqVWu5wTj6=ZHS08SSVuOGJJfvx8xWSPR4qc4YBa9xRw@mail.gmail.com>
Message-ID: <afb2a8c23dca7c93486aff178aba41cc@assyoma.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Chris Murphy <lists@colorremedies.com>

Il 2020-02-15 21:49 Chris Murphy ha scritto:
> Are you referring to this known problem?
> https://btrfs.wiki.kernel.org/index.php/Gotchas#Block-level_copies_of_devices

Yes.

> By default the snapshot LV isn't active, so the problem doesn't
> happen. I've taken many LVM thinp snapshots of Btrfs file systems,
> including while they're actively being written to, and never run into
> this problem (or any other).

Thin LVM snapshots are not active by default, yes. But you *need* to 
activate them to access their data.
Moreover, classical (non-thin) LVM snapshot are automatically activated 
when taken.

> An LVM snapshot comes with FIFREEZE, and supported filesystems,
> including Btrfs, should have a consistent snapshot created as a
> result. I don't think ZFS supports FIFREEZE/FITHAW and if that's
> correct, you're effectively getting a powerfail/crash type behavior
> with an LVM snapshot of a ZFS file system, entirely trusting on its
> own ability to maintain file system consistency.

True, but the transactional nature of ZFS writes means that a clean 
recovery option should always be available. Anyway, any modern journaled 
filesystem will not corrupt itself on power loss/recovery (async write 
back data will be lost, obviously).

> My dualist opinion on mixing these layers: while it should work, and
> if there's corruption then there's a bug somewhere, adding layers
> increases complexity and thus risk. That's possibly a good idea in a
> testing/qualification context, where you want something sensitive to
> and consistently flags any discrepancy. That's not fragility.

I am not sure about that: one of BTRFS main goal was to not duplicate 
code, relying on standard Linux block device behavior as much as 
possible. For this reason, I tend to think that snapshotting (and using) 
the block device under a BTRFS device should be a supported use case.

But hey - the LVM team is really doing an awesome work!
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it [1]
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
