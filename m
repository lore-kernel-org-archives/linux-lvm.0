Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBQJaV131924
	for <linux-lvm@redhat.com>; Mon, 26 Dec 2005 14:36:31 -0500
Received: from web32505.mail.mud.yahoo.com (web32505.mail.mud.yahoo.com
	[68.142.207.215])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jBQJaTBe024232
	for <linux-lvm@redhat.com>; Mon, 26 Dec 2005 14:36:30 -0500
Message-ID: <20051226193622.71516.qmail@web32505.mail.mud.yahoo.com>
Date: Mon, 26 Dec 2005 11:36:21 -0800 (PST)
From: natasha patil <natasha182_pune@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1633552131-1135625781=:70922"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Error in "lvcreate" in LVM2
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

--0-1633552131-1135625781=:70922
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

   Hi,
      I am using mandrake 10.2 , and have installed
      1)device-mapper.1.01.05.tgz
      2)LVM2.2.01.15.tgz
      and have untar the patches in "/usr/src/linux-2.6.11-6mdk"
  
  I have succesfully created physical volume using :         pvcreate 
then  created volume group  using                         :         vgcreate
  
  
  
  [root@localhost ~]# vgdisplay
      --- Volume group ---
      VG Name               volume1
      System ID
      Format                lvm2
      Metadata Areas        2
      Metadata Sequence No  1
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                0
      Open LV               0
      Max PV                0
      Cur PV                2
      Act PV                2
      VG Size               6.35 GB
      PE Size               4.00 MB
      Total PE              1626
      Alloc PE / Size       0 / 0
      Free  PE / Size       1626 / 6.35 GB
    VG  UUID                zZO4ie-mfY7-st4p-G6ah-tnyf-S5Nt-7AWkzu
    
  
  but while creating  logical volumes from volume group i get following messages :
  
  [root@localhost ~]# lvcreate -L1500 -nshash volume1
  
    /proc/misc: No entry for device-mapper found
    Is device-mapper driver missing from kernel?
    Failure to communicate with kernel device-mapper driver.
    striped: Required device-mapper target(s) not detected in your kernel
    lvcreate: Create a logical volume
  
  lvcreate
          [-A|--autobackup {y|n}]
          [--addtag Tag]
          [--alloc AllocationPolicy]
          [-C|--contiguous {y|n}]
          [-d|--debug]
          [-h|-?|--help]
          [-i|--stripes Stripes [-I|--stripesize StripeSize]]
          {-l|--extents LogicalExtentsNumber |
           -L|--size LogicalVolumeSize[kKmMgGtT]}
          [-M|--persistent {y|n}] [--major major] [--minor minor]
          [-m|--mirrors Mirrors]
          [-n|--name LogicalVolumeName]
          [-p|--permission {r|rw}]
          [-r|--readahead ReadAheadSectors]
          [-R|--regionsize MirrorLogRegionSize]
          [-t|--test]
          [--type VolumeType]
          [-v|--verbose]
          [-Z|--zero {y|n}]
          [--version]
          VolumeGroupName [PhysicalVolumePath...]
  
  lvcreate -s|--snapshot
          [-c|--chunksize]
          [-A|--autobackup {y|n}]
          [--addtag Tag]
          [--alloc AllocationPolicy]
          [-C|--contiguous {y|n}]
          [-d|--debug]
          [-h|-?|--help]
          [-i|--stripes Stripes [-I|--stripesize StripeSize]]
          {-l|--extents LogicalExtentsNumber |
           -L|--size LogicalVolumeSize[kKmMgGtT]}
          [-M|--persistent {y|n}] [--major major] [--minor minor]
          [-n|--name LogicalVolumeName]
          [-p|--permission {r|rw}]
          [-r|--readahead ReadAheadSectors]
          [-t|--test]
          [-v|--verbose]
          [--version]
          OriginalLogicalVolume[Path] [PhysicalVolumePath...]
  
  ------------------------------------------------------------------------------------------------
  
  [root@localhost ~]# lvcreate -i2 -I8 -l100 -nanothervolume1 volume1
    
    /proc/misc: No entry for device-mapper found
    Is device-mapper driver missing from kernel?
    Failure to communicate with kernel device-mapper driver.
    striped: Required device-mapper target(s) not detected in your kernel
    lvcreate: Create a logical volume
  
  lvcreate
          [-A|--autobackup {y|n}]
          [--addtag Tag]
          [--alloc AllocationPolicy]
          [-C|--contiguous {y|n}]
          [-d|--debug]
          [-h|-?|--help]
          [-i|--stripes Stripes [-I|--stripesize StripeSize]]
          {-l|--extents LogicalExtentsNumber |
           -L|--size LogicalVolumeSize[kKmMgGtT]}
          [-M|--persistent {y|n}] [--major major] [--minor minor]
          [-m|--mirrors Mirrors]
          [-n|--name LogicalVolumeName]
          [-p|--permission {r|rw}]
          [-r|--readahead ReadAheadSectors]
          [-R|--regionsize MirrorLogRegionSize]
          [-t|--test]
          [--type VolumeType]
          [-v|--verbose]
          [-Z|--zero {y|n}]
          [--version]
          VolumeGroupName [PhysicalVolumePath...]
  
  lvcreate -s|--snapshot
          [-c|--chunksize]
          [-A|--autobackup {y|n}]
          [--addtag Tag]
          [--alloc AllocationPolicy]
          [-C|--contiguous {y|n}]
          [-d|--debug]
          [-h|-?|--help]
          [-i|--stripes Stripes [-I|--stripesize StripeSize]]
          {-l|--extents LogicalExtentsNumber |
           -L|--size LogicalVolumeSize[kKmMgGtT]}
          [-M|--persistent {y|n}] [--major major] [--minor minor]
          [-n|--name LogicalVolumeName]
          [-p|--permission {r|rw}]
          [-r|--readahead ReadAheadSectors]
          [-t|--test]
          [-v|--verbose]
          [--version]
          OriginalLogicalVolume[Path] [PhysicalVolumePath...]
  
  please help me ....
  what is the problem here?
                                                                       -Shashank K.
                                                                         PhD C.S.
                                                                         IIT POWOI
                                                                         INDIA 
  
  
  
  

		
