Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u12NQYNv013663
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 2 Feb 2016 18:26:34 -0500
Received: from nm6-vm5.bullet.mail.gq1.yahoo.com
	(nm6-vm5.bullet.mail.gq1.yahoo.com [98.136.218.196])
	by mx1.redhat.com (Postfix) with ESMTPS id 960503298
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2016 23:26:32 +0000 (UTC)
Date: Tue, 2 Feb 2016 23:20:10 +0000 (UTC)
From: Pavlik Kirilov <pavllik@yahoo.ca>
Message-ID: <2056321183.657972.1454455210122.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <CAE7pJ3BhCHr_hMTBhnhOdz=sXNNOMcCLuqMgfp1H5S-2JvVYnA@mail.gmail.com>
References: <CAE7pJ3BhCHr_hMTBhnhOdz=sXNNOMcCLuqMgfp1H5S-2JvVYnA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Raid 10 - recovery after a disk failure
Reply-To: Pavlik Kirilov <pavllik@yahoo.ca>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you for helping me out with this. I am glad the issue was fixed in the newer version of LVM.

Regards,

Pavlik




----- Original Message -----
From: emmanuel segura <emi2fast@gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Sent: Tuesday, February 2, 2016 11:50 AM
Subject: Re: [linux-lvm] Raid 10 - recovery after a disk failure

Using the lvm version "LVM version:     2.02.141(2)-git (2016-01-25)"
the space is not begin allocate twice when you try to recover or
replace the failed device with a new one.

https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=b33d7586e7f629818e881e26677f4431a47d50b5

Anyway if you have a failing disk, you can recover in this way:

lvs  -o seg_pe_ranges,lv_name,stripes -a vgraid10
  PE Ranges
                   LV                #Str
  lv_r10_rimage_0:0-255 lv_r10_rimage_1:0-255 lv_r10_rimage_2:0-255
lv_r10_rimage_3:0-255 lv_r10               4
  /dev/sdb:1-256
                   [lv_r10_rimage_0]    1
  /dev/sdc:1-256
                   [lv_r10_rimage_1]    1
  /dev/sdd:1-256
                   [lv_r10_rimage_2]    1
  /dev/sde:1-256
                   [lv_r10_rimage_3]    1
  /dev/sdb:0-0
                   [lv_r10_rmeta_0]     1
  /dev/sdc:0-0
                   [lv_r10_rmeta_1]     1
  /dev/sdd:0-0
                   [lv_r10_rmeta_2]     1
  /dev/sde:0-0
                   [lv_r10_rmeta_3]     1

echo 1 > /sys/block/vdb/device/delete

vgextend vgraid10 /dev/sdf
lvconvert --repair vgraid10/lv_r10 /dev/sdf



lvs  -o seg_pe_ranges,lv_name,stripes -a vgraid10
  Couldn't find device with uuid zEcc1n-172G-lNA9-ucC2-JJRx-kZnX-xx7tAW.
  PE Ranges
                   LV                #Str
  lv_r10_rimage_0:0-255 lv_r10_rimage_1:0-255 lv_r10_rimage_2:0-255
lv_r10_rimage_3:0-255 lv_r10               4
  /dev/sdf:1-256
                   [lv_r10_rimage_0]    1
  /dev/sdc:1-256
                   [lv_r10_rimage_1]    1
  /dev/sdd:1-256
                   [lv_r10_rimage_2]    1
  /dev/sde:1-256
                   [lv_r10_rimage_3]    1
  /dev/sdf:0-0
                   [lv_r10_rmeta_0]     1
  /dev/sdc:0-0
                   [lv_r10_rmeta_1]     1
  /dev/sdd:0-0
                   [lv_r10_rmeta_2]     1
  /dev/sde:0-0
                   [lv_r10_rmeta_3]     1


