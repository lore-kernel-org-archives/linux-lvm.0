Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6DLom5Q020961
	for <linux-lvm@redhat.com>; Sun, 13 Jul 2008 17:50:48 -0400
Received: from eastrmmtao101.cox.net (eastrmmtao101.cox.net [68.230.240.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6DLoZ4l009721
	for <linux-lvm@redhat.com>; Sun, 13 Jul 2008 17:50:35 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080713215029.UXUX11636.eastrmmtao101.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Sun, 13 Jul 2008 17:50:29 -0400
From: Gene Czarcinski <gene@czarc.net>
Date: Sun, 13 Jul 2008 17:51:57 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807131751.57651.gene@czarc.net>
Subject: [linux-lvm] sector zero on a Logical Volume
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I am hoping that someone on this mailing list is expert enough to answer my 
question:

Is there any reason that sector 0 on a Logical Volume should not be all zeros?

I guess I am really asking if any filesystem uses sector 0 on a Logical 
Volume.

My problem occurred when I effectively dd'ed a real disk partition on which 
grub is installed to a Logical Volume.  When grub in installed into a 
partition, it not only installs it's boot code but also makes sector 0 on 
that partition have a fake "msdos" partition table and the kernel (and other 
software) does not like that at all!!

My solution was to use dd to zero sector 0 and then everything worked ... 
could mount the Logical Volume, etc.

Gene
