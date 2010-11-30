Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAU7F9bi004796
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 02:15:09 -0500
Received: from aspen.rjl.com (aspen.rjl.com [66.35.48.14])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAU7F0vT022417
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 02:15:00 -0500
Message-ID: <4CF4A472.20107@rjl.com>
Date: Mon, 29 Nov 2010 23:14:58 -0800
From: Nataraj <incoming-centos@rjl.com>
MIME-Version: 1.0
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>	<4CF3F7A0.2080108@rjl.com>
	<AANLkTim67atrgHEzunBRvp4ij+MUDiTg4vu5t6sbgFLq@mail.gmail.com>
In-Reply-To: <AANLkTim67atrgHEzunBRvp4ij+MUDiTg4vu5t6sbgFLq@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Q: LVM over RAID,
 or plain disks? A:"Yes" = best of both worlds?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: hansbkk@gmail.com
Cc: linux-lvm@redhat.com

hansbkk@gmail.com wrote:
> On Tue, Nov 30, 2010 at 1:57 AM, Nataraj <incoming-redhat@rjl.com> wrote:
>   
>> Your proposed solution is a bit confusing to understand,
>>     
>
> Thanks for taking the time to give me feedback! And sorry I couldn't
> make it clearer, but if the diagram is pasted into a monospace screen
> it becomes more so - duplicated below.
>
> The key is that I want to RAID1 from a given **LV** within the
> TopRAID1 set to regular partitions on physical disks on the TopRAID2
> side.
>
>   
>> however raid1 works for doing backups in the manner that you describe .
>> I use it myself and I
>> have, over time read about others doing so as well.  Be sure to create your
>> volumes with --bitmap=internal, that way when you swap in a drive, it won't
>> need to replicate the entire drive, only the part that is changed.
>>     
>
> TopRAID1's LVM is likely to be running over a RAID6 set , so I'm not
> depending on the TopRAID mirroring for reliability, just using it for
> the above volume cloning.
>   
Your raid 1 backups won't mirror any snapshots of your LV's unless you 
specifically setup mirroring of the snapshots after they exist.
> When TopRAID1 is running with the TopRAID2 side marked faulty or
> missing, will there be a performance hit or other negative
> consequences?
>   
My guess would be no, but the only way to really tell is to run tests.  
It would depend somewhat on how your drives and controllers are 
configured, but writes might be faster with only a single drive online, 
whereas reads may be slower, since you don't have the ability to read 
from both drives.  But since your LV is already raid 6, it's hard to 
tell what the behavior of raid 1 on top of raid 6 will be. I think you 
would just have to try it.  The syncing of data when you readd a drive 
into the raid 1 set tends to be very fast (with the internal bitmap).

> If so, would it be possible/better for the host In normal operations
> to mount the underlying LV directly rather than the degraded top-level
> RAID1?
>
>   
No, you want to have mdadm assemble the raid volume, even if in degraded 
mode with only one drive and then access the LV on top of the md 
device.  Even if you were able to mount the LV and bypass raid, that 
would be pointless because you would not update the bitmap and 
superblock and the integrety of the raid set would be lost.


Nataraj
