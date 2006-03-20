Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2KArp108347
	for <linux-lvm@redhat.com>; Mon, 20 Mar 2006 05:53:51 -0500
Date: Mon, 20 Mar 2006 11:52:01 +0100
From: Per Kristiansen <per@gathering.org>
Message-ID: <20060320105201.GI17426@gathering.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Fun with powersurges
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Last night a powersupply in a storage system managed to crash EVERYTHING that was hooked up to
the same UPS, and all the non-ups'd stuff stayed up.

the ONLY item that did not survive was a infortrend A16U-G2421 (SATA to SCSI chassi) with 16
400GB disks (15 in raid5+1 hotspare)

The G4321 seems to have gotten it's config badly garbled, as it was more or less non existant
on boot.

the config was all disks in on large Logical Disk, then split up into 4 smaller logical volumes (we are
NOT talking LVM yet stay with me)

The box then exported these Logical Volumes as normal scsi devices, that I mounted on the fileserver
and used LVM2 to pull together into on large happy ReiserFS volume. (3.8TB)

Now we've just finished a lot of material so I wanted to take a backeup, but it was running at the same time
everything else crashed..whippy!

So now I'm trying to find a way to rebuild the config of this box, ive been recommended to just mount the 
Logical disk and see if I can find any partition data.

I have a vgbackup of the VG that resides on the box.

I have the sizes of the esported Logical Disks.

I NEED a wizard that knows filesystems in and out

And I will pay!
 
-- 
Per Kristiansen
per@gathering.org
