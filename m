Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0C8rgr01217
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 03:53:42 -0500
Received: from mail.clunker.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0C8rUPG023815
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 03:53:36 -0500
Message-ID: <41E4E575.6030802@vilain.net>
Date: Wed, 12 Jan 2005 21:53:09 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing a volume group
References: <853E1A0C-6071-11D9-A1E3-000A95AF6760@hawaii.rr.com>
In-Reply-To: <853E1A0C-6071-11D9-A1E3-000A95AF6760@hawaii.rr.com>
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
To: deant@hawaii.rr.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dean Takemori wrote:
> I'm running a Fedora Core 1 box using LVM on RAID (lvm-1.0.3-13)  I moved
> from a pair of RAID1 hard drives to a larger pair of drives by 
> strategically
> failing and replacing the drives. 
> This has left me with the following situation : Volume group lv0 (26GB) 
> resides
> on /dev/md1, which are a pair of 250GB partitions.  But the lvm tools 
> only see
> /dev/md1 as being 26GB (which is what it was on the old hard drives).  
> (Oddly,
> vgdisplay does note that the maximum lv size is 250GB).
> 
> Is it possible to resize the pv and lv so that they use up the full 
> space of
> the partition?

so, blockdev -s /dev/md1 shows 26 or 250GB ?

I'm struggling to see how you would have changed the size of a block
device with "strategically failing and replacing" drives.

> ~ > pvdisplay /dev/md1
> PV Size               26.44 GB [55453952 secs] / NOT usable 4.19 MB 

If /dev/md1 really is 250GB then you might have some surgical disk 
partitioning to do.  ie, get it back to the size it was, then add the
rest of the disk as another /dev/md PV.

Sam.
