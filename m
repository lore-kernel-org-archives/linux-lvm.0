Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m18Au9Gh024002
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 05:56:09 -0500
Received: from septimus.inrp.fr (septimus.inrp.fr [193.51.247.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m18AtTXv024484
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 05:55:29 -0500
Received: from septimus.inrp.fr (septimus.inrp.fr [127.0.0.1])
	by localhost.septimus.inrp.fr (Postfix) with ESMTP id A06DFE324A
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 11:55:28 +0100 (CET)
Received: from valerian.inrp.fr (valerian.inrp.fr [195.83.134.122])
	by septimus.inrp.fr (Postfix) with ESMTP id 95119E3249
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 11:55:28 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by valerian.inrp.fr (Postfix) with ESMTP id 85E372BFDC
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 11:55:28 +0100 (CET)
Received: from valerian.inrp.fr ([127.0.0.1])
	by localhost (valerian [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 22180-01 for <linux-lvm@redhat.com>;
	Fri,  8 Feb 2008 11:55:28 +0100 (CET)
Received: from [195.83.134.19] (SCI004.inrp.fr [195.83.134.19])
	by valerian.inrp.fr (Postfix) with ESMTP id 41AA72BEAD
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 11:55:28 +0100 (CET)
Message-ID: <47AC3520.3050608@gmail.com>
Date: Fri, 08 Feb 2008 11:55:28 +0100
From: Thomas Bellembois <thomas.bellembois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and RAID
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

Hello,

I wonder if we can use RAID (hard) under LVM for Xen domU.
What kind of RAID is recommanded ?

I was thinking about the following configuration:
- RAID 1 (two 70 GB disks) for the dom0
- RAID 5 (three 285 GB disks) for domU on LVM partitions

Any idea ?

Regards,

Thomas
