Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAL0Kmr26131
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 19:20:48 -0500
Received: from mailgw.aecom.yu.edu (mailgw.aecom.yu.edu [129.98.1.16])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAL0Kkpl028281
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 19:20:46 -0500
Received: from mailvx.aecom.yu.edu (mailvx.aecom.yu.edu [129.98.1.17])
	by mailgw.aecom.yu.edu (8.12.11/8.12.11) with SMTP id iAL0Kfnw027021
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 19:20:41 -0500
Received: from post.aecom.yu.edu ([129.98.1.4])
	by mailvx.aecom.yu.edu (SAVSMTP 3.1.1.32) with SMTP id
	M2004112019204022919
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 19:20:40 -0500
Received: from [129.98.90.227] (usseinstein.aecom.yu.edu [129.98.90.227])
	by post.aecom.yu.edu (8.11.7p1+Sun/8.11.7) with ESMTP id iAL0Ket26338
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 19:20:40 -0500 (EST)
Mime-Version: 1.0
Message-Id: <a0610050dbdc14eff1992@[129.98.90.227]>
Date: Sat, 20 Nov 2004 19:27:43 -0500
From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: [linux-lvm] LVM strategy: Is One VG Safe?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I plan to start with a hardware RAID (level 5) of one physical volume 
and one volume group. Then create several logical volumes from it and 
grow them each as they are needed pulling space from what's not used 
in the volume group until all the space in the group eventually 
utilized.

Is it reasonable to believe that such an arrangement is stable enough 
that if anything were to ever go wrong a with an individual logical 
volume that it wouldn't impact the other logical volumes in that same 
volume group or the volume group itself?
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University
