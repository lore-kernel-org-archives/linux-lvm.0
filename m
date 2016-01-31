Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0VNN920025763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 31 Jan 2016 18:23:09 -0500
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mx1.redhat.com (Postfix) with ESMTPS id CECC113353
	for <linux-lvm@redhat.com>; Sun, 31 Jan 2016 23:23:07 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id a85so127297214ykb.1
	for <linux-lvm@redhat.com>; Sun, 31 Jan 2016 15:23:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <218341039.2921649.1454281239033.JavaMail.yahoo@mail.yahoo.com>
References: <218341039.2921649.1454281239033.JavaMail.yahoo.ref@mail.yahoo.com>
	<218341039.2921649.1454281239033.JavaMail.yahoo@mail.yahoo.com>
Date: Mon, 1 Feb 2016 00:23:07 +0100
Message-ID: <CAE7pJ3CLeCEVOw1R2qb3k9T9rQ8t=q28tBDpxbzUQ1=z7nGveg@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Raid 10 - recovery after a disk failure
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
To: Pavlik Kirilov <pavllik@yahoo.ca>, LVM general discussion and development <linux-lvm@redhat.com>

You used pvcreate without the required options to create the physical
in your new disk and set the old uuid


example:

pvcreate --uuid "FmGRh3-zhok-iVI8-7qTD-S5BI-MAEN-NYM5Sk" --restorefile
/etc/lvm/archive/VG_00050.vg /dev/sdh1

https://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdatarecover.html

