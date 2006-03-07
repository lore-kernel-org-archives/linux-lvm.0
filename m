Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k27LDg130783
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 16:13:42 -0500
Received: from mta4.srv.hcvlny.cv.net (mta4.srv.hcvlny.cv.net [167.206.4.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k27LDaKk010678
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 16:13:36 -0500
Received: from [127.0.0.1] (ool-182e627d.dyn.optonline.net [24.46.98.125])
	by mta4.srv.hcvlny.cv.net
	(Sun Java System Messaging Server 6.2-4.03 (built Sep 22 2005))
	with ESMTP id <0IVS00GAD0AEAHZ3@mta4.srv.hcvlny.cv.net> for
	linux-lvm@redhat.com; Tue, 07 Mar 2006 16:13:27 -0500 (EST)
Date: Tue, 07 Mar 2006 16:13:21 -0500
From: Brian Weck <bweck@weck.net>
Message-id: <440DF771.1050506@weck.net>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] snapshot, machine hang and physical memory required
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


I seem to be encountering a problem when attempting to create a 
snapshot. Sometimes the snapshot goes through fine and at other times 
while executing a 'lvcreate --snapshot ...' it subsequently causes my 
box to hang completely.

 From what I've read, this problem seems to be related to having 
insufficient physical memory.

I can not seem to find where/how to estimate how much memory is required 
to successfully perform the snapshot. Is the memory required relative to 
the snapshot size, the size of the target LVM device or both?

I'm running with a 2.6.12 kernel:
lvm2-2.01.14-2.0.RHEL4
device-mapper-1.01.04-1.0.RHEL4

As the machine seems to hang when creating a snapshot on "/" (rather the 
logical volume upon which "/" resides), upon a reboot I do not see 
anything in my logs related to the problem which further makes the 
problem harder to debug.

Any help would be greatly appreciated-
Brian
