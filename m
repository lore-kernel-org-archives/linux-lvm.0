Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38EL5j31586
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 10:21:05 -0400
Received: from hotmail.com (bay16-dav32.bay16.hotmail.com [65.54.186.212])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38EL3Gl027475
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 10:21:04 -0400
From: "sachin" <sachindurge@hotmail.com>
Date: Thu, 8 Apr 2004 19:57:07 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <BAY16-DAV32wB0jTj7z000022e2@hotmail.com>
Subject: [linux-lvm] Meaning of strict allocation
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

Hi

when I  executed the lvdisplay command  i get the following output

--- Logical volume ---
LV Name                /dev/vg/lv1
VG Name                vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                4 GB
Current LE             1024
Allocated LE           1024
Stripes                4
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     1024
Block device           58:0

Can any one tell  me what that ALLOCATION next free means
and also what strict allocation means.

I also tried lvdisplay  with -v option

it gives me read and writes
What that exactly means 
      1. No of read and write operation
      2  No of blocks transferd 
      3. No of sectors read or written 

One more thing  this io statics is from which time 
     1. bootup time
     2. lv creation time

Thanks
Sachin. 