2016-02-01 0:00 GMT+01:00 Pavlik Kirilov <pavllik@yahoo.ca>:
> Hi,
>
>   I am encountering strange behaviour when trying to recover a Raid 10 LV, created with the following command:
>
>
> lvcreate --type raid10 -L3G  -i 2 -I 256 -n lv_r10 vg_data /dev/vdb1:1-500 /dev/vdc1:1-500 /dev/vdd1:1-500 /dev/vde1:1-500
>
> As it can be seen, I have 4 PVs and give the first 500 PE  of each of them for the raid 10 logical volume. I am able to see the following PE layout:
>
> lvs  -o seg_pe_ranges,lv_name,stripes -a
>
> PE Ranges                                                                               LV                #Str
> lv_r10_rimage_0:0-767 lv_r10_rimage_1:0-767 lv_r10_rimage_2:0-767 lv_r10_rimage_3:0-767 lv_r10               4
> /dev/vdb1:2-385                                                                         [lv_r10_rimage_0]    1
> /dev/vdc1:2-385                                                                         [lv_r10_rimage_1]    1
> /dev/vdd1:2-385                                                                         [lv_r10_rimage_2]    1
> /dev/vde1:2-385                                                                         [lv_r10_rimage_3]    1
> /dev/vdb1:1-1                                                                           [lv_r10_rmeta_0]     1
> /dev/vdc1:1-1                                                                           [lv_r10_rmeta_1]     1
> /dev/vdd1:1-1                                                                           [lv_r10_rmeta_2]     1
> /dev/vde1:1-1                                                                           [lv_r10_rmeta_3]     1
>
>
>  So far everything is OK and the number of PE is automatically reduced to 385 per PV  to have the size equal to 3 Gigabytes.
>
>  The problem comes when I shut down the system, replace one disk (vdc), boot again and try to recover the array. Here are the commands I execute:
> pvs
> Couldn't find device with uuid 2hU2pD-xNDa-yi1J-OkkP-NjGq-hIxo-Q5AgQC.
> PV             VG         Fmt  Attr PSize  PFree
> /dev/vdb1      vg_data    lvm2 a--   8.00g 6.49g
> /dev/vdd1      vg_data    lvm2 a--   8.00g 6.49g
> /dev/vde1      vg_data    lvm2 a--   8.00g 6.49g
> unknown device vg_data    lvm2 a-m   8.00g 6.49g
>
> pvcreate /dev/vdc1
> Physical volume "/dev/vdc1" successfully created
>
> vgextend vg_data /dev/vdc1
> Couldn't find device with uuid 2hU2pD-xNDa-yi1J-OkkP-NjGq-hIxo-Q5AgQC
> Volume group "vg_data" successfully extended
>
> lvs  -o seg_pe_ranges,lv_name,stripes -a
> Couldn't find device with uuid 2hU2pD-xNDa-yi1J-OkkP-NjGq-hIxo-Q5AgQC.
> PE Ranges                                                                               LV                #Str
> lv_r10_rimage_0:0-767 lv_r10_rimage_1:0-767 lv_r10_rimage_2:0-767 lv_r10_rimage_3:0-767 lv_r10               4
> /dev/vdb1:2-385                                                                         [lv_r10_rimage_0]    1
> unknown device:2-385                                                                    [lv_r10_rimage_1]    1
> /dev/vdd1:2-385                                                                         [lv_r10_rimage_2]    1
> /dev/vde1:2-385                                                                         [lv_r10_rimage_3]    1
> /dev/vdb1:1-1                                                                           [lv_r10_rmeta_0]     1
> unknown device:1-1                                                                      [lv_r10_rmeta_1]     1
> /dev/vdd1:1-1                                                                           [lv_r10_rmeta_2]     1
> /dev/vde1:1-1                                                                           [lv_r10_rmeta_3]     1
>
> lvchange -ay --partial /dev/vg_data/lv_r10
> PARTIAL MODE. Incomplete logical volumes will be processed.
> Couldn't find device with uuid 2hU2pD-xNDa-yi1J-OkkP-NjGq-hIxo-Q5AgQC
>
> lvconvert --repair vg_data/lv_r10 /dev/vdc1:1-385
> Attempt to replace failed RAID images (requires full device resync)? [y/n]: y
> Insufficient free space: 770 extents needed, but only 345 available
> Failed to allocate replacement images for vg_data/lv_r10
>
> lvconvert --repair vg_data/lv_r10
> Attempt to replace failed RAID images (requires full device resync)? [y/n]: y
> Faulty devices in vg_data/lv_r10 successfully replaced.
>
> lvs  -o seg_pe_ranges,lv_name,stripes -a
> Couldn't find device with uuid
> 2hU2pD-xNDa-yi1J-OkkP-NjGq-hIxo-Q5AgQC.
>
> PE Ranges                                                                               LV                #Str
> lv_r10_rimage_0:0-767 lv_r10_rimage_1:0-767 lv_r10_rimage_2:0-767 lv_r10_rimage_3:0-767 lv_r10               4
> /dev/vdb1:2-385                                                                         [lv_r10_rimage_0]    1
> /dev/vdc1:1-768                                                                         [lv_r10_rimage_1]    1
> /dev/vdd1:2-385                                                                         [lv_r10_rimage_2]    1
> /dev/vde1:2-385                                                                         [lv_r10_rimage_3]    1
> /dev/vdb1:1-1                                                                           [lv_r10_rmeta_0]     1
> /dev/vdc1:0-0                                                                           [lv_r10_rmeta_1]     1
> /dev/vdd1:1-1                                                                           [lv_r10_rmeta_2]     1
> /dev/vde1:1-1                                                                           [lv_r10_rmeta_3]     1
>
>   The array was recovered, but it is definitely not what I expected, because on /dev/vdc1 now 768 PEs are used instead of 385, like on the other PVs. In this case I had some extra free space on /dev/vdc1, but what if I did not? Please, suggest what should be done.
>
> Linux ubuntu1 3.13.0-32-generic, x86_64
> LVM version:     2.02.98(2) (2012-10-15)
> Library version: 1.02.77 (2012-10-15)
> Driver version:  4.27.0
>
> Pavlik Petrov
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
  .~.
  /V\
 //  \\
/(   )\
^`~'^
