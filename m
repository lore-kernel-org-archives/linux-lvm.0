Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3J77Ej03692
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 03:07:14 -0400
Received: from outmta-1.esr.lvcm.net (outmta-1.esr.lvcm.net [24.234.0.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3J77C87013650
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 03:07:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 9092024056
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 00:08:37 -0700 (PDT)
Received: from outmta-1.esr.lvcm.net ([127.0.0.1])
	by localhost (outmta-1.esr.lvcm.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 10397-01 for <linux-lvm@redhat.com>;
	Mon, 19 Apr 2004 00:08:37 -0700 (PDT)
Received: from mlug.missouri.edu (ip68-104-28-32.lv.lv.cox.net [68.104.28.32])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 15DA624027
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 00:08:37 -0700 (PDT)
Message-ID: <40837A96.9000801@mlug.missouri.edu>
Date: Mon, 19 Apr 2004 00:07:02 -0700
From: Michael <mogmios@mlug.missouri.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM across multiple servers?
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

I remember seeing some mention that in the 2.6 kernels that the new LVM 
implementation would allow disks across multiple servers to form one 
logical disk. Did I understand that correctly and if so how do I use 
that? I have several servers on my home LAN maxed out on the number and 
size of disks they can handle and would really like to be able to keep 
all those files managed logically in one giant drive. Thanks.
