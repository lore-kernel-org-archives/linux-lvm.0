Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6NHa0n7011171
	for <linux-lvm@redhat.com>; Wed, 23 Jul 2008 13:36:00 -0400
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6NHZF66024557
	for <linux-lvm@redhat.com>; Wed, 23 Jul 2008 13:35:15 -0400
Received: from soda.linbit (office.linbit [86.59.100.100])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id 320FC2E03781
	for <linux-lvm@redhat.com>; Wed, 23 Jul 2008 19:35:14 +0200 (CEST)
Date: Wed, 23 Jul 2008 19:35:14 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] Every now and then LVM is not recognized - LVM2 on
	RAID10
Message-ID: <20080723173514.GC30203@soda.linbit>
References: <48871F04.9090002@exxs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48871F04.9090002@exxs.net>
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
To: linux-lvm@redhat.com

On Wed, Jul 23, 2008 at 02:07:32PM +0200, exxs.net - matevz sernc-urban wrote:
> Dear LVM-Users,
>
> i am running into a very interesting situation today, that our LVM  
> metadata is recognized only sometimes. LVM was running fine for some  
> weeks and now from today on running pvscan 10 times one after another i  
> get about 4 positive and 6 negative results (its somehow a coincidence  
> that LVM is recognized).
>
> * WORKING STATE:
> server$ pvscan
>   PV /dev/md2   VG mainvg   lvm2 [909.59 GB / 299.59 GB free]
>   Total: 1 [909.59 GB] / in use: 1 [909.59 GB] / in no VG: 0 [0   ]
>
> * NOT-WORKING STATE:
> server$ pvscan
>   No matching physical volumes found
>
> notice: Same behaviour with vgscan and lvscan.
>
> Our Setup:
> * RAID-10 /dev/md2 on /dev/sd[a-d]5
> cat /proc/mdstat
> Personalities : [raid1] [raid10]
> md2 : active raid10 sdb5[1] sda5[0] sdd5[3] sdc5[2]
>       953778688 blocks 64K chunks 2 far-copies [4/4] [UUUU]
>
> * LVM2 on top of /dev/md2 (no separate lvm partition)
> lvm metadata backup is present and it is exactly the same as backups we  
> did months ago
>
> I will attach the lvm2 metadata file to this message (vg name: mainvg)
>
> WORKING STATE:
> server$ pvscan -vv
>       Setting global/locking_type to 1
>       File-based locking selected.
>       Setting global/locking_dir to /var/lock/lvm
>       Locking /var/lock/lvm/P_global WB
>     Wiping cache of LVM-capable devices
>       /dev/sndstat: stat failed: No such file or directory
>     Wiping internal VG cache
>     Walking through all physical volumes
>       /dev/md2: size is 1907557376 sectors
>       /dev/md2: lvm2 label detected
>   PV /dev/md2   VG mainvg   lvm2 [909.59 GB / 299.59 GB free]
>   Total: 1 [909.59 GB] / in use: 1 [909.59 GB] / in no VG: 0 [0   ]
>       Unlocking /var/lock/lvm/P_global
>
> NOT-WORKING STATE:
> server$ pvscan -vv
>       Setting global/locking_type to 1
>       File-based locking selected.
>       Setting global/locking_dir to /var/lock/lvm
>       Locking /var/lock/lvm/P_global WB
>     Wiping cache of LVM-capable devices
>       /dev/sndstat: stat failed: No such file or directory
>     Wiping internal VG cache
>     Walking through all physical volumes
>       /dev/md2: size is 1907557376 sectors
>       /dev/md2: No label detected
>   No matching physical volumes found
>       Unlocking /var/lock/lvm/P_global
>
>
> Any hints?
>
> Where should it look regarding "/dev/md2: No label detected" vs.  
> "/dev/md2: lvm2 label detected"??
>
> It seems like RAID-10 is not sync'ed well maybe? But, mdstat reports all  
> disks are up.

just a shot in the dark:

for dev in /dev/sd{a,b,c,d}5; do
	md5=$(dd if=$dev iflag=direct bs=1M count=1 | md5sum)
	echo "$dev: $md5"
done

echo check > /sys/block/md2/md/sync_action

	Lars
