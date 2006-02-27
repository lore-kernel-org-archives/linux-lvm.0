Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1RJ3G114611
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 14:03:16 -0500
Received: from excite.com (nn2.excitenetwork.com [207.159.120.56])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1RJ3G0m025717
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 14:03:16 -0500
Subject: RE: [linux-lvm] LVM2 + Pair GNBD on FC4
From: "binky123@excite.com" <binky123@excite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <20060227180812.B22C391FDA@xprdmxin.myway.com>
Date: Mon, 27 Feb 2006 13:08:12 -0500 (EST)
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


Does anybody have any suggestions on what I can use to coalesce partitions together from 3 PC's?  I didn't have much luck over
the weekend on my tests.

Testing Summary on 3 PCs with 2 2TB real partitions each:
local 2TB                   + LVM(2 devices)     : OK
GNBD 2TB(4 imports 2 PCs)   + LVM(6 devices)     : FAIL(mkfs xfs)
GNBD 2TB(2 imports 2 PCs)   + LVM(2 devices)     : FAIL(dd ok,
                                                   mkfs xfs fails)
GNBD 2TB(2 imports 2 PCs)   + MD(2 devices)      : FAIL(dd ok,
                                                   mkfs xfs fails)
GNBD 2TB(2 imports same PC) + LVM(2 devices)     : FAIL(mkfs xfs)
GNBD 2TB(2 imports same PC) + MD(2 devices)      : FAIL(dd 100000 ct ok,
                                                   mkfs xfs fails,
                                                   mkfs ext3 fails)
GNBD 4TB(1 import linear array) + LVM(1 device)  : FAIL(mkfs xfs)
GNBD 4TB(1 import linear array)                  : FAIL(dd 5000 ct ok,
                                                   mkfs xfs fails)
GNBD 2TB(1 import)    + LVM(1 device)  : OK(dd,mkfs xfs on LVM device)
GNBD 2TB(1 import)                     : OK(dd,mkfs xfs on gnbd device)

Testing Summary on 1 PC with 2 2TB partitions and 1 PC with 4 .37GB partitions:
local 2TB                   + LVM(2 devices)     : OK
GNBD .37GB(4 imports 2 PCs) + LVM(6 devices)     : not tested
GNBD .37GB(2 imports same PC) + LVM(2 devices)   : FAIL(dd ok, mkfs xfs fails,
                                                   mkfs xfs waiting for fsync(),
                                                   mkfs reiserfs ok,
                                                   mount reiserfs fails)
GNBD .37GB(2 imports same PC) + MD(2 devices)    : OK(dd,mkfs xfs on MD device,
                                                   mkfs reiserfs ok,
                                                   mount reiserfs fails)
GNBD .74GB(1 import linear array) + LVM(1 device): FAIL(mkfs xfs fails,
                                        dd ok)
GNBD .74GB(1 import linear array)      : OK(dd,mkfs xfs on gnbd device)
GNBD .37GB(1 import)  + LVM(1 device)  : OK(dd,mkfs xfs on LVM device)
GNBD .37GB(1 import)                   : OK(dd,mkfs xfs on gnbd device)




 --- On Sat 02/25, binky123@excite.com < binky123@excite.com > wrote:
From: binky123@excite.com [mailto: binky123@excite.com]
To: linux-lvm@redhat.com
Date: Sat, 25 Feb 2006 13:01:35 -0500 (EST)
Subject: [linux-lvm] LVM2 + Pair GNBD on FC4

<br>On a standard FC4 2.6.15-1.1831_FC4smp build, I'm trying to get<br>LVM2(lvm2-2.01.08-2.1) to work on a pair of gnbd(gnbd-1.0.2) imported devices.  I'm able to create a volume group and logical volume<br>from one gnbd device and I'm able to create an XFS filesystem on it.<br>I then extend the volume group with another gnbd device and recreate the logical volume to use the full # of extents.  This works.  I now<br>try to create an XFS or an EXT3 filesystem on top of the logical<br>volume and the mkfs process seems to go into a disk wait mode.  ssh access to the machine is still ok, any LVM2 command will hang, sync command will hang.<br><br>Any suggestions on what is happening, debug suggestions or if anyone else has done something similar to this? Thanks.<br><br><br><br><br>_______________________________________________<br>Join Excite! - http://www.excite.com<br>The most personalized portal on the Web!<br><br><br>_______________________________________________<br>linux-lv!
m 
mailing list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
