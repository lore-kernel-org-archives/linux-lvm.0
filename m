Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2UC7Cj29787
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 07:07:12 -0500
Received: from net-m.de (h-213.61.219.37.host.de.colt.net [213.61.219.37])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2UC7A1X026402
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 07:07:11 -0500
From: Wiktor Wodecki <wiktor.wodecki@net-m.de>
Date: Tue, 30 Mar 2004 14:06:41 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200403301406.41500.wiktor.wodecki@net-m.de>
Subject: [linux-lvm] does a snapshot change vg metadata?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: Iulian Topliceanu <iulian.topliceanu@net-m.de>

Hello,

we have a shared scsi system here with one vg and multiple lv's in it. Some 
lv's are mounted on machine A, others on machine B. I know that I must not 
make vg changes (like shrinking, deleteing, expanding, etc. an lv) while the 
vg is active on both machines. My question is whether this "limitation" also 
applies to snapshots - Can I take them while the vg is active on two machines 
or do I risk data corruption?

I use latest lvm1 kernel patches on a 2.4.24 redhat 9.0 system.

-- 
Regards,
 
 Wiktor Wodecki
    
 net mobile AG - 40470 Duesseldorf - Germany
 923B DCF8 070C 9FDD 5E05  9AE3 E923 5A35 182C 9783
