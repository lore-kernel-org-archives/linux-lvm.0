Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j92ErkV23275
	for <linux-lvm@redhat.com>; Sun, 2 Oct 2005 10:53:46 -0400
Received: from kosh.cyd.liu.se (kosh.cyd.liu.se [130.236.245.8])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j92EriTF016078
	for <linux-lvm@redhat.com>; Sun, 2 Oct 2005 10:53:45 -0400
Received: from [130.236.245.142] (cyd14.cyd.liu.se [130.236.245.142])
	by kosh.cyd.liu.se (Postfix) with ESMTP id 1A3A03E78
	for <linux-lvm@redhat.com>; Sun,  2 Oct 2005 16:53:43 +0200 (CEST)
Message-ID: <433FF47A.4020906@cyd.liu.se>
Date: Sun, 02 Oct 2005 16:53:46 +0200
From: Elmir Jagudin <boris@cyd.liu.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problems using all space in a VG
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

I have a system with 2.73 TB partition on witch a VG group was created:

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               storage0
  PV Size               2.73 TB / not usable 2.00 TB
  Allocatable           yes
  PE Size (KByte)       65536
  Total PE              44701
  Free PE               32803
  Allocated PE          11898
  PV UUID               n1wiZE-PmlM-sAaH-I8cl-ORUZ-GReQ-54xlf7

Notice that it says that 2 TB is not usable, which according to 
https://www.redhat.com/archives/linux-lvm/2005-August/msg00033.html
is a sign of lvm tools is not able to handle devices this large.

After upgrading lvm tools the pvdisplay says that all the space is 
usable. However creating LVs that total in size over 0.73 TB (2.73 - 2) 
is not possible and fails with following error messages:

# lvcreate -L 65g -n export storage0
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'storage0-export'.
  Failed to activate new LV.

following errors are logged in /var/log/messages:

Oct  2 17:48:35 sinclair kernel: device-mapper: device /dev/sdc1 too 
small for target
Oct  2 17:48:35 sinclair kernel: device-mapper: dm-linear: Device lookup 
failed
Oct  2 17:48:35 sinclair kernel: device-mapper: error adding target to table


Anyone knows what's going on ? How can i reclaim this 2TB of storage ?


Here follows some version details:

The VG was originaly created with following tools:

# lvm version
  LVM version:     2.00.31 (2004-12-12)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0

Since then the tools have been upgraded to following versions:

# lvm version
  LVM version:     2.01.08 (2005-03-22)
  Library version: 1.01.01 (2005-03-29)
  Driver version:  4.4.0

The upgraded pvdisplay then says:

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               storage0
  PV Size               2.73 TB / not usable 0
  Allocatable           yes
  PE Size (KByte)       65536
  Total PE              44701
  Free PE               32803
  Allocated PE          11898
  PV UUID               n1wiZE-PmlM-sAaH-I8cl-ORUZ-GReQ-54xlf7


T.i.a,
Elmir Jagudin
