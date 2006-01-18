Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0IEQ4122284
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 09:26:04 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.183])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0IEPqI4014614
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 09:25:57 -0500
Message-ID: <43CE4CF8.8090709@schembach.de>
Date: Wed, 18 Jan 2006 15:13:12 +0100
From: Oliver Schembach <oliver@schembach.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Recovering LVM configuration on crashed RAID partition
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

Hi,

I'm running 4 IDE disks in my home server using software raid with the 
following partition layout:

hd[abcd]1   /boot (RAID 1)
hd[abcd]2   swap (RAID 5)
hd[abcd]3   / (RAID 5)
hd[abcd]4   (RAID 5) LVM with logical volumes /data and /business

Now hdb crashed and while trying to recover the root partition (before I 
replaced the faulty disk) I lost all data in the root partition 
(including the whole /etc directory tree). So after replacing the defect 
drive I installed a linux on hda3 (with swap partion on hda2) for 
recovering purposes. I actually left the LVM RAID partition untouched 
until I replaced the defect drive. After resyncing the new drive into 
the LVM partition I tried to get access to the data in the logical 
volumes, but without success. There are no PVs, no VGs, or LVs listed.

GPART did not give any positive results, but listed four primary 
partitions with all 00s in it:
* Warning: strange partition table magic 0x0000.
Primary partition(1)
   type: 000(0x00)(unused)
   size: 0mb #s(0) s(0-0)
   chs:  (0/0/0)-(0/0/0)d (0/0/0)-(0/0/0)r
   hex:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00

Primary partition(2)
...

vgscan gives:
  Reading all physical volumes.  This may take a while...

pvscan gives:
  No matching physical volumes found

lvdisplay gives:
  No volume groups found

Since I didn't do anything with the LVM RAID partition the logical 
volumes and the data must still be there!!!

Is there any other way to get access to the LVM partitions?

Thanks in advance!

Oliver 
