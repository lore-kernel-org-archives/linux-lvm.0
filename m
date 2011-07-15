Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6FDmaUj010760
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 09:48:37 -0400
Received: from mail-yi0-f46.google.com (mail-yi0-f46.google.com
	[209.85.218.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6FDmaVB029754
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 09:48:36 -0400
Received: by yia27 with SMTP id 27so663636yia.33
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 06:48:36 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 Jul 2011 06:48:36 -0700
Message-ID: <CAH5HgO9aRwAsjH2hprM=HhnKhZV4h1hewNp8G_VEm0Fvs8bptQ@mail.gmail.com>
From: Tom Epperly <tepperly@gmail.com>
Subject: [linux-lvm] Recovery from a failed motherboard
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I had a Linux system that I used for backups running Bacula. It had
two physical volumes (actual separate SATA hard disks) that were
combined into a logical volume group. The motherboard of this system
is dead, but there is some reason to believe the physical hard disks
may be fine.

I am wondering if there is a way I can plug these two physical disks
into another Linux box and access the file system that's on the
logical volume group. I looked at the LVM FAQ about moving groups, but
it assumes you can run commands on the old system before moving to the
new system. In this case, the old system is gone.

Regards,

Tom
