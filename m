Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB4GlN0w020070
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:47:23 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB4Gl28T012231
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:47:02 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id lB4Gkvh7007834
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:46:57 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id lB4Gku9p009446
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:46:57 -0500
Date: Tue, 4 Dec 2007 11:46:56 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] moving a logical volume between servers
In-Reply-To: <475517F1.9050000@ucdavis.edu>
Message-ID: <Pine.LNX.4.44.0712041137500.9363-100000@bmsred.bmsi.com>
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

On Tue, 4 Dec 2007, Brad Sickler wrote:

> I'm surprised I couldn't find a good answer to the question before but I 
> want to move logical volumes from one computer to another.
> 
> A little more detail... I created a bunch of xen images on logical 
> volumes. I brought another computer up to split the load of all the 
> virtual machines and I want to move some volumes to the new computer. 
> When I created them I figured I could just dd them like a partition but 
> upon attempting this and booting the transported xen machine/logical 
> volume fsck showed some bad errors on the boot partition of the virtual 
> machine. The later partitions seemed fine.

I do this all the time.  You want to take a snapshot of the LV and copy
the snapshot.  Make sure the target is the same size or bigger.
This works with journaled filesystems like ext3, xfs, reiserfs, jfs.  If you do
it with ext2 or other non-journalled fs, you'll need to run fsck on the copy.

Oh, and once I reversed the src and dst :-(  Now I have a co-worker check
before I press enter.

PS.  It would be possible for LVM to flag PEs newly added to an LV as
"uninitialized".  Attempts to read uninitialized data could result in
a read error.  This would catch a lot of fat finger mistakes - if it
didn't break too much stuff in the process.  Maybe just flag the entire LV
"write only" until the first write, and subsequent first reads would
return zeroes for security reasons.  There should be a flag to disable
all this in case the LV is created for data recovery purposes.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
