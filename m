Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8HG31V05696
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 12:03:01 -0400
Received: from smtp.aaisp.net.uk (B.painless.aaisp.net.uk [81.187.81.52])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8HG2hR7010676
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 12:02:48 -0400
Received: from ebourne.me.uk ([81.187.210.78] helo=hordein.ebourne.me.uk)
	by smtp.aaisp.net.uk with esmtp (Exim 4.43) id 1EGf96-0006Wn-Tf
	for linux-lvm@redhat.com; Sat, 17 Sep 2005 17:02:33 +0100
Received: from avenin.ebourne.me.uk (avenin.ebourne.me.uk [192.168.66.4])
	by hordein.ebourne.me.uk (Postfix) with ESMTP id 9A90112C8B6
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 17:02:30 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by avenin.ebourne.me.uk (Postfix) with ESMTP id 51018C81A6
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 17:02:30 +0100 (BST)
Subject: Re: [linux-lvm] Recovering Data From LVM
From: Martin Ebourne <lists@ebourne.me.uk>
In-Reply-To: <50387.65.93.236.186.1126965110.squirrel@www.stellarimagination.com>
References: <50387.65.93.236.186.1126965110.squirrel@www.stellarimagination.com>
Date: Sat, 17 Sep 2005 17:02:29 +0100
Message-Id: <1126972949.3284.3.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2005-09-17 at 08:51 -0500, michael@stellarimagination.com wrote:
> The problem is that there does not appear to be any logical volumes in the
> volume group.  This was the original layout of the disks:
> 
> /dev/hda1 ext3   102MB  1   13
> /dev/hda2  lvm 39104MB 14 4998
> 
> VolGroup00   Size 39040
>   LogVol00 / ext3 38272
>   LogVol01   swap   768
> ...
> I suspect that I corrupted the structure of the LVM when I was trying to
> mount it originally.  At one point I had run "vgcreate oldhdd /dev/hb2" or
> something to that effect.  None of the processes took more than a second,
> so I strongly believe that the data itself is still there.

Looks like you need to restore the original metadata to the drive, from
before you accidentally modified it. You'll find a history of metadata
backups in /etc/lvm/archives. Pick the last one that looks good (read
them, they're text files) and use vgcfgrestore to write it back to the
drive.

Then "vgchange -ay" should find the volume group and make all the
logical volumes active.

Cheers,

Martin.
