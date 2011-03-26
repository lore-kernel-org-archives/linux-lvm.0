Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2Q4P3uw003612
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:25:03 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q4OwYd031754
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:24:58 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2Q4OuBB024629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:24:57 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2Q4OuMn025936
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:24:56 -0400
Date: Sat, 26 Mar 2011 00:24:56 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Powerfailure and snapshot consistency
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

At a production site, there was a power failure, and the UPS battery 
wasn't up to the job.  There was a backup running, but otherwise things 
were quiet.

The production system came up fine, but the test system, which was running 
from a snapshot, had a corrupted filesystem.  The PVs are md raid1.  One 
of the PVs had to resync when power was restored.

My theory about what happened to the test system is this: the origin and 
snapshot were on different PVs.  The origin was writing as part of the 
backup process, and some blocks that were supposed to be copied to the COW 
didn't get copied, but were written to the origin.  This would result in
an inconsistent image for the snapshot.

Assuming my theory is correct, the morals would be:

1) don't run production on a snapshot :-)

2) make sure important LVs do not span multiple PVs (except for LVM
    mirroring) - you could be unhappy in the event of a system crash.

While I can peruse lvdisplay --maps manually, is there a tool that 
highlights LVs that span multiple PVs?

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
