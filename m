Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C52C183D8
	for <linux-lvm@redhat.com>; Sat,  8 Apr 2017 11:56:55 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id 92BBAA327D
	for <linux-lvm@redhat.com>; Sat,  8 Apr 2017 11:56:52 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 08 Apr 2017 13:56:50 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CALm7yL1Qm4xanZ=tbLgC7B7KZ=dzLZtsTJXTd0rsEONxg0nqng@mail.gmail.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<CALm7yL1Qm4xanZ=tbLgC7B7KZ=dzLZtsTJXTd0rsEONxg0nqng@mail.gmail.com>
Message-ID: <3772958ec700a4f7e1b152a97e605e0f@assyoma.it>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Il 08-04-2017 00:24 Mark Mielke ha scritto:
> 
> We use lvmthin in many areas... from Docker's dm-thinp driver, to XFS
> file systems for PostgreSQL or other data that need multiple
> snapshots, including point-in-time backup of certain snapshots. Then,
> multiple sizes. I don't know that we have 8 TB anywhere right this
> second, but we are using it in a variety of ranges from 20 GB to 4 TB.
> 

Very interesting, this is the exact information I hoped to get. Thank 
you for reporting.

> 
> When you say "nightly", my experience is that processes are writing
> data all of the time. If the backup takes 30 minutes to complete, then
> this is 30 minutes of writes that get accumulated, and subsequent
> performance overhead of these writes.
> 
> But, we usually keep multiple hourly snapshots and multiply daily
> snapshots, because we want the option to recover to different points
> in time. With the classic LVM snapshot capability, I believe this is
> essentially non-functional. While it can work with "1 short lived
> snapshot", I don't think it works at all well for "3 hourly + 3 daily
> snapshots".  Remember that each write to an area will require that
> area to be replicated multiple times under classic LVM snapshots,
> before the original write can be completed. Every additional snapshot
> is an additional cost.

Right. For such a setup, classic LVM snapshot overhead would be 
enormous, grinding all to an halt.

> 
>> I more concerned about lenghtly snapshot activation due to a big,
>> linear CoW table that must be read completely...
> 
> I suspect this is a pre-optimization concern, in that you are
> concerned, and you are theorizing about impact, but perhaps you
> haven't measured it yourself, and if you did, you would find there was
> no reason to be concerned. :-)

For classic (non-thinly provided) LVM snapshot, relatively big metadata 
size was a know problem. Many talks happened on this list for this very 
topic. Basically, when the snapshot metadata size increased above a 
certain point (measured in some GB), snapshot activation failed due to 
timeout on LVM commands. This, in turn, was due that legacy snapshot 
behavior was not really tuned for long-lived, multi-gigabyte snapshots, 
rather for create-backup-remove behavior.

> 
> If you absolutely need a contiguous sequence of blocks for your
> drives, because your I/O patterns benefit from this, or because your
> hardware has poor seek performance (such as, perhaps a tape drive? :-)
> ), then classic LVM snapshots would retain this ordering for the live
> copy, and the snapshot could be as short lived as possible to minimize
> overhead to only that time period.
> 
> But, in practice - I think the LVM authors of the thinpool solution
> selected a default block size that would exhibit good behaviour on
> most common storage solutions. You can adjust it, but in most cases I
> think I don't bother, and just use the default. There is also the
> behaviour of the systems in general to take into account in that even
> if you had a purely contiguous sequence of blocks, your file system
> probably allocates files all over the drive anyways. With XFS, I
> believe they do this for concurrency, in that two different kernel
> threads can allocate new files without blocking each other, because
> they schedule the writes to two different areas of the disk, with
> separate inode tables.
> 
> So, I don't believe the contiguous sequence of blocks is normally a
> real thing. Perhaps a security camera that is recording a 1+ TB video
> stream might allocate contiguous, but basically nothing else does
> this.

True.

> 
> To me, LVM thin volumes is the right answer to this problem. It's not
> particularly new or novel either. Most "Enterprise" level storage
> systems have had this capability for many years. At work, we use
> NetApp and they take this to another level with their WAFL =
> Write-Anywhere-File-Layout. For our private cloud solution based upon
> NetApp AFF 8080EX today, we have disk shelves filled with flash
> drives, and NetApp is writing everything "forwards", which extends the
> life of the flash drives, and allows us to keep many snapshots of the
> data. But, it doesn't have to be flash to take advantage of this. We
> also have large NetApp FAS 8080EX or 8060 with all spindles, including
> 3.5" SATA disks. I was very happy to see this type of technology make
> it back into LVM. I think this breathed new life into LVM, and made it
> a practical solution for many new use cases beyond being just a more
> flexible partition manager.
> 
> --
> 
> Mark Mielke <mark.mielke@gmail.com>

Yeah, CoW-enabled filesystem are really cool ;) Too bad BTRFS has very 
low performance when used as VM backing store...

Thank you very much Mark, I really appreciate the information you 
provided.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
