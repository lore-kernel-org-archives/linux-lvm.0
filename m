Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8RFAIV05485
	for <linux-lvm@redhat.com>; Tue, 27 Sep 2005 11:10:18 -0400
Received: from minotaur.hekimian.com (host-64-47-34-180.masergy.com
	[64.47.34.180] (may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8RFABFE014246
	for <linux-lvm@redhat.com>; Tue, 27 Sep 2005 11:10:11 -0400
Message-ID: <A61771BC4AE2DD41B460E8D73082E6E304F99E60@olympus.hekimian.com>
From: "Musard, Kris" <Kris.Musard@spirentcom.com>
Date: Tue, 27 Sep 2005 11:10:04 -0400
MIME-Version: 1.0
Subject: [linux-lvm] Help - cant bring Volume Group online!!!!!!
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

I had a temporary disk failure on a software RAID5 device yesterday
containing a volume group "hekvg".  I was able to bring my RAID5 online
using mdadm --assemble /dev/md0 --force, but now my LVM volume group refuses
to vary on.  Here are my errors:

lnxsrv2:root> vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg00"
vgscan -- ERROR "pv_read_pe(): read" can't get data of volume group "hekvg"
from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

lnxsrv2:root> vgimport /dev/hekvg /dev/md0
vgimport -- ERROR "pv_read(): multiple device" reading physical volume
"/dev/md0"

lnxsrv2:root> pvcreate -ff /dev/md0
pvcreate -- really INITIALIZE physical volume "/dev/md0" of volume group
"hekvg" [y/n]? y
pvcreate -- WARNING: forcing physical volume creation on "/dev/md0" of
volume group "hekvg"
pvcreate -- physical volume "/dev/md0" successfully created

lnxsrv2:root> vgcfgrestore -n hekvg -f /etc/lvmconf/hekvg.conf /dev/md0
vgcfgrestore -- ERROR "pv_write_pe(): write" storing VGDA of "hekvg" on
disks

lnxsrv2:root> vgchange -a y /dev/hekvg
vgchange -- volume group "hekvg" does not exist

lnxsrv2:root> pvdisplay -v /dev/md0
--- Physical volume ---
PV Name               /dev/md0
VG Name               hekvg
PV Size               949.58 GB [1991416320 secs] / NOT usable 5.06 MB [LVM:
1.05 MB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                8
PE Size (KByte)       4096
Total PE              243091
Free PE               0
Allocated PE          243091
PV UUID               MAfau0-qK8F-oNAg-gfH9-dw7s-lU3a-PftQTo
pvdisplay -- ERROR "pv_read_pe(): read" reading physical extent information

This is a production server which I need to get back online ASAP.  If anyone
can provide any assistance I would greatly appreciate it.

Thank You,

Kris Musard
Senior Software Analyst
Service Assurance - Broadband
SPIRENT COMMUNICATIONS
15200 Omega Drive, 2nd Floor
Rockville, MD 20850-3240 USA
Office: +1 301.417.6464
Fax: +1 301.590.3662
Pager:  +1 800.SKY8888 PIN#1266930
kris.musard@spirentcom.com
www.spirentcom.com
