Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TGgClL007916
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 12:42:12 -0400
Received: from certmail.caregroup.org (tumbleweed1.caregroup.org
	[134.174.120.81])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TGgB9Z008245
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 12:42:11 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Problem with vgreduce on LVM1
Date: Tue, 29 Aug 2006 12:41:54 -0400
Message-ID: <EED09BB41EE72044BCEE8156094FCE8F0183821F@EVS4.its.caregroup.org>
From: mghofran@caregroup.harvard.edu
Content-Transfer-Encoding: 8bit
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

You show lv=4 so don't you need to check if any of those lvols were
using that particular disk, remove the lvol and then proceed?

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Peter Smith
Sent: Tuesday, August 29, 2006 12:21 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Problem with vgreduce on LVM1

I can't seem to remove two physical volumes.  I've removed the LVs on 
them.  I've deactivated the PVs.  But I can not remove the PVs from the
VG.

Here's an example of what I'm seeing:

[root@linux archive]# pvmove -v /dev/emcpowera
pvmove -- checking name of source physical volume "/dev/emcpowera"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/emcpowera"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "data" from lvmtab
pvmove -- checking volume group consistency of "data"
pvmove -- searching for source physical volume "/dev/emcpowera" in 
volume group "data"
pvmove -- no logical volumes on empty source physical volume 
"/dev/emcpowera"

[root@linux archive]# vgreduce data /dev/emcpowera
vgreduce -- ERROR: can't reduce volume group "data" by used physical 
volume "/dev/emcpowera"

[root@linux archive]# pvdisplay /dev/emcpowera
--- Physical volume ---
PV Name               /dev/emcpowera
VG Name               data
PV Size               785.10 GB [1646481408 secs] / NOT usable 1 GB 
[LVM: 127 KB]
PV#                   1
PV Status             available
Allocatable           NO
Cur LV                4
PE Size (KByte)       1048576
Total PE              784
Free PE               784
Allocated PE          0
PV UUID               JpYFFb-NUqC-trBf-oFm7-tbdF-65If-GZ56fw

Does anyone have any idea why I can't complete a reduce?

Thanks,
Peter

Note:
Logical Volume Manager 1.0.8-13
Heinz Mauelshagen, Red Hat  03/05/2005 (IOP 10)

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
