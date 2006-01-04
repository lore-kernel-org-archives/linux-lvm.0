Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k04NMU104279
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 18:22:30 -0500
Received: from dedicateddev.com (66-195-47-65.gen.twtelecom.net [66.195.47.65])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k04NMMNg016440
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 18:22:23 -0500
From: Lewis Hall <lewis@dedicateddev.com>
Content-Type: multipart/alternative; boundary="=-UQW1DXLDig5KkWUNqEjN"
Date: Wed, 04 Jan 2006 16:22:17 -0700
Message-Id: <1136416937.5293.18.camel@lewis-lx.nam.dedicateddev.com>
Mime-Version: 1.0
Subject: [linux-lvm] Physical extent  size <-> ~256GB limit
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


--=-UQW1DXLDig5KkWUNqEjN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I am using LVM version 2.00.25.

The man page states that there is a ~256GB limit if physical extent size
is set to 4MB, because number of physical extents per LV is limited to
~64K.

Is this actually still true with this version?

My system is set to 4MB physical extent size, and total size is 614GB,
with number of PE's in the LV  157363.
No problems experienced yet.

See below for details.

Hints?

Thanks,

Lewis









# pvdisplay
pvdisplay  --- Physical volume ---
pvdisplay  PV Name               /dev/scsi/host3/bus0/target0/lun0/disc
pvdisplay  VG Name               vg00
pvdisplay  PV Size               279.46 GB / not usable 0
pvdisplay  Allocatable           yes (but full)
pvdisplay  PE Size (KByte)       4096
pvdisplay  Total PE              71541
pvdisplay  Free PE               0
pvdisplay  Allocated PE          71541
pvdisplay  PV UUID               eG78ji-ImGJ-5dSd-D4mv-CbOd-dFhy-5ZQknf
pvdisplay
pvdisplay  --- Physical volume ---
pvdisplay  PV Name               /dev/scsi/host1/bus0/target0/lun0/disc
pvdisplay  VG Name               vg00
pvdisplay  PV Size               111.79 GB / not usable 0
pvdisplay  Allocatable           yes (but full)
pvdisplay  PE Size (KByte)       4096
pvdisplay  Total PE              28618
pvdisplay  Free PE               0
pvdisplay  Allocated PE          28618
pvdisplay  PV UUID               g6jrz8-A3qA-Cwy2-8fm9-de77-2O1j-2SS9nU
pvdisplay
pvdisplay  --- Physical volume ---
pvdisplay  PV Name               /dev/scsi/host0/bus0/target0/lun0/disc
pvdisplay  VG Name               vg00
pvdisplay  PV Size               111.79 GB / not usable 0
pvdisplay  Allocatable           yes (but full)
pvdisplay  PE Size (KByte)       4096
pvdisplay  Total PE              28618
pvdisplay  Free PE               0
pvdisplay  Allocated PE          28618
pvdisplay  PV UUID               1mKr4f-31ZK-zIqn-l1jD-Z3G1-6G0T-JYhPaa
pvdisplay
pvdisplay  --- Physical volume ---
pvdisplay  PV Name               /dev/scsi/host2/bus0/target0/lun0/disc
pvdisplay  VG Name               vg00
pvdisplay  PV Size               111.79 GB / not usable 0
pvdisplay  Allocatable           yes (but full)
pvdisplay  PE Size (KByte)       4096
pvdisplay  Total PE              28618
pvdisplay  Free PE               0
pvdisplay  Allocated PE          28618
pvdisplay  PV UUID               ULU7N8-CazP-Y1aA-r7rZ-22lU-i48j-lN0dul
pvdisplay
#
#
#
# lvdisplay
lvdisplay  --- Logical volume ---
lvdisplay  LV Name                /dev/vg00/swap
lvdisplay  VG Name                vg00
lvdisplay  LV UUID                Y2Wy6I-2P9d-BKVY-nHSB-GPIJ-mZgK-LmD6n2
lvdisplay  LV Write Access        read/write
lvdisplay  LV Status              available
lvdisplay  # open                 1
lvdisplay  LV Size                128.00 MB
lvdisplay  Current LE             32
lvdisplay  Segments               1
lvdisplay  Allocation             inherit
lvdisplay  Read ahead sectors     0
lvdisplay  Block device           254:0
lvdisplay
lvdisplay  --- Logical volume ---
lvdisplay  LV Name                /dev/vg00/sys
lvdisplay  VG Name                vg00
lvdisplay  LV UUID                s9tRHz-joHr-63uR-8l6n-gNhm-bZd6-bsd5ZU
lvdisplay  LV Write Access        read/write
lvdisplay  LV Status              available
lvdisplay  # open                 1
lvdisplay  LV Size                614.70 GB
lvdisplay  Current LE             157363
lvdisplay  Segments               4
lvdisplay  Allocation             inherit
lvdisplay  Read ahead sectors     0
lvdisplay  Block device           254:1
lvdisplay




