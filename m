Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HGnYj18105
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 11:49:34 -0500
Received: from artemis.le.ac.uk (artemis.le.ac.uk [143.210.16.126])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HGnW4b020921
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 11:49:32 -0500
Received: from [143.210.12.128] (helo=pc-nt556.cc.le.ac.uk)
	by artemis.le.ac.uk with esmtp (Exim 4.30) id 1B3eEV-0001w4-Hw
	for linux-lvm@redhat.com; Wed, 17 Mar 2004 16:49:31 +0000
Received: from rao3 (helo=localhost)
	by pc-nt556.cc.le.ac.uk with local-esmtp (Exim 3.35 #1 (Debian))
	id 1B3eEV-0001RJ-00
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 16:49:31 +0000
Date: Wed, 17 Mar 2004 16:49:31 +0000 (GMT)
From: "R.A.Owen" <rao3@leicester.ac.uk>
Message-ID: <Pine.LNX.4.44.0403171643240.2111-100000@pc-nt556.cc.le.ac.uk>
MIME-Version: 1.0
Sender: "R.A.Owen" <rao3@leicester.ac.uk>
Subject: [linux-lvm] LVM-1.0.8 and linux-2.4.25 
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

Hello,
I am upgrading from linux-2.4.18 patched with LVM-1.0.8  to
linux-2.4.25. I see from the kernel changelog tht somewhere between
2.4.24-pre2 and 2.4.24-pre3 lvm-1.0.8 was synced with the kernel.

Should I still add the lvm-1.0.8 patch to linux-2.4.25 of is the code in
linux-2.4.25 more uptodate than the lvm-1.0.8 patch ?

Also is there an official VFS-lock patch for linux-2.4.25 or do I just
have to force the VFS-lock-2.4.20 (from lvm-1.0.8) to fit?

Any advice would be great!
Many thanks

Alex Owen
