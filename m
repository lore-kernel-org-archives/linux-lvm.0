Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2EDWJS28075
	for <linux-lvm@redhat.com>; Sun, 14 Mar 2004 08:32:19 -0500
Received: from p15124399.pureserver.info (p15124399.pureserver.info
	[217.160.182.169])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2EDWH07010786
	for <linux-lvm@redhat.com>; Sun, 14 Mar 2004 08:32:17 -0500
Received: from rockley.barbados (81-5-142-175.dsl.eclipse.net.uk
	[81.5.142.175]) (authenticated (0 bits))
	by p15124399.pureserver.info (8.11.6/8.11.6) with ESMTP id i2EDWBV19069
	for <linux-lvm@redhat.com>; Sun, 14 Mar 2004 13:32:11 GMT
From: Nick Gushlow <nick@gushlow.com>
Message-Id: <1079271129.2414.7.camel@rockley.barbados>
Mime-Version: 1.0
Date: Sun, 14 Mar 2004 13:32:09 +0000
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Problems when moving data off a PV
Reply-To: nick@gushlow.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I've got a volume group (vg2) that spans 3 partitions on two disks;
hdb1, hdb5, hdc.  hdb1 and hdb5 are the only partitions on disk hdb.

Disk hdb is failing and I've got an identical replacement from Maxtor,
so I stuck the new disk in and tried to follow the instructions on the
LVM howto for removing a disk. 

I've successfully transfered hdb5 to the new disk (hdd) but I got an
error when trying to move hdb1; I can't remember that error now but I am
assuming that there may be damage to that part of the disk as the disk
is failing.

After trying a few things I found on the lvm lists and other places and
I'm now at a stage where a vgscan reports

------------------------------------------------------------------------
vgscan -- only found 4253 of 4267 LEs for LV /dev/vg2/storage (0) 
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg2" from physical volume(s)
------------------------------------------------------------------------

I tried a couple of things from very old posts I found on the lvm
mailing list including compiling LVM2 from cvs so I could do a vgreduce
--removemissing but that didn't work (I assume because they are lvm1) 

Can anyone tell me what might be wrong, and more importantly how I can
get the volume group back up. 

I am assuming that as the data is spread across 3 disks if I can't
recover from this error then I will have lost everything on them. 

Unfortunately I don't have a backup because I have nothing large enough
to backup the data in the volume group. 

TIA,

Nick Gushlow.
