Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s13AHYTu011507
	for <linux-lvm@redhat.com>; Mon, 3 Feb 2014 05:17:35 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s13AHRCr022797
	for <linux-lvm@redhat.com>; Mon, 3 Feb 2014 05:17:27 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id CCCCD200415
	for <linux-lvm@redhat.com>; Mon,  3 Feb 2014 11:17:25 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id a-_yPjQo_0sW for <linux-lvm@redhat.com>;
	Mon,  3 Feb 2014 11:17:25 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id D9299200411
	for <linux-lvm@redhat.com>; Mon,  3 Feb 2014 11:17:24 +0100 (CET)
Message-ID: <52EF6CB4.7010505@mglug.de>
Date: Mon, 03 Feb 2014 11:17:24 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
References: <BLU0-SMTP1435605BEFA0CCEC48A9CC4FBA80@phx.gbl>
In-Reply-To: <BLU0-SMTP1435605BEFA0CCEC48A9CC4FBA80@phx.gbl>
Content-Type: multipart/alternative;
	boundary="------------090004010908010505090000"
Subject: Re: [linux-lvm] LVM2 [lvcreate --type raid5] issue
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------090004010908010505090000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi James,

i was able to reproduce this on a Ubuntu 12.04.3 machine with lvm
2.02.105+ (compiled from git). It seems, that the -s 4kib parameter
causes this error. Normally, if not set explicitly, it es a 4MB size
assumed, so that you choosed a really tiny size (1/1000th of standard
size). Omitting this all seems running fine.

Im not a developer of this, but i could imagine, that based on this tiny
size the metadata is running out of space. Setting this to at least
64kib seems running fine. I think, smaller than 64kib doesnt make sense,
because this is the smallest reading size of most harddisks.

Hth
Oliver

