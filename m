Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7GJ4N0l021785
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 20:04:23 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1E56jX-0006jd-Lb
	for linux-lvm@redhat.com; Tue, 16 Aug 2005 20:04:23 +0100
Date: Tue, 16 Aug 2005 20:04:23 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
Message-ID: <20050816190423.GN29587@agk.surrey.redhat.com>
References: <20050816072600.26570.qmail@web52205.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050816072600.26570.qmail@web52205.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Aug 16, 2005 at 12:26:00AM -0700, john_gore@yahoo.com wrote:
> My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan). 
  
Check for a bogus partition table.

If a device (e.g. /dev/hdd) is partitioned, you can't use /dev/hdd as the PV
but have to use one of its partitions instead e.g. /dev/hdd1.
If something like this happened, you need to remove the partition table.

Alasdair
-- 
agk@redhat.com
