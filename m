Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4UEwgat030472
	for <linux-lvm@redhat.com>; Wed, 30 May 2007 10:58:42 -0400
Received: from omega.jtlnet.com (omega.jtlnet.com [69.36.9.168])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4UEwdFr023165
	for <linux-lvm@redhat.com>; Wed, 30 May 2007 10:58:40 -0400
Message-ID: <465D910E.70908@tgharold.com>
Date: Wed, 30 May 2007 10:58:22 -0400
From: Thomas Harold <tgh@tgharold.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM, Software RAID, and arrays larger then 2TB?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I suspect that I'm running into a 2TB (2 terabyte) issue with LVM2 
(lvm2-2.02.16).  Or at least possibly an issue with the pvscan and 
pvdisplay commands.

I have (12) 500GB drives pulled together into a 10-disk (+2 hot spares) 
RAID10 volume using mdadm & Software RAID.

# cat /proc/partitions
8 48 488386584 sdd
8 49 488384001 sdd1
8 64 488386584 sde
8 65 488384001 sde1
8 80 488386584 sdf
8 81 488384001 sdf1
8 96 488386584 sdg
8 97 488384001 sdg1
8 112 488386584 sdh
8 113 488384001 sdh1
8 128 488386584 sdi
8 129 488384001 sdi1
8 144 488386584 sdj
8 145 488384001 sdj1
8 160 488386584 sdk
8 161 488384001 sdk1
8 176 488386584 sdl
8 177 488384001 sdl1
8 192 488386584 sdm
8 193 488384001 sdm1
8 208 488386584 sdn
8 209 488384001 sdn1
8 224 488386584 sdo
8 225 488384001 sdo1

# cat /proc/mdstat
md7 : active raid10 sdo1[10](S) sdn1[11](S) sdm1[9] sdl1[8] sdk1[7] 
sdj1[6] sdi1[5] sdh1[4] sdg1[3] sdf1[2] sde1[1] sdd1[0]
2441919680 blocks 32K chunks 2 near-copies [10/10] [UUUUUUUUUU]

So I created the PV and VGs on /dev/md7.

# /usr/sbin/pvscan
PV /dev/md7 VG vg2 lvm2 [2.27 TB / 2.27 TB free]
PV /dev/md6 VG vg lvm2 [353.39 GB / 47.97 GB free]
Total: 2 [634.18 GB] / in use: 2 [634.18 GB] / in no VG: 0 [0 ]

That looks like my first clue that LVM2 is having difficulties. Instead 
of the "Total:" line reporting correct totals, it seems to be only 
adding up 276GB (0.27TB) + 353GB to come up with the 634GB number 
(approximately).

The "pvdisplay" command also indicates trouble.

# /usr/sbin/pvdisplay
--- Physical volume ---
PV Name /dev/md7
VG Name vg2
PV Size 280.80 GB / not usable 8192.00 EB
Allocatable yes
PE Size (KByte) 4096
Total PE 596171
Free PE 596171
Allocated PE 0
PV UUID XR5Nvm-tuuK-ZXld-zCYE-Kplf-K9Fy-HacLbD

--- Physical volume ---
PV Name /dev/md6
VG Name vg
PV Size 353.39 GB / not usable 2.25 MB
Allocatable yes
PE Size (KByte) 4096
Total PE 90467
Free PE 12280
Allocated PE 78187
PV UUID jnjZDc-rcFe-NBy8-gYmZ-dOYM-oPq6-PexnS5

It is only showing 280GB in the "vg2" volume group out of 2.27TB. With a 
huge and ridiculous number in the "not usable" section.

...

So, am I correct in thinking that there are issues here? And that maybe 
I need to boost my "PE" size from 4096 up to 8192 or 16384?  What is the 
maximum number of "Total PE" before you run into trouble?

...

I've read through the following past list posts:

http://www.redhat.com/archives/linux-lvm/2006-January/msg00007.html
[linux-lvm] Physical extent size <-> ~256GB limit
(unanswered post from Jan 2006)

http://www.redhat.com/archives/linux-lvm/2005-January/msg00056.html
[linux-lvm] understanding large LVM volumes
(a better thread from Jan 2005)
