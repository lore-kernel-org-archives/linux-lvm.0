Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66A37012940
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 06:03:07 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.101])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i66A31Xn011707
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 06:03:01 -0400
Received: from northrelay02.pok.ibm.com (northrelay02.pok.ibm.com
	[9.56.224.150])
	by e1.ny.us.ibm.com (8.12.10/NS PXFA) with ESMTP id i66A2tCc496202
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 06:02:55 -0400
Received: from in.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by northrelay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i66A3xaH094836
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 06:04:04 -0400
Message-ID: <40EA7997.73FF330@in.ibm.com>
Date: Tue, 06 Jul 2004 15:36:15 +0530
From: Sachin Sant <sachinp@in.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm problem..
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

Steps to Reproduce:
   configure logical volume 
vgscan
pvcreate /dev/hdc1
vgcreate vg1 /dev/hdc1
lvcreate -n lv001 -L 1000G vg1

After a reboot  when the machine comes up i see these messages 

Remounting root filesystem in read-write mode:  [  OK  ]
Setting up Logical Volume Management: modprobe: modprobe: Can't locate
module 
block-major-43
modprobe: modprobe: Can't locate module block-major-43
modprobe: modprobe: Can't locate module block-major-43
modprobe: modprobe: Can't locate module block-major-43

After adding the line " alias block-major-43 off" i can turn off these
messages.
 
Question :
   Why is lvm looking for this block major 43 device [ nbd ]. Does it
scan all the block major devices to locate pv's.

I am using LVM 1.0.8 on RHEL 3.

-- 
Thanks
-Sachin
-----------------------------------
Sachin Sant
Linux Technology Center
IBM Software Lab
Bangalore, INDIA.

sachinp@in.ibm.com
Ph: 91-80-5044647
-----------------------------------
