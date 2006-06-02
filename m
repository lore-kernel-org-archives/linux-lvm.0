Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k522EdKT010817
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 22:14:39 -0400
Received: from chaos.chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k522ESqG026478
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 22:14:29 -0400
Received: from [205.244.242.67] (taz.ao.net [205.244.242.67])
	by chaos.chaos.ao.net (8.13.5/8.13.5/Debian-3) with ESMTP id
	k522EGFN013468
	for <linux-lvm@redhat.com>; Thu, 1 Jun 2006 22:14:26 -0400
Message-ID: <447F9CCE.2010305@chaos.ao.net>
Date: Thu, 01 Jun 2006 22:05:02 -0400
From: "Harik A'ttar" <harik@chaos.ao.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Bringing an existing filesystem under LVM2 control
References: <20060601134048.GJ10603@agk.surrey.redhat.com>
In-Reply-To: <20060601134048.GJ10603@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> A question which came up again on irc last night was whether an existing
> filesystem on a non-LVM partition can be turned into an LVM logical volume
> without having to wipe the disk.
> 
> With LVM2, I think the answer is often 'Yes'.


> 6. Finally run fsck on your new logical volume and check everything worked.


Wow, that's a bit scary.  The problem I see with it is you have PV data 
sitting inside a LV.  An errant tool operating on the filesystem would 
wipe out your entire volumegroup (until you manually intervened) rather 
then just screwing up one filesystem.

What I would do is copy the first (and probably last depending on 
alignment) extant out to another PV, then pvcreate.  You end up losing 
one or extants due to it, but there's always waste when dealing with 
large blocksizes.

Something like this:

lvcreate temporary-filesystem-head
copy one extant from raw partition -> vg1/temporary-filesystem-head
pvcreate on raw partition
vgextend vg1  raw partition
edit  the config backup to set the pe_start=pe_size
restore the config
lvextend temporary-filesystem-head raw_partition filesystem size

depending on alignment and allocation, you may have to copy the 
filesystem tail to another PV.

Wastes a bit more space, but you don't end up with an oddball PV with
it's UUID in the middle of a filesystem.



Now for the tough question:  With LVM2 built on device-mapper, why isn't 
extant_size = 512 bytes?   Is large-chunk allocation just leftover from 
LVM1, or is there a deeper technical reason for keeping it large?
