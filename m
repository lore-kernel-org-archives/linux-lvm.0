Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7GD0HWF032107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 09:00:18 -0400
Message-ID: <4C693661.5030003@redhat.com>
Date: Mon, 16 Aug 2010 14:00:17 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <0b2501cb3cfd$e7c263e0$b7472ba0$@rit.edu>
In-Reply-To: <0b2501cb3cfd$e7c263e0$b7472ba0$@rit.edu>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Partition Recovery in LVM
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 08/16/2010 05:45 AM, Andrew Ragone wrote:
> I�ve been searching like crazy to find an answer to this question to no avail: 
> when you restore a backup of LVM does the backup contain partition table 
> information as well?

No; LVM2 sits a level above partitioning. If you had a partition table
on the devices that were being used by LVM2 when you backed up you
should put it back before you restore (and back it up separately of course).

Note also that if you were using partitions then you'll need to
re-create the PVs on the appropriate partitions after restoring those
before you can restore the LVM2 metadata.

If you're just using whole-disk devices then there are no partitions or
partition tables to worry about.

If you mean partition tables that are stored _inside_ logical volumes
(e.g. where the LV is a whole-disk image for a virtual machine
containing partitions) then the answer's no as well; in this case the
partition table is just ordinary data on the LV and LVM2 doesn't know or
care about it at all (so you need to back it up separately, just like
any other data stored in an LV).

> I recently recovered an LVM that had a partition inside of it, but it has since 
> been unable to mount. Most recovery utilities such as TestDisk will only find 
> the LVM so I�m unsure of how to proceed and �recover� the partition.

Run the tools agains the logical volume (LV), not the physical volume (PV).

Regards,
Bryn.
