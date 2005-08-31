Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VLGkV15052
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:16:46 -0400
Received: from smtp.aaisp.net.uk (A.painless.aaisp.net.uk [81.187.81.51])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7VLGNWi002938
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 17:16:28 -0400
Received: from ebourne.me.uk ([81.187.210.78] helo=hordein.ebourne.me.uk)
	by smtp.aaisp.net.uk with esmtp (Exim 4.43) id 1EAZwK-0007zQ-9w
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 22:16:12 +0100
Received: from avenin.ebourne.me.uk (avenin.ebourne.me.uk [192.168.66.4])
	by hordein.ebourne.me.uk (Postfix) with ESMTP id CA93612CE80
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 22:16:09 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by avenin.ebourne.me.uk (Postfix) with ESMTP id B1799C80F5
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 22:16:09 +0100 (BST)
From: Martin Ebourne <lists@ebourne.me.uk>
Content-Type: multipart/mixed; boundary="=-u1WTEereqzdzgH3sw9Cl"
Date: Wed, 31 Aug 2005 22:16:08 +0100
Message-Id: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Subject: [linux-lvm] pvmove is stuck
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
To: linux-lvm@redhat.com


--=-u1WTEereqzdzgH3sw9Cl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I've recently added a new disk and have been using pvmove to reorganise
the logical volumes. All went well until moving an active 372GB physical
volume onto the new disk. Now pvmove is stuck at 75.1% and refuses to
progress any further:

# pvmove /dev/hda1 /dev/hdd
  Detected pvmove in progress for /dev/hda1
  Ignoring remaining command line arguments
  /dev/hda1: Moved: 75.1%
  /dev/hda1: Moved: 75.1%
  /dev/hda1: Moved: 75.1%
  /dev/hda1: Moved: 75.1%
... ad infinitum (I left it going overnight)

Restarting pvmove has no effect, and I can't find any clues anywhere
(including syslog) as to what is up. The logical volumes are mounted and
in use (and NFS exported), but I believe none of that should matter, and
so were some of the others I moved earlier that worked.

I've attached the output of pvmove -vvd and lvdisplay -m in case that
helps.

Any advice on how to fix this or debug it gratefully received.

Cheers,

Martin.



--=-u1WTEereqzdzgH3sw9Cl
Content-Description: 
Content-Disposition: inline; filename=lvdisplay.txt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

  --- Logical volume ---
  LV Name                /dev/vg_hordein_bak/root
  VG Name                vg_hordein_bak
  LV UUID                r6rGXT-WOY5-d7co-KbHE-LmAc-V1ux-xFmarq
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10.00 GB
  Current LE             160
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
   
  --- Segments ---
  Logical extent 0 to 159:
    Type		linear
    Physical volume	/dev/hdb2
    Physical extents	0 to 159
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein_bak/backup
  VG Name                vg_hordein_bak
  LV UUID                PjMSKH-qRyF-WfrB-WOA5-fCCK-39gM-yyEGKm
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                248.81 GB
  Current LE             3981
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
   
  --- Segments ---
  Logical extent 0 to 3199:
    Type		linear
    Physical volume	/dev/hdb2
    Physical extents	176 to 3375
   
  Logical extent 3200 to 3980:
    Type		linear
    Physical volume	/dev/hdb2
    Physical extents	4336 to 5116
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein_bak/tmp
  VG Name                vg_hordein_bak
  LV UUID                VwK0Se-miJ8-1cOV-L8uQ-SGni-UgjA-2fyC4j
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                20.00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2
   
  --- Segments ---
  Logical extent 0 to 319:
    Type		linear
    Physical volume	/dev/hdb2
    Physical extents	5117 to 5436
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/audio
  VG Name                vg_hordein
  LV UUID                i9L0WJ-nNvx-vIl0-oXzU-qmtO-Z82s-wSeGSS
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                180.00 GB
  Current LE             2880
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3
   
  --- Segments ---
  Logical extent 0 to 2719:
    Type		linear
    Logical volume	pvmove0
    Logical extents	0 to 2719
   
  Logical extent 2720 to 2879:
    Type		linear
    Logical volume	pvmove0
    Logical extents	2720 to 2879
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/video
  VG Name                vg_hordein
  LV UUID                tBAfcE-INrd-6Apw-9Sm8-WfyE-F4SM-Tg1LCJ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                307.75 GB
  Current LE             4924
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4
   
  --- Segments ---
  Logical extent 0 to 1599:
    Type		linear
    Logical volume	pvmove0
    Logical extents	2880 to 4479
   
  Logical extent 1600 to 3080:
    Type		linear
    Logical volume	pvmove0
    Logical extents	4480 to 5960
   
  Logical extent 3081 to 4923:
    Type		linear
    Physical volume	/dev/sda2
    Physical extents	1136 to 2978
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/recording
  VG Name                vg_hordein
  LV UUID                NAPzsw-gZZf-QHV9-vJbQ-4Kk5-u6dH-2PYCUJ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                120.00 GB
  Current LE             1920
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5
   
  --- Segments ---
  Logical extent 0 to 1919:
    Type		linear
    Physical volume	/dev/sdb
    Physical extents	0 to 1919
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/root
  VG Name                vg_hordein
  LV UUID                R1y64w-TTj3-ySJv-4FWM-GlgZ-72Eb-EMbTNd
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                10.00 GB
  Current LE             160
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:6
   
  --- Segments ---
  Logical extent 0 to 159:
    Type		linear
    Physical volume	/dev/sda2
    Physical extents	0 to 159
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/swap
  VG Name                vg_hordein
  LV UUID                dwX5yR-GCFH-WKNr-DHoR-vKEa-I7JN-KTwJE6
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             16
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7
   
  --- Segments ---
  Logical extent 0 to 15:
    Type		linear
    Physical volume	/dev/sda2
    Physical extents	160 to 175
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/srv
  VG Name                vg_hordein
  LV UUID                WELq71-vloL-xIeo-orgo-JJIV-lR4Z-FQw19T
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                30.00 GB
  Current LE             480
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:8
   
  --- Segments ---
  Logical extent 0 to 479:
    Type		linear
    Physical volume	/dev/sda2
    Physical extents	176 to 655
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/home
  VG Name                vg_hordein
  LV UUID                6j9rxg-IBdZ-RchM-ekTJ-TxY6-kEd1-uwPwcg
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                30.00 GB
  Current LE             480
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:9
   
  --- Segments ---
  Logical extent 0 to 479:
    Type		linear
    Physical volume	/dev/sda2
    Physical extents	656 to 1135
   
   
  --- Logical volume ---
  LV Name                /dev/vg_hordein/pvmove0
  VG Name                vg_hordein
  LV UUID                247BqL-aEnl-ApBy-bLCf-W2Cs-1spS-GFfERx
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                372.56 GB
  Current LE             5961
  Segments               4
  Allocation             contiguous
  Read ahead sectors     0
  Block device           253:10
   
  --- Segments ---
  Logical extent 0 to 2719:
    Type		mirror
    Mirrors		2
    Mirror size		2720
    Mirror original:
      Physical volume	/dev/hda1
      Physical extents	0 to 2719
    Mirror destination:
      Physical volume	/dev/hdd
      Physical extents	0 to 2719
   
  Logical extent 2720 to 2879:
    Type		mirror
    Mirrors		2
    Mirror size		160
    Mirror original:
      Physical volume	/dev/hda1
      Physical extents	4320 to 4479
    Mirror destination:
      Physical volume	/dev/hdd
      Physical extents	2720 to 2879
   
  Logical extent 2880 to 4479:
    Type		mirror
    Mirrors		2
    Mirror size		1600
    Mirror original:
      Physical volume	/dev/hda1
      Physical extents	2720 to 4319
    Mirror destination:
      Physical volume	/dev/hdd
      Physical extents	2880 to 4479
   
  Logical extent 4480 to 5960:
    Type		mirror
    Mirrors		2
    Mirror size		1481
    Mirror original:
      Physical volume	/dev/hda1
      Physical extents	4480 to 5960
    Mirror destination:
      Physical volume	/dev/hdd
      Physical extents	4480 to 5960
   
   

