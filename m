Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5CJqAxh020501
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2007 15:52:10 -0400
Received: from postalmail-a1.g.dreamhost.com (sd-green-bigip-74.dreamhost.com
	[208.97.132.74])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5CJq72I013237
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2007 15:52:07 -0400
Received: from [192.168.12.113]
	(82-46-27-208.cable.ubr02.hawk.blueyonder.co.uk [82.46.27.208])
	by postalmail-a1.g.dreamhost.com (Postfix) with ESMTP id 9FA568990
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2007 12:52:06 -0700 (PDT)
From: Dave Fear <david@dfear.info>
Date: Tue, 12 Jun 2007 20:51:43 +0100
Message-Id: <1181677903.19437.7.camel@osiris.home.dfear.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] devsize problems
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi

I have a problem with device-mapper and/or lvm.

"vgchange -ay" outputs:

root@ubuntu:/home/ubuntu# vgchange -ay
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  6 logical volume(s) in volume group "vgroot" now active

and "dmesg | tail" outputs:

root@ubuntu:/home/ubuntu# dmesg | tail
[12363.172000] device-mapper: table: 254:0: linear: dm-linear: Device
lookup failed
[12363.172000] device-mapper: ioctl: error adding target to table
[12363.256000] device-mapper: table: device 3:2 too small for target
**** above lines repeats 5 more times, the only difference is the number
after "table 254:    ".

therefore:

the error seems to be "device 3:2 too small for target" and "pvs -o
+dev_size" prints incorrect dev_size.

how do i fix this?

-- 
-----------------------------------
Dave Fear :: david@dfear.info
Skype: dpfear
GPG: key ID - 805B3D54
GPG: server - wwwkeys.eu.pgp.net
