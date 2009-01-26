Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0Q6LGrD027229
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 01:21:16 -0500
Received: from nskntmtas02p.mx.bigpond.com (nskntmtas02p.mx.bigpond.com
	[61.9.168.140])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0Q6L9AO018421
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 01:21:10 -0500
Received: from nskntotgx02p.mx.bigpond.com ([124.188.196.197])
	by nskntmtas02p.mx.bigpond.com with ESMTP id
	<20090126062104.RMAE24984.nskntmtas02p.mx.bigpond.com@nskntotgx02p.mx.bigpond.com>
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 06:21:04 +0000
Received: from [192.168.0.102] (really [124.188.196.197])
	by nskntotgx02p.mx.bigpond.com with ESMTP id
	<20090126062103.KYYB12531.nskntotgx02p.mx.bigpond.com@[192.168.0.102]>
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 06:21:03 +0000
From: Doug Gray <dgra1233@bigpond.net.au>
Date: Mon, 26 Jan 2009 17:20:58 +1100
Message-Id: <1232950858.3807.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to change the PV Volume Group name?
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

Hi,
I am a new here and new to lvm management, so be gentle please.

I have systems running of CF cards that were created using the normal
installation as was my desktop system. 

I would like to mount the CF cards via USB device and gain access to the
contents of the lvm partition on my desktop system to be able to perform
maintenance.

Additionally it would be helpful to be able to mount the CF image in
loop mode so I can make modifications without the physical hardware.

Following the guide here:
http://tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

I can see how to mount the CF partition... but what I don't follow is
how the distinction is made when the PV VG Name are the same, ie the
default 'VolGroup00'

I don't see a facility in pvchange to change the name.

Is it necessary to change the name?

How do I mount the CF partition?

How do I mount the CF partition file image?

I would be grateful for any help.  This is straight forward with the
normal disk volumes and partitions but to do so with lvm I am
bamboozled.

Doug Gray


From my system:

[root@vulcan ~]# pvdisplay /dev/sda2
  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               VolGroup00
  PV Size               1.80 GB / not usable 22.20 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              57
  Free PE               1
  Allocated PE          56
  PV UUID               GmT4UA-X3QN-QkGd-pMls-iIlp-UIUd-dmnE5F

[root@vulcan ~]# pvdisplay /dev/hda2
  --- Physical volume ---
  PV Name               /dev/hda2
  VG Name               VolGroup00
  PV Size               186.21 GB / not usable 21.74 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              5958
  Free PE               1
  Allocated PE          5957
  PV UUID               02l6cp-88zz-4lbU-3Nut-cb04-5Bkj-yUHkRZ
