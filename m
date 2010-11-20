Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAKDPiUS010079
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 08:25:45 -0500
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAKDPNRF016502
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 08:25:29 -0500
Received: from [192.168.10.52] (unknown [82.245.225.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 08ADFA62A7
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 14:25:20 +0100 (CET)
Message-ID: <4CE7CC41.9060401@arial-concept.com>
Date: Sat, 20 Nov 2010 14:25:21 +0100
From: Sam Przyswa <samp@arial-concept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Corrupted physical volume
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
To: LVM Users List <linux-lvm@redhat.com>

Hi,

For the first time I have a problem after remove a physical volume with 
the command "pvremove". the partition was /dev/sdb4 and after the 
"pvremove /dev/sdb4" command I got an error and the pvdisplay give me:

-------------------------------------------------------
Couldn't find device with uuid '2KFcH6-vX6o-2olV-CuAN-iSbQ-HwOz-SKlkoe'.
   --- Physical volume ---
   PV Name               unknown device
   VG Name               Disk1
   PV Size               127,63 GiB / not usable 874,50 KiB
   Allocatable           yes
   PE Size               4,00 MiB
   Total PE              32673
   Free PE               32673
   Allocated PE          0
   PV UUID               2KFcH6-vX6o-2olV-CuAN-iSbQ-HwOz-SKlkoe

-------------------------------------------------------

How to fix it ?

It seems I have an other PV corrupted, is it a way to restore/fix a LVM 
with a tool as fsck for filesystems ?

Thanks for your help.

Sam.
