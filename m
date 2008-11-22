Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAMLnE6F020841
	for <linux-lvm@redhat.com>; Sat, 22 Nov 2008 16:49:14 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAMLn2Mj023155
	for <linux-lvm@redhat.com>; Sat, 22 Nov 2008 16:49:02 -0500
Received: by ug-out-1314.google.com with SMTP id j30so454525ugc.13
	for <linux-lvm@redhat.com>; Sat, 22 Nov 2008 13:49:01 -0800 (PST)
Message-ID: <614f37be0811221349v64bc0ba2x2419618458c61780@mail.gmail.com>
Date: Sat, 22 Nov 2008 16:49:01 -0500
From: "Gary Desrochers" <garybrenda@comcast.net>
Sender: garyfdes@gmail.com
In-Reply-To: <614f37be0811211734v20c2ccb7y68948ad0c83b66f8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_111487_28090350.1227390541896"
References: <614f37be0811211734v20c2ccb7y68948ad0c83b66f8@mail.gmail.com>
Subject: [linux-lvm] Re: Cannot find out what to use for the volume.
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

------=_Part_111487_28090350.1227390541896
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Did this make it?  I have did not get it after signing up and I don't see it
in the list.  Oh well, here is the question again.

On Fri, Nov 21, 2008 at 8:34 PM, Gary wrote:

> I had a disk failure for my lvm mirror.  It was between two disks.  This
> was a failure of the primary.
>
> I have been trying to recover the mirror but I cannot find directions as to
> what to do.
>
> Seems like if I create a new partition, give it the old uuid and then try
> to load everything I get superblock errors.
>
> So how do you fix up from a crashed primary mirror?
>
> By the way, what is below is before I make a partition and create it
> properly with the uuid (as all the web pages say to do).
> I have done that but get the file system superblock error when I mount it.
>
> I have not done anything to the other partition but this is what I am
> starting with.
> pvscan
>
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   PV unknown device   VG backup_vg            lvm2 [232.84 GB / 20.00 MB
> free]
>   PV /dev/sda6        VG backup_vg            lvm2 [232.84 GB / 24.00 MB
> free]
>   PV /dev/sda5        VG video_volume_group   lvm2 [213.77 GB / 13.77 GB
> free]
>   PV /dev/sdb1                                lvm2 [189.92 GB]
>   Total: 4 [869.36 GB] / in use: 3 [679.44 GB] / in no VG: 1 [189.92 GB]
>
> pvdisplay -v
>     Scanning for physical volume names
>     Wiping cache of LVM-capable devices
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find all physical volumes for volume group backup_vg.
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find all physical volumes for volume group backup_vg.
>   Can't read backup_vg: skipping
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find all physical volumes for volume group backup_vg.
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find all physical volumes for volume group backup_vg.
>   Can't read backup_vg: skipping
>   --- Physical volume ---
>   PV Name               /dev/sda5
>   VG Name               video_volume_group
>   PV Size               213.77 GB / not usable 1.28 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              54725
>   Free PE               3525
>   Allocated PE          51200
>   PV UUID               nEYdPc-IWr3-oJgf-TFLO-37OC-7vjv-FcbEC7
>
>   --- NEW Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name
>   PV Size               189.92 GB
>   Allocatable           NO
>   PE Size (KByte)       0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               37Mxhe-nxDh-yfPz-61TB-y8OJ-4Jrb-GKckqr
>
>
> vgdisplay -v
>     Finding all volume groups
>     Finding volume group "backup_vg"
>     Wiping cache of LVM-capable devices
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find all physical volumes for volume group backup_vg.
>   Couldn't find device with uuid 'xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy'.
>   Couldn't find all physical volumes for volume group backup_vg.
>   Volume group "backup_vg" not found
>     Finding volume group "video_volume_group"
>   --- Volume group ---
>   VG Name               video_volume_group
>   System ID
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  30
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               213.77 GB
>   PE Size               4.00 MB
>   Total PE              54725
>   Alloc PE / Size       51200 / 200.00 GB
>   Free  PE / Size       3525 / 13.77 GB
>   VG UUID               ZMY89I-pdP8-QRey-yjx2-Y750-5isR-KOtd10
>
>   --- Logical volume ---
>   LV Name                /dev/video_volume_group/video_logical_volume
>   VG Name                video_volume_group
>   LV UUID                xaHgAn-Onic-uZEj-WAaQ-Cucc-7e8e-pVoo3p
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                200.00 GB
>   Current LE             51200
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:3
>
>   --- Physical volumes ---
>   PV Name               /dev/sda5
>   PV UUID               nEYdPc-IWr3-oJgf-TFLO-37OC-7vjv-FcbEC7
>   PV Status             allocatable
>   Total PE / Free PE    54725 / 3525
>
> Gary
>

