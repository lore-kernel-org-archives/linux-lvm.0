Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4D8HdlW007999
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 04:17:39 -0400
Received: from amsfep15-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4D8HUah010344
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 04:17:31 -0400
Message-ID: <4465967E.6090206@neuroweave.nl>
Date: Sat, 13 May 2006 10:19:10 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl>
	<44647CA0.3010509@redhat.com>	<4464A0BE.7070509@neuroweave.nl>
	<4464A274.3090808@gmx.net>	<44650B76.6070604@neuroweave.nl>
	<1147484968.7783.12.camel@localhost.localdomain>
In-Reply-To: <1147484968.7783.12.camel@localhost.localdomain>
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
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>

Ming Zhang wrote:

>On Sat, 2006-05-13 at 00:25 +0200, Joep Blom wrote:
>  
>
>>Klaus Strebel wrote:
>>
>>    
>>
>>>Hi Joep,
>>>
>>>well, what Patrick meant is, that your system (forget that USB drive in
>>>this moment) already has a VG called VolGroup00 on your internal disk.
>>>The modern FC distros use it as default (i think, i'm using SuSE ;-) ).
>>>Before messing up more using fdisk, just provide us with the output of a
>>>vgdisplay -a ;-) get an impression of the 'disaster' :-).
>>>
>>>Btw. the volume group your wanted to create has the name VG0, not
>>>VolGroup00 ;-) ..
>>>
>>>Ciao
>>>Klaus
>>>
>>> 
>>>
>>>      
>>>
>>Klaus & Pattrick,
>>I'm sorry I asked the wrong question (stupid me!). I interpreted the 
>>output of vgcreate wrongly. Yes, Klaus, the VolGroup00 was automatically 
>>created by FC when I did an upgrade.
>>The correct question is that VG01 (the name I gave it) occupies 232.88 
>>Gb although I had asked for 250 Gb. Where are the 17.2 GB and can I add 
>>    
>>
>
>
>when u buy the disk, vendor count it as 250GB or 250 * 1000 * 1000 *
>1000 bytes.
>
>when LVM count it, it is 250 * 1000 * 1000 * 1000 / 1024 / 1024/ 1024 =
>232.83GB.
>
>check online, many discussion about this 1024 and 1000 issue.
>
>
>  
>
>>them to VG01.
>>When I look with fdisk it says that no information is available for 
>>/dev/sda1 and "invalid flag 0x0000 of partition table 4 will be 
>>corrected by w(rite)".
>>I assume that all problems have arisen due to the fact that I did a 
>>pvcreate on a disk which has a W95 FAT32 partition ( of 250 Gb).
>>I assume the best way is to delete the partition completely and create a 
>>new partition (with parted or fdisk?) or are there better methods? Do I 
>>have to remove VG01 first?
>>Please, be lenient to me for these basic questions.
>>Joep
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
Ah, Ming,
Thanks! That solves it!.
So I don't have to remove the already created pv. Only fdisk complains 
because when I do an "fdisk /dev/sda" it sees it still as a FAT32 
partition but when I do an "fdisk /dev/sda1" it correctly sees it as a 
partition which is virtually free but with the invalid flag in partition 
table 4. As I use it as a backup disk I don't have to boot from it but 
is a logical volume bootable?
One last question: Why can't  I use "pvcreate /dev/sda" but have to use 
"pvcreate /dev/sda1" (as the LV HOW-TO stated the former).
Hope you can help me out with this as well.
Joep
