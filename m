Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GG7TWG031012
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 12:07:29 -0400
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GG7ElO031203
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 12:07:14 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI700BWLBFXHWEI@vms173001.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 16 Apr 2009 11:07:10 -0500 (CDT)
Message-id: <49E757A9.6090108@verizon.net>
Date: Thu, 16 Apr 2009 12:07:05 -0400
From: Gerry Reno <greno@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Move an array/volgroup to another machine.
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

We built a replacement server (x86_64) for an older server (x86).  Now 
we want to move a RAID-5 array intact from the older machine over to the 
new machine.  We know the UUID of the array and of all the PV and VG on 
the array.  So what commands should we perform after plugging in all the 
array drives to the new server to bring up the array and lvm on the new 
machine?

Regards,
Gerry
