Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1FBondc024493
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 06:50:49 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1FBol6o027134
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 06:50:47 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id 2DA0F540BE
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 12:50:36 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 11579-18 for <linux-lvm@redhat.com>;
	Thu, 15 Feb 2007 12:50:18 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 12:50:18 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id D036694AF
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 12:50:17 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (192.168.113.3 [192.168.113.3]) (amavisd-new, port 10025)
	with ESMTP id FISh26VPAHKO for <linux-lvm@redhat.com>;
	Thu, 15 Feb 2007 12:50:15 +0100 (CET)
Received: from [81.173.141.96] (xdsl-81-173-141-96.netcologne.de
	[81.173.141.96]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 15 Feb 2007 12:50:15 +0100 (CET)
Message-ID: <45D448F5.3000301@wpkg.org>
Date: Thu, 15 Feb 2007 12:50:13 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgdisplay - checksum error - what does it mean?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Recently, I used "vgdisplay", and noticed that it gives a "checksum error":

# vgdisplay
   /dev/sda2: Checksum error
   --- Volume group ---
   VG Name               LVM2
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  49
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                34
   Open LV               34
   Max PV                0
   Cur PV                1
   Act PV                1
   VG Size               743.16 GB
   PE Size               4.00 MB
   Total PE              190250
   Alloc PE / Size       175807 / 686.75 GB
   Free  PE / Size       14443 / 56.42 GB
   VG UUID               yV2ADe-MeJd-dHbd-ExLP-AIu3-OTA2-u46qhl


Should I be scared? What does it mean? What should I do about it? I 
wouldn't like to loose the data.

If it helps, my setup looks like that:

HDD1-sda2-\
HDD2-sdb2-|__RAID-10--LVM-2
HDD3-sdc2-|
HDD4-sdd2-/

I'm running 2.6.17.8 kernel.


-- 
Tomasz Chmielewski
http://wpkg.org
