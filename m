Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4IM50qc006663
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 18:05:00 -0400
Received: from vms046pub.verizon.net (vms046pub.verizon.net [206.46.252.46])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4IM4wMi029536
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 18:04:58 -0400
Received: from bollocks.perusion.net ([68.238.134.230])
	by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0JI900AI5BZOAT91@vms046.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 18 May 2007 17:04:36 -0500 (CDT)
Date: Fri, 18 May 2007 15:04:35 -0700
From: Greg Hanson <greg@perusion.com>
Message-id: <464E22F3.5040108@perusion.com>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] difference in space used
Reply-To: Greg <greg@valuemedia.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi all,

Very new to LVM, running into the following problem: We have a logical 
volume /dev/mapper/vg0-lv2 mounted on /log. While the disk usage for the 
/log shows only about 23 megs, running  df for the logical volume is 
showing over 1 gig. 

The logical volume was previously set to 6 gigs, and when the /log mount 
point only had 123 megs, the LV was full.

We redirected the output from /log to another location, unmounted 
/dev/mapper/vg0-lv2, ran fsck, extended the LV to 12 gigs and remounted.

But now the system is filling up again quickly as shown below.
 
 [root@newbox1 ~]# df -T
Filesystem    Type   1K-blocks      Used Available Use% Mounted on
/dev/sda1     ext3    12389324   7195644   4564336  62% /
none         tmpfs     1037404         0   1037404   0% /dev/shm
/dev/mapper/vg0-lv0
              ext3    15118728   1890900  12459828  14% /var/lib
/dev/mapper/vg0-lv1
              ext3     5039616    728048   4055568  16% /home
10.202.2.100:/share1
               nfs   352982176 125698112 226931088  36% /snap
/dev/mapper/vg0-lv4
              ext3    71523868  25955308  41935408  39% /backup
/dev/mapper/vg0-lv2
              ext3    12385456   1411556  10470584  12% /log


[root@newbox1 ~]# df /log/
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/vg0-lv2   12385456   1391740  10490400  12% /log

[root@newbox1 ~]# du /log/
16      /log/lost+found
23696   /log/httpd
23716   /log/

[root@newbox1 ~]# vgdisplay
  --- Volume group ---
  VG Name               vg0
  System ID            
  Format                lvm2
  Metadata Areas        10
  Metadata Sequence No  18
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               4
  Max PV                0
  Cur PV                10
  Act PV                10
  VG Size               107.51 GB
  PE Size               4.00 MB
  Total PE              27522
  Alloc PE / Size       25812 / 100.83 GB
  Free  PE / Size       1710 / 6.68 GB
  VG UUID               2WzghL-C7Nf-17oy-ISA9-hZu4-Bhtc-WvHF8Z

[root@newbox1 ~]# lvdisplay /dev/vg0/lv2
  --- Logical volume ---
  LV Name                /dev/vg0/lv2
  VG Name                vg0
  LV UUID                DHb2dZ-zYpx-bipG-rjmL-CxBu-q0At-1oOBJB
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                12.00 GB
  Current LE             3072
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2

Any ideas as to what could be going on?

Thank you,

Greg

-- 
Greg Hanson
1506 Gilbert Ave
Coeur d'Alene, ID 83815

email		greg@valuemedia.com
Phone		208-667-2442
Toll Free	800-949-1889
Fax		775-256-2231
