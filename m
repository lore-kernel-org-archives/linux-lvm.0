Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k36Mlw21005244
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 18:47:58 -0400
Received: from black.open2space.com ([68.144.188.211])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k36MljjJ029445
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 18:47:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by black.open2space.com (Postfix) with ESMTP id 98FF449AD2
	for <linux-lvm@redhat.com>; Thu,  6 Apr 2006 21:45:03 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by black.open2space.com (Postfix) with ESMTP id 5FB4348CC1
	for <linux-lvm@redhat.com>; Thu,  6 Apr 2006 21:45:03 -0600 (MDT)
Received: from black.open2space.com ([127.0.0.1])
	by localhost (black [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 06632-07 for <linux-lvm@redhat.com>;
	Thu,  6 Apr 2006 21:45:02 -0600 (MDT)
Received: from [192.168.0.20] (unknown [192.168.0.20])
	by black.open2space.com (Postfix) with ESMTP id 2CFED488C4
	for <linux-lvm@redhat.com>; Thu,  6 Apr 2006 21:45:01 -0600 (MDT)
From: Shawn <sgrover@open2space.com>
Date: Thu, 6 Apr 2006 15:45:08 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604061545.09082.sgrover@open2space.com>
Subject: [linux-lvm] Recovering data from a damaged LVM partition?
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

First post to this list, so please forgive me if I'm not on topic, or 
repeating a common issue.

I have been asked to try to get data from a drive with a damaged partition.  
In the past I've done this with ddrescue, and then mounted the resulting 
image file.  That's not working in this case because the partition in 
question was part of an LVM volume.

My experience with LVM is not that great, as I've never seen a need for it on 
my systems.  But, I've installed the LVM tools, and modified my kernel for 
LVM support, and can at least see the volume on the damaged drive now.  But I 
want to focus on the image file, not the drive.

So, the question is how to mount an image file of an LVM partition?  Anytime I 
try the mount command, it's complaining about the file system type.  I've 
tried the different options for the -t argument, (and am using the -o loop as 
well).

I'm hesitant to run any of the LVM commands to create a volume set, or 
intialize a partition, for fear of loosing the data.  (though I could run 
ddrescue again I suppose, as long as I don't touch the source drive).

Does anyone have any experience here they'd care to share?  Thanks.

BTW, the disk in question is from a default install of Fedora Core 4, and the 
system only had a single drive.  So LVM probably wasn't needed in this case, 
but the person that installed the system is not comfortable with the file 
system details.

Shawn
