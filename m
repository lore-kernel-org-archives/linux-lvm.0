Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3L5k85h023771
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 01:46:08 -0400
Received: from Ishtar.sc.tlinx.org
	(173-164-175-65-SFBA.hfc.comcastbusiness.net [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3L5joHV030327
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 01:45:51 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o3L5jl1l014247
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 22:45:50 -0700
Message-ID: <4BCE910C.5020108@tlinx.org>
Date: Tue, 20 Apr 2010 22:45:48 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] volume developing problems even though should be
	static...
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I needed extra space on my home partition, and speed, so I disabled my
 snapshoting cron job and deleted any logical jobs for now.

But during this transition time, I've started getting some were symptoms.
Now when I do a "pvs", I see:

# pvs
  /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
  PV         VG   Fmt  Attr PSize   PFree  
  /dev/sdb1  Home lvm2 a-   888.48G      0 
  /dev/sdb2  Home lvm2 a-   888.48G 640.96G
  /dev/sdb3  Home lvm2 a-   584.87G 584.87G
# vgs
  /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error
  VG   #PV #LV #SN Attr   VSize VFree
  Home   3   7   6 wz--n- 2.31T 1.20T
# lvs
  /dev/dm-1: read failed after 0 of 4096 at 0: Input/output error                      
  lvol0               Home -wi-ao  1.00T                                      

-----------------------------------------------
So, the "output of the commands looks mostly 'right', as near as I can tell: 3 physical volumes, 
-> 1 volume group with the 3 volumes, and
1 logical volume taking up space in that pv (only using part of the space).

What I don't get and what worries me a fair amount are the I/O errors --
any idea what's going on and how I shoudl fix this?

Thanks much!
linda
