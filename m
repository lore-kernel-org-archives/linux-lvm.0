Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j09IpNr24045
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 13:51:23 -0500
Received: from alpha.geneseo.edu (alpha.geneseo.edu [137.238.1.190])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j09IpNPV003350
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 13:51:23 -0500
Received: from [137.238.1.104] (helo=mars.geneseo.edu)
	by alpha.geneseo.edu with esmtp (Exim 4.34) id 1Cni9q-0003fV-5p
	for linux-lvm@redhat.com; Sun, 09 Jan 2005 13:51:23 -0500
Received: from mars.geneseo.edu (localhost.localdomain [127.0.0.1])
	by mars.geneseo.edu (8.12.9/8.12.5) with ESMTP id j09IpHRh030755
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 13:51:17 -0500
Received: from localhost (valites@localhost)
	by mars.geneseo.edu (8.12.9/8.12.9/Submit) with ESMTP id j09IpH2t030752
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 13:51:17 -0500
Date: Sun, 9 Jan 2005 13:51:17 -0500 (EST)
From: "Mark T. Valites" <valites@geneseo.edu>
Message-ID: <Pine.LNX.4.44.0501091156580.19284-100000@mars.geneseo.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Problem Upgrading from LVM1 to LVM2
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
To: linux-lvm@redhat.com

I'd like to upgrade my LVM1 based machine to LVM2. I recently compiled a
new 2.4.28 kernel and patched in the
linux-2.4.26-rc1-devmapper-ioctl.patch patch from;

ftp://sources.redhat.com/pub/dm/patches/2.4-stable/2.4.26/linux-2.4.26-rc1-devmapper-ioctl.patch

A copy of my kernel config is available here:

http://www.geneseo.edu/~valites/config-2.4.28-x86_mythtv-dev_mapper

I have quite a few things running on this machine, so I'd prefer to stick
with 2.4 for now.

The machine is running Debian testing, with these versions of relevant
packages:

lvm-common                1.5.17
lvm10                     1.0.8-8
lvm2                      2.00.24-1
libdevmapper1.00          1.00.19-2
libdevmapper-dev          1.00.19-2

I compiled devmapper statically into the kernel & I'm pretty sure it's
working:

myth:/usr/src# ls -l /dev/mapper/control
crw-------  1 root root 10, 63 Jan  9 11:53 /dev/mapper/control

myth:/usr/src# file !$
file /dev/mapper/control
/dev/mapper/control: character special (10/63)

myth:~# cat /proc/misc
 63 device-mapper
135 rtc
  1 psaux

Following the docs in the LVM HOWTO, specifically section 4.1.1:

(http://linux.geneseo.edu/LDP/HOWTO/LVM-HOWTO/lvm2faq.html#AEN235),

I've added the devmap_mknod.sh script to my lvm startup script
(/etc/init.d/lvm):

#!/bin/bash
#
# lvm           This script handles the LVM startup/shutdown
#               so that LVMs are properly configured and available.
#

# try to load module in case that hasn't been done yet
modprobe lvm >/dev/null 2>&1
modprobe lvm-mod >/dev/null 2>&1
modprobe dm-mod >/dev/null 2>&1

/root/device-mapper.1.00.19/scripts/devmap_mknod.sh ; lvm vgscan ; lvm
vgchange -ay

set -e

test -x /sbin/lvmiopversion -a -x /sbin/vgscan -a -x /sbin/vgchange ||
exit 0
test -f /etc/default/lvm-common && . /etc/default/lvm-common

# So much for being "LVM independant" :(
create_lvm_device()
{
    mknod --mode=600 /dev/lvm c 109 0 >/dev/null 2>&1 || true
}

<truncated>

The LVM1 tools see my PVs and VGs fine:

myth:/usr/src# /lib/lvm-10/pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg"  is in EXPORTED VG "music_vg" [111.75 GB / 0 free]
pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "music_vg" [111.79 GB / 0 free]
pvscan -- total: 2 [223.55 GB] / in use: 2 [223.55 GB] / in no VG: 0 [0]

myth:/usr/src# /lib/lvm-10/vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found exported volume group "music_vgPV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

But the LVM2 tools do not:

myth:/usr/src# /lib/lvm-200/pvscan
  logical extent (56202) already mapped.
  Couldn't fill logical volume maps.
  No matching physical volumes found

myth:/usr/src# /lib/lvm-200/vgscan
  Reading all physical volumes.  This may take a while...
  logical extent (56202) already mapped.
  Couldn't fill logical volume maps.
  Volume group "music_vg" not found

After reading section 4.1.5 of the same HOWTO, I was under the impression
LVM2 should be able to see the VGs created from LVM1.

I don't have enough scratch space to temporarily dump the data to and
start fresh with LVM2 VGs. I do have remotely located backups of my data,
but it'll take me a long time to restore all of it and if you can't guess
from the name of the VG, I can live without the data for a while.

I've had no luck google-ing or searching the lvm archives. Does anyone
have any suggestions for making the LVM2 tools first see my LVM1 VGs so I
can then convert them to LVM2?

Thanks in advance,
-Mark

-- 
Mark T. Valites
Unix Systems Analyst
Computing & Information Technology
SUNY Geneseo
>--))> >--))>
