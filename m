Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38GGWj04906
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 12:16:32 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38GGUMC010967
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 12:16:30 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 873DFE6DA0
	for <linux-lvm@redhat.com>; Thu,  8 Apr 2004 17:14:19 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03905-13 for <linux-lvm@redhat.com>;
	Thu,  8 Apr 2004 17:14:19 +0100 (BST)
Received: from oak.dgreaves.com (modem-3587.parera.dialup.pol.co.uk
	[81.78.190.3]) by mail.ukfsn.org (Postfix) with ESMTP id 3F05CE6D68
	for <linux-lvm@redhat.com>; Thu,  8 Apr 2004 17:14:18 +0100 (BST)
Received: from 96.dgreaves.com ([10.0.0.96] helo=dgreaves.com)
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BBdC3-0000YU-1o
	for linux-lvm@redhat.com; Thu, 08 Apr 2004 18:19:59 +0100
Message-ID: <40757AD6.80702@dgreaves.com>
Date: Thu, 08 Apr 2004 17:16:22 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Contiguous policy causes lvextend problems
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi

Summary:
I had a problem trying to extend an lv. It turns out that it was due to 
having a contiguous allocation policy.
The error report wasn't helpful :)
Maybe this will help others searching the archive (I couldn't find 
anything useful)
Maybe someone could point me at what contiguous does?


so, I recently had a problem trying to lvextend an lv:

root@bao:~ # lvextend -l +2086 /dev/vg1/Myth
  Extending logical volume Myth to 401.69 GB
  Insufficient allocatable extents (4341) for logical volume Myth: 6427 
required

Everything was setup correctly:
root@bao:~ # vgdisplay
  --- Volume group ---
  VG Name               vg1
  System ID            
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               1
  Max PV                255
  Cur PV                2
  Act PV                2
  VG Size               401.69 GB
  PE Size               64.00 MB
  Total PE              6427
  Alloc PE / Size       4341 / 271.31 GB
  Free  PE / Size       2086 / 130.38 GB
  VG UUID               T1gURQ-6CZM-axdh-UAHa-E1nd-fxEC-cwDLdq
  
root@bao:~ # pvdisplay
  --- Physical volume ---
  PV Name               /dev/hdc3
  VG Name               vg1
  PV Size               271.31 GB / not usable 0  
  Allocatable           yes (but full)
  PE Size (KByte)       65536
  Total PE              4341
  Free PE               0
  Allocated PE          4341
  PV UUID               25Ngo9-LGNo-0Nsp-R826-C1Lc-5pD7-xh3GOX
  
  --- Physical volume ---
  PV Name               /dev/hde2
  VG Name               vg1
  PV Size               130.38 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       65536
  Total PE              2086
  Free PE               2086
  Allocated PE          0
  PV UUID               22hSvz-eARY-1AAq-5kko-whHH-QJRl-s94us5
  
  --- NEW Physical volume ---
  PV Name               /dev/hdc
  VG Name              
  PV Size               279.40 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               PWxvHH-uary-DgTx-Mk9K-UfoM-4gCs-fR1vzo
  
root@bao:~ # lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg1/Myth
  VG Name                vg1
  LV UUID                4hzmiM-9uSn-67Lm-ZWzS-YS2Q-gVtm-8HbTWW
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                271.31 GB
  Current LE             4341
  Segments               1
  Allocation             contiguous
  Read ahead sectors     0
  Block device           254:0

but the allocation policy was 'contiguous'.
This isn't documented (that I could find) in the man pages - I am 
creating large (3-4Gb) files from a PVR and thought I'd try contiguous 
(in a kind of "what the heck, sounds about right" kinda way)
It turns out that I needed to:
root@bao:~ # lvchange -C n /dev/vg1/Myth
  Logical volume "Myth" changed
root@bao:~ # lvextend -l +2086 /dev/vg1/Myth
  Extending logical volume Myth to 401.69 GB
  Logical volume Myth successfully resized

Maybe a better error (or documentation of -C) is needed?

David
