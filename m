Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0DHVPr09078
	for <linux-lvm@redhat.com>; Thu, 13 Jan 2005 12:31:25 -0500
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0DHVJZk013350
	for <linux-lvm@redhat.com>; Thu, 13 Jan 2005 12:31:20 -0500
Message-ID: <41E6B060.3030400@berbee.com>
Date: Thu, 13 Jan 2005 11:31:12 -0600
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] devmapper
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
To: linux-lvm@redhat.com

I love LVM and device mapper functionality...
I dont like how 'df' spills over many lines now with the /dev/mapper/myvg-mylv syntax...
any idea how I can shorten the device path? how about /dev/dm/myvg-mylv
Thanks -Al
