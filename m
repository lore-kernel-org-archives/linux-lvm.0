Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3UFtYv31735
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 11:55:34 -0400
Received: from p2.imoveinc.com (p2.imoveinc.com [64.1.196.61])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3UFtXKG009456
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 11:55:33 -0400
Received: from easystreet.com (unknown [64.1.196.2])
	by p2.imoveinc.com (Postfix) with ESMTP id 8BC223CB5
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:55:32 -0700 (PDT)
Message-ID: <409276F4.7060305@easystreet.com>
Date: Fri, 30 Apr 2004 08:55:32 -0700
From: Don Buchholz <buchholz@easystreet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and hardware device re-ordering?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


I'm looking at implementing my first LVM system.  It looks
pretty straight-forward.  (Very similar to the LVM stuff I
saw in AIX v3.x and Veritas management Sun used to manage
SPARCStorage Arrays.)

The one nagging question in my mind is:

  How resilient is LVM to a sudden renumbering of
  physical hard disks?

Assume no disks have actually failed, just that a new disk
gets added and suddenly all the LVM drives get notched up
a drive letter. 

For example,

 Before  After  SCSI ID*    description
 ------  -----  --------   --------------------------------
   sda    sda    0,0,0,0    operating system disk (HW RAID)
    --    sdb    0,0,1,0    new added disk (e.g. a CD drive)

   sdb    sdc    1,0,0,0    LVM PV#1
   sdc    sdd    1,0,0,1    LVM PV#2
   sdd    sde    1,0,0,2    LVM PV#3
 ----------------------------------------------------------
  * The four numbers are:  (1) controller, (2) controller
   channel, (3) SCSI target, (4) SCSI LUN.

Can I just assume LVM will do the right thing, and my VG
created from the three physical volumes will be OK?

Thanks,
- Don Buchholz