---------------------------------
 Yahoo! DSL Something to write home about. Just $16.99/mo. or less
--0-1633552131-1135625781=:70922
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent">&nbsp;  <div id="RTEContent">Hi,<br>  &nbsp;&nbsp;&nbsp; I am using mandrake 10.2 , and have installed<br>  &nbsp;&nbsp;&nbsp; 1)device-mapper.1.01.05.tgz<br>  &nbsp;&nbsp;&nbsp; 2)LVM2.2.01.15.tgz<br>  &nbsp;&nbsp;&nbsp; and have untar the patches in "/usr/src/linux-2.6.11-6mdk"<br>  <br>  I have succesfully created physical volume using :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pvcreate <br>then  created volume group  using&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgcreate<br>  <br>  <br>  <br>  [root@localhost ~]# vgdisplay<br>    &nbsp; --- Volume group ---<br>    &nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; volume1<br>    &nbsp; System ID<br>    &nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n!
bsp;
 lvm2<br>    &nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>    &nbsp; Metadata Sequence No&nbsp; 1<br>    &nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>    &nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>    &nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>    &nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>    &nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>    &nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>    &nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>    &nbsp; Act
 PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>    &nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.35 GB<br>    &nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00 MB<br>    &nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1626<br>    &nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<br>    &nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1626 / 6.35 GB<br>  &nbsp; VG  UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  zZO4ie-mfY7-st4p-G6ah-tnyf-S5Nt-7AWkzu<br>    <br>  <br>  but while creating&nbsp; logical volumes from volume group i get following messages :<br>  <br>  [root@localhost ~]# lvcreate -L1500 -nshash volume1<br>  <br>  &nbsp; /proc/misc: No entry for device-mapper found<br>  &nbsp; Is device-map!
