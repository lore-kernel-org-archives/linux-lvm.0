Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v29BECd0022975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 9 Mar 2017 06:14:12 -0500
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCBC68046E
	for <linux-lvm@redhat.com>; Thu,  9 Mar 2017 11:14:11 +0000 (UTC)
From: Eric Ren <zren@suse.com>
Message-ID: <4f9b8bba-d219-fca3-3b48-41e732044021@suse.com>
Date: Thu, 9 Mar 2017 19:12:06 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] is it right to specify '-l' with all the free PE in VG
 when creating a thin pool?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I find that it will fail to create a thin pool with all the free PE in VG as follows:

# pvs
   PV         VG   Fmt  Attr PSize   PFree
   /dev/sdb        lvm2 ---  200.00g 200.00g
# vgcreate vgtest /dev/sdb
   Volume group "vgtest" successfully created
# pvdisplay
   --- Physical volume ---
   PV Name               /dev/sdb
   VG Name               vgtest
   PV Size               200.00 GiB / not usable 32.00 MiB
   Allocatable           yes
   PE Size               4.00 MiB
   Total PE              51192
   Free PE               51192
   Allocated PE          0
   PV UUID               JD74c2-R4zZ-cgs5-c5Ty-1abQ-cf7l-gdSxzz
# lvcreate -l 51192 --thinpool thinpool0 vgtest
   Volume group "vgtest" has insufficient free space (51167 extents): 51192 required.

while it works when specifying '-l' this way:

# lvcreate -l 100%FREE --thinpool thinpool0 vgtest
   Logical volume "thinpool0" created.

Is this something by design? or something may be wrong?
I can replicate this on both:

CentOS Linux release 7.3.1611 (Core)
lvm2-2.02.166-1.el7.x86_64

and
SUSE Linux Enterprise Server 12 SP2
lvm2-2.02.120-72.8.x86_64

Thanks,
Eric
