Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2C0IGUN001785
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 20:18:16 -0400
Received: from smtp4.pacifier.net (smtp4.pacifier.net [64.255.237.174])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2C0Huvr027084
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 20:17:57 -0400
Received: from laptop1.local (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp4.pacifier.net (Postfix) with ESMTP id 607286A600
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 17:17:56 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Wed, 11 Mar 2009 17:17:50 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200903111717.50789.benscott@nwlink.com>
Subject: [linux-lvm] moving a partition with a physical volume?
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

Lets say I have a partition with a physical volume in a volume group. If the 
group is *not* active, is it safe to move the disk partition to another 
location on the same disk along with the data? If the device number changed 
would lvm still be able to cope?

Thank you

benscott@nwlink.com
