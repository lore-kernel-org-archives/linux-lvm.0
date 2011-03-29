Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2TLtZY9009494
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 17:55:35 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2TLtTpU015897
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 17:55:30 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id 5837CE9640
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 23:55:28 +0200 (CEST)
Message-ID: <CE3415B4EB40445F8F294A52BC905070@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <DE6049702F6A4634890B18D047C27E03@caramon>
	<20110329124434.3cf62c3e@bettercgi.com>
Date: Tue, 29 Mar 2011 23:56:03 +0200
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

>> While adding a new disk to my LV i ended up with a crash during the
>> resize2fs.
>
> resize2fs would be run AFTER lvextend, so if resize2fs was running,
> the LV would need to be the new, larger size.  Yet, you said
> "the system still thinks the LV is the old size".  Did you run
> vgcfgrestore already, restoring to the point between where you
> ran vgextend and lvextend?  Perhaps you forgot to run lvextend,
> but then one would expect resize2fs to tell you it was already
> full sized.  Double check what you did, because this information
> is not consistent.

Thank you for your reply
Sorry, maybe my english is a bit confusing. I'll try again.

1> I made a partition /dev/sde1 with Linux LVM
2> Run a "pvcreate /dev/sde1"
3> Run "vgextend vgftp /dev/sd1"
4> Run "lvextend -L+400G /dev/vgftp/lvftp"
5> Run "umount /dev/vgftp/lvftp"
6> Run "e2fsck -f /dev/vgftp/lvftp"
7> Run "resize2fs /dev/vgftp/lvftp"
    resize2fs 1.41.10 (10-Feb-2009)
    Resizing the filesystem on /dev/vgftp/lvftp to 1115800576 (4k) blocks
8> Here it all hangs. I cant do anything with the filesystem or LVM. every 
command i do hangs.
     I edited fstab so my LVM is not remounted on reboot, and rebooted.
     Here I am right now.

I can run LVM commands fine now after the reboot and the output from 
pvdisplay and lvdisplay is like i posted earlier.
How can i revert this in a safe way? I was thinking of just removing the PV 
and do a vgcfgrestore to "before" the lvextend.
But since lvdisplay says the volume is 4.16TiB and pvdisplay says 5.59TiB 
something is wrong? Or am I missing something?

I tried a " vgreduce vgftp /dev/sde1" to remove my new drive again, but this 
only gives me an error "Physical volume "/dev/sde1" still in use"
I think this is strange because the pvdisplay seems to think i have not yet 
added the PV but pvdisplay does.
If i do a lvreduce i fear something will break.

Is it better to do a e2fsck now?

Thank you for your help

>
>> If I can revert the adding of the new drive, I planned on
>> trying to vgcfgrestore to an archived config from before I added the
>> drive and did the lvextend and resize2fs.
>
> Indeed you could "undo" the vgextend and lvextend via vgcfgrestore,
> or via lvreduce + vgreduce, but first you probably need to undo
> resize2fs.  Use fsck to get the filesystem consistent, if possible.
> Then resize it back to the old smaller size.  At this point you
> can move forward by using lvextend, then resize2fs. You could also
> move backward from that point with lvreduce and vgreduce.
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
> On Tue, 29 Mar 2011 17:21:55 +0200
> "Fredrik Skog" <fredrik.skog@rodang.se> wrote:
>
>> Hello,
>>
>> While adding a new disk to my LV i ended up with a crash during the
>> resize2fs. Now I have LVM reporting different sizes for my VG and LV.
>> How do I fix this?
>>
>> I tried to do a "vgreduce vgftp /dev/sde1" to remove my new drive
>> again. This only gives me an error "Physical volume "/dev/sde1" still
>> in use" If I can revert the adding of the new drive, I planned on
>> trying to vgcfgrestore to an archived config from before I added the
>> drive and did the lvextend and resize2fs. Is this a good way of
>> solving the problem? I guess it's not possible to lvreduce the LV by
>> the same amount i did lvextend it before, because the system still
>> thinks the LV is the old size. I just want to get rid of the PV i
>> added to the VG
>>
>> I'm a bit confused on how to do this.
>>
>> # vgdisplay
>>   --- Volume group ---
>>   VG Name               vgftp
>>   System ID
>>   Format                lvm2
>>   Metadata Areas        13
>>   Metadata Sequence No  67
>>   VG Access             read/write
>>   VG Status             resizable
>>   MAX LV                0
>>   Cur LV                1
>>   Open LV               0
>>   Max PV                0
>>   Cur PV                12
>>   Act PV                12
>>   VG Size               5.59 TiB
>>   PE Size               4.00 MiB
>>   Total PE              1464180
>>   Alloc PE / Size       1089649 / 4.16 TiB
>>   Free  PE / Size       374531 / 1.43 TiB
>>   VG UUID               kOApX5-oTeV-cPWr-h41J-NxML-sbbj-WcKObC
>>
>>  # lvdisplay
>>   --- Logical volume ---
>>   LV Name                /dev/vgftp/lvftp
>>   VG Name                vgftp
>>   LV UUID                l4EWSh-GOfD-n0Sx-7ZSG-RTVi-p7fC-ApyHZS
>>   LV Write Access        read/write
>>   LV Status              NOT available
>>   LV Size                4.16 TiB
>>   Current LE             1089649
>>   Segments               14
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>

Thanks
 /Fredrik Skog 
