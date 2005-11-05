Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA5IVYV19547
	for <linux-lvm@redhat.com>; Sat, 5 Nov 2005 13:31:34 -0500
Received: from svs.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA5IVW8M031719
	for <linux-lvm@redhat.com>; Sat, 5 Nov 2005 13:31:32 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svs.gsfc.nasa.gov (Postfix) with ESMTP id AF61110000A9
	for <linux-lvm@redhat.com>; Sat,  5 Nov 2005 13:31:22 -0500 (EST)
Message-ID: <436CFA6E.5000607@svs.gsfc.nasa.gov>
Date: Sat, 05 Nov 2005 13:31:10 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Failed xfs_growfs after lvextend
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I extended an LV to 12.28TB and ran xfs_growfs on the mount point, lv0.
This appeared to work fine except that after this, the filesystem didn't 
appear any larger.

rajones@mapdata<~>$ df -h /lv0
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg0-lv0   4.1T  2.9T  1.3T  70% /lv0

This was the size of the filesystem before the xfs_growfs was run and after.

Is it possible the LV or VG could be corrupted in some way?  Or is the 
problem likely with the xfs filesystem?  I've run xfs_repair on 
/dev/mapper/vg0-lv0 and it complete successfully.  I can mount the 
filesystem with no errors and see the existing data but the size still 
shows up wrong.


The System in question:

The PVs in the VG are LUNs on an external FC attached RAID unit.
The system OS is FC3 running kernel 2.6.12-1.1381_FC3smp, 
xfsprogs-2.6.13-2, lvm2-2.00.25-1.01.

What happened:

root@mapdata<~>$ lvextend -l +33528 /dev/vg0/lv0 /dev/sdi1 /dev/sdj1 
/dev/sdk1 /dev/sdl1 /dev/sdm1 /dev/sdn1

After the extend I have the following LV.

root@mapdata<~>$ lvdisplay
   --- Logical volume ---
   LV Name                /dev/vg0/lv0
   VG Name                vg0
   LV UUID                qbk6r9-RxpP-Bx9Y-joJV-4ptl-PSNE-PuXX1X
   LV Write Access        read/write
   LV Status              available
   # open                 2
   LV Size                12.28 TB
   Current LE             50292
   Segments               11
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

root@mapdata<~>$ xfs_growfs /lv0

Results in no change in the mounted filesystem size.

root@mapdata<~>$ xfs_repair -o assume_xfs /dev/mapper/vg0-lv0
Phase 1 - find and verify superblock...
bad primary superblock - inconsistent filesystem geometry information !!!

attempting to find secondary superblock...

[cut rest of xfs_repair output]


The xfs_repair finds secondary superblock and completes successfully but 
when I mount I get the same result as before:

rajones@mapdata<~>$ df -h /lv0
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg0-lv0   4.1T  2.9T  1.3T  70% /lv0


Any suggestions?

Thank you,
Randall

-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
