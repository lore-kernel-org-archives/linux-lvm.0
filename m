Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4OBfL007882
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 07:41:21 -0400
Received: from outmta-1.esr.lvcm.net (outmta-1.esr.lvcm.net [24.234.0.14])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4OBfKGG003035
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 07:41:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id C67D124039
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 01:57:12 -0700 (PDT)
Received: from outmta-1.esr.lvcm.net ([127.0.0.1])
	by localhost (outmta-1.esr.lvcm.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 14835-05 for <linux-lvm@redhat.com>;
	Mon, 24 May 2004 01:57:12 -0700 (PDT)
Received: from mlug.missouri.edu (ip68-104-28-32.lv.lv.cox.net [68.104.28.32])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 2EC5D24009
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 01:57:09 -0700 (PDT)
Message-ID: <40B1B898.2050204@mlug.missouri.edu>
Date: Mon, 24 May 2004 01:55:52 -0700
From: Michael <mogmios@mlug.missouri.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM on a drive with a bad sector?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I have a drive I was getting ready to change to LVM. When moving all the 
old files off I noticed it seems to have a bad sector on the drive.. not 
unlikely as I move a lot so the disks take a lot of physical abuse.. but 
only that one bad sector. Is there anything special I should do before 
using the drive with LVM to mark the sector as bad so that LVM just 
works around it? So far there is no evidence that the entire drive is 
failing.
