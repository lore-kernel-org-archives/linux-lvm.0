Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2U04lE5013425
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 20:04:47 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2U04e9K020913
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 20:04:40 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id 77863E9647
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 02:04:39 +0200 (CEST)
Message-ID: <4092125B2C6B4D8CB4A9452F5D48D262@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <DE6049702F6A4634890B18D047C27E03@caramon><20110329124434.3cf62c3e@bettercgi.com><CE3415B4EB40445F8F294A52BC905070@caramon>
	<20110329172659.4a921f53@bettercgi.com>
Date: Wed, 30 Mar 2011 02:05:14 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
thanks for your time

----- Original Message ----- 
From: "Ray Morris" <support@bettercgi.com>
To: <linux-lvm@redhat.com>
Sent: Wednesday, March 30, 2011 12:26 AM
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?


>7> Run "resize2fs /dev/vgftp/lvftp"
>>    resize2fs 1.41.10 (10-Feb-2009)
>>    Resizing the filesystem on /dev/vgftp/lvftp to 1115800576 (4k)
>> blocks
>> Resizing the filesystem on /dev/vgftp/lvftp to 1115800576 (4k)
>> blocks
> 8> Here it all hangs. I cant do anything with the filesystem or LVM.
> 8> every
>
> You can expect resize2fs to take a couple of hours on a 4 TB
> filesystem, so the "crash" may well be nothing but impatience.

I doubt that is the case after waiting for at least 3 days. It has only 
taken 5-10 hours before.

>
>> If i do a lvreduce i fear something will break.
>> Is it better to do a e2fsck now?
>
> The problem that we know about is that the resize2fs was
> interrupted.  Reports defer in the level in danger in that,
> but definitely we want to get the filesystem consistent and
> small enough before we pull the block device out from underneath
> it.  So yes, you need a passing e2fsck before an lvreduce at
> this points.
>
> The safest thing to do would be make a copy of at least the LV,
> if not both PVs, so you can get back to where you are if needed.
> That's almost always the first best step for any kind of data
> recovery type of effort.
>
> Once you have a copy or have checked that your backups are Ok,
> you can proceed with e2fsck. After e2fsck passes, you can try
> to pvmove the extents off of the new drive, if you wish.  If
> the LV won't fit on the old drive, you'll need to resize2fs
> and lvreduce to make it fit.  It can be hard to know just how
> big to make the LV for a given FS size, due to filesystem overhead
> and such.  A safe way to do it would be to resize2fs as small
> as possible first. That'll probably give you at least 10%-20%
> of margin between the size of the FS and the size of the PV.
> Then resize the LV to match the PV.  Once the LV is at it's final
> size, resize2fs to max.
>
> Check that your LV is in fact the same size as it was
> before your lvextend and the output of "history". It sounds
> like either a) you didn't run exactly the commands that you
> are reporting or b) the LV is in fact larger than it used
> to be.  If you ran lvextend to increase the size of the LV
> and did not reduce it after, a crash during resize2fs isn't
> going to shrink it automagically.  Also, if it were at the
> old size, it probably wouldn't be on both PVs.  Therefore,
> the LV probably actually is 400GB larger than it used to be.

Sadly I have no backups of this system due to the size of it and lack of 
disks to make a full backup of it. :( I have alot of PV's making up the VG 
and LV and it totals 4TB before i added the new disk.
I have not used the system at all, and the commands i printed before is the 
exact ones i did on the machine. I have a file with the console buffer still 
here.
I did not execute any other commands in between or wrote anything to the 
volume. The old volume was almost full before i did the lvextend. But since 
i have not used it at all after the resize2fs crash.....i could do an e2fsck 
and then an lvreduce /dev/vgftp -L-400G /dev/vgftp/lvftp and I should be 
back to where i started? Given that i can run e2fsck.

I really dont like this situation and I feel like a newbie trying to 
understand whats gone wrong. really appreciate your help.

thanks
/Fredrik Skog


> -- 
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
>
>
> On Tue, 29 Mar 2011 23:56:03 +0200
> "Fredrik Skog" <fredrik.skog@rodang.se> wrote:
>
>> But since lvdisplay says the volume is 4.16TiB and pvdisplay says
>> 5.59TiB something is wrong? Or am I missing something?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
