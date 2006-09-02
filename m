Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k82LRkt6001732
	for <linux-lvm@redhat.com>; Sat, 2 Sep 2006 17:27:46 -0400
Received: from fmmailgate07.web.de (fmmailgate07.web.de [217.72.192.248])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k82LRjqu018578
	for <linux-lvm@redhat.com>; Sat, 2 Sep 2006 17:27:45 -0400
Date: Sat, 02 Sep 2006 23:27:33 +0200
Message-Id: <1225935486@web.de>
MIME-Version: 1.0
From: Thomas Scheller <thomas.scheller@email.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Partitiontable destroyed with gentoo installer
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

Hi,

I have a 250GB harddisk. I used the whole disk as a PV.

# pvcreate /dev/hdb

and did create a volume group

vgcreate vg_250GB /dev/hdb

and 2 logical volumes

lv_old_system with 50GB
and
lv_storage with the rest of the disk

then I did copy all the data from the old harddisk to lv_old_system.

With the Gentoo live CD I did then install gentoo linux to the old harddrive.
The gentoo installer did delete the partitiontable on all connected harddrives :-(
So my logicalvolumes are not available anymore.
But vgchange shows that lv_old_system is somehow still available. Can you help me please, to recover that volume?
As I did create the logical volume with the old SuSE 8 installation, which I did overwrite with the gentoo installation, I do not have the metadata backup in /etc :-(

thinkpad ~ # vgchange -v -ay vg_250GB
    Using volume group(s) on command line
    Finding volume group "vg_250GB"
  Logical volume (lv_old_system) contains an incomplete mapping table.
    Wiping cache of LVM-capable devices
  Logical volume (lv_old_system) contains an incomplete mapping table.
  Volume group "vg_250GB" not found
thinkpad ~ # 

Thank you in advance
    Thomas
