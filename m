Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB71DlAN028955
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 20:13:47 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB71DaGd000926
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 20:13:36 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oB71DZg7010497
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 20:13:35 -0500
Message-ID: <4CFD8A3F.8070403@bmsi.com>
Date: Mon, 06 Dec 2010 20:13:35 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <4CFD6563.70508@free.fr>
In-Reply-To: <4CFD6563.70508@free.fr>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] A hint on a process
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
To: linux-lvm@redhat.com

On 12/06/2010 05:36 PM, Georges Giralt wrote:
> Hello !
> I've a system (now on Ubuntu 9.04, but initially on a Fedora ) set up as
> follow :
> There are two RAID1 software raid arrays (md0 , which is around 100 Mb
> and holding an Ext2 FS for use in booting, md1 occupying the rest of the
> space used as a PV for LVM) made on a couple of old 160 GB disks.
>
> On the LVM VG0 are a lot of LV onto which Ubuntu is installed.
>
> One of the two disks failed. I can't find a 160 GB replacement. Only 320
> Gb for the smallest availlable disk near where I live.
>
> So I plan to move the system to 320 GB disks and, if possible, not
> wasting the 320-160 difference....
> The process I thought about is as follow :
>
> 1) insert one 320 disk in both arrays (after partitioning it correctly,
> 100 Mb for the first partition and the remaining for the second.)
>
> 2) wait for the raid1 to synchronize.
>
> 3) mark the remaining 160 GB disk as failed and remove/replace with
> another 320 GB disk set up as the first.
>
> 4) wait for the arrays to reconstruct/synchronize.
>
> 5) Extend the PV my Volume Group is build on (md1 in this case)
>
> 6) enjoy a beer...
>
> What do you think of my method ? Is it a good one or am I missing
> something ? You will have understood that losing data is not an option ...
> Many thanks in advance for your answers, critics and pointers...
> Regards.
Your method will fail because the raid superblock is at the end of the
partition.

I use and recommend this variation:

1. Replace 160 with 320, allocate 2 partitions to match (or slightly
exceed if geometry requires) the partitions on
the 160.  Synchronize. 

2. Replace the 2nd 160, resynchronize. 

3. Add a 3rd raid1 with the remaining space, and extend the VG with the
additional PV.

If your system can support 3 drives, you can always partition to mirror
everything despite size mismatches.  For example,
step 3 would become:

3a. reinstall the 160 and allocate 2 80g partitions on the 160 (which is
no longer the default boot drive).  Allocate an 80g partition on each
320 to mirror the 2 80g partitions giving md2 and md3.  Mirror the
remaining 80g in each 320 for md4.  Extend the VG with the addition 3 PVs.
