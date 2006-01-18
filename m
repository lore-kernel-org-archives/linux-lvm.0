Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0IHgR131188
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 12:42:27 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0IHgK2m011605
	for <linux-lvm@redhat.com>; Wed, 18 Jan 2006 12:42:20 -0500
Message-ID: <43CE7DF7.3010201@schembach.de>
Date: Wed, 18 Jan 2006 18:42:15 +0100
From: Oliver Schembach <oliver@schembach.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering LVM configuration on crashed RAID partition
References: <43CE4CF8.8090709@schembach.de> <1137600874l.12955l.0l@mofo>
In-Reply-To: <1137600874l.12955l.0l@mofo>
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
To: linux-lvm@redhat.com

Karl O. Pinc schrieb:
>
> On 01/18/2006 08:13:12 AM, Oliver Schembach wrote:
>> Hi,
>>
>> I'm running 4 IDE disks in my home server using software raid with 
>> the following partition layout:
>>
>> hd[abcd]1   /boot (RAID 1)
>> hd[abcd]2   swap (RAID 5)
>
> I don't know what I'm doing with LVM so can't help, but I can
> say that you don't want to run swap on raid5.  Probably you
> want to run it on raid0, perhaps raid 1 if you've hot-swappable
> drives and want to maximize uptime.
>
> Karl <kop@meme.com>
> Free Software:  "You don't pay back, you pay forward."
>                  -- Robert A. Heinlein
>
>
>
Thanks for your recommendation regarding RAID 5 on swap partitions. 
There's not so much swapping on my machine, so I didn't really notice 
the drawbacks resulting from the CPU XORing for the raid 5 algarithm.  
My idea really was to avoid  the machine going down in case of a disk 
crash in the raid array.
But you are right, I will change the swap partition to RAID 1 (...if I 
ever will get back my data from my LVM partition...)

Regards,
    Oliver
