Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k25JHi114577
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 14:17:44 -0500
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k25JHbFq016152
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 14:17:37 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 61C591B8D
	for <linux-lvm@redhat.com>; Sun,  5 Mar 2006 14:17:31 -0500 (EST)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 26672-16 for <linux-lvm@redhat.com>;
	Sun,  5 Mar 2006 14:17:21 -0500 (EST)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id DB4B21B8C
	for <linux-lvm@redhat.com>; Sun,  5 Mar 2006 14:17:21 -0500 (EST)
Message-ID: <440B394A.2050100@volved.com>
Date: Sun, 05 Mar 2006 14:17:30 -0500
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] New disk; 	"Couldn't find uuid" after successful
	pvcreate&vgextend
References: <440AECFD.5070305@volved.com>
	<p06230912c030abc0c35d@[128.83.162.209]>
	<440B244B.6000606@volved.com>
In-Reply-To: <440B244B.6000606@volved.com>
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

After the below error-free commands, I went ahead and ran 'vgextend' and 
then 'lvextend' without any 'vgscan' tests in between, and the whole 
system is fine now, 'xfs_grow' went off problem free as well.

Very odd. Are there caveats about when to run 'vgscan' maybe?

Thanks for the response James,
-Barnaby



Barnaby Claydon wrote:
> # pvcreate -v /dev/hdc
>    Set up physical volume for "/dev/hdc" with 390721584 available sectors
>    Zeroing start of device /dev/hdc
>  Physical volume "/dev/hdc" successfully created
>
>
> # pvdisplay -v /dev/hdc
>    Using physical volume(s) on command line
>  --- NEW Physical volume ---
>  PV Name               /dev/hdc
>  VG Name
>  PV Size               186.31 GB
>  Allocatable           NO
>  PE Size (KByte)       0
>  Total PE              0
>  Free PE               0
>  Allocated PE          0
>  PV UUID               xacykK-MXPT-2yO0-qf2R-TBTU-VJb5-vVYw4Q
>
>
> I haven't tried vgextend again since running badblocks - it looks like 
> the drive is fine though:
>
> # badblocks -svw /dev/hdc
> Checking for bad blocks in read-write mode
> From block 0 to 195360984
> Testing with pattern 0xaa: done                        984
> Reading and comparing: done                        984
> Testing with pattern 0x55: done                        984
> Reading and comparing: done                        984
> Testing with pattern 0xff: done                        984
> Reading and comparing: done                        984
> Testing with pattern 0x00: done                        984
> Reading and comparing: done                        984
> Pass completed, 0 bad blocks found.
>
>
>
>
>
>
> James Hammett wrote:
>> What do you get when you try pvdisplay?
>>
>> James
>>
>>> Hi all,
>>>
>>> I've been successfully running LVM2 (2.01.04) on Debian Sarge 
>>> (2.6.8-2-686) for months.
>>>
>>> As I've done many times before, I added a new disk yesterday. I 
>>> successfully ran the following, both without error:
>>>
>>> pvcreate -v /dev/hdc
>>> and
>>> vgextend -v mono_media /dev/hdc
>>>
>>> As standard practice to make sure everything was ok, I then ran:
>>>
>>> vgscan -v
>>>
>>> At this point I got several references to "Couldn't find uuid..." 
>>> repeated with the same uuid several times. At this point it seemed 
>>> logical to back-out my changes, so I tried to run the following:
>>>
>>> vgreduce -v mono_media /dev/hdc
>>>
>>> Unfortunately this gave the same "Couldn't find uuid..." errors as 
>>> 'vgscan'. As it seemed somewhat logical, I tried running the same 
>>> 'pvcreate' command, again without error:
>>>
>>> pvcreate -v /dev/hdc
>>>
>>> After 'pvcreate' had finished, I was THEN able to run 'vgreduce' and 
>>> restore my 'mono_media' VG to working order.
>>>
>>> At this point I was a bit baffled, running 'lvmdiskscan' after the 
>>> initial 'pvcreate' shows the disk as present, but if I reboot after 
>>> just that first 'pvcreate' step and run 'lvmdisksacn' after the 
>>> reboot, /dev/hdc isn't shown.
>>>
>>> To rule-out a hardware problem I successfully ran 'mkfs.ext3 
>>> /dev/hdc' and was able to mount and navigate the volume without 
>>> errors. Last night I also left 'badblocks -svw /dev/hdc' running 
>>> which is almost complete and hasn't found any errors yet.
>>>
>>> I will reply with full command output once 'badblocks' has finished, 
>>> but I hope this brief synopsis makes sense.
>>>
>>> Thanks everyone!
>>> -Barnaby
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>
>
