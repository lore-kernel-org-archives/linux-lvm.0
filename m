Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j2GFtfUX027969
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2005 15:55:41 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DBas1-0003y0-5m
	for linux-lvm@redhat.com; Wed, 16 Mar 2005 15:55:41 +0000
Date: Wed, 16 Mar 2005 15:55:41 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Can't find physical volume / vgcfgrestore not helping
Message-ID: <20050316155541.GP19749@agk.surrey.redhat.com>
References: <20050316153135.C72191E404E@mail.zapeng.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050316153135.C72191E404E@mail.zapeng.com>
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

On Wed, Mar 16, 2005 at 10:30:42AM -0500, Bryan Ragon wrote:
> # fdisk -l /dev/hdb
> /dev/hdb1               1       14593   117218241   83  Linux
 
> (Is that a proper Id? Plus, looking at my media_vg backup, I don't believe
> there should be a partition because the hint is /dev/hdb, not /dev/hdb1)
 
>                         device = "/dev/hdb"     # Hint only

Chances are you didn't remove the partition table before using
the entire unpartitioned device as a physical volume,
or ran pvcreate on /dev/hdb when you intended to use hdb1.

(Recent lvm2 versions of pvcreate handle this better.)

Try removing the partition table.

[eg delete the partition with fdisk/parted, or write 512 zero bytes 
to the start of /dev/hdb - back it up first - and run blockdev --rereadpt]

Alasdair
-- 
agk@redhat.com
