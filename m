Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DEnnMX006124
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 10:49:50 -0400
Received: from mail.runsolutions.com (mail.runsolutions.com [65.111.165.242])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DEnbil027661
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 10:49:40 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.runsolutions.com (Postfix) with ESMTP id D79792B7C
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 15:53:21 +0200 (CEST)
Received: from mail.runsolutions.com ([127.0.0.1])
	by localhost (runsolutions.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20284-09 for <linux-lvm@redhat.com>;
	Tue, 13 Apr 2010 15:53:09 +0200 (CEST)
Received: from zimbra-01.runsolutions.com (213.201.24.127.static.user.ono.com
	[213.201.24.127])
	by mail.runsolutions.com (Postfix) with ESMTP id 12E00E3F
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 15:53:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra-01.runsolutions.com (Postfix) with ESMTP id 49E6C2C10E
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 16:49:22 +0200 (CEST)
Received: from zimbra-01.runsolutions.com ([127.0.0.1])
	by localhost (zimbra-01.runsolutions.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id JCL4w1rAW9gG for <linux-lvm@redhat.com>;
	Tue, 13 Apr 2010 16:49:19 +0200 (CEST)
Received: from zimbra-01.runsolutions.com (zimbra-01.runsolutions.com
	[192.168.0.188])
	by zimbra-01.runsolutions.com (Postfix) with ESMTP id A0C0A2C088
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 16:49:19 +0200 (CEST)
Date: Tue, 13 Apr 2010 16:49:19 +0200 (CEST)
From: Raimund Sacherer <rs@runsolutions.com>
Message-ID: <294874707.253.1271170159428.JavaMail.root@zimbra-01>
In-Reply-To: <1387502754.251.1271169841357.JavaMail.root@zimbra-01>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM hangs on removing a snapshot ...
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi Mailinglist,

I sent this mail to the proxmox mailinglist (http://bit.ly/aEEsVG) but I got no helpful response, I first thought it might be iSCSI, but then another guy responded with problems on LVM over MDRaid with drdb ... so i guess it's LVM, here is my mail from then:

I use proxmox (http://bit.ly/trBSx) with their kernel 2.6.32 (see detailed version informations below) and I have on this machine some KVM's, which have their raw image on an iSCSI LVM volume.

This machine is running with this scenario for over a month now. On Saturday one KVM Machine (a Zimbra Server) suddenly stopped. On Monday I could not enter the KVM from ssh and proxmox did not let me login. I tried from another node but could not do anything with the node in question.

After restarting the pvedaemon I noticed vgs and vgscan stuff laying dormant around. I investigated further and found that the cron-jobs doing the backups is hanging "uninterruptable" with lvremove.

I had nothing really relevant in the log-files, the output from lsscsi is fine, however all lvm tools (vgdisplay, pvdisplay) are hanging in regard to the volume (vmstorage), all other pv's and vg's display fine (after a CTRL-C).

The other KVM-Machines seem to be fine as well as I can ssh into them, etc.

I rebooted the node for the better and everything worked fine, until the nightly backup, again the same problem. Now I am worried to why, because in the whole Setup *nothing* has changed.

All KVM Machines are running either debian or ubuntu LTS 8.04

All logs insinde the Zimbra KVM machine just stop at a specific time. Around this Time I can not find anything unusual in the Logs from the Host machine.


here are some more details gathered from the Host machine:
root 3064 0.0 0.0 19832 1040 ? Ss Mar15 0:00 /usr/sbin/cron
root 8857 0.0 0.0 28372 992 ? S Mar15 0:00 \_ /USR/SBIN/CRON
root 8859 0.0 0.1 47824 13096 ? Ss Mar15 0:00 \_ /usr/bin/perl -w /usr/sbin/vzdump --quiet --node 1 --snapshot --compress --storage backup-bagdad
root 21200 0.0 0.0 38668 7892 ? S Mar15 0:00 \_ /usr/bin/perl -w /usr/sbin/pvesm lock KVM 60
root 21201 0.0 0.1 25840 13568 ? D<L Mar15 0:00 \_ lvremove -f /dev/vmstorage/vzsnap-node-04-0

Hanging pvedaemon (but interruptable)
root 21246 0.0 0.0 15492 1516 ? S Mar15 0:00 | \_ /sbin/vgs --separator : --noheadings --units k --unbuffered --nosuffix --options vg_name,vg_size
root 4494 0.0 0.2 88116 24096 ? S Mar15 0:08 \_ pvedaemon worker
root 21219 0.0 0.0 15492 1516 ? S Mar15 0:00 \_ /sbin/vgs --separator : --noheadings --units k --unbuffered --nosuffix --options vg_name,vg_size


iSCSI Information:
Loading iSCSI transport class v2.0-870.
iscsi: registered transport (tcp)
iscsi: registered transport (iser)
scsi5 : iSCSI Initiator over TCP/IP
scsi6 : iSCSI Initiator over TCP/IP
scsi7 : iSCSI Initiator over TCP/IP
scsi 5:0:0:0: Direct-Access OPNFILER VIRTUAL-DISK 0 PQ: 0 ANSI: 4
sd 5:0:0:0: Attached scsi generic sg4 type 0
scsi 6:0:0:0: Direct-Access OPNFILER VIRTUAL-DISK 0 PQ: 0 ANSI: 4
sd 6:0:0:0: Attached scsi generic sg5 type 0
sd 6:0:0:0: [sdc] 52822016 512-byte logical blocks: (27.0 GB/25.1 GiB)
sd 5:0:0:0: [sdb] 246743040 512-byte logical blocks: (126 GB/117 GiB)
sd 5:0:0:0: [sdb] Write Protect is off
sd 5:0:0:0: [sdb] Mode Sense: 77 00 00 08
sd 6:0:0:0: [sdc] Write Protect is off
sd 6:0:0:0: [sdc] Mode Sense: 77 00 00 08
sd 5:0:0:0: [sdb] Write cache: disabled, read cache: disabled, doesn't support DPO or FUA
sd 6:0:0:0: [sdc] Write cache: disabled, read cache: disabled, doesn't support DPO or FUA
sdb:
sdc: sdc1
sd 6:0:0:0: [sdc] Attached SCSI disk
unknown partition table
sd 5:0:0:0: [sdb] Attached SCSI disk

Kernel:
Linux node-04 2.6.32-1-pve #1 SMP Fri Jan 15 11:37:39 CET 2010 x86_64 GNU/Linux

node-04:/var/log# dpkg -l | egrep "(lvm|devm)"
ii libdevmapper1.02.1 2:1.02.27-4 The Linux Kernel Device Mapper userspace library
ii lvm2 2.02.39-7 The Linux Logical Volume Manager


node-04:/var/log# cat /etc/debian_version 
5.0.4


lsscsi output:
node-04:/etc# lsscsi --long
[0:0:0:0] cd/dvd TSSTcorp CDDVDW TS-L633B IB03 /dev/sr0
state=running queue_depth=1 scsi_level=6 type=5 device_blocked=0 timeout=30
[4:0:0:0] disk ATA ST9320423AS SDM1 - 
state=running queue_depth=64 scsi_level=6 type=0 device_blocked=0 timeout=0
[4:0:1:0] disk ATA ST9320423AS SDM1 - 
state=running queue_depth=64 scsi_level=6 type=0 device_blocked=0 timeout=0
[4:1:2:0] disk LSILOGIC Logical Volume 3000 /dev/sda
state=running queue_depth=64 scsi_level=3 type=0 device_blocked=0 timeout=30
[5:0:0:0] disk OPNFILER VIRTUAL-DISK 0 /dev/sdb
state=running queue_depth=32 scsi_level=5 type=0 device_blocked=0 timeout=30
[6:0:0:0] disk OPNFILER VIRTUAL-DISK 0 /dev/sdc
state=running queue_depth=32 scsi_level=5 type=0 device_blocked=0 timeout=30


Anyone experiencing the same? Any solutions? Everything i found on google relates to older LVM software problems which should be fixed in the releases installed on this node.


-
RunSolutions
     Open Source It Consulting
-
Email: rs@runsolutions.com

Parc Bit - Centro Empresarial Son Espanyol
Edificio Estel - Local 3D
07121 -  Palma de Mallorca
Baleares
