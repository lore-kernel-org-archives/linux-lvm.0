Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j33JarpH011139
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 20:36:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DIAtx-0000hZ-Qy
	for linux-lvm@redhat.com; Sun, 03 Apr 2005 20:36:53 +0100
Date: Sun, 3 Apr 2005 20:36:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem with UUID on PVs
Message-ID: <20050403193653.GP14307@agk.surrey.redhat.com>
References: <200504011804.j31I4bbt074009@tron.kn.vutbr.cz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200504011804.j31I4bbt074009@tron.kn.vutbr.cz>
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

On Fri, Apr 01, 2005 at 08:04:46PM +0200, Jiri Bartosik wrote:
>   Reading all physical volumes.  This may take a while...
>   Couldn't find device with uuid 'ZpitfR-Kwsh-8YJH-6RLS-tDZL-Tlhg-xcM99S'.
>   Couldn't find all physical volumes for volume group vg_XXX2.

> Is there any way to fix UUID on PV with maintaining data od that PVs? I
> tried uuid_fixer, I looked for some guide, but both didn't work.
 
> lvm2-2.00.33-r1 installed

Common causes:
  Mixed-up partitioning (e.g. device is partitioned yet the PV was 
installed on the whole disk; fix - remove unused partition table)
  pvcreate was run against devices inside the PV
    fix: run pvcreate again with -u to put the uuids back on all the
         devices, followed by vgcfgrestore (once per VG) to put 
         the metadata back from current backup

Alasdair
-- 
agk@redhat.com
