Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3920aTn024704
	for <linux-lvm@redhat.com>; Sun, 8 Apr 2007 22:00:36 -0400
Received: from mail.mediacell.com
	(74-92-210-145-Colorado.hfc.comcastbusiness.net [74.92.210.145]
	(may be forged))
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3920WjF028968
	for <linux-lvm@redhat.com>; Sun, 8 Apr 2007 22:00:34 -0400
Received: from [192.168.0.229] (asbestos.bish0p.org [74.92.210.149])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by mail.mediacell.com (Postfix) with ESMTP id 75D23D1271
	for <linux-lvm@redhat.com>; Sun,  8 Apr 2007 20:00:31 -0600 (MDT)
From: Don Bishop <donbishop@mediacell.com>
Content-Type: multipart/alternative; boundary="=-mT9PF/ACXlWR6vkVoVN+"
Date: Sun, 08 Apr 2007 20:03:48 -0600
Message-Id: <1176084228.14147.47.camel@zit>
Mime-Version: 1.0
Subject: [linux-lvm] Unrecognised segment type mirror
Reply-To: donbishop@mediacell.com,
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
To: linux-lvm@redhat.com


--=-mT9PF/ACXlWR6vkVoVN+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have just recently installed LVM2 on top of a 4-disk software RAID5
array under Gentoo Linux (x86).  I have four other machines with a
similar configuration although they are variously EIDE, SATA, and
SCSI-based).

This 5th machine gives the following error/warning whenever running any
of the lvm tools (vgdisplay, pvdisplay, lvdisplay, vgscan, etc).  The
drives are all identical EIDE WD2500JBRTL, partitions are type fd, and
are a single partition drives.

Unrecognised segment type mirror

This above error repeats once for each logical volume I create using,
eg,  lvcreate -L10G -nwhatever vg0

Here is the output from vgscan:

pus ~ # vgscan
    Logging initialised at Sun Apr  8 19:39:58 2007
    Set umask to 0077
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "vg0"
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Found volume group "vg0" using metadata type lvm2
    Wiping internal VG cache


I have tried various filters, etc, to no avail.  It seems to be linked
to the /dev/md/0 logical volumes.  Here is the output from lvdisplay

pus ~ # lvdisplay
    Logging initialised at Sun Apr  8 19:49:17 2007
    Set umask to 0077
    Finding all logical volumes
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  Unrecognised segment type mirror
  --- Logical volume ---
  LV Name                /dev/vg0/ccache
  VG Name                vg0
  LV UUID                nO0w8H-WsOA-8djw-Xk9w-xE25-mH0o-9pD4B2
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
   
  --- Logical volume ---
  LV Name                /dev/vg0/netstor
  VG Name                vg0
  LV UUID                38f0Cs-WJ0Q-BNhJ-yCwn-3oqw-xBHT-9yjKGy
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                200.00 GB
  Current LE             51200
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
   
  --- Logical volume ---
  LV Name                /dev/vg0/portage
  VG Name                vg0
  LV UUID                3AgwV0-lfLN-ksVr-68fT-d2E6-HsTE-ffEYOb
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                10.00 GB
  Current LE             2560
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2
   
  --- Logical volume ---
  LV Name                /dev/vg0/livecd
  VG Name                vg0
  LV UUID                yfrzKx-pCnE-43Oc-QA0K-nooy-GTn8-EH16QM
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                6.00 GB
  Current LE             1536
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3
   
  --- Logical volume ---
  LV Name                /dev/vg0/mediacell
  VG Name                vg0
  LV UUID                3xaj3s-1E8c-HJuH-8ADe-ZTuP-b8iW-PMcNuS
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                20.00 GB
  Current LE             5120
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4
   
  --- Logical volume ---
  LV Name                /dev/vg0/home
  VG Name                vg0
  LV UUID                3vD1l9-oCwM-pG8C-c37H-p9hw-HIWq-D1hB0k
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                60.00 GB
  Current LE             15360
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5
   
    Wiping internal VG cache




I'd appreciate any help, this error only happens on this machine.

