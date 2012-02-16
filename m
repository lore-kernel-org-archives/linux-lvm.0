Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1GDoItr024721
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 08:50:18 -0500
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1GDo90r010557
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 08:50:10 -0500
Received: by bkcjm19 with SMTP id jm19so2766960bkc.33
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 05:50:09 -0800 (PST)
Message-ID: <4F3D098F.4010709@profitbricks.com>
Date: Thu, 16 Feb 2012 14:50:07 +0100
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Allocation Policy for Cloud Computing needed
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

Hi LVM list,

I'm experimenting with storage for many QEMU/KVM virtual machines in
cloud computing. I've got many concurrent IO processes and 24 hard
drives. I've tested the scalability with a single IO reader process per
hard drive. Single drives scale best and have the best performance of
cause, but we need mirroring and volume management. So I've created MD
RAID-1 arrays and created on each a VG and two LVs. This gives me good
overall performance (up to 2 GB/s, HBA limit: 2.2 GB/s).

Then, I've tested to put all my RAID-1 arrays into a single VG, because
LV size should be adjustable over all hard drives. I've tried all
allocation policies but none does what I want to achieve here. Yeah,
that this isn't implemented fully is in the man page, ... .

I want to have an allocation which distributes the LVs equally over the
PVs as long as space is left and LVs aren't resized. The goal is to
minimize the number of concurrent IO processes per hard drive (striping
is total crap in this situation).

I've tested LVM2 2.02.66 and kernel 3.0.15. Is something like that
implemented in newer releases or is something like that intended to be
implemented in near future? Or does someone want to implement this
together with me?

Thanks, cheers,

Sebastian

-- 
Sebastian Riemer
Linux Kernel Developer

ProfitBricks GmbH
Greifswalder Str. 207
10405 Berlin, Germany

Tel.:  +49 - 30 - 60 98 56 991 - 303
Fax:   +49 - 30 - 51 64 09 22
Email: sebastian.riemer@profitbricks.com
Web:   http://www.profitbricks.com/

RG: Amtsgericht Charlottenburg, HRB 125506 B
GF: Andreas Gauger, Achim Weiss
