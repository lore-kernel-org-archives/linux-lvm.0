Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5JLOC017292
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 17:24:12 -0400
Received: from cse.uta.edu (cse.uta.edu [129.107.12.1])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5JLO5e1016402
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 17:24:05 -0400
Received: from Debug (cse [129.107.12.1])
	by cse.uta.edu (8.12.9/8.12.9) with SMTP id i5JLNqmv007695
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 16:23:52 -0500 (CDT)
Message-Id: <200406192123.i5JLNqmv007695@cse.uta.edu>
From: arajendr@cse.uta.edu
Date: Sat, 19 Jun 2004 16:23:52 US/Central
Subject: [linux-lvm] lvcreate complains and fails
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi. I'm sure this has been asked a million times. 
I'm running LVM2 on a 2.6.6 kernel running debian. The LVM tools are
standard debian sid distribution. I have dm_mod.o in the kernel. Modprobe
tells me dev mapper is in the kernel.

I even created the file /dev/mapper/control with major and minor numbers
taken from /proc/devices and /proc/misc respectively.

Yet when I run lvcreate it gives me an error saying no /dev/mapper/control.
One other error it gives me is Incompatible libdevmapper 1.00.17-ioctl, and
kernel driver.

Could this be the problem its not creating logical volumes? If so, any way
to resolve it?

Thanks,
Anoop

----------------------------------------------------------
This message was sent from cse.uta.edu using
Endymion MailMan. http://www.endymion.com/products/mailman/
