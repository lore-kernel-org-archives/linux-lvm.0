Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8ANPOkm025371
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 19:25:24 -0400
Received: from destar.net (mail.destar.net [12.12.38.18])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8ANPB3X005150
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 19:25:12 -0400
Message-ID: <20090910152510.20691nc1e7608sm8@www.destar.net>
Date: Thu, 10 Sep 2009 15:25:10 -0800
From: jonr@destar.net
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello List,

I don't get it!

I have a xen system that has a DomU of FC11 with a 20GB LV for the  
disk. I created a snapshot using this command:

lvcreate -L +10G -s -n s_cgate-be1 /dev/xenvg/cgate-be1

This is the output of an 'lvdisplay' of the snapshot LV:

lvdisplay /dev/xenvg/s_cgate-be1
   --- Logical volume ---
   LV Name                /dev/xenvg/s_cgate-be1
   VG Name                xenvg
   LV UUID                7c1kEs-xYoO-Qxem-2E2M-hlee-pc4Q-zm6TZ5
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/xenvg/cgate-be1
   LV Status              available
   # open                 2
   LV Size                20.00 GB
   Current LE             5120
   COW-table size         10.00 GB
   COW-table LE           2560
   Allocated to snapshot  0.11%
   Snapshot chunk size    4.00 KB
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           253:15

I then shutdown the DomU and pointed the 'Disk...' line in the config  
file for the DomU to the snapshot. It boots.

OK, I must be missing the simple answer because I cannot seem to grasp  
the concept of snapshots.


1. How can I have a 20GB LV as a disk and the snapshot be 10GB and  
boot the entire OS?

2. Can I create a DomU and then snapshot the LV and use the snapshot  
to create other DomU's?

3. If 2 is yes, would I want to continue using the snapshot as the  
disk or is there something else that should be done, i.e. dd the drive  
to a new LV?

In the 'lvdisplay' of the snapshot I have these extra lines:
   LV snapshot status     active destination for /dev/xenvg/cgate-be1
   # open                 2
   COW-table size         10.00 GB
   COW-table LE           2560
   Allocated to snapshot  0.11%
   Snapshot chunk size    4.00 KB

4. Does the 0.11% mean that the 10GB snapshot file is only using .11%  
of the 10GB LV?


If there is a good doc out there explaining all of this could someone  
just post a link. I don't mind reading but am not getting the answers  
to the above. I have found lots of docs explaining how to do it but  
nothing going much further than that.

Thanks for any help,

Jon
