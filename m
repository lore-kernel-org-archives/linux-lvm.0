Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TGLbWl002152
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 12:21:37 -0400
Received: from swlx167.swmed.edu (swlx167.swmed.edu [199.165.152.167])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7TGLSbL004641
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 12:21:28 -0400
Received: from peters.swmed.org ([129.112.118.137])
	by swlx167.swmed.edu with esmtp (Exim 4.44) id 1GI6Ky-0005la-Fc
	for linux-lvm@redhat.com; Tue, 29 Aug 2006 11:21:17 -0500
Message-ID: <44F4697C.3070908@utsouthwestern.edu>
Date: Tue, 29 Aug 2006 11:21:16 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with vgreduce on LVM1
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

I can't seem to remove two physical volumes.  I've removed the LVs on 
them.  I've deactivated the PVs.  But I can not remove the PVs from the VG.

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
