Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4P8fRYv025819
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 04:41:27 -0400
Received: from relay2.gigamail.to (mail.tnp-online.de [212.80.247.147])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4P8fOjk011693
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 04:41:25 -0400
Received: from scanner5.gigamail.to (content5.cluster.gigamail.to
	[192.168.254.200])
	by mxout2.gigamail.to (Postfix) with ESMTP id 34D81D2ABF
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 10:41:14 +0200 (CEST)
Received: from chimp.subsystem.local (content5.cluster.gigamail.to
	[192.168.254.200])
	by chimp.scanner5.gigamail.to (Postfix) with ESMTP id 02449EAB42
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 10:41:14 +0200 (CEST)
Received: from scanner5.gigamail.to (localhost [127.0.0.1])
	by clamav-milter.scanner5.gigamail.to (Postfix) with ESMTP id
	37806EAB61
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 10:41:13 +0200 (CEST)
Received: from relay1.gigamail.to (relay1.cluster.gigamail.to [192.168.254.12])
	by scanner5.gigamail.to (Postfix) with ESMTP id 3230FEAB42
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 10:41:13 +0200 (CEST)
Received: from cheetah.dd.xiranet.com (162.237.80.212.static.versanetonline.de
	[212.80.237.162])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ddkom-online.de (Postfix) with ESMTP id 80BD0108ACD
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 10:41:10 +0200 (CEST)
Received: from [192.168.0.242] (dhcp242.dd.xiranet.com [192.168.0.242])
	(authenticated bits=0)
	by cheetah.dd.xiranet.com (8.13.4/8.13.4/Debian-1) with ESMTP id
	l4P8emxV028880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 25 May 2007 10:40:52 +0200
Message-ID: <4656A10F.30000@web.de>
Date: Fri, 25 May 2007 10:40:47 +0200
From: Mirko Benz <mirko.benz@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM over MD performance
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

Hi,

I have a setup with 15 SATA drives configured as 3 x SW RAID with 5 
drives each with 64k stripe size. Configuration: kernel version is 
2.6.18-8.1.3.el5, CPU Xeon 5130, LSI PCI-X SAS controller.
I am testing the devices in parallel with seq I/O using Oracle Orion and 
1 MB block size.

3 x MD RAID 5 (all values in MB/s):
Read:  800.42
Write: 564.75

When I setup a volume group + lv on each of the three devices I get the 
following results:
Read:  729.28 (-9 %)
Write: 362.30 (- 36 %)

Is there a reason that write performance is so much slower?
---
Striping: I would like to aggregate the individual RAID into a single vg 
with a lv using all disks.
Using md with RAID 0 over 3 x RAID 5 I get the following results (stripe 
size is 256k):
Read:  700.68
Write: 530.43

When using LVM to do the striping (-i 3 -I 256K) I get the following:
Read:  660.71 (- 6%)
Write: 149.29 (- 72%)

Should one avoid LVM striping or are there some parameters that need to 
be adjusted?

Regards,
Mirko
