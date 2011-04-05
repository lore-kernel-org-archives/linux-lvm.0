Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p35MgAmV011699
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 18:42:10 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p35Mg5Ee028109
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 18:42:05 -0400
Received: from anubis.ankh.org ([172.22.128.3])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7Ewm-0006Nr-41
	for linux-lvm@redhat.com; Tue, 05 Apr 2011 23:42:04 +0100
Message-ID: <4D9B9AB9.8070202@ankh.org>
Date: Tue, 05 Apr 2011 22:42:01 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>
	<4D9B8B5A.2070104@abpni.co.uk>
In-Reply-To: <4D9B8B5A.2070104@abpni.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 05/04/2011 21:36, Jonathan Tripathy wrote:
> Hi James,
>
> Interesting, didn't know you could do that! However, how do I know 
> that the PEs aren't being used by LVs? Also, could you please explain 
> the syntax? Normally to create a snapshot, I would do:
>
> lvcreate -L20G -s -n backup /dev/vg0/customerID
>

Hmmm well you have two options, you could use pvdisplay --map or 
lvdisplay --map to work out exactly which PEs have been used to build 
you snapshot cow and then use that information to allow you to create a 
blanking PV in the same place or you could do it the easy way :-

1 hog the space to specific PEs
2 delete the hog
3 create the snapshot on same PEs
4 backup
5 delete the snapshot
6 create the hog on the same PEs
7 zero the hog

This has the advantage that the creation commands will fail if the PEs 
you want are not available the problem with it is you probably need more 
space for snapshots. As its less flexible in space use. Below i have 
illustrated all the commands, you need to do this. you don;t need all 
the display commands but they are there to prove to you this has worked, 
and the lvs are in the same place.

#pvdisplay --map /dev/cciss/c0d1p1
   --- Physical volume ---
   PV Name               /dev/cciss/c0d1p1
   VG Name               test_vg
   PV Size               683.51 GB / not usable 5.97 MB
   Allocatable           yes
   PE Size (KByte)       131072
   Total PE              5468
   Free PE               4332
   Allocated PE          1136
   PV UUID               YXjplf-EfLh-8Jkr-2utT-gmi5-gjAH-UOCcN0

   --- Physical Segments ---
   Physical extent 0 to 15:
     Logical volume      /dev/test_vg/test_lv
     Logical extents     0 to 15
   Physical extent 16 to 815:
     Logical volume      /dev/test_vg/mail_lv
     Logical extents     0 to 799
   Physical extent 816 to 975:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     0 to 159
   Physical extent 976 to 2255:
     FREE
   Physical extent 2256 to 2335:
     Logical volume      /dev/test_vg/srv_lv
     Logical extents     0 to 79
   Physical extent 2336 to 2415:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     160 to 239
   Physical extent 2416 to 5467:
     FREE

#lvcreate -l 20 -n hog_lv test_vg /dev/cciss/c0d1p1:5448-5467

#pvdisplay --map /dev/cciss/c0d1p1
   --- Physical volume ---
   PV Name               /dev/cciss/c0d1p1
   VG Name               test_vg
   PV Size               683.51 GB / not usable 5.97 MB
   Allocatable           yes
   PE Size (KByte)       131072
   Total PE              5468
   Free PE               4312
   Allocated PE          1156
   PV UUID               YXjplf-EfLh-8Jkr-2utT-gmi5-gjAH-UOCcN0

   --- Physical Segments ---
   Physical extent 0 to 15:
     Logical volume      /dev/test_vg/test_lv
     Logical extents     0 to 15
   Physical extent 16 to 815:
     Logical volume      /dev/test_vg/mail_lv
     Logical extents     0 to 799
   Physical extent 816 to 975:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     0 to 159
   Physical extent 976 to 2255:
     FREE
   Physical extent 2256 to 2335:
     Logical volume      /dev/test_vg/srv_lv
     Logical extents     0 to 79
   Physical extent 2336 to 2415:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     160 to 239
   Physical extent 2416 to 5447:
     FREE
   Physical extent 5448 to 5467:
     Logical volume      /dev/test_vg/hog_lv
     Logical extents     0 to 19

#lvremove /dev/test_vg/hog_lv
Do you really want to remove active logical volume hog_lv? [y/n]: y
   Logical volume "hog_lv" successfully removed
#lvcreate -l 20 -s -n data_snap /dev/test_vg/data_lv 
/dev/cciss/c0d1p1:5448-5467
   Logical volume "data_snap" created
