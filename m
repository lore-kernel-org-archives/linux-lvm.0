Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j17FBqO22795
	for <linux-lvm@redhat.com>; Mon, 7 Feb 2005 10:11:52 -0500
Received: from host1.appws.com ([216.136.72.3])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j17FBkJO006675
	for <linux-lvm@redhat.com>; Mon, 7 Feb 2005 10:11:46 -0500
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.12.8/8.12.8) with ESMTP id
	j17EBYZ1030804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 7 Feb 2005 09:11:34 -0500
Received: (from david@localhost)
	by grandmother.littlebald.com (8.12.8/8.12.8/Submit) id j17EBYcF030802
	for linux-lvm@redhat.com; Mon, 7 Feb 2005 09:11:34 -0500
Subject: RE: [linux-lvm] LVM + SAN Behavior
From: David Johnston <david@littlebald.com>
In-Reply-To: <1107395761.22389.86.camel@voxan.mystro.mystrotv.com>
References: <1107395761.22389.86.camel@voxan.mystro.mystrotv.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1107785493.30272.10.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Date: Mon, 07 Feb 2005 09:11:34 -0500
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

On Wed, 2005-02-02 at 20:56, Kreig DuBose wrote:
> Hello-
> 
> I too am sharing the same issue regarding SAN file systems and Linux
> LVM.  I have a device presented via FC on RHEL 3 update 3.  
> 
> I started with a simple raid 5 configuration with 3 disks
> 
> When I created the file systems I did so as such:
> 
> pvcreate /dev/sdc
> vgcreate <volgrp_name> /dev/sdc
> lvcreate -L +45G -n <lv_name> <volgrp_name>
> mkfs -j  /dev/<volgrp_name>/<lv_name>
> 
> So far so good.  Partitions mount up and work fine.  My problem is now
> that I've added in another disk  I cannot grow the vg:
> 
> # vgextend <volgrp_name> /dev/sdc
> ______________________________________________________________________
Perhaps it's just a typo in your email, but this is the same pv you used
when you first created the vg.  I think you meant:
# vgextend <volgrp_name> /dev/sdd

That would add sdd to your vg, which already has sda, sdb, and sdc.
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