--=-u1WTEereqzdzgH3sw9Cl
Content-Disposition: attachment; filename=pvmove.txt.gz
Content-Type: application/x-gzip; name=pvmove.txt.gz
Content-Transfer-Encoding: base64

H4sICExpFUMAA3B2bW92ZS50eHQA7dhBbxNXFIDRPb9ihNRlcWyRBrpL0gSBQirVpUHdRHbmxYyY
eMyMPST59bVDCkKi2C1t5as5rABNnJP7/C6fybLVr2Gaz4vpJJuU1XhU9srq4u3yj+fzm1nK5lXW
f5B97bG8qFdP9dpRffd3vbK9uv+K46JM349HTcqz+6ezNB2Ny5Q/un+il6e29yYf9X/Mll82yMrR
OJVZnubpYp7yf/LQ2mea1TOn1bd+q+buoa++zvKRwQavM97gxxqvJeebvMo68fKR9eJNx7PJK61X
bzYfokCi42Kar3ZBW5WLq5RN6moxyx62k/M3VZ2nYvrw/pVO7nfGZ6ul99v5pyezs4Mt/RmJ4ol+
uv9tNmuvqjZly/fXrK4mdWqa7LKqP2k//vP2hffx6sHFosiznbPF7uHodXFzcjtdXO88b97ejNq9
+snx4nrw+tnu0eDx3sG7k9HRtNyfHdyMTw4vzwaHTb+ZDZ8dXx79cr2VIyKKKTquFtN87cL9s/BG
F/OiHc2Latq7KppmVXnNvC5m6fyyKMv0ofdW37OoUl1X9b9yH4qnJztnL6an7XX7vNypXt++enc1
//n3J4Pm/TA9Gw63dLJEEUWb3Ydve0PPD/YvL46en9b5D/uz90+HV0/OLm+Ojh8PX/466Z8cvtjS
0RBFFG32hn41Ldc29d2jh2/Sh+c+BlBqU32T9XezJl1U07z5zz7Ab8tEiWKKfGok2l6RLUj0f4i+
+FFu9VntvE6T5Z/Om+L27n/3d/uDB5/9AC+rNi2//d7uo/53fzcb3ASibRPpAaLtFdmCRHrATSDS
AzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHn
SaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQH
iKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ
9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAX
TplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplI
DxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBF
FtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmC
RHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrA
TSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDS
AzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHn
SaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQH
iKKJ9EAXTplIDxBFFtmCRHrATSDSAzHnSaQHiKKJ9EAXTplIDxD9tegPyCrMAQCwAQA=


--=-u1WTEereqzdzgH3sw9Cl--