thanks,
Don B


--=-mT9PF/ACXlWR6vkVoVN+
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.12.2">
</HEAD>
<BODY>
I have just recently installed LVM2 on top of a 4-disk software RAID5 array under Gentoo Linux (x86).&nbsp; I have four other machines with a similar configuration although they are variously EIDE, SATA, and SCSI-based).<BR>
<BR>
This 5th machine gives the following error/warning whenever running any of the lvm tools (vgdisplay, pvdisplay, lvdisplay, vgscan, etc).&nbsp; The drives are all identical EIDE WD2500JBRTL, partitions are type fd, and are a single partition drives.<BR>
<BR>
<TT>Unrecognised segment type mirror</TT><BR>
<BR>
This above error repeats once for each logical volume I create using, eg,&nbsp; lvcreate -L10G -nwhatever vg0<BR>
<BR>
Here is the output from vgscan:<BR>
<BR>
pus ~ # vgscan<BR>
&nbsp;&nbsp;&nbsp; Logging initialised at Sun Apr&nbsp; 8 19:39:58 2007<BR>
&nbsp;&nbsp;&nbsp; Set umask to 0077<BR>
&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable devices<BR>
&nbsp;&nbsp;&nbsp; Wiping internal VG cache<BR>
&nbsp; Reading all physical volumes.&nbsp; This may take a while...<BR>
&nbsp;&nbsp;&nbsp; Finding all volume groups<BR>
&nbsp;&nbsp;&nbsp; Finding volume group &quot;vg0&quot;<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Found volume group &quot;vg0&quot; using metadata type lvm2<BR>
&nbsp;&nbsp;&nbsp; Wiping internal VG cache<BR>
<BR>
<BR>
I have tried various filters, etc, to no avail.&nbsp; It seems to be linked to the /dev/md/0 logical volumes.&nbsp; Here is the output from lvdisplay<BR>
<BR>
pus ~ # lvdisplay<BR>
&nbsp;&nbsp;&nbsp; Logging initialised at Sun Apr&nbsp; 8 19:49:17 2007<BR>
&nbsp;&nbsp;&nbsp; Set umask to 0077<BR>
&nbsp;&nbsp;&nbsp; Finding all logical volumes<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; Unrecognised segment type mirror<BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg0/ccache<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg0<BR>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nO0w8H-WsOA-8djw-Xk9w-xE25-mH0o-9pD4B2<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.00 GB<BR>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 512<BR>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:0<BR>
&nbsp;&nbsp; <BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg0/netstor<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg0<BR>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38f0Cs-WJ0Q-BNhJ-yCwn-3oqw-xBHT-9yjKGy<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 200.00 GB<BR>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51200<BR>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:1<BR>
&nbsp;&nbsp; <BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg0/portage<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg0<BR>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3AgwV0-lfLN-ksVr-68fT-d2E6-HsTE-ffEYOb<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10.00 GB<BR>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2560<BR>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:2<BR>
&nbsp;&nbsp; <BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg0/livecd<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg0<BR>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yfrzKx-pCnE-43Oc-QA0K-nooy-GTn8-EH16QM<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.00 GB<BR>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1536<BR>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:3<BR>
&nbsp;&nbsp; <BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg0/mediacell<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg0<BR>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3xaj3s-1E8c-HJuH-8ADe-ZTuP-b8iW-PMcNuS<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20.00 GB<BR>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5120<BR>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:4<BR>
&nbsp;&nbsp; <BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg0/home<BR>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg0<BR>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3vD1l9-oCwM-pG8C-c37H-p9hw-HIWq-D1hB0k<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 60.00 GB<BR>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15360<BR>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:5<BR>
&nbsp;&nbsp; <BR>
&nbsp;&nbsp;&nbsp; Wiping internal VG cache<BR>
<BR>
<BR>
<BR>
<BR>
I'd appreciate any help, this error only happens on this machine.<BR>
<BR>
thanks,<BR>
Don B<BR>
<BR>
</BODY>
</HTML>

--=-mT9PF/ACXlWR6vkVoVN+--