2016-02-01 23:59 GMT+01:00 Pavlik Kirilov <pavllik@yahoo.ca>:
> I upgraded lvm, because --syncaction was not available in the old one:
> New lvm version     2.02.111(2) (2014-09-01)
> Library version: 1.02.90 (2014-09-01)
> Driver version:  4.27.0
>
> However it seems to me that the command "lvchange --syncaction repair vg_data/lv_r10" does not perform a resync if there are no mismatches.
> Here is the test output:
>
> ## Created the same LV as before, shut down, replace disk, start up again ###
>
> lvs -a -o +devices,raid_mismatch_count,raid_sync_action
> Couldn't find device with uuid f0M1di-y7Fy-TZZg-3RO3-kJsA-fWEi-MoD2mt.
> LV                VG      Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices                                                                     Mismatches SyncAction
> lv_r10            vg_data rwi-a-r-p- 3.00g                                    100.00           lv_r10_rimage_0(0),lv_r10_rimage_1(0),lv_r10_rimage_2(0),lv_r10_rimage_3(0)          0 idle
> [lv_r10_rimage_0] vg_data iwi-aor--- 1.50g                                                     /dev/vda1(2)
> [lv_r10_rimage_1] vg_data iwi-a-r-p- 1.50g                                                     unknown device(2)
> [lv_r10_rimage_2] vg_data iwi-aor--- 1.50g                                                     /dev/vdc1(2)
> [lv_r10_rimage_3] vg_data iwi-aor--- 1.50g                                                     /dev/vdd1(2)
> [lv_r10_rmeta_0]  vg_data ewi-aor--- 4.00m                                                     /dev/vda1(1)
> [lv_r10_rmeta_1]  vg_data ewi-a-r-p- 4.00m                                                     unknown device(1)
> [lv_r10_rmeta_2]  vg_data ewi-aor--- 4.00m                                                     /dev/vdc1(1)
> [lv_r10_rmeta_3]  vg_data ewi-aor--- 4.00m                                                     /dev/vdd1(1)
>
> pvs
> Couldn't find device with uuid f0M1di-y7Fy-TZZg-3RO3-kJsA-fWEi-MoD2mt.
> PV             VG      Fmt  Attr PSize PFree
> /dev/vda1      vg_data lvm2 a--  8.00g 6.49g
> /dev/vdc1      vg_data lvm2 a--  8.00g 6.49g
> /dev/vdd1      vg_data lvm2 a--  8.00g 6.49g
> unknown device vg_data lvm2 a-m  8.00g 6.49g
>
> grep description /etc/lvm/backup/vg_data
> description = "Created *after* executing 'lvcreate --type raid10 -L3g -i 2 -I 256 -n lv_r10 vg_data /dev/vda1:1-900 /dev/vdb1:1-900 /dev/vdc1:1-900 /dev/vdd1:1-900'"
>
> pvcreate --uuid f0M1di-y7Fy-TZZg-3RO3-kJsA-fWEi-MoD2mt  --restorefile /etc/lvm/backup/vg_data /dev/vdb1
> Couldn't find device with uuid f0M1di-y7Fy-TZZg-3RO3-kJsA-fWEi-MoD2mt.
> Physical volume "/dev/vdb1" successfully created
>
> vgcfgrestore vg_data
> Restored volume group vg_data
>
> lvchange --syncaction repair vg_data/lv_r10
>
> dmesg | tail
> ------------
> [  324.454722] md: requested-resync of RAID array mdX
> [  324.454725] md: minimum _guaranteed_  speed: 1000 KB/sec/disk.
> [  324.454727] md: using maximum available idle IO bandwidth (but not more than 200000 KB/sec) for requested-resync.
> [  324.454729] md: using 128k window, over a total of 3145728k.
> [  324.454882] md: mdX: requested-resync done.
>
> ### Here I think the new PV did not receive any data
> ### shut down , replace vda , start the system###
>
> grep description /etc/lvm/backup/vg_data
> description = "Created *after* executing 'vgscan'"
>
> pvcreate --uuid  zjJVEj-VIKe-oe0Z-W1CF-edfj-16n2-oiAyID --restorefile /etc/lvm/backup/vg_data /dev/vda1
> Couldn't find device with uuid zjJVEj-VIKe-oe0Z-W1CF-edfj-16n2-oiAyID.
> Physical volume "/dev/vda1" successfully created
>
> vgcfgrestore vg_data
> Restored volume group vg_data
>
> lvchange --syncaction repair vg_data/lv_r10
> Unable to send message to an inactive logical volume.
>
> dmesg | tail
> -------------
> [  374.959535] device-mapper: raid: Failed to read superblock of device at position 0
> [  374.959577] device-mapper: raid: New device injected into existing array without 'rebuild' parameter specified
> [  374.959621] device-mapper: table: 252:10: raid: Unable to assemble array: Invalid superblocks
> [  374.959656] device-mapper: ioctl: error adding target to table
>
>
> ### I gave another try to my previous procedure with "lvchange --resync vg_data/lv_r10", but this again destroyed the file system, even now with the newer LVM version.
> ### Also the test with lvconvert --repair produced the same result as before.
>
> Please, advice.
>
> Pavlik
>
>
> ----- Original Message -----
> From: emmanuel segura <emi2fast@gmail.com>
> To: Pavlik Kirilov <pavllik@yahoo.ca>; LVM general discussion and development <linux-lvm@redhat.com>
> Sent: Monday, February 1, 2016 1:22 PM
> Subject: Re: [linux-lvm] Raid 10 - recovery after a disk failure
>
> please can you retry using:
>
>        --[raid]syncaction {check|repair}
>               This argument is used to initiate various RAID
> synchronization operations.  The check and repair options provide a
> way to check the integrity of a RAID log‐
>               ical  volume  (often  referred  to  as "scrubbing").
> These options cause the RAID logical volume to read all of the data
> and parity blocks in the array and
>               check for any discrepancies (e.g. mismatches between
> mirrors or incorrect parity values).  If check is used, the
> discrepancies  will  be  counted  but  not
>               repaired.   If  repair is used, the discrepancies will
> be corrected as they are encountered.  The 'lvs' command can be used
> to show the number of discrepan‐
>               cies found or repaired.
>
> maybe --resync is for mirror and you are using raid
>
>       --resync
>               Forces  the  complete resynchronization of a mirror.  In
> normal circumstances you should not need this option because
> synchronization happens automatically.
>               Data is read from the primary mirror device and copied
> to the others, so this can take a considerable amount of time - and
> during this time you are  without
>               a complete redundant copy of your data.
>
> 2016-02-01 18:06 GMT+01:00 Pavlik Kirilov <pavllik@yahoo.ca>:



-- 
  .~.
  /V\
//  \\
/(   )\
^`~'^

_______________________________________________
linux-lvm mailing list

linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
