Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3C707c2004335
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 03:00:07 -0400
Received: from mxip1i.isis.unc.edu (mxip1i.isis.unc.edu [152.2.0.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3C702px022007
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 03:00:03 -0400
Received: from orwell (triband-mum-59.183.62.80.mtnl.net.in [59.183.62.80])
	(authenticated bits=0)
	by smtp.unc.edu (8.14.4/8.14.3) with ESMTP id p3C6xuK4017368
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 03:00:01 -0400 (EDT)
Received: from faheem (helo=localhost) by orwell with local-esmtp (Exim 4.72)
	(envelope-from <faheem@email.unc.edu>) id 1Q9XZr-0005Yb-Dq
	for linux-lvm@redhat.com; Tue, 12 Apr 2011 12:29:55 +0530
Date: Tue, 12 Apr 2011 12:29:55 +0530 (IST)
From: Faheem Mitha <faheem@email.unc.edu>
Message-ID: <alpine.DEB.2.00.1104121207130.11425@orwell.homelinux.org>
MIME-Version: 1.0
Subject: [linux-lvm] lvm devices under /dev/mapper missing
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi,

I'm using LVM on top of software RAID 1 on Debian squeeze.

The symbolic links under /dev/mapper have gone missing. I don't know why. 
I'm looking for advice on how to diagnose and fix this (if necessary). I 
believe udev dynamically generates these links, so in the best case 
scenario nothing needs to be done. But I don't know if there might be 
other problems I'm not aware of.

Further details are at

http://unix.stackexchange.com/questions/11125/lvm-devices-under-dev-mapper-missing

Please CC me on any reply to faheem@email.unc.edu. Thanks very much in 
advance.

                                                          Regards, Faheem
