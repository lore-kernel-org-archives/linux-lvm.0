Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i32Hhnj09327
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 12:43:49 -0500
Received: from cs.selu.edu (cs.selu.edu [147.174.59.5])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i32Hhmjj010947
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 12:43:48 -0500
Received: from cs.selu.edu (jholland@localhost [127.0.0.1])
	by cs.selu.edu (8.12.10/8.12.10) with ESMTP id i32HhgYK043470
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 11:43:42 -0600 (CST)
	(envelope-from jholland@cs.selu.edu)
Received: from localhost (jholland@localhost)
	by cs.selu.edu (8.12.10/8.12.10/Submit) with ESMTP id i32HhgEx043467
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 11:43:42 -0600 (CST)
	(envelope-from jholland@cs.selu.edu)
Date: Fri, 2 Apr 2004 11:43:42 -0600 (CST)
From: Jason P Holland <jholland@cs.selu.edu>
Message-ID: <20040402114054.F43447@cs.selu.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Lost Disk, any way to recover data?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello all,

I just lost a disk in my lvm set, and was wondering if there is a way to
recover the data from the first disk.  I don't believe anything had been
written to an LE's on the second disk. Is there a way to mount the first
one and see if my data is still there?  Or is this a lost cause and I
should forget about it?  Thanks

Jason