------=_Part_111487_28090350.1227390541896
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Did this make it? &nbsp;I have did not get it after signing up and I don&#39;t see it in the list. &nbsp;Oh well, here is the question again.<br><br><div class="gmail_quote">On Fri, Nov 21, 2008 at 8:34 PM, Gary wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
I had a disk failure for my lvm mirror.&nbsp; It was between two disks.&nbsp; This was a failure of the primary.<br><br>I have been trying to recover the mirror but I cannot find directions as to what to do.<br><br>Seems like if I create a new partition, give it the old uuid and then try to load everything I get superblock errors.<br>

<br>So how do you fix up from a crashed primary mirror?<br><br>By the way, what is below is before I make a partition and create it properly with the uuid (as all the web pages say to do).<br>I have done that but get the file system superblock error when I mount it.<br>

<br>I have not done anything to the other partition but this is what I am starting with.<br>pvscan<br><br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>

&nbsp; PV unknown device&nbsp;&nbsp; VG backup_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [232.84 GB / 20.00 MB free]<br>&nbsp; PV /dev/sda6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG backup_vg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [232.84 GB / 24.00 MB free]<br>&nbsp; PV /dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG video_volume_group&nbsp;&nbsp; lvm2 [213.77 GB / 13.77 GB free]<br>

&nbsp; PV /dev/sdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [189.92 GB]<br>&nbsp; Total: 4 [869.36 GB] / in use: 3 [679.44 GB] / in no VG: 1 [189.92 GB]<br><br>pvdisplay -v<br>&nbsp;&nbsp;&nbsp; Scanning for physical volume names<br>&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable devices<br>

&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>

&nbsp; Couldn&#39;t find all physical volumes for volume group backup_vg.<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>&nbsp; Couldn&#39;t find all physical volumes for volume group backup_vg.<br>

&nbsp; Can&#39;t read backup_vg: skipping<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>&nbsp; Couldn&#39;t find all physical volumes for volume group backup_vg.<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>

&nbsp; Couldn&#39;t find all physical volumes for volume group backup_vg.<br>&nbsp; Can&#39;t read backup_vg: skipping<br>&nbsp; --- Physical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda5<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; video_volume_group<br>

&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 213.77 GB / not usable 1.28 MB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 54725<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3525<br>&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51200<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nEYdPc-IWr3-oJgf-TFLO-37OC-7vjv-FcbEC7<br>

<br>&nbsp; --- NEW Physical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb1<br>&nbsp; VG Name<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 189.92 GB<br>&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>

&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 37Mxhe-nxDh-yfPz-61TB-y8OJ-4Jrb-GKckqr<br><br><br>vgdisplay -v <br>&nbsp;&nbsp;&nbsp; Finding all volume groups<br>&nbsp;&nbsp;&nbsp; Finding volume group &quot;backup_vg&quot;<br>&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable devices<br>

&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>&nbsp; Couldn&#39;t find all physical volumes for volume group backup_vg.<br>&nbsp; Couldn&#39;t find device with uuid &#39;xXD0U6-1s5q-avfG-yuHR-CoX0-53Kl-F1WbBy&#39;.<br>

&nbsp; Couldn&#39;t find all physical volumes for volume group backup_vg.<br>&nbsp; Volume group &quot;backup_vg&quot; not found<br>&nbsp;&nbsp;&nbsp; Finding volume group &quot;video_volume_group&quot;<br>&nbsp; --- Volume group ---<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; video_volume_group<br>

&nbsp; System ID<br>&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Metadata Sequence No&nbsp; 30<br>&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>

&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 213.77 GB<br>&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00 MB<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 54725<br>

&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51200 / 200.00 GB<br>&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3525 / 13.77 GB<br>&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZMY89I-pdP8-QRey-yjx2-Y750-5isR-KOtd10<br><br>&nbsp; --- Logical volume ---<br>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/video_volume_group/video_logical_volume<br>

&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; video_volume_group<br>&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xaHgAn-Onic-uZEj-WAaQ-Cucc-7e8e-pVoo3p<br>&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<br>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>

&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 200.00 GB<br>&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51200<br>&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<br>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:3<br><br>&nbsp; --- Physical volumes ---<br>

&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda5<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nEYdPc-IWr3-oJgf-TFLO-37OC-7vjv-FcbEC7<br>&nbsp; PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; allocatable<br>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 54725 / 3525<br><font color="#888888"><br>Gary<br>
</font></blockquote></div><br>

------=_Part_111487_28090350.1227390541896--
