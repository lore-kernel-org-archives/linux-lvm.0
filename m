Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7B5eTa12352
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 01:40:29 -0400
Received: from smtp.pspl.co.in (www.pspl.co.in [202.54.11.65] (may be forged))
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7B5eMXn032674
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 01:40:23 -0400
Received: from persistent.co.in ([10.44.50.16]) (authenticated bits=0)
	by smtp.pspl.co.in (8.12.9/8.12.9) with ESMTP id i7B5eDD3005342
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 11:10:18 +0530
Message-ID: <4119B135.6000702@persistent.co.in>
Date: Wed, 11 Aug 2004 11:10:05 +0530
From: sridhar <sridhar_surampudi@persistent.co.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend problem in linux 2.6.7
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
To: linux-lvm@redhat.com

hi,
  i created a volume group(vg1) and a logical volume(lvm1) for two 
partitions. i am able to add and remove one more partition to
existing  volume group (vg1). But i am unable to extend the logical
volume (lvm1) and getting errors while using command lvextend.
i am using linux 2.6.7 kernel and installed device-mapper and LVM2
from  http://sources.redhat.com/pub/lvm2 and 
http://sources.redhat.com/pub/db

please reply me asap,

regards
sridhar.
