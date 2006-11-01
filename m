Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA1NX17G021692
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 18:33:01 -0500
Received: from mail.mmtab.se ([212.209.150.85])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kA1NWx9b027091
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 18:32:59 -0500
Received: from [10.0.0.145] ([212.209.150.84]) (authenticated bits=0)
	by mail.mmtab.se (8.13.7/8.13.7) with ESMTP id kA1MgK8D003292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 1 Nov 2006 23:42:20 +0100
Message-ID: <454922C3.8060902@mmtab.se>
Date: Wed, 01 Nov 2006 23:42:11 +0100
From: Per Mellander <per.m@mmtab.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] xfs_growfs after lvextend don't increase mounted size.
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

Hi!

I've got a 6.5TB xfs filesystem on a LVM2 volume. I wanted to increase
the size of the fs so I added another ~10TB to the volume. Every step
taken was successfull, (ie no errors) but the filesystem size remained
unchanged even after the xfs_growfs.

What I did was the following:

I extended the lvm using pvcreate, vgextend and finally lvextend. pvscan
gives:

   PV /dev/sda1   VG vg01   lvm2 [1.59 TB / 0    free]
   PV /dev/sdb1   VG vg01   lvm2 [1.59 TB / 0    free]
   PV /dev/sdc1   VG vg01   lvm2 [1.59 TB / 0    free]
   PV /dev/sdd1   VG vg01   lvm2 [1.59 TB / 0    free]
   PV /dev/sde1   VG vg01   lvm2 [2.00 TB / 0    free]
   PV /dev/sdf1   VG vg01   lvm2 [2.00 TB / 0    free]
   PV /dev/sdg1   VG vg01   lvm2 [2.00 TB / 0    free]
   PV /dev/sdh1   VG vg01   lvm2 [2.00 TB / 0    free]
   PV /dev/sdi1   VG vg01   lvm2 [1.55 TB / 0    free]
   Total: 9 [15.91 TB] / in use: 9 [15.91 TB] / in no VG: 0 [0   ]

and lvdisplay:

   --- Logical volume ---
   LV Name                /dev/vg01/lv01
   VG Name                vg01
   LV UUID                rDSEQ3-DdhV-oLci-nNYT-dMdX-cppA-7v1r3e
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                15.91 TB
   Current LE             4169996
   Segments               9
   Allocation             inherit
   Read ahead sectors     0
   Block device           253:0

After xfs_growfs /vol1 ( mounted fs ) df -h gives:

/dev/mapper/vg01-lv01
                       6.4T  6.4T   36G 100% /vol1

The fs remains in previous size!!

# cat /sys/block/dm-0/size
34160607232

which is equal to 15.91 TB

Have I missed something when I extended the volume / growed the xfs fs?

The system running xfs is a Fedora Core 4, 2.6.15-1.1831_FC4smp,
lvm2-2.01.08-2.1, xfsprogs-2.6.13-4

Per

_________________________________
This email has been ClamScanned !
          www.clamav.net
