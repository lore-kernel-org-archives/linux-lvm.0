Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k26JLs112896
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 14:21:54 -0500
Received: from mailgate1.yesinc.com (mailgate1.yesinc.com [216.204.185.106])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k26JLr97019489
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 14:21:53 -0500
Received: from mailgate1.yesinc.com (localhost.localdomain [127.0.0.1])
	by mailgate1.yesinc.com (Postfix) with ESMTP id 205B4D7630
	for <linux-lvm@redhat.com>; Mon,  6 Mar 2006 14:21:48 -0500 (EST)
Received: from fs02.yesinc.com (fs02.yesinc.com [172.16.0.2])
	by mailgate1.yesinc.com (Postfix) with ESMTP id DB824D762D
	for <linux-lvm@redhat.com>; Mon,  6 Mar 2006 14:21:42 -0500 (EST)
Message-Id: <s40c4576.090@fs02.yesinc.com>
Date: Mon, 06 Mar 2006 14:21:36 -0500
From: "Tim Cary" <TDC@yesinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM Snapshot create trouble
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

Hello,
 
This post relates to an issue posted by Steffen Plotner back in
December.  See
https://www.redhat.com/archives/linux-lvm/2005-December/msg00105.html
I am experiencing the same type of problem.
 
On 2.6.13-1.1532_FC4:
When a lot of write activity is going on my server goes into a dead
lock trying to create a snapshot.  The write activity is from creating
the snap itself, as disk i/o normally is not intense on this server.

lvm_snap_copy> source: /dev/vg_scsi_0/lv_os_root
lvm_snap_copy> target: /dev/vg_scsi_0/lv_os_root_alt
lvm_snap_create> source: /dev/vg_scsi_0/lv_os_root
lvm_snap_create> target: snap
lvm_snap_create> snap_space: 15%
lvm_snap_create> source uuid: Jm4sGV-fGt5-XRHl-ESds-AERY-pZtq-GOg8Tu
lvm_snap_create> short name: lv_os_root
lvm_snap_create> size: 8388608000 bytes
lvm_snap_create> snap_size: 1200 Mb
lvm_snap_create> lvcreate -s -L1200 -n lv_os_root_snap
/dev/vg_scsi_0/lv_os_root
  Rounding up size to full physical extent 1.19 GB

At this point no I/O was possible.  No ssh, no x terminal, no logging
into the console,  nothing at all!  Disk activity was null.  In VNC you
could see the load window all black filled.  I had to push the reset
button on the server.

This is on some very decent hardware- 3Ghz Xenon, 4Gb RAM, 7200RPM SCSI
Hardware raid controller drives.

When I run the same command on a different system, same hardware (but a
bit less loaded CPU wise), I did not yet have this problem, however I
have been able to reproduce this same type of issue, it seems when there
is continuous i/o, one can not remove the snapshot until all i/o
ceases.

Can anyone reproduce this problem?  Now there are at least two of us
with the same exact issue.

Tim
