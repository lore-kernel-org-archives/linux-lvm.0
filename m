Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3T9YkO27515
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 05:34:46 -0400
Received: from mxs1.siemens.at (mxs1.siemens.at [194.138.12.131])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3T9YccY015538
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 05:34:39 -0400
Received: from vies1k7x.sie.siemens.at ([158.226.129.83])
	by mxs1.siemens.at  with ESMTP id j3T9YXDG012007
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 11:34:33 +0200
Received: from pce151.ram.siemens.at ([158.226.129.97])
	by vies1k7x.sie.siemens.at (8.12.11/8.12.1) with ESMTP id
	j3T9YXO4023691
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 11:34:33 +0200
From: Wolfgang Liebich <wolfgang.liebich@siemens.com>
Date: Fri, 29 Apr 2005 11:34:31 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200504291134.31810.wolfgang.liebich@siemens.com>
Subject: [linux-lvm] Question about LVM2 and repartitioning
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
To: linux-lvm@redhat.com

Hi,
I have a somewhat strange question about LVM2 on a Linux 2.6.11 kernel:
- When installing a new hard disk, I had to use some partitioning trickery to 
move my data from the old disk (partitioned and using LVM2) to the new one.
As a result, my partition scheme looked like this:
- a primary boot partition (not inside a  LVM container)
- a primary root partition (not inside a LVM container)
- an extended partition spanning the rest of the disk
-- inside of that a logical partition containing the primary LVM container
--- inside this LVM container, my main partitions (/home,/usr,...)
- some remaining logical partitions. This partitions were needed during the 
move, but now they can be killed.
I want to use the disk space from the remaining partitions for the one and 
only LVM2 container. If I add the partitions as new PVs, I can use the space 
alright, but I also lose some MBs due to these partitions not being exactly 
right sized (sorry, bad english, I know :-().
So I want to know if I can just do the following:
- remove the partitions not needed anymore
- resize the LVM2 partition to use the whole disk
- resize the LVM2 container.
Is this possible, or is it the smartest move for me to create one logical 
partition containing the rest of the disk and add that as a new PV, accepting 
that maybe some MB might be lost?
TIA,
Wolfgang Liebich
