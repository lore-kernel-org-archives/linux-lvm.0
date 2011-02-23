Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NCae1a009477
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 07:36:41 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NCaRw5022770
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 07:36:28 -0500
Message-ID: <4D64FF3C.6080602@abpni.co.uk>
Date: Wed, 23 Feb 2011 12:36:12 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshots and disk re-use
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi Everyone,

We host many Xen VMs for customers. We use LVM as the fisk storage for 
these VMs. When a customer cancels, we generally dd their LV with 
/dev/zero, before removing the LV.

If however we want to create a snapshot of a customer's LV, is there the 
chance that the data may appear on a new future LV if we were to create 
one (for a new customer)? Is is my understanding that most filesystems 
don't actually remove data from a disk when deleting a file, but just 
set an "ignore" tag of some sort...

Thanks
