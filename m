Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0AF7ar03349
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 10:07:36 -0500
Received: from alpha.geneseo.edu (alpha.geneseo.edu [137.238.1.190])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0AF7UKH022955
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 10:07:30 -0500
Received: from [137.238.1.104] (helo=mars.geneseo.edu)
	by alpha.geneseo.edu with esmtp (Exim 4.34) id 1Co18k-0006NY-3h
	for linux-lvm@redhat.com; Mon, 10 Jan 2005 10:07:30 -0500
Received: from mars.geneseo.edu (localhost.localdomain [127.0.0.1])
	by mars.geneseo.edu (8.12.9/8.12.5) with ESMTP id j0AF7QRh003428
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 10:07:26 -0500
Received: from localhost (valites@localhost)
	by mars.geneseo.edu (8.12.9/8.12.9/Submit) with ESMTP id j0AF7PVB003425
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 10:07:25 -0500
Date: Mon, 10 Jan 2005 10:07:25 -0500 (EST)
From: "Mark T. Valites" <valites@geneseo.edu>
Subject: Re: [linux-lvm] Problem Upgrading from LVM1 to LVM2
In-Reply-To: <20050110140452.GS26670@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.44.0501100946370.855-100000@mars.geneseo.edu>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 10 Jan 2005, Alasdair G Kergon wrote:

> On Mon, Jan 10, 2005 at 08:43:24AM -0500, Mark T. Valites wrote:
> >   logical extent (56202) already mapped.
> >   Couldn't fill logical volume maps.
>
> Metadata corruption: eg 2 LV sharing a PE.
> If you forcibly ran LVM1 and LVM2 on the same VG at the same time
> that could lead to this.

Upgrading to LVM2 has been on my to-do list for a while, but I finally got
around to it because I was sick of seeing "Duplicate Volume ID" errors
each time lilo loaded. I made backups of my MBR/partition tables on both
disks and then tried to edit the bytes of the disk representing the Volume
ID, which I quickly discovered were used by LVM1 for metadata and by
changing the bytes that normally held the Volume ID info, I "broke" LVM.

I put the original MBR/partition table back quickly and LVM was happy
again. If I currently boot an LVM1 capable kernel, I can mount the VG fine
and access/manipulate the data on it, so it works in LVM1 now - if the
metadata was in fact corrupted, would LVM still work? I could see how my
mucking around would have (and did) break things, but I put the parts of
disk back and it works correctly now.

> Make sure you're using a recent version of LVM2.

I see 2.00.33 is the most current. I'm using the 2.00.24-1 package
provided in Debian testing - is it worth compiling the latest?

> You'll need to restore your metadata from a backup using vgcfgrestore -
> but first you need to work out which is the correct backup to restore
> from, then use either lvm1 or lvm2 vgcfgrestore depending which format
> that backup is in.

Does this assume I've done a vgcfgbackup previously? Or does LVM keep
copies of this itself (similar to UFS and alternate superblocks?) The
description of the vgcfgrestore from its manpage leads me to think I need
to point it at a previously vgcfgbackup-ed file. While I have backups of
the data, I don't of the vgcfg.

But if my LVM 1 setup is working, I wonder if we even need to think about
the above. Or is it possible to vgcfgbackup from with the working LVM1 and
vgcfgrestore when booted into LVM2? And more importantly, what exaclty
should I backup before making a worse situation for myself?


-- 
Mark T. Valites
Unix Systems Analyst
Computing & Information Technology
SUNY Geneseo
>--))> >--))>
