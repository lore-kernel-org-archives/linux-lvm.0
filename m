Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9NHDwsZ014004
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 13:13:58 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9NHDtoC008586
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 13:13:55 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id k9NHDnCG031441
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 13:13:49 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k9NHDljK294618
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 11:13:48 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k9NHDlYK005324
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 11:13:47 -0600
From: Dave Kleikamp <shaggy@austin.ibm.com>
In-Reply-To: <Pine.LNX.4.62.0610231805010.18913@office2.c1.internal>
References: <Pine.LNX.4.62.0610231805010.18913@office2.c1.internal>
Date: Mon, 23 Oct 2006 12:13:42 -0500
Message-Id: <1161623623.8571.13.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Kernel oops on 2.6.17.13 while resizing logical
	volume (data loss)
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
Content-Type: text/plain; charset="us-ascii"
To: Allard Hoeve <allard@byte.nl>
Cc: linux-lvm@redhat.com

On Mon, 2006-10-23 at 18:11 +0200, Allard Hoeve wrote:
> Dear LVM maintainers,
> 
> (JFS maintainer CC'ed because of crash on LVM + JFS)
> 
> Today I encountered a kernel oops while resizing one of our logical volumes. 
> Others at the office have encountered this oops before, but until now I haven't 
> had the chance to get to the oops message itself.
> 
> A short description of the machine:
> 
> * The machine is a Dell PowerEdge 2850 (megaraid_mbox 4e/Di SCSI)
> * There are 6 disks in a RAID5 setup (one large logical disk)
> * The machine had medium load overall
> * The machine had low load on the partition to be resized
> 
> Output of lsmod and lspci -vv attached.
> 
> Description of the setup:
> 
> * The machine was running a vanilla Linux 2.6.17.8
> * The machine was running Debian Sarge (lvm2 2.01.04-5)
> * 80% of the RAID5 array covered by LVM2
> * One volume group
> * Five logical volumes
> 
> About the crash:
> 
> * I was using lvextend -L +100G /dev/srv/home
> * Oops happend during resize
> * The partition in question had a JFS filesystem
> * Resizing the largest logical volume
> * Resizing from 150 to 250 GB
> * Partition was mounted read/write (online)
> * Two other resizes had finished succesfully happened before
>    the kernel oops occurred

It looks like lbmRead() (jfs) called submit_bio() where bio->bi_bdev is
NULL.  I don't know how this can be happening, and it doesn't look like
anything I've seen before.  I didn't see any lv's that appear to be an
external journal, so I'm assuming the partition has an internal journal.

> After a reboot:
> 
> * Second attempt at lvresize succeeded after reboot
> * mount -o remount,resize of filesystem succeeded
> 
> It seems like this bug is only triggered on consecutive resize attempts, but I 
> cannot confirm this.

I'll look a bit closer to see if I can find any way multiple resizes
might lead to a null bdev somewhere.

> Output of vgs and lvs attached (unfortunately only of the new situation)
> 
> The oops itself:
> 
> See attached file. Please note the NULL pointer and memory allocation function 
> references.
> 
> I hope this information is complete. If you require any more information about 
> this, please don't hesitate to contact me. If you do, please CC me, I'm not on 
> any of the LVS lists.
> 
> Thanks for your time,
> 
> 
> Sincerely,
> 
> Allard Hoeve
-- 
David Kleikamp
IBM Linux Technology Center
