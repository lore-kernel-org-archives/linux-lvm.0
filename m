Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1OKEUK18544
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 15:14:30 -0500
Received: from pfepc.post.tele.dk (pfepc.post.tele.dk [195.41.46.237])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1OKETAW018621
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 15:14:29 -0500
Received: from debian (0x50a44a50.arcnxx14.adsl-dhcp.tele.dk [80.164.74.80])
	by pfepc.post.tele.dk (Postfix) with ESMTP id F03E9262813
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 21:14:27 +0100 (CET)
Received: from [192.168.0.29] (helo=[192.168.0.29])
	by debian with esmtp (Exim 3.35 #1 (Debian)) id 1D4PNS-0000EX-00
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 21:14:26 +0100
Message-ID: <421E3614.5010107@gozar.dynu.com>
Date: Thu, 24 Feb 2005 21:16:20 +0100
From: Heine Laursen <maillist@gozar.dynu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM1 Bad harddisk. How do I het data off the Volume?
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

Hi.

One of my harddisks in my 2 harddisk LVM 1 setup, The bad harddisk is a 
120 GB Maxtor harddisk, who now identifies itself to the system as:
hde: Oaztor"6[120R0" " " " " " " " " " " " ", ATA DISK drive
The bios reports that the size of the harddisk is 80GB!

And of curse, I can't access any LVM volumes!

debian:~# pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG "vg" (run 
vgscan)
pvscan -- total: 1 [76.34 GB] / in use: 1 [76.34 GB] / in no VG: 0 [0]

debian:~# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "vg" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

As I understand, I have to run vgcfgrestore to get access to the volume.
But what about the faulty hde, is it also possebill to get data off this 
disk?
debian:~# fdisk -l /dev/hde

Disk /dev/hde: 16 heads, 63 sectors, 16383 cylinders
Units = cylinders of 1008 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System
/dev/hde1         33289    271505 120060832+  8e  Linux LVM
/dev/hde2         33289     66578  16777472    0  Empty
Partition 2 does not end on cylinder boundary:
      phys=(2, 2, 0) should be (2, 15, 63)
/dev/hde3         33289     66578  16777472    0  Empty
Partition 3 does not end on cylinder boundary:
      phys=(2, 2, 0) should be (2, 15, 63)
/dev/hde4         33289     66578  16777472    0  Empty
Partition 4 does not end on cylinder boundary:
      phys=(2, 2, 0) should be (2, 15, 63)

How can I rescue as mutch data as possebill?
I do not have access to a spare harddisk to do a dd_rescue on.

I'm useinf debian woody, and LVM 1.
Please advice. I'm afraid i'll do more damage, than rescue!
Thanks.
-- 
Sincerley
Heine Laursen
