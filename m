Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j47FLNO23383
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 11:21:23 -0400
Received: from defender.int.cjs226.com (cpe-70-113-64-6.austin.res.rr.com
	[70.113.64.6])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j47FLHHL018454
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 11:21:17 -0400
Received: from [192.168.1.21] ([192.168.1.1])
	by defender.int.cjs226.com (8.12.8/8.12.8) with ESMTP id j47Ef910020336
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 09:41:10 -0500
Message-ID: <427CDD98.6090401@cjs226.com>
Date: Sat, 07 May 2005 10:24:08 -0500
From: Clif Smith <redhat@cjs226.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Slightly Off Topic - Filesystems
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

Which filesystem do you normally use?  I prefer jfs as you can extend it 
online and it's been pretty stable for me.  However, it gets complicated 
if I have a problem and need to boot from a CD as the Red Hat cds don't 
support jfs.