On 02.02.2014 20:53, James Woolliscroft wrote:
>
> Hi
>
>  
>
> New to Linux, not sure if this is a legitimate fault, or if I am doing
> something wrong. *_Please can you advise on which release of LVM2 (if
> any) fixes this issue._*
>
>  
>
> Initially tested using SL6.4, now testing with SL6.5. I have used both
> LiveDVD and basic "Minimal Desktop" Installations on the target
> computer and inside a VirtualBox Virtual Machine.
>
>  
>
> I am preparing to install SL6.5 on a small system with 3x750GB Disks.
> As a pre-requisite, I wish to testing the performance of the disks
> using different chunk/block sizes using LVM2 RAID5.
>
>  
>
> It is a preference to use LVM2 RAID5 rather than mdraid and LVM2 to
> reduce the complexity of setting up and managing the system.
>
>  
>
> However I am experiencing a problem when creating the Logical Volume.
> This issue occurs with both SL6.4 and SL6.5:
>
>  
>
> *  /dev/vg_system1/lv_system1: read failed after 0 of 4096 at 0:
> Input/output error*
>
> *  /dev/vg_system1/lv_system1: write failed after 0 of 4096 at 0:
> Input/output error*
>
>  
>
> There was one additional issue with SL6.4 which also appears to be
> partially resolved in SL6.5. Certain commands function without an
> issue, however once the issue manifests, it appears in most or all
> commands:
>
>  
>
> [root@localhost ~]# pvscan -vd
>
>     Wiping cache of LVM-capable devices
>
>     Wiping internal VG cache
>
>     Walking through all physical volumes
>
> *  /dev/vg_system1/lv_system1: read failed after 0 of 4096 at
> 5368643584: Input/output error*
>
> *  /dev/vg_system1/lv_system1: read failed after 0 of 4096 at
> 5368700928: Input/output error*
>
> *  /dev/vg_system1/lv_system1: read failed after 0 of 4096 at 0:
> Input/output error*
>
> *  /dev/vg_system1/lv_system1: read failed after 0 of 4096 at 4096:
> Input/output error*
>
> *    /dev/vg_system1/lv_system1: read failed after 0 of 4096 at 0:
> Input/output error*
>
>   PV /dev/sdb1   VG vg_system1   lvm2 [16.00 GiB / 13.50 GiB free]
>
>   PV /dev/sdc1   VG vg_system1   lvm2 [16.00 GiB / 13.50 GiB free]
>
>   PV /dev/sdd1   VG vg_system1   lvm2 [16.00 GiB / 13.50 GiB free]
>
>   PV /dev/sda2   VG VolGroup     lvm2 [11.51 GiB / 0    free]
>
>   Total: 4 [59.50 GiB] / in use: 4 [59.50 GiB] / in no VG: 0 [0   ]
>
>  
>
> I am at a loss to explain this, I cannot find any information relating
> to these errors.
>
>  
>
> If I cannot resolve this within a reasonable period of time, I will be
> forced to use mdraid which is much less flexible -- i.e. if I wish to
> use different RAID modes, I have to use separate partitions/volume
> groups for example I would consider using unraided partitions for
> /boot, RAID 0 for SWAP and /tmp and RAID 5 for the rest of the system.
> Separating these into different partitions means the system will have
> to span further across the disk at times.
>
>  
>
> I am considering possibly testing a later revision of LVM2 as I
> understand that SL6.5 has *_LVM2-2.02.100-8_* while *_subversions 101
> -- 105_* are available. I understand that to do this I may have to
> download the source code of this and dependant packages and compile
> it. This is not something I can easily do, but am prepared to try if I
> can get some guidance.
>
>  
>
> It may be useful to test this in RHEL 6.5 and CentOS 6.5 though I
> could only do this on the latter myself.
>
>  
>
> Below are the scripts to destroy the test LV/VG/PV and a test pass,
> and a script to create the PV/VG/LV as executed on a test system. Each
> attempt I execute the destroy script prior to running the create
> script. There is also a dump of the partition tables.
>
>  
>
> I hope you can point me in the right direction!
>
>  
>
> Thanks and Regards,
>
>  
>
> J Woolliscroft
>
> [root@localhost ~]# cat d_lv
>
> lvremove /dev/vg_system1/lv_system1
>
> vgremove vg_system1
>
> pvremove /dev/sdb1 /dev/sdc1 /dev/sdd1
>
> =====
>
> [root@localhost ~]# . ./d_lv
>
> Do you really want to remove active logical volume lv_system1? [y/n]: y
>
>   Logical volume "lv_system1" successfully removed
>
>   Volume group "vg_system1" successfully removed
>
>   Labels on physical volume "/dev/sdb1" successfully wiped
>
>   Labels on physical volume "/dev/sdc1" successfully wiped
>
>   Labels on physical volume "/dev/sdd1" successfully wipeda
>
>  
>
> [root@localhost ~]# cat c_lv
>
> parted -l
>
>  
>
> pvcreate -M2 -v /dev/sdb1 /dev/sdc1 /dev/sdd1
>
>  
>
> pvs -v -d
>
> pvscan -v -d
>
>  
>
> vgcreate -s 4kib -v vg_system1 /dev/sdb1 /dev/sdc1 /dev/sdd1
>
>  
>
> vgs -v -d
>
> vgscan -v -d
>
>  
>
> lvcreate --type raid5 -i 2 -I 4 -L 5G -ay -Zy -v -n lv_system1 vg_system1
>
>  
>
> lvs -v -d
>
> lvscan -v -d
>
> [root@localhost ~]# . ./c_lv
>
> Model: ATA VBOX HARDDISK (scsi)
>
> Disk /dev/sda: 12.9GB
>
> Sector size (logical/physical): 512B/512B
>
> Partition Table: msdos
>
>  
>
> Number  Start   End     Size    Type     File system  Flags
>
> 1      1049kB  525MB   524MB   primary  ext4         boot
>
> 2      525MB   12.9GB  12.4GB  primary               lvm
>
>  
>
>  
>
> Model: ATA VBOX HARDDISK (scsi)
>
> Disk /dev/sdb: 17.2GB
>
> Sector size (logical/physical): 512B/512B
>
> Partition Table: gpt
>
>  
>
> Number  Start   End     Size    File system  Name     Flags
>
> 1      1049kB  17.2GB  17.2GB               primary  lvm
>
>  
>
>  
>
> Model: ATA VBOX HARDDISK (scsi)
>
> Disk /dev/sdc: 17.2GB
>
> Sector size (logical/physical): 512B/512B
>
> Partition Table: gpt
>
>  
>
> Number  Start   End     Size    File system  Name     Flags
>
> 1      1049kB  17.2GB  17.2GB               primary  lvm
>
>  
>
>  
>
> Model: ATA VBOX HARDDISK (scsi)
>
> Disk /dev/sdd: 17.2GB
>
> Sector size (logical/physical): 512B/512B
>
> Partition Table: gpt
>
>  
>
> Number  Start   End     Size    File system  Name     Flags
>
> 1      1049kB  17.2GB  17.2GB               primary  lvm
>
>  
>
>  
>
> Model: Linux device-mapper (linear) (dm)
>
> Disk /dev/mapper/VolGroup-lv_swap: 2147MB
>
> Sector size (logical/physical): 512B/512B
>
> Partition Table: loop
>
>  
>
> Number  Start  End     Size    File system     Flags
>
> 1      0.00B  2147MB  2147MB  linux-swap(v1)
>
>  
>
>  
>
> Model: Linux device-mapper (linear) (dm)
>
> Disk /dev/mapper/VolGroup-lv_root: 10.2GB
>
> Sector size (logical/physical): 512B/512B
>
> Partition Table: loop
>
>  
>
> Number  Start  End     Size    File system  Flags
>
> 1      0.00B  10.2GB  10.2GB  ext4
>
>  
>
>  
>
>     Set up physical volume for "/dev/sdb1" with 33552351 available sectors
>
>     Zeroing start of device /dev/sdb1
>
>     Writing physical volume data to disk "/dev/sdb1"
>
>   Physical volume "/dev/sdb1" successfully created
>
>     Set up physical volume for "/dev/sdc1" with 33552351 available sectors
>
>     Zeroing start of device /dev/sdc1
>
>     Writing physical volume data to disk "/dev/sdc1"
>
>   Physical volume "/dev/sdc1" successfully created
>
>     Set up physical volume for "/dev/sdd1" with 33552351 available sectors
>
>     Zeroing start of device /dev/sdd1
>
>     Writing physical volume data to disk "/dev/sdd1"
>
>   Physical volume "/dev/sdd1" successfully created
>
>     Scanning for physical volume names
>
>     Wiping cache of LVM-capable devices
>
>   PV         VG       Fmt  Attr PSize  PFree  DevSize PV
> UUID                              
>
>   /dev/sda2  VolGroup lvm2 a--  11.51g     0   11.51g
> JjV0kz-rW98-zTxe-X1jm-T9h3-i6SG-Frd325
>
>   /dev/sdb1           lvm2 a--  16.00g 16.00g  16.00g
> k7kxWU-W1bh-Eqda-xVj8-aBva-efN4-Et5B94
>
>   /dev/sdc1           lvm2 a--  16.00g 16.00g  16.00g
> 9M29V5-qldE-mSVl-Z2UY-h9nM-1F3i-AEsNYu
>
>   /dev/sdd1           lvm2 a--  16.00g 16.00g  16.00g
> zPpXzZ-ptwp-qxok-ubNq-asmz-Ifcj-QtRvfv
>
>     Wiping cache of LVM-capable devices
>
>     Wiping internal VG cache
>
>     Walking through all physical volumes
>
>   PV /dev/sda2   VG VolGroup        lvm2 [11.51 GiB / 0    free]
>
>   PV /dev/sdb1                      lvm2 [16.00 GiB]
>
>   PV /dev/sdc1                      lvm2 [16.00 GiB]
>
>   PV /dev/sdd1                      lvm2 [16.00 GiB]
>
>   Total: 4 [59.50 GiB] / in use: 1 [11.51 GiB] / in no VG: 3 [48.00 GiB]
>
>     Wiping cache of LVM-capable devices
>
>     Wiping cache of LVM-capable devices
>
>     Adding physical volume '/dev/sdb1' to volume group 'vg_system1'
>
>     Adding physical volume '/dev/sdc1' to volume group 'vg_system1'
>
>     Adding physical volume '/dev/sdd1' to volume group 'vg_system1'
>
>     Archiving volume group "vg_system1" metadata (seqno 0).
>
>     Creating volume group backup "/etc/lvm/backup/vg_system1" (seqno 1).
>
>   Volume group "vg_system1" successfully created
>
>     Finding all volume groups
>
>     Finding volume group "vg_system1"
>
>     Finding volume group "VolGroup"
>
>   VG         Attr   Ext   #PV #LV #SN VSize  VFree  VG
> UUID                                VProfile
>
>   VolGroup   wz--n- 4.00m   1   2   0 11.51g     0 
> oaJmPd-ElY9-a0E9-hUlu-SLxE-XTje-LfpO31        
>
>   vg_system1 wz--n- 4.00k   3   0   0 47.99g 47.99g
> hZTC0w-k0bJ-6M2A-Fmky-hHLo-hzHM-k8gdPl        
>
>     Wiping cache of LVM-capable devices
>
>     Wiping internal VG cache
>
>   Reading all physical volumes.  This may take a while...
>
>     Finding all volume groups
>
>     Finding volume group "vg_system1"
>
>   Found volume group "vg_system1" using metadata type lvm2
>
>     Finding volume group "VolGroup"
>
>   Found volume group "VolGroup" using metadata type lvm2
>
>     Setting logging type to disk
>
>     Finding volume group "vg_system1"
>
>     Archiving volume group "vg_system1" metadata (seqno 1).
>
>     Creating logical volume lv_system1
>
>     Creating logical volume lv_system1_rimage_0
>
>     Creating logical volume lv_system1_rmeta_0
>
>     Creating logical volume lv_system1_rimage_1
>
>     Creating logical volume lv_system1_rmeta_1
>
>     Creating logical volume lv_system1_rimage_2
>
>     Creating logical volume lv_system1_rmeta_2
>
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vg_system1/lv_system1_rmeta_0
>
>     Creating vg_system1-lv_system1_rmeta_0
>
>     Loading vg_system1-lv_system1_rmeta_0 table (253:2)
>
>     Resuming vg_system1-lv_system1_rmeta_0 (253:2)
>
>     Clearing metadata area of vg_system1/lv_system1_rmeta_0
>
>     Clearing start of logical volume "lv_system1_rmeta_0"
>
>     Removing vg_system1-lv_system1_rmeta_0 (253:2)
>
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vg_system1/lv_system1_rmeta_1
>
>     Creating vg_system1-lv_system1_rmeta_1
>
>     Loading vg_system1-lv_system1_rmeta_1 table (253:2)
>
>     Resuming vg_system1-lv_system1_rmeta_1 (253:2)
>
>     Clearing metadata area of vg_system1/lv_system1_rmeta_1
>
>     Clearing start of logical volume "lv_system1_rmeta_1"
>
>     Removing vg_system1-lv_system1_rmeta_1 (253:2)
>
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vg_system1/lv_system1_rmeta_2
>
>     Creating vg_system1-lv_system1_rmeta_2
>
>     Loading vg_system1-lv_system1_rmeta_2 table (253:2)
>
>     Resuming vg_system1-lv_system1_rmeta_2 (253:2)
>
>     Clearing metadata area of vg_system1/lv_system1_rmeta_2
>
>     Clearing start of logical volume "lv_system1_rmeta_2"
>
>     Removing vg_system1-lv_system1_rmeta_2 (253:2)
>
>     Creating volume group backup "/etc/lvm/backup/vg_system1" (seqno 3).
>
>     activation/volume_list configuration setting not defined: Checking
> only host tags for vg_system1/lv_system1
>
>     Creating vg_system1-lv_system1_rmeta_0
>
>     Loading vg_system1-lv_system1_rmeta_0 table (253:2)
>
>     Resuming vg_system1-lv_system1_rmeta_0 (253:2)
>
>     Creating vg_system1-lv_system1_rimage_0
>
>     Loading vg_system1-lv_system1_rimage_0 table (253:3)
>
>     Resuming vg_system1-lv_system1_rimage_0 (253:3)
>
>     Creating vg_system1-lv_system1_rmeta_1
>
>     Loading vg_system1-lv_system1_rmeta_1 table (253:4)
>
>     Resuming vg_system1-lv_system1_rmeta_1 (253:4)
>
>     Creating vg_system1-lv_system1_rimage_1
>
>     Loading vg_system1-lv_system1_rimage_1 table (253:5)
>
>     Resuming vg_system1-lv_system1_rimage_1 (253:5)
>
>     Creating vg_system1-lv_system1_rmeta_2
>
>     Loading vg_system1-lv_system1_rmeta_2 table (253:6)
>
>     Resuming vg_system1-lv_system1_rmeta_2 (253:6)
>
>     Creating vg_system1-lv_system1_rimage_2
>
>     Loading vg_system1-lv_system1_rimage_2 table (253:7)
>
>     Resuming vg_system1-lv_system1_rimage_2 (253:7)
>
>     Creating vg_system1-lv_system1
>
>     Loading vg_system1-lv_system1 table (253:8)
>
>     Resuming vg_system1-lv_system1 (253:8)
>
>     Monitoring vg_system1/lv_system1
>
>     Clearing start of logical volume "lv_system1"
>
> *  /dev/vg_system1/lv_system1: read failed after 0 of 4096 at 0:
> Input/output error*
>
> *  /dev/vg_system1/lv_system1: write failed after 0 of 4096 at 0:
> Input/output error*
>
>     Creating volume group backup "/etc/lvm/backup/vg_system1" (seqno 3).
>
>   Logical volume "lv_system1" created
>
>     Finding all logical volumes
>
>   LV         VG         #Seg Attr       LSize Maj Min KMaj KMin Pool
> Origin Data%  Meta%  Move Cpy%Sync Log Convert LV
> UUID                                LProfile
>
>   lv_root    VolGroup      1 -wi-ao---- 9.51g  -1  -1 253 
> 0                                                       
> BG77rR-C2lS-UXzm-V4KI-ptcG-1BZu-0yqVcV        
>
>   lv_swap    VolGroup      1 -wi-ao---- 2.00g  -1  -1 253 
> 1                                                       
> i6uo0r-9T2P-OW60-Z1i7-6o7y-id1Q-1R7Lli        
>
>   lv_system1 vg_system1    1 rwi-a-r-r- 5.00g  -1  -1 253 
> 8                                     100.00            
> GM0hKc-BHNV-CUAR-y0US-5Iw9-Ihi0-GSFD1V        
>
>     Finding all logical volumes
>
>   ACTIVE            '/dev/vg_system1/lv_system1' [5.00 GiB] inherit
>
>   ACTIVE            '/dev/VolGroup/lv_root' [9.51 GiB] inherit
>
>   ACTIVE            '/dev/VolGroup/lv_swap' [2.00 GiB] inherit
>
> [root@localhost ~]#
>
>  
>
>  
>
>  
>
>  
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------090004010908010505090000
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi James,<br>
    <br>
    i was able to reproduce this on a Ubuntu 12.04.3 machine with lvm
    2.02.105+ (compiled from git). It seems, that the -s 4kib parameter
    causes this error. Normally, if not set explicitly, it es a 4MB size
    assumed, so that you choosed a really tiny size (1/1000th of
    standard size). Omitting this all seems running fine.<br>
    <br>
    Im not a developer of this, but i could imagine, that based on this
    tiny size the metadata is running out of space. Setting this to at
    least 64kib seems running fine. I think, smaller than 64kib doesnt
    make sense, because this is the smallest reading size of most
    harddisks.<br>
    <br>
    Hth<br>
    Oliver<br>
    <br>
    <div class="moz-cite-prefix">On 02.02.2014 20:53, James Woolliscroft
      wrote:<br>
    </div>
    <blockquote cite="mid:BLU0-SMTP1435605BEFA0CCEC48A9CC4FBA80@phx.gbl"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">New to Linux, not sure if this is a
          legitimate fault, or if I am doing something wrong. <b><u>Please
              can you advise on which release of LVM2 (if any) fixes
              this issue.</u></b><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Initially tested using SL6.4, now testing
          with SL6.5. I have used both LiveDVD and basic &#8220;Minimal
          Desktop&#8221; Installations on the target computer and inside a
          VirtualBox Virtual Machine.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I am preparing to install SL6.5 on a small
          system with 3x750GB Disks. As a pre-requisite, I wish to
          testing the performance of the disks using different
          chunk/block sizes using LVM2 RAID5.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">It is a preference to use LVM2 RAID5 rather
          than mdraid and LVM2 to reduce the complexity of setting up
          and managing the system.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">However I am experiencing a problem when
          creating the Logical Volume. This issue occurs with both SL6.4
          and SL6.5:<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 0: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: write
              failed after 0 of 4096 at 0: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">There was one additional issue with SL6.4
          which also appears to be partially resolved in SL6.5. Certain
          commands function without an issue, however once the issue
          manifests, it appears in most or all commands:<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">[root@localhost
            ~]# pvscan -vd<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping cache of LVM-capable devices<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping internal VG cache<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Walking through all physical volumes<o:p></o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 5368643584: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 5368700928: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 0: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 4096: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp;&nbsp;&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 0: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sdb1&nbsp;&nbsp; VG vg_system1&nbsp;&nbsp; lvm2 [16.00 GiB / 13.50 GiB
            free]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sdc1&nbsp;&nbsp; VG vg_system1&nbsp;&nbsp; lvm2 [16.00 GiB / 13.50 GiB
            free]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sdd1&nbsp;&nbsp; VG vg_system1&nbsp;&nbsp; lvm2 [16.00 GiB / 13.50 GiB
            free]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sda2&nbsp;&nbsp; VG VolGroup&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [11.51 GiB / 0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Total: 4 [59.50 GiB] / in use: 4 [59.50 GiB] / in no VG: 0
            [0&nbsp;&nbsp; ]<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I am at a loss to explain this, I cannot
          find any information relating to these errors.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">If I cannot resolve this within a
          reasonable period of time, I will be forced to use mdraid
          which is much less flexible &#8211; i.e. if I wish to use different
          RAID modes, I have to use separate partitions/volume groups
          for example I would consider using unraided partitions for
          /boot, RAID 0 for SWAP and /tmp and RAID 5 for the rest of the
          system. Separating these into different partitions means the
          system will have to span further across the disk at times.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I am considering possibly testing a later
          revision of LVM2 as I understand that SL6.5 has <b><u>LVM2-2.02.100-8</u></b>
          while <b><u>subversions 101 &#8211; 105</u></b> are available. I
          understand that to do this I may have to download the source
          code of this and dependant packages and compile it. This is
          not something I can easily do, but am prepared to try if I can
          get some guidance.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">It may be useful to test this in RHEL 6.5
          and CentOS 6.5 though I could only do this on the latter
          myself.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Below are the scripts to destroy the test
          LV/VG/PV and a test pass, and a script to create the PV/VG/LV
          as executed on a test system. Each attempt I execute the
          destroy script prior to running the create script. There is
          also a dump of the partition tables.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I hope you can point me in the right
          direction!<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Thanks and Regards,<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div
          style="mso-element:para-border-div;border:none;border-bottom:double
          windowtext 2.25pt;padding:0cm 0cm 1.0pt 0cm">
          <p class="MsoNormal" style="border:none;padding:0cm">J
            Woolliscroft<o:p></o:p></p>
        </div>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">[root@localhost
            ~]# cat d_lv<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">lvremove
            /dev/vg_system1/lv_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">vgremove
            vg_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">pvremove
            /dev/sdb1 /dev/sdc1 /dev/sdd1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">=====<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">
            [root@localhost ~]# . ./d_lv<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Do
            you really want to remove active logical volume lv_system1?
            [y/n]: y<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Logical volume "lv_system1" successfully removed<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Volume group "vg_system1" successfully removed<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Labels on physical volume "/dev/sdb1" successfully wiped<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Labels on physical volume "/dev/sdc1" successfully wiped<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Labels on physical volume "/dev/sdd1" successfully wiped</span>a<o:p></o:p></p>
        <div
          style="mso-element:para-border-div;border:none;border-bottom:double
          windowtext 2.25pt;padding:0cm 0cm 1.0pt 0cm">
          <p class="MsoNormal" style="border:none;padding:0cm"><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;"><o:p>&nbsp;</o:p></span></p>
        </div>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">[root@localhost
            ~]# cat c_lv<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">parted
            -l<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">pvcreate
            -M2 -v /dev/sdb1 /dev/sdc1 /dev/sdd1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">pvs
            -v -d<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">pvscan
            -v -d<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">vgcreate
            -s 4kib -v vg_system1 /dev/sdb1 /dev/sdc1 /dev/sdd1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">vgs
            -v -d<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">vgscan
            -v -d<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">lvcreate
            --type raid5 -i 2 -I 4 -L 5G -ay -Zy -v -n lv_system1
            vg_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">lvs
            -v -d<o:p></o:p></span></p>
        <div
          style="mso-element:para-border-div;border:none;border-bottom:double
          windowtext 2.25pt;padding:0cm 0cm 1.0pt 0cm">
          <p class="MsoNormal" style="border:none;padding:0cm"><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;">lvscan -v -d<o:p></o:p></span></p>
        </div>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">[root@localhost
            ~]# . ./c_lv<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Model:
            ATA VBOX HARDDISK (scsi)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Disk
            /dev/sda: 12.9GB<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Sector
            size (logical/physical): 512B/512B<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Partition
            Table: msdos<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Number&nbsp;
            Start&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp;&nbsp;&nbsp; Type&nbsp;&nbsp;&nbsp;&nbsp; File system&nbsp; Flags<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1049kB&nbsp; 525MB&nbsp;&nbsp; 524MB&nbsp;&nbsp; primary&nbsp; ext4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boot<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            525MB&nbsp;&nbsp; 12.9GB&nbsp; 12.4GB&nbsp; primary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Model:
            ATA VBOX HARDDISK (scsi)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Disk
            /dev/sdb: 17.2GB<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Sector
            size (logical/physical): 512B/512B<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Partition
            Table: gpt<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Number&nbsp;
            Start&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp;&nbsp;&nbsp; File system&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp; Flags<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1049kB&nbsp; 17.2GB&nbsp; 17.2GB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary&nbsp; lvm<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Model:
            ATA VBOX HARDDISK (scsi)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Disk
            /dev/sdc: 17.2GB<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Sector
            size (logical/physical): 512B/512B<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Partition
            Table: gpt<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Number&nbsp;
            Start&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp;&nbsp;&nbsp; File system&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp; Flags<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1049kB&nbsp; 17.2GB&nbsp; 17.2GB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary&nbsp; lvm<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Model:
            ATA VBOX HARDDISK (scsi)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Disk
            /dev/sdd: 17.2GB<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Sector
            size (logical/physical): 512B/512B<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Partition
            Table: gpt<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Number&nbsp;
            Start&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp;&nbsp;&nbsp; File system&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp; Flags<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            1049kB&nbsp; 17.2GB&nbsp; 17.2GB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary&nbsp; lvm<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Model:
            Linux device-mapper (linear) (dm)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Disk
            /dev/mapper/VolGroup-lv_swap: 2147MB<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Sector
            size (logical/physical): 512B/512B<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Partition
            Table: loop<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Number&nbsp;
            Start&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp;&nbsp;&nbsp; File system&nbsp;&nbsp;&nbsp;&nbsp; Flags<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            0.00B&nbsp; 2147MB&nbsp; 2147MB&nbsp; linux-swap(v1)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Model:
            Linux device-mapper (linear) (dm)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Disk
            /dev/mapper/VolGroup-lv_root: 10.2GB<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Sector
            size (logical/physical): 512B/512B<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Partition
            Table: loop<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">Number&nbsp;
            Start&nbsp; End&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp;&nbsp;&nbsp; File system&nbsp; Flags<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            0.00B&nbsp; 10.2GB&nbsp; 10.2GB&nbsp; ext4<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Set up physical volume for "/dev/sdb1" with 33552351
            available sectors<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Zeroing start of device /dev/sdb1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Writing physical volume data to disk "/dev/sdb1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Physical volume "/dev/sdb1" successfully created<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Set up physical volume for "/dev/sdc1" with 33552351
            available sectors<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Zeroing start of device /dev/sdc1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Writing physical volume data to disk "/dev/sdc1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Physical volume "/dev/sdc1" successfully created<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Set up physical volume for "/dev/sdd1" with 33552351
            available sectors<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Zeroing start of device /dev/sdd1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Writing physical volume data to disk "/dev/sdd1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Physical volume "/dev/sdd1" successfully created<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Scanning for physical volume names<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping cache of LVM-capable devices<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fmt&nbsp; Attr PSize&nbsp; PFree&nbsp; DevSize PV
            UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;/dev/sda2&nbsp;
            VolGroup lvm2 a--&nbsp; 11.51g&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 11.51g
            JjV0kz-rW98-zTxe-X1jm-T9h3-i6SG-Frd325<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            /dev/sdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 a--&nbsp; 16.00g 16.00g&nbsp; 16.00g
            k7kxWU-W1bh-Eqda-xVj8-aBva-efN4-Et5B94<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            /dev/sdc1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 a--&nbsp; 16.00g 16.00g&nbsp; 16.00g
            9M29V5-qldE-mSVl-Z2UY-h9nM-1F3i-AEsNYu<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            /dev/sdd1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 a--&nbsp; 16.00g 16.00g&nbsp; 16.00g
            zPpXzZ-ptwp-qxok-ubNq-asmz-Ifcj-QtRvfv<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping cache of LVM-capable devices<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping internal VG cache<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Walking through all physical volumes<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sda2&nbsp;&nbsp; VG VolGroup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [11.51 GiB / 0&nbsp;&nbsp;&nbsp;
            free]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [16.00 GiB]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sdc1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [16.00 GiB]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            PV /dev/sdd1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [16.00 GiB]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Total: 4 [59.50 GiB] / in use: 1 [11.51 GiB] / in no VG: 3
            [48.00 GiB]<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping cache of LVM-capable devices<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping cache of LVM-capable devices<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Adding physical volume '/dev/sdb1' to volume group
            'vg_system1'<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Adding physical volume '/dev/sdc1' to volume group
            'vg_system1'<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Adding physical volume '/dev/sdd1' to volume group
            'vg_system1'<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Archiving volume group "vg_system1" metadata (seqno 0).<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating volume group backup "/etc/lvm/backup/vg_system1"
            (seqno 1).<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Volume group "vg_system1" successfully created<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding all volume groups<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding volume group "vg_system1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding volume group "VolGroup"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp; Ext&nbsp;&nbsp; #PV #LV #SN VSize&nbsp; VFree&nbsp; VG
            UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VProfile<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            VolGroup&nbsp;&nbsp; wz--n- 4.00m&nbsp;&nbsp; 1&nbsp;&nbsp; 2&nbsp;&nbsp; 0 11.51g&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;
            oaJmPd-ElY9-a0E9-hUlu-SLxE-XTje-LfpO31&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;vg_system1
            wz--n- 4.00k&nbsp;&nbsp; 3&nbsp;&nbsp; 0&nbsp;&nbsp; 0 47.99g 47.99g
            hZTC0w-k0bJ-6M2A-Fmky-hHLo-hzHM-k8gdPl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;Wiping
            cache of LVM-capable devices<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Wiping internal VG cache<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Reading all physical volumes.&nbsp; This may take a while...<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding all volume groups<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding volume group "vg_system1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Found volume group "vg_system1" using metadata type lvm2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding volume group "VolGroup"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Found volume group "VolGroup" using metadata type lvm2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Setting logging type to disk<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding volume group "vg_system1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Archiving volume group "vg_system1" metadata (seqno 1).<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1_rimage_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1_rmeta_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1_rimage_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1_rmeta_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1_rimage_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating logical volume lv_system1_rmeta_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            activation/volume_list configuration setting not defined:
            Checking only host tags for vg_system1/lv_system1_rmeta_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rmeta_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rmeta_0 table (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rmeta_0 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing metadata area of vg_system1/lv_system1_rmeta_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing start of logical volume "lv_system1_rmeta_0"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Removing vg_system1-lv_system1_rmeta_0 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            activation/volume_list configuration setting not defined:
            Checking only host tags for vg_system1/lv_system1_rmeta_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rmeta_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rmeta_1 table (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rmeta_1 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing metadata area of vg_system1/lv_system1_rmeta_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing start of logical volume "lv_system1_rmeta_1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Removing vg_system1-lv_system1_rmeta_1 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            activation/volume_list configuration setting not defined:
            Checking only host tags for vg_system1/lv_system1_rmeta_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rmeta_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rmeta_2 table (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rmeta_2 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing metadata area of vg_system1/lv_system1_rmeta_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing start of logical volume "lv_system1_rmeta_2"<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Removing vg_system1-lv_system1_rmeta_2 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating volume group backup "/etc/lvm/backup/vg_system1"
            (seqno 3).<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            activation/volume_list configuration setting not defined:
            Checking only host tags for vg_system1/lv_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rmeta_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rmeta_0 table (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rmeta_0 (253:2)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rimage_0<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rimage_0 table (253:3)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rimage_0 (253:3)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rmeta_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rmeta_1 table (253:4)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rmeta_1 (253:4)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rimage_1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rimage_1 table (253:5)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rimage_1 (253:5)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rmeta_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rmeta_2 table (253:6)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rmeta_2 (253:6)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1_rimage_2<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1_rimage_2 table (253:7)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1_rimage_2 (253:7)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating vg_system1-lv_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Loading vg_system1-lv_system1 table (253:8)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Resuming vg_system1-lv_system1 (253:8)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Monitoring vg_system1/lv_system1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Clearing start of logical volume "lv_system1"<o:p></o:p></span></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: read
              failed after 0 of 4096 at 0: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><b><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;;color:red">&nbsp; /dev/vg_system1/lv_system1: write
              failed after 0 of 4096 at 0: Input/output error<o:p></o:p></span></b></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Creating volume group backup "/etc/lvm/backup/vg_system1"
            (seqno 3).<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            Logical volume "lv_system1" created<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;
            Finding all logical volumes<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #Seg Attr&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LSize Maj Min KMaj
            KMin Pool Origin Data%&nbsp; Meta%&nbsp; Move Cpy%Sync Log Convert LV
            UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LProfile<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            lv_root&nbsp;&nbsp;&nbsp; VolGroup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 -wi-ao---- 9.51g&nbsp; -1&nbsp; -1 253&nbsp;
            0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            BG77rR-C2lS-UXzm-V4KI-ptcG-1BZu-0yqVcV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;lv_swap&nbsp;&nbsp;&nbsp;
            VolGroup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 -wi-ao---- 2.00g&nbsp; -1&nbsp; -1 253&nbsp;
            1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            i6uo0r-9T2P-OW60-Z1i7-6o7y-id1Q-1R7Lli&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;lv_system1
            vg_system1&nbsp;&nbsp;&nbsp; 1 rwi-a-r-r- 5.00g&nbsp; -1&nbsp; -1 253&nbsp;
            8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            GM0hKc-BHNV-CUAR-y0US-5Iw9-Ihi0-GSFD1V&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;Finding
            all logical volumes<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/vg_system1/lv_system1' [5.00 GiB]
            inherit<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/VolGroup/lv_root' [9.51 GiB] inherit<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:9.0pt;font-family:&quot;Courier New&quot;">&nbsp;
            ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/VolGroup/lv_swap' [2.00 GiB] inherit<o:p></o:p></span></p>
        <div
          style="mso-element:para-border-div;border:none;border-bottom:double
          windowtext 2.25pt;padding:0cm 0cm 1.0pt 0cm">
          <p class="MsoNormal" style="border:none;padding:0cm"><span
              style="font-size:9.0pt;font-family:&quot;Courier
              New&quot;">[root@localhost ~]#</span><o:p></o:p></p>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090004010908010505090000--
