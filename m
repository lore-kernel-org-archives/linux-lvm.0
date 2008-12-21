Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBLEXfjO013547
	for <linux-lvm@redhat.com>; Sun, 21 Dec 2008 09:33:41 -0500
Received: from tigger.tntechs.com (tigger.tntechs.com [71.185.26.3])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBLEXTYQ017374
	for <linux-lvm@redhat.com>; Sun, 21 Dec 2008 09:33:29 -0500
Received: from localhost (localhost [127.0.0.1])
	by tigger.tntechs.com (Postfix) with ESMTP id 007779C05B
	for <linux-lvm@redhat.com>; Sun, 21 Dec 2008 09:33:28 -0500 (EST)
Date: Sun, 21 Dec 2008 09:33:28 -0500 (EST)
From: Tom Diehl <tdiehl@rogueind.com>
Message-ID: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM snapshot?
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I have a machine that is running EL5 with xen. One of the DOMU's has an LV
from DOM0 mounted on it to allow access to the data. Is it safe to do 
a snapshot of the LV from DOM0 while it is still mounted rw on the DOMU?

What I would like to do is snapshot the LV, fsck the snapshot and if it comes
up clean, continue on. If it shows errors, then I will schedule downtime
for a real fsck.

Does this sound safe or am I going to get into trouble if I do that?

Regards,

-- 
Tom Diehl		tdiehl@rogueind.com		Spamtrap address mtd123@rogueind.com
