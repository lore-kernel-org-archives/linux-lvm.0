Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6MEM4a01135
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 10:22:04 -0400
Received: from grassmarket.ucs.ed.ac.uk (grassmarket.ucs.ed.ac.uk
	[129.215.166.64])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6MEM2e1021334
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 10:22:03 -0400
Received: from grassmarket.ucs.ed.ac.uk (localhost [127.0.0.1])
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.10) with ESMTP id
	i6MEM1FO012507
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 15:22:01 +0100 (BST)
Received: (from nobody@localhost)
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.9/Submit) id i6MEM1Q2012506
	for linux-lvm@redhat.com; Thu, 22 Jul 2004 15:22:01 +0100 (BST)
Message-ID: <1090506121.40ffcd89a8dc5@sms.ed.ac.uk>
Date: Thu, 22 Jul 2004 15:22:01 +0100
From: Rupert Hair <rupert.hair@ntlworld.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Quoting Zachary Hamm <zhamm@nc.rr.com>:

> Hello, I'm running Fedora Core 2 on a Dell Poweredge 1750 with three 36G
> SCSI drives setup with two volumes, /boot and /, setup with software RAID 1
> with online spare.  This was setup at install, which reported no errors.
> I've done a yum update as well.
I would recommend that you run LVM on top of the RAID.  I.E.  all of the disks
are setup for RAID (with partition type fd/"Linux raid auto") and then you make
the resultant /dev/md0 a physical volume in the LVM.  You can then create two
logical volumes for your boot and root partitions.

If the system is recently installed then a re-install is probably the quickest
way to go.

> The problem is that only one of the to volume groups is recognised and
> mirrored (/boot), as apparently vgscan does not like the the large drives
> (which aren't that large...).   Any help is appreciated.
I'm not sure what this could be but I don't think its due to the disks actually
being too big.

Hope this is of some help,

Rupert