--=-UQW1DXLDig5KkWUNqEjN
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.3.2">
</HEAD>
<BODY>
Hi,<BR>
<BR>
I am using LVM version 2.00.25.<BR>
<BR>
The man page states that there is a ~256GB limit if physical extent size is set to 4MB, because number of physical extents per LV is limited to ~64K.<BR>
<BR>
Is this actually still true with this version?<BR>
<BR>
My system is set to 4MB physical extent size, and total size is 614GB, with number of PE's in the LV&nbsp; 157363.<BR>
No problems experienced yet.<BR>
<BR>
See below for details.<BR>
<BR>
Hints?<BR>
<BR>
Thanks,<BR>
<BR>
Lewis<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
# pvdisplay<BR>
pvdisplay&nbsp; --- Physical volume ---<BR>
pvdisplay&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/scsi/host3/bus0/target0/lun0/disc<BR>
pvdisplay&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<BR>
pvdisplay&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 279.46 GB / not usable 0<BR>
pvdisplay&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
pvdisplay&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
pvdisplay&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 71541<BR>
pvdisplay&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
pvdisplay&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 71541<BR>
pvdisplay&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eG78ji-ImGJ-5dSd-D4mv-CbOd-dFhy-5ZQknf<BR>
pvdisplay<BR>
pvdisplay&nbsp; --- Physical volume ---<BR>
pvdisplay&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/scsi/host1/bus0/target0/lun0/disc<BR>
pvdisplay&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<BR>
pvdisplay&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 111.79 GB / not usable 0<BR>
pvdisplay&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
pvdisplay&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
pvdisplay&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28618<BR>
pvdisplay&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
pvdisplay&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28618<BR>
pvdisplay&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g6jrz8-A3qA-Cwy2-8fm9-de77-2O1j-2SS9nU<BR>
pvdisplay<BR>
pvdisplay&nbsp; --- Physical volume ---<BR>
pvdisplay&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/scsi/host0/bus0/target0/lun0/disc<BR>
pvdisplay&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<BR>
pvdisplay&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 111.79 GB / not usable 0<BR>
pvdisplay&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
pvdisplay&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
pvdisplay&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28618<BR>
pvdisplay&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
pvdisplay&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28618<BR>
pvdisplay&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1mKr4f-31ZK-zIqn-l1jD-Z3G1-6G0T-JYhPaa<BR>
pvdisplay<BR>
pvdisplay&nbsp; --- Physical volume ---<BR>
pvdisplay&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/scsi/host2/bus0/target0/lun0/disc<BR>
pvdisplay&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<BR>
pvdisplay&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 111.79 GB / not usable 0<BR>
pvdisplay&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<BR>
pvdisplay&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>
pvdisplay&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28618<BR>
pvdisplay&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
pvdisplay&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28618<BR>
pvdisplay&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ULU7N8-CazP-Y1aA-r7rZ-22lU-i48j-lN0dul<BR>
pvdisplay<BR>
#<BR>
#<BR>
#<BR>
# lvdisplay<BR>
lvdisplay&nbsp; --- Logical volume ---<BR>
lvdisplay&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg00/swap<BR>
lvdisplay&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<BR>
lvdisplay&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Y2Wy6I-2P9d-BKVY-nHSB-GPIJ-mZgK-LmD6n2<BR>
lvdisplay&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
lvdisplay&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
lvdisplay&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
lvdisplay&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 128.00 MB<BR>
lvdisplay&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32<BR>
lvdisplay&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
lvdisplay&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
lvdisplay&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
lvdisplay&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 254:0<BR>
lvdisplay<BR>
lvdisplay&nbsp; --- Logical volume ---<BR>
lvdisplay&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg00/sys<BR>
lvdisplay&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg00<BR>
lvdisplay&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s9tRHz-joHr-63uR-8l6n-gNhm-bZd6-bsd5ZU<BR>
lvdisplay&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>
lvdisplay&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<BR>
lvdisplay&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
lvdisplay&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 614.70 GB<BR>
lvdisplay&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 157363<BR>
lvdisplay&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<BR>
lvdisplay&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<BR>
lvdisplay&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
lvdisplay&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 254:1<BR>
lvdisplay<BR>
<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-UQW1DXLDig5KkWUNqEjN--
