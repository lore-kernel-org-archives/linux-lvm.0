Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2U7Wxj03587
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 02:32:59 -0500
Received: from mxfep01.bredband.com (mxfep01.bredband.com [195.54.107.70])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2U7Wv1X014125
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 02:32:58 -0500
Received: from toface.com ([213.114.136.7] [213.114.136.7])
	by mxfep01.bredband.com with ESMTP
	id <20040330073252.MZUX12989.mxfep01.bredband.com@toface.com>
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 09:32:52 +0200
Date: Tue, 30 Mar 2004 09:32:47 +0200
From: Tobias <tobias@olsson.be>
Message-ID: <20040330073247.GA4585@olsson.be>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM-crash with pvmove, 300GB gone?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello,

I'm hoping someone here can help me retrieve the 300GB data I hopefully
DIDN'T lose when trying to migrate off a disk.

First off, this is the current output of the pvscan -v
PV /dev/hda7   VG vg   lvm2 [94.62 GB / 0    free]      # working disk
PV /dev/hdb1   VG vg   lvm2 [111.79 GB / 0    free]     # working disk
PV /dev/hdf1   VG vg   lvm2 [114.50 GB / 0    free]     # the disk I was migrating OFF
PV /dev/hdo1   VG vg   lvm2 [149.05 GB / 34.55 GB free] # the disk I was migrating IN

vgscan -v
    Wiping cache of LVM-capable devices
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "vg"
  Found volume group "vg" using metadata type lvm2

lvscan -v
    Finding all logical volumes
  ACTIVE            '/dev/vg/media' [320.91 GB] next free (default)
  ACTIVE            '/dev/vg/pvmove0' [114.50 GB] contiguous


The story begins with one drive (hdf) starting to click. The disk had
to be replaced with hdo. This is supposed to be a simple so I just looked at the
instructions and ran:

badblocks -w /dev/hdo
[wait 20 hours]
fdisk /dev/hdo 
[created a partition over the entire disk with 8e as type]
pvcreate /dev/hdo1
pvextend vg /dev/hdo1
pvmove /dev/hdf1

And HERE it boinks. It returns immediatly with (from syslog):
Mar 30 06:17:56 void device-mapper: error adding target to table
Mar 30 06:17:56 void device-mapper: device 254:001 too small for target
Mar 30 06:17:56 void device-mapper: dm-linear: Device lookup failed
Mar 30 06:17:56 void device-mapper: error adding target to table
Mar 30 06:18:27 void device-mapper: device 254:001 too small for target
Mar 30 06:18:27 void device-mapper: dm-linear: Device lookup failed
Mar 30 06:18:27 void device-mapper: error adding target to table
Mar 30 06:18:29 void device-mapper: device 254:001 too small for target
Mar 30 06:18:29 void device-mapper: dm-linear: Device lookup failed
Mar 30 06:18:29 void device-mapper: error adding target to table

As it returns, I didn't think it had modified the system. It had.

I try to reboot with shutdown -r 0, but it just hangs without returning
the prompt. I try to umount the logical device, but it too hangs without
returning the prompt.  I check with top to see if something is working,
but nothing is.

I now make the cardinal mistake of pushing the reset-button without
running storing all the error-messages. Anyways, the machine boots 
up, but the logical device isn't mounted. When the system should've
mounted the syslog goes:
Mar 30 06:37:28 void device-mapper: error adding target to table

Now I did something STUPID.. I panicked.. I did
dd if=/dev/zero of=/dev/hdo count=10000
fdisk /dev/hdo
[created a one partition with id 8e]
pvcreate /dev/hdo1

when this made the array inconsistent, I did the same thing again, only
this time with the uuid that it missed. [not actual uuid]
pvcreate -u 54353455345-345435 /dev/hdo1

This is the state right now. When it boots up it gives "meta-data
inconsistent".


Since I can't imagine that any actual filesystem data have been
altered, the filesystem should be ok if I could just mount it. The
problem is that every time I try to mount or reboot or sync or do
anything like that, the computer refuses to give me back the prompt, and
just seems to wait for ever for those commands to return. (That's what
I've called "hanged" earlier.)

The system has been stable for maybe a month with heavy disk access, and
the only new thing in it is the 160GB disk, but that has been scanned
for bad blocks (none found).

I'm using Gentoo Linux with lvm 2.00.08, device-mapper 1.00.07
and kernel 2.6.3-gentoo-r1. I've got both device-mapper and lvm support
in the kernel.

The hda/hdb devices are on a nforce2 mobo-controller, the hdf is on
a promise budget controller, and the hdo is on a built-in SATA
SII3112 controller.


Btw, next time I'll backup FIRST, even if it's 100DVD-R and 50 hours
work..

Please help me

Best regards

/Tobias
