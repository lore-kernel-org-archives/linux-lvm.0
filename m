Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j33JJepH010133
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 20:19:40 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DIAdI-0000gP-N3
	for linux-lvm@redhat.com; Sun, 03 Apr 2005 20:19:40 +0100
Date: Sun, 3 Apr 2005 20:19:40 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM Error
Message-ID: <20050403191940.GO14307@agk.surrey.redhat.com>
References: <200504031040.05910.t-rigby@shaw.ca>
	<200504031046.00394.t-rigby@shaw.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200504031046.00394.t-rigby@shaw.ca>
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

On Sun, Apr 03, 2005 at 09:46:00AM -0800, Terry Rigby wrote:
> > http://ultimate.kicks-ass.net/files/lvm.txt

  PV /dev/hda2        VG 4474   lvm2 [18.18 GB / 0    free]
  PV /dev/hdc         VG 4474   lvm2 [74.53 GB / 0    free]
  PV /dev/hdb         VG 4474   lvm2 [74.53 GB / 0    free]
  PV unknown device   VG 4474   lvm2 [74.53 GB / 0    free]

Which version of LVM2?
Try upgrading it to at least 2.00.33.

Does hdd have a partition table on it (even an empty one)?
Is the PV meant to be hdd or hdd1?
If the PV is genuinely hdd not hdd1 and there's a partition 
table, try removing it.

Alasdair
-- 
agk@redhat.com
