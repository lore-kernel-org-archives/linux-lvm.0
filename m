Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6DJSI021888
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 15:28:18 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6DJSCXn012478
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 15:28:12 -0400
Received: from [127.0.0.1] (leviathan [131.128.51.64])
	by leviathan.ele.uri.edu (8.12.9/8.12.9) with ESMTP id i6DJS94h007741
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 15:28:10 -0400 (EDT)
From: Ming Zhang <mingz@ele.uri.edu>
Message-Id: <1089746889.2988.20.camel@Smeagol.geministorage.com>
Mime-Version: 1.0
Date: Tue, 13 Jul 2004 15:28:09 -0400
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] wrong data unit in lvdiskplay?
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I am not sure if this is a bug or my stupid error.

I am using lvm-1.0.3-13, which come from Fedora core 1. I created a
lvol1 with size -L 2000M. then

# lvdisplay /dev/vg1/lvol1
--- Logical volume ---
LV Name                /dev/vg1/lvol1
VG Name                vg1
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                1.95 GB
Current LE             500
Allocated LE           500
Allocation             next free
Read ahead sectors     1024
Block device           58:0

# lvdisplay -c /dev/vg1/lvol1
/dev/vg1/lvol1:vg1:3:1:0:0:4096000:500:500:0:1024:58:0
                                                                                           here i found that its size is 4096000. base on the document of lvdiskplay, this should be in KB unit. so two output from lvdisplay is mismatched. can anybody tell me why?



ming


-- 
 --------------------------------------------------
| Ming Zhang, PhD. Student
| Dept. of Electrical & Computer Engineering
| College of Engineering
| University of Rhode Island
| Kingston RI. 02881
| e-mail: mingz at ele.uri.edu
| Tel. (401) 874-2293 
| Fax. (401) 782-6422
| http://www.ele.uri.edu/~mingz/
 --------------------------------------------------
