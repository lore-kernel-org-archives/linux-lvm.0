Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l62Lpr1Y025976
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 17:51:53 -0400
Received: from email.arc.nasa.gov (email.arc.nasa.gov [143.232.64.51])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l62Lpq3m027487
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 17:51:52 -0400
Received: from gobo.arc.nasa.gov (gobo.arc.nasa.gov [143.232.65.135])
	by email.arc.nasa.gov (Postfix) with ESMTP id A4486204
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 14:51:51 -0700 (PDT)
Message-ID: <46897378.8040305@email.arc.nasa.gov>
Date: Mon, 02 Jul 2007 14:51:52 -0700
From: Ryan Nelson <ryan@email.arc.nasa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Clone disk with LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


I had a Linux system using LVM for / (root) that was going away for 
field tests and the users of the system wanted to have a couple hot 
spares of the drives.  Using dd I replicated the disk to two diffrent 
drives.  One drive stored away and the other drive was going to be in 
the system being rsync'd nightly so that it would have the freshest data 
on it.

Because of the dd the LVM had the same names and UUIDs for the vg and 
lg.  I was able to change the names however I wasn't successful in 
change the UUIDs.  It didn't even look like there was an option to 
change the UUIDs for the lv. 

What would have been the correct way to achieve a setup like this with 
LVM?  I would assume a mirroring of some sort although I don't know what 
would be involved for the user if the drive did die and they needed to 
use the second drive.

Thanks
Ryan
