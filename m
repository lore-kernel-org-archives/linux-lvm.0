Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2SAx7O17885
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2005 05:59:07 -0500
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2SAx6m6017656
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2005 05:59:07 -0500
Received: from bilbo.dd.chalmers.se (bilbo.dd.chalmers.se [129.16.116.8])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id 0A2814984
	for <linux-lvm@redhat.com>; Mon, 28 Mar 2005 12:59:06 +0200 (CEST)
Date: Mon, 28 Mar 2005 12:59:05 +0200 (MEST)
From: Peter Karlsson <petekarl@student.chalmers.se>
Message-ID: <Pine.GSO.4.62.0503281214020.12615@bilbo.dd.chalmers.se>
MIME-Version: 1.0
Subject: [linux-lvm] lvm corruption...
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi!

I'm new to this list... and I have a problem (or rather, It's my friend's 
problem). The background: I installed Fedora core 3 for him on an via epia 
machine. I wasn't really paying attention when I did the install for him 
and let the install program handle the partitioning which led to fedora 
being installed with lvm "partitions" (id: 0x8e). The day after when he 
had started using his new 'puter it froze (hard) so he had to push the 
"button" (there's no reset - only poweroff on the box). When trying to 
boot into FC3 again it boots the kernel (so apparently the boot partition 
is ok) but when it tries to launch init (on root partition) it panics 
saying:

ext3_underscore_descriptors: block bitmap for group 128 not in group 
(block 0)!
Group descriptors corrupted.

So booting with the FC3 install cd rescue mode and doing a fsck does not 
help, since it (fsck) complains about superblock corruption. From what I 
and my friend understands lvm is a sort of linked list of physical volumes 
(harddrives) containing the ext3 filesystem (i.e. it encapsulates the 
filesystem). Could it be that the ext2 tools supplied on the disc is not 
lvm-aware so that it doesn't recognise the filesystem? Or is it possible 
to "extract" the ext3 data (or remove the lvm data on the partition thus 
converting it to a "clean" ext3 or ext2 filesystem) somehow? What we're 
really interested in is rescuing some data on the drive since he (without 
thinking) moved some data from another computer to this epia 'puter (i.e. 
he erased his only backup). This is a situation where H.Simpson would say 
"doh"! Another possibility would be to re-create the superblock 
information in the ext3 but I don't know how to access it. Any help would 
be very much appreciated... TIA!

Best regards

Peter K
