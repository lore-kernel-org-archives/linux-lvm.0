Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3I9Dcj11319
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 05:13:38 -0400
Received: from mail016.syd.optusnet.com.au (mail016.syd.optusnet.com.au
	[211.29.132.167])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3I9DZJW003927
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 05:13:36 -0400
Received: from webmail02.syd.optusnet.com.au (webmail02.syd.optusnet.com.au
	[211.29.132.236])
	by mail016.syd.optusnet.com.au (8.11.6p2/8.11.6) with ESMTP id
	i3I9DTw23484
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 19:13:29 +1000
Message-Id: <200404180913.i3I9DTw23484@mail016.syd.optusnet.com.au>
Content-Disposition: inline
Content-Transfer-Encoding: binary
MIME-Version: 1.0
From: drsmithy@optusnet.com.au
Date: Sun, 18 Apr 2004 19:13:28 +1000
Subject: [linux-lvm] Lost a VG - please help
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

I have just upgraded a machine running Redhat
9 to Whitebox Linux 3.  Unfortunately, it
appears to have killed/destructively
reconfigured my LVM setup.

The original config consisted of:

/dev/hda1	
	- Regular ext3 Linux partition mounted as /boot
/dev/hda2	
	- LVM partition containing:
	vg_system
		- VG with several LVs containing the OS.

A RAID5 md device, /dev/md0, consisting of:
	/dev/hdc1
	/dev/hde1
	/dev/hdg1
	/dev/hdi1
	/dev/hdk1

/dev/md0 was configured as a single VG,
vg_data.  This VG had about 5 LVs.

Before installing the new system, I
'vgexport'ed vg_data as indicated in the LVM
HOWTO
(http://www.tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html):

(Unmount all relevant filesystems)

'vgchange -an vg_data'
          
'vgexport vg_data'


I "upgraded" by replacing /dev/hda with a new
drive and installing WBL straight onto the
new drive.  The LVM config I used for the new
drive was:

/dev/hda1
	- Regular ext3 Linux partition mounted as /boot
/dev/hda2	
	- LVM partition containing:
	vg_wbl
		- VG with a single LV containg the OS

Unfortunately, the VG that was on /dev/md0 -
vg_data - appears to have disappeared and
/dev/md0 appears to have been "merged" into
vg_wbl.  The commands for importing the old
VG do not give the results I was expecting:

[root@terminus root]# pvscan
pvscan -- reading all physical volumes (this
may take a while...)
pvscan -- ACTIVE   PV "/dev/md0"  of VG
"vg_wbl" [447.14 GB / 447.14 GB free]
pvscan -- WARNING: physical volume
"/dev/hde1" belongs to a meta device
pvscan -- WARNING: physical volume
"/dev/hdc1" belongs to a meta device
pvscan -- ACTIVE   PV "/dev/hda2" of VG
"vg_wbl" [37.16 GB / 25.40 GB free]
pvscan -- total: 4 [484.32 GB] / in use: 4
[484.32 GB] / in no VG: 0 [0]

[root@terminus root]#

I do not think /dev/md0 should be a PV of
vg_wbl....

Unsurprisingly, the next step of the import
didn't work:

[root@terminus root]# vgimport vg_data /dev/md0
vgimport -- ERROR "pv_read(): multiple
device" reading physical volume "/dev/md0"

[root@terminus root]#


I'd appreciate any help people can offer
recovering my data.  It would appear the
470Gb VG that was on /dev/md0 has disappeared
in a puff of electrons and /dev/md0 has
somehow been "sucked in" to the new vg_wbl VG
I created while installing the OS.  I'm sure
I'll need to provide more info, but I'm
unsure as to what it is - please don't
hesistate to ask.

Regards,
CS
