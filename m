Message-ID: <53564F0C.3080402@redhat.com>
Date: Tue, 22 Apr 2014 13:14:20 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>	<5342A6A9.6060104@redhat.com>
	<5345703E.2050401@ucdavis.edu>	<5346A663.502@redhat.com>
	<006a01cf5b33$47f5bb20$d7e13160$@edu>
In-Reply-To: <006a01cf5b33$47f5bb20$d7e13160$@edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
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
Content-Type: text/plain; charset="us-ascii"
To: rrdavis@ucdavis.edu
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/18/2014 08:23 PM, Ryan Davis wrote:
> Hi Peter,
> 
> I made a backup copy of /dev/sdc using dd as you suggested.  This took a
> while to get a drive to copy this data to.
> 
> I started today with the resizing of the LV and hit a few snags and was
> wondering if you could shine some light on what is going on.
> 
> #pvdisplay --maps /dev/sdc1
> 
> --- Physical volume ---
>   PV Name               /dev/sdc1
>   VG Name               vg_data
>   PV Size               3.64 TB / not usable 3.97 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              953668
>   Free PE               0
>   Allocated PE          953668
>   PV UUID               8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf
>    
>   --- Physical Segments ---
>   Physical extent 0 to 953667:
>     Logical volume	/dev/vg_data/lv_home
>     Logical extents	0 to 953667
> 
> 
> Is the Allocatable yes (but Full) a deal breaker?
> 

That's OK and it's not a stopper here...

> # lvchange -an /dev/vg_data/lv_home
> 
> [root@hobbes ~]# lvscan
>   inactive          '/dev/vg_data/lv_home' [3.64 TB] inherit
> 
> [root@hobbes ~]# lvreduce -r -l -1 /dev/vg_data/lv_home
>   Logical volume lv_home must be activated before resizing filesystem
> 

Ah, I see. Well, we have to do that a bit more manually then...

> [root@hobbes ~]# pvresize /dev/sdc1
>   /dev/sdc1: cannot resize to 953667 extents as 953668 are allocated.
>   0 physical volume(s) resized / 1 physical volume(s) not resized
> 
> 
> What should I do now?  Did I miss something along the way?
> 

This should do the job then (I've tried this exact sequence on my machine):

- deactivate the problematic LV:
	lvchange -an vg_data/lv_home

- reduce the size of the LV by 1 extent:
	lvreduce -l -1 vg_data/lv_home

- make the PV size to be in sync with the real device size:
	pvresize /dev/sdc1

- activate the LV:
	lvchange -ay vg_data/lv_home

- run fsck for the FS on the LV:
	e2fsck -f -n /dev/vg_data/lv_home

- resize the FS to be in sync with new LV size:
	fsadm resize /dev/vg/lvol0

- check the resized filesystem:
	e2fsck /dev/vg_data/lv_home

Let me know if it works for you.

-- 
Peter
