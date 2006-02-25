Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1PI1o101238
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 13:01:50 -0500
Received: from excite.com (nn5.excitenetwork.com [207.159.120.59])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1PI1n3A004056
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 13:01:49 -0500
From: "binky123@excite.com" <binky123@excite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <20060225180135.E9E8D1E427@xprdmailfe24.nwk.excite.com>
Date: Sat, 25 Feb 2006 13:01:35 -0500 (EST)
Subject: [linux-lvm] LVM2 + Pair GNBD on FC4
Reply-To: binky123@excite.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


On a standard FC4 2.6.15-1.1831_FC4smp build, I'm trying to get
LVM2(lvm2-2.01.08-2.1) to work on a pair of gnbd(gnbd-1.0.2) imported devices.  I'm able to create a volume group and logical volume
from one gnbd device and I'm able to create an XFS filesystem on it.
I then extend the volume group with another gnbd device and recreate the logical volume to use the full # of extents.  This works.  I now
try to create an XFS or an EXT3 filesystem on top of the logical
volume and the mkfs process seems to go into a disk wait mode.  ssh access to the machine is still ok, any LVM2 command will hang, sync command will hang.

Any suggestions on what is happening, debug suggestions or if anyone else has done something similar to this? Thanks.




_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
