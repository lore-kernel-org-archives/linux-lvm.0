Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o67KxS61003369
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 16:59:28 -0400
Received: from ucsc.edu (email-prod-out-1.ucsc.edu [128.114.129.85])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o67KxIlo011940
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 16:59:18 -0400
Received: from [128.114.125.121] (HELO ucsc.edu)
	by email-prod-out-1.ucsc.edu (CommuniGate Pro SMTP 5.2.13)
	with ESMTPS id 14751035 for linux-lvm@redhat.com;
	Wed, 07 Jul 2010 13:59:18 -0700
Received: from [128.114.25.211] (account ermorris@ucsc.edu HELO
	dhcp-25-211.ucsc.edu)
	by email-prod-fe-2.ucsc.edu (CommuniGate Pro SMTP 5.2.13)
	with ESMTPSA id 373755441 for linux-lvm@redhat.com;
	Wed, 07 Jul 2010 13:59:07 -0700
From: Eli Morris <ermorris@ucsc.edu>
Date: Wed, 7 Jul 2010 13:59:07 -0700
Message-Id: <6565F032-9765-4325-B7E7-CC2E5BB4194C@ucsc.edu>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] 'not usable' value radically increased
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

Hi All,

I have several raid units that are combined into a single LVM volume. Each RAID is a physical volume and then the physical volumes are combined to form one large volume. For some reason, all of a sudden, one of the PVs has 12.00 TB of its space marked as 'not usable' and that space is missing from my XFS file system, which used to be 63 TB, but is now 51 TB total. About 7 TB of this 'lost' space is data. About 4 TB should be free space.

Here is the relevant output from pvdisplay:

[root@nimbus ~]# pvdisplay
 --- Physical volume ---
 PV Name               /dev/sdc1
 VG Name               vg1
 PV Size               12.73 TB / not usable 12.00 TB
 Allocatable           yes (but full)
 PE Size (KByte)       4096
 Total PE              3337859
 Free PE               0
 Allocated PE          3337859
 PV UUID               sDWFWu-fJ5u-wITT-ikmU-6ytD-OdUf-pHnRd1



I haven't a clue as to why out of 12.73 TB, 12 TB is unusable. One would think it would be all or nothing. The /dev/sdc1 shows up in lsscsi.

I hope some expert can help me out with this. I'm stumped (and a little freaked out).

thanks,

Eli
