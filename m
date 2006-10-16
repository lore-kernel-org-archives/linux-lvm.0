Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9GDJ9DM013450
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 09:19:09 -0400
Received: from mta9.adelphia.net (mta9.adelphia.net [68.168.78.199])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9GDJ1b1007692
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 09:19:02 -0400
Message-ID: <45338648.80805@waldoware.com>
Date: Mon, 16 Oct 2006 09:16:56 -0400
From: Paul Waldo <pwaldo@waldoware.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to add new drive to LV
References: <200610130827.42040.pwaldo@waldoware.com>	<452FB129.7020208@gmx.net>
	<452FBCAA.4080000@redhat.com> <45333B3D.9010009@gmx.net>
In-Reply-To: <45333B3D.9010009@gmx.net>
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
To: Klaus Strebel <klaus.strebel@gmx.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Klaus Strebel wrote:
> Bryn M. Reeves schrieb:
>> Klaus Strebel wrote:
>>> Hi Paul,
>>> look's like you didn't get the LVM architecture :-(.
>>> You can't add a drive to a LV, no matter how brand new and shiny it is
>>> and no matter how desperate you try.
>> Hi Klaus,
>>
>> Looks like you didn't read the mail :-(.
>>
>> Paul has already added hdd1 as a PV to the ide_disks VG:
>>
>>>>>   --- Physical volume ---
>>>>>   PV Name               /dev/hdd1
>>>>>   VG Name               ide_disks <------------------
>>>>>   PV Size               149.03 GB / not usable 0
>>>>>   Allocatable           yes
>>>>>   PE Size (KByte)       4096
>>>>>   Total PE              38152
>>>>>   Free PE               38152
>>>>>   Allocated PE          0
>>>>>   PV UUID               XxOREs-3k4B-jhky-lhGD-zQx5-xhE3-HPqG0L
> Hi all ( esp. Paul ),
> 
> mea culpa, i really missed that bit :-(.
> 
> Cheers
> Klaus
Not a problem, Klaus!  Everybody helps, and that's the point!

Paul
