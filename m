Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8A9b4Nc030163
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 05:37:04 -0400
Received: from hathor.ankh.org (hathor.ankh.org [149.255.109.145])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8A9b1dm009172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 05:37:02 -0400
Received: from apple.ocado.com ([91.206.0.43] helo=[10.252.24.87])
	by hathor.ankh.org with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.82) (envelope-from <oolon@ankh.org>) id 1XReKi-0003mR-AN
	for linux-lvm@redhat.com; Wed, 10 Sep 2014 10:37:00 +0100
Message-ID: <54101BB6.3020700@ankh.org>
Date: Wed, 10 Sep 2014 10:36:54 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <5410138C.9010603@cemery.org.uk>
In-Reply-To: <5410138C.9010603@cemery.org.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Ok this is such an easy bread and butter task, but its really easy to 
get wrong so be careful! You have 7 tasks here, you will notice not all 
your OS is on lvm a small part /boot is on its own partition and you 
need to copy that as well to get you os to boot.

I am assuming here your second disk is called sdb.

Task 1) fdisk

fdisk /dev/sdb

c
p
1
2048
499711
a
1

c
p
2
<return>
<return>
t
8e

Task 2) Copying /boot

mkfs.ext3 /dev/sdb1
mkdir /boot2
mount /dev/sdb1 /boot2
cd /boot
tar -cPpSslf - . | ( cd /boot2 ; tar -xvPpSslf -)
umount /boot2
change /etc/fstab to us /dev/sda1 for how to reference /boot

Task 3) moving lvm... easy!
pvcreate /dev/sdb2
vgextend ubuntu-vg /dev/sdb2
swapoff -a
pvmove /dev/sda5 /dev/sdb2
vgreduce ubuntu-vg /dev/sda5


And now the tricky bit!

task4) Install grub on your new drive

Hopefully this is right... if not your need task 6.

grub-setup /dev/sdb

task5) Turn off your computer.

swap sda and sdb

and boot from your new drive.

check /boot is comming from the right device (/dev/sda1), if not unmount 
and mount it, then install a new kernel. This is the easiest way to get 
it to build a new initrd.
Shut down your computer remove /dev/sdb (old disk)
and you should be able to boot from just your new drive... SIMPLEZ!

Task 6) If you computer does no boot.

boot the ubuntu install disk and use rescue to install the grub boot 
block and verify /boot is mounted and populated with data. If not ... fix.

Task 7) I have no new space. Yes you do use pvs its just unallocated,

use either lvextend or lvcreate to extend or create a new logical 
volume, if you extend you will then need to use resize2fs for make he 
filesystem bigger, personally I would create a new mount point and not 
use / for everything.

James
