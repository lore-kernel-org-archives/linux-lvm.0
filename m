Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2VExlj31931
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 09:59:47 -0500
Received: from abelia.cimr.cam.ac.uk (abelia.cimr.cam.ac.uk [131.111.181.212])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2VExk1X015468
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 09:59:47 -0500
Received: from lupin ([192.168.101.134])
	by abelia.cimr.cam.ac.uk with esmtp (Exim 4.24) id 1B8hBs-00052n-JE
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 15:59:40 +0100
From: Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
Message-Id: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>
Mime-Version: 1.0
Date: Wed, 31 Mar 2004 15:59:39 +0100
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm 1 unable to boot
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
To: linux-lvm@redhat.com

Hi

I have a machine with the following partition structure:

/dev/sda1 /boot (ext3)
/dev/sda2 swap
/dev/sda3 LVM

The LVM (1.03/rh9) contains one PV and this has Volume00 in it which
contains lvs for slash, usr, var, /usr/local and so on...

I rebooted the machine for the first time in ages (same kernel
configuration as the last reboot and no changes - or very few).

The machine won't reboot - it panics because of a message (something)
like:

vgscan found inactive "Volume00"
Error 28 Unable to make /etc/lvmtab.d/Volume00/Volume00.tmp
vg_cfgbackup.c line 273

It then gives an error about pivot_root panic with the error unable to
mount /dev/Volume00/slash mount error 2 
(the same sort of error as if fstab was wrong but it isn't)


Here's what I've tried to fix this:

- boot into rescue mode: lvscan shows all lvs no problem
	checked pvscan, vgscan, lvscan - no problems
	fscked slash - okay
	checked configuration files, fstab, etc.
tried a reboot - another panic
- rescue mode again
	delete /etc/lvmtab and /etc/lvmtab.d
reboot - panic
- rescue: reinstall lvm rpm and kernel
panic
- make a new initrd.img
panic
...plus lots of other things that were probably irrelevant.

The machine *still* panics when booted normally but works fine in rescue
mode, with a chrooted slash.

Any ideas?

Thanks

Geoff Dolman
-- 
JDRF/WT Diabetes and Inflammation Laboratory
Cambridge Institute for Medical Research
University of Cambridge
http://www-gene.cimr.cam.ac.uk/todd/
