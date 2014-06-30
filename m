Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5U8b4QO016035
	for <linux-lvm@redhat.com>; Mon, 30 Jun 2014 04:37:04 -0400
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5U8b15w022509
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 30 Jun 2014 04:37:02 -0400
Received: by mail-we0-f182.google.com with SMTP id q59so7896185wes.13
	for <linux-lvm@redhat.com>; Mon, 30 Jun 2014 01:37:01 -0700 (PDT)
Received: from macbookml.ws.lrz.de (macbookml.ws.lrz.de. [129.187.15.135])
	by mx.google.com with ESMTPSA id
	hi2sm39855126wjb.29.2014.06.30.01.37.00 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 01:37:00 -0700 (PDT)
From: Matteo Lanati <matteo.lanati@gmail.com>
Message-Id: <F5727D08-8B60-4ADC-841F-D2ADD60D5033@gmail.com>
Date: Mon, 30 Jun 2014 10:36:59 +0200
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Read LVM structure of a virtual machine disk image
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,

I have a file containing a disk image of a virtual machine. One of the partitions is LVM.
I would like to read the information in there (i.e. the volume group name or the list of logical volumes) from the file itself without exposing the device through kpartx and/or qemu-nbd.
My problem is that on the same physical host I could have multiple copies of the same virtual machine running, using same VGs and LVs. Even the UUID would be the same, hence the impossibility to distinguish the two virtual machines anymore.
Of course, if I could check beforehand the structure of the disk image I could take a different decision and avoid errors.
Thanks,

Matteo
 

A refund for defective software might be nice, except it would bankrupt the entire software industry in the first year.

Andrew S. Tanenbaum, Computer Networks, 2003, Introduction, page 14

Linux registered user #463400
