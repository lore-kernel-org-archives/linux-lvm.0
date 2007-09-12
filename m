Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CLrA8F004227
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 17:53:10 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8CLr8XQ001498
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 17:53:09 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l8CLr3wt012657
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 17:53:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l8CLr3rS002214
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 17:53:03 -0400
Date: Wed, 12 Sep 2007 17:53:03 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] is it possible to move lvm2 logvols?
In-Reply-To: <46E7FC20.8090003@bppiac.hu>
Message-ID: <Pine.LNX.4.44.0709121741470.2155-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 12 Sep 2007, Farkas Levente wrote:

> ok everything seems to working. after i move the logvols i remove the
> old pv and try to boot the system. now the problem during the boot linux
> can't find the volume group so can't find it's / since the / is on the
> first logvol of the vg. this on centos-5.
> the strange thing if i boot from centos rescue dvd it see the vg and
> logvols too and i can chroot /mnt/sysimage into the new real system.
> what can be the reason that if i boot the new system it can't find the
> vg and it's logvols?

centos-5 puts hardcoded lvm and md activation into the initrd init script.  

To see your init script,

# mkdir initrd
# cd initrd
# zcat /path/to/initrd...img | cpio -icvdmu
# cat init

A typical init script has lvm related parts similar to this:
----------
...
echo "Loading dm-mod.ko module"
insmod /lib/dm-mod.ko
echo "Loading dm-mirror.ko module"
insmod /lib/dm-mirror.ko
echo "Loading dm-zero.ko module"
insmod /lib/dm-zero.ko
echo "Loading dm-snapshot.ko module"
insmod /lib/dm-snapshot.ko
echo Making device-mapper control node
mkdmnod
mkblkdevs
raidautorun /dev/md3
raidautorun /dev/md4
echo Scanning logical volumes
lvm vgscan --ignorelockingfailure
echo Activating logical volumes
lvm vgchange -ay --ignorelockingfailure  rootvg
...
---------

You have to edit the script, make sure it activates any raid PVs your
VG depends on, and change the name of the VG containing root fs.

This is done automatically by mkinitrd.  But it has no
options to creat a script for a different LVM environment than the
one you are running on.  So you have to manually edit init and
package it back to a new initrd image with cpio.

# pwd
/.../initrd
# find * | cpio -ocv | gzip -9 >../newinitrd.img

This is not convenient.  Assuming mkinitrd was more adaptable, it
would still defeat much of the advantage of grub to have to remember
to run it to change LVM environment.  (Although, to be fair, this
usually happens only when migrating to new hardware.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