per
 driver missing from kernel?<br>  &nbsp; Failure to communicate with kernel device-mapper driver.<br>  &nbsp; striped: Required device-mapper target(s) not detected in your kernel<br>  &nbsp; lvcreate: Create a logical volume<br>  <br>  lvcreate<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-A|--autobackup {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--addtag Tag]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--alloc AllocationPolicy]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-C|--contiguous {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-d|--debug]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-h|-?|--help]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-i|--stripes Stripes [-I|--stripesize StripeSize]]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-l|--extents LogicalExtentsNumber |<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -L|--size LogicalVolumeSize[kKmMgGtT]}<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-M|--persi!
stent
 {y|n}] [--major major] [--minor minor]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-m|--mirrors Mirrors]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-n|--name LogicalVolumeName]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-p|--permission {r|rw}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-r|--readahead ReadAheadSectors]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-R|--regionsize MirrorLogRegionSize]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-t|--test]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--type VolumeType]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-v|--verbose]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-Z|--zero {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--version]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolumeGroupName [PhysicalVolumePath...]<br>  <br>  lvcreate -s|--snapshot<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-c|--chunksize]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-A|--a!
utobackup
 {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--addtag Tag]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--alloc AllocationPolicy]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-C|--contiguous {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-d|--debug]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-h|-?|--help]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-i|--stripes Stripes [-I|--stripesize StripeSize]]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-l|--extents LogicalExtentsNumber |<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -L|--size LogicalVolumeSize[kKmMgGtT]}<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-M|--persistent {y|n}] [--major major] [--minor minor]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-n|--name LogicalVolumeName]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-p|--permission {r|rw}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-r|--readahead ReadAheadSectors]<br> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-t|--test]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-v|--verbose]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--version]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OriginalLogicalVolume[Path] [PhysicalVolumePath...]<br>  <br>  ------------------------------------------------------------------------------------------------<br>  <br>  [root@localhost ~]# lvcreate -i2 -I8 -l100 -nanothervolume1 volume1<br>  &nbsp; <br>  &nbsp; /proc/misc: No entry for device-mapper found<br>  &nbsp; Is device-mapper driver missing from kernel?<br>  &nbsp; Failure to communicate with kernel device-mapper driver.<br>  &nbsp; striped: Required device-mapper target(s) not detected in your kernel<br>  &nbsp; lvcreate: Create a logical volume<br>  <br>  lvcreate<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-A|--autobackup {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--addtag Tag]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb!
sp;
 [--alloc AllocationPolicy]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-C|--contiguous {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-d|--debug]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-h|-?|--help]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-i|--stripes Stripes [-I|--stripesize StripeSize]]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-l|--extents LogicalExtentsNumber |<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -L|--size LogicalVolumeSize[kKmMgGtT]}<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-M|--persistent {y|n}] [--major major] [--minor minor]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-m|--mirrors Mirrors]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-n|--name LogicalVolumeName]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-p|--permission {r|rw}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-r|--readahead ReadAheadSectors]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-R|--regionsize
 MirrorLogRegionSize]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-t|--test]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--type VolumeType]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-v|--verbose]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-Z|--zero {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--version]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolumeGroupName [PhysicalVolumePath...]<br>  <br>  lvcreate -s|--snapshot<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-c|--chunksize]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-A|--autobackup {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--addtag Tag]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--alloc AllocationPolicy]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-C|--contiguous {y|n}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-d|--debug]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-h|-?|--help]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-i|--str!
ipes
 Stripes [-I|--stripesize StripeSize]]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-l|--extents LogicalExtentsNumber |<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -L|--size LogicalVolumeSize[kKmMgGtT]}<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-M|--persistent {y|n}] [--major major] [--minor minor]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-n|--name LogicalVolumeName]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-p|--permission {r|rw}]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-r|--readahead ReadAheadSectors]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-t|--test]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [-v|--verbose]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [--version]<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OriginalLogicalVolume[Path] [PhysicalVolumePath...]<br>  <br>  please help me ....<br>  what is the problem here?<br> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -Shashank K.<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  PhD C.S.<br> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  IIT POWOI<br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  INDIA <br>  <br>  <br>  </div>  </div><p>
		<hr size=1> <a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=37474/*http://promo.yahoo.com/broadband/ 
">Yahoo! DSL</a> Something to write home about. Just $16.99/mo. or less
--0-1633552131-1135625781=:70922--
