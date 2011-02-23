Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NDJSG9010469
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 08:19:28 -0500
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com
	[143.166.85.207])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NDJJum004368
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 08:19:19 -0500
From: <Sunil_Gupta2@Dell.com>
Date: Wed, 23 Feb 2011 18:48:01 +0530
Message-ID: <8EF1FE59C3C8694E94F558EB27E464B71D13077067@BLRX7MCDC201.AMER.DELL.COM>
References: <4D64FF3C.6080602@abpni.co.uk>
In-Reply-To: <4D64FF3C.6080602@abpni.co.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
To: linux-lvm@redhat.com

A file when removed from linux OS does not remove the data it just unlink the inode associated with the file which makes data unaccessible. If the disk is /dev/zeroed I don't think it will reappear.

--Sunil  

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Jonathan Tripathy
Sent: Wednesday, February 23, 2011 6:06 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Snapshots and disk re-use

Hi Everyone,

We host many Xen VMs for customers. We use LVM as the fisk storage for these VMs. When a customer cancels, we generally dd their LV with /dev/zero, before removing the LV.

If however we want to create a snapshot of a customer's LV, is there the chance that the data may appear on a new future LV if we were to create one (for a new customer)? Is is my understanding that most filesystems don't actually remove data from a disk when deleting a file, but just set an "ignore" tag of some sort...

Thanks

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
