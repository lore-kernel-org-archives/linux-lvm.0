Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57IKd002048
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:20:39 -0400
Received: from admin.theuseful.com (admin.theuseful.com [208.48.182.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i57IKYXn004555
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:20:34 -0400
Received: from [192.168.1.95] (adsl-065-013-046-003.sip.mia.bellsouth.net
	[65.13.46.3])
	by admin.theuseful.com (Postfix) with ESMTP id A073D150F7
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 14:20:27 -0400 (EDT)
Message-ID: <40C4B1E5.8040801@staff.theuseful.com>
Date: Mon, 07 Jun 2004 14:20:21 -0400
From: Yaroslav Klyukin <yklyukin@staff.theuseful.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM snapshot sizes.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


I have created an LVM logical volume of the size arount 60G and 
formatted it with reiserfs. After that I put MySQL database onto this 
partition and made it a replicating slave.
Using this configuration I took several LVM snapshots, 1G each.
It did not take long for these snapshots to overflow.

So here is the question:
Why would it take so fast to overflow an LVM snapshot?
In other words, what are the parameters, which affect snapshot fillups?
Is it possible, that journaling filesystem can contribute to the size of 
changing data on the logical volume, and would LVM2 be more efficient?

Thank you!

-- 
Systems Administrator, NiuTech.
Cellular: (561) 843-1552
AIM: infiniteparticle