#pvdisplay --map /dev/cciss/c0d1p1
                                    --- Physical volume ---
   PV Name               /dev/cciss/c0d1p1
   VG Name               test_vg
   PV Size               683.51 GB / not usable 5.97 MB
   Allocatable           yes
   PE Size (KByte)       131072
   Total PE              5468
   Free PE               4312
   Allocated PE          1156
   PV UUID               YXjplf-EfLh-8Jkr-2utT-gmi5-gjAH-UOCcN0

   --- Physical Segments ---
   Physical extent 0 to 15:
     Logical volume      /dev/test_vg/restricted_lv
     Logical extents     0 to 15
   Physical extent 16 to 815:
     Logical volume      /dev/test_vg/mail_lv
     Logical extents     0 to 799
   Physical extent 816 to 975:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     0 to 159
   Physical extent 976 to 2255:
     FREE
   Physical extent 2256 to 2335:
     Logical volume      /dev/test_vg/srv_lv
     Logical extents     0 to 79
   Physical extent 2336 to 2415:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     160 to 239
   Physical extent 2416 to 5447:
     FREE
   Physical extent 5448 to 5467:
     Logical volume      /dev/test_vg/data_snap
     Logical extents     0 to 19


#lvdisplay /dev/test_vg/data_snap
   --- Logical volume ---
   LV Name                /dev/test_vg/data_snap
   VG Name                test_vg
   LV UUID                bdqB77-f0vb-ZucS-Ka1l-pCr3-Ebeq-kOchmk
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/test_vg/data_lv
   LV Status              available
   # open                 0
   LV Size                30.00 GB
   Current LE             240
   COW-table size         2.50 GB
   COW-table LE           20
   Allocated to snapshot  0.00%
   Snapshot chunk size    4.00 KB
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           253:5

#lvdisplay --map /dev/test_vg/data_snap
   --- Logical volume ---
   LV Name                /dev/test_vg/data_snap
   VG Name                test_vg
   LV UUID                IBBvOq-Bg0U-c69v-p7fQ-tR63-T8UV-gM1Ncu
   LV Write Access        read/write
   LV snapshot status     active destination for /dev/test_vg/data_lv
   LV Status              available
   # open                 0
   LV Size                30.00 GB
   Current LE             240
   COW-table size         2.50 GB
   COW-table LE           20
   Allocated to snapshot  0.00%
   Snapshot chunk size    4.00 KB
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           253:5

   --- Segments ---
   Logical extent 0 to 19:
     Type                linear
     Physical volume     /dev/cciss/c0d1p1
     Physical extents    5448 to 5467

<NOW BACKUP>

#lvremove /dev/test_vg/data_snap
Do you really want to remove active logical volume data_snap? [y/n]: y
   Logical volume "data_snap" successfully removed

#lvcreate -l 20 -n hog_lv test_vg /dev/cciss/c0d1p1:5448-5467
       Logical volume "hog_lv" created

#pvdisplay --map /dev/cciss/c0d1p1                                   --- 
Physical volume ---
   PV Name               /dev/cciss/c0d1p1
   VG Name               test_vg
   PV Size               683.51 GB / not usable 5.97 MB
   Allocatable           yes
   PE Size (KByte)       131072
   Total PE              5468
   Free PE               4312
   Allocated PE          1156
   PV UUID               YXjplf-EfLh-8Jkr-2utT-gmi5-gjAH-UOCcN0

   --- Physical Segments ---
   Physical extent 0 to 15:
     Logical volume      /dev/test_vg/restricted_lv
     Logical extents     0 to 15
   Physical extent 16 to 815:
     Logical volume      /dev/test_vg/mail_lv
     Logical extents     0 to 799
   Physical extent 816 to 975:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     0 to 159
   Physical extent 976 to 2255:
     FREE
   Physical extent 2256 to 2335:
     Logical volume      /dev/test_vg/srv_lv
     Logical extents     0 to 79
   Physical extent 2336 to 2415:
     Logical volume      /dev/test_vg/data_lv
     Logical extents     160 to 239
   Physical extent 2416 to 5447:
     FREE
   Physical extent 5448 to 5467:
     Logical volume      /dev/test_vg/hog_lv
     Logical extents     0 to 19

#dd if=/dev/zero of=/dev/hog_lv

#lvremove /dev/test_vg/hog_lv
Do you really want to remove active logical volume hog_lv? [y/n]: y
   Logical volume "hog_lv" successfully removed

Enjoy

James
