Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5FLXZxG026515
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 17:33:35 -0400
Received: from electra.uleth.ca (electra.uleth.ca [142.66.3.44])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5FLXTbd029079
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 17:33:29 -0400
Received: from [142.66.6.17] (port=54490 helo=juliet.netsrv.uleth.ca)
	by electra.uleth.ca with esmtp (Exim 4.52) id 1FqzSt-0000sk-7s
	for linux-lvm@redhat.com; Thu, 15 Jun 2006 15:33:23 -0600
Received: from [142.66.136.2] (port=38939 helo=laue.chem.uleth.ca)
	by juliet.netsrv.uleth.ca with smtp (Exim 4.52) id 1FqzSt-00064Y-5Z
	for linux-lvm@redhat.com; Thu, 15 Jun 2006 15:33:23 -0600
From: Steven Mosimann <steven.mosimann@uleth.ca>
Date: Thu, 15 Jun 2006 15:41:20 -0600
Message-Id: <1150407680.28492.28.camel@laue.chem.uleth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm - problem replacing failed disk
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

Greetings,

I've been running lvm2 on a redhat system for the past 6 months
(happily).  As happens, one of the three hard disks used in my volume
group has failed.  There is some data in the volume group I'd like to
retrieve if possible.


I've been reading HOWTOs and various other posts and tried the
following:

(1) Replaced the failed disk with one of the same size  
(2) Used pvcreate to make the same physical volumes on the new disk
that were present on the failed disk.  Example of the actual command I
used was:
  pvcreate --uuid xxxxx /dev/sdb1
where xxxxx was the pv uuid from pvdisplay 
(3) Used vgchange -a y -P to activate the volume group

At this point I get an error saying the metadata is inconsistent and a
volume group uuid is not found.

Any advice on how to proceed would be appreciated.  

Thanks, Steve
----------------

PS.  Attempts to mount the Logical volume of interest fail with a bad
superblock message.  I think this is expected as the first segment of
the logical volume was on the failed disk.
