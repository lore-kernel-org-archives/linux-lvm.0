Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HF74JQ021924
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:07:05 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8HF6sWn005809
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:06:55 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n8HF6r8t002270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:06:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n8HF6rBK006569
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 11:06:53 -0400
Date: Thu, 17 Sep 2009 11:06:53 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
In-Reply-To: <1253181956.30299.25.camel@breeves.fab.redhat.com>
Message-ID: <Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
	<1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 17 Sep 2009, Bryn M. Reeves wrote:

> If you don't want to muck about making manual changes you might be
> better off creating a new LV and mirroring the data with dd or some
> other block-level tool.

Using dd from a snapshot does not help the OP.  He says the dd will take
5-6 hours, and he needs a backup of the system *just before* the upgrade,
not hours before.  The rollback also needs to be quick.

A snapshot with dd does the "instant" backup part ok, but rollback
requires 5-6 hours to copy the snapsnot to a normal LV.

The OP is correct that creating and breaking a RAID1 mirror does what
he needs.  Apparently, LVM does not currently support this, although
it could be done with dmsetup.

I always build my VGs on md* devices.

My suggestion:

1. Add another disk, create partitions for software RAID1 (md) on the new
disk with missing mirrors, and size <= existing non-md PVs.

2. Make the md device(s) into LVM PVs, add to volume group.  

3. Migrate your LVs to the md PVs.

4. Remove non-md PVs.

5. Turn non-md partitions into md RAID1 partitions, and attach
(hot add) to the md devices created in step 1.

6. Wait for syncronization to complete.

7. Shutdown, remove one of the disks, and do the
upgrade.  (If you don't remove the disk and use mdadm to break the mirror,
you'll have a "hardware clone" which duplicates the VGIDs, and you'll need
to run the importclone script to rename+reUUID the clone.)

Alternate plan B for the paranoid:

Add *2* new disks, set up RAID1 md partitions with up to 3 mirrors, 2 active,
pvcreate, add to VG, and migrate LVs to the RAID1 PVs.  Add 3rd mirror,
synchronize, then physically remove or break mirror and importclone.
This ensures that your data always has@least 2 copies.

Alternate plan C for the brilliant:

Create new lvm command to clone LVs by creating a mirror and then breaking
it.  This is a good complement to a snapnot.  A snapsnot can be taken
"instantly", but take a long time to rollback (by copying to another LV).
A clone takes a long time to synchronize, but is current as of the
when the mirror is broken and can be used immediately as a real (non-snapsnot)
LV for rollback or other purposes.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
