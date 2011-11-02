Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA2Dbq77023701
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 09:37:52 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2Dbomv029327
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 09:37:51 -0400
Message-ID: <4EB147A4.4070805@ankh.org>
Date: Wed, 02 Nov 2011 13:37:40 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>	<4EB1190A.30501@ankh.org>
	<581100587.20111102124129@marki-online.net>
In-Reply-To: <581100587.20111102124129@marki-online.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a
 Logical	Volume Group ?
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
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>

Marek Podmaka wrote:
> Hello,
>
> Wednesday, November 2, 2011, 11:18:50, James Hawtin wrote:
>
>   
>> Personally even with LVM I would still write a partition table the disk,
>> this helps show the disk as being used to other system administrators,
>> however there would be one partition on it of type 8e, and on that I 
>> would create a PV (physical volume), this PV can then be used to create
>>     
>
> How do you extend the PV then? For example extend the LUN on storage
> or just resize a RAID1+0 set by adding 2 new disks... Resizing the
> block device is no problem, resizing the PV also, but to resize the
> PV, you need to resize the partition also - and if I remember well,
> the kernel won't re-read the new partition table while it is used...
>
>
>   
I never have need to extend a PV, I just add a new piece of disk (LUN) 
to the server, create a PV on that and extend the volume group and LV. 
There is pvresize if you really  want to extend an lun, that could be 
used after making the disk larger or fdisking more space, however I 
never have need to do that, I pretty much always present a new lun. You 
can also create a second partition on a larged disk and then create a PV 
on that too... LVM is designed to join all your bits of disk together, 
so you don't have to need one continue peice of space to provide the disk.

Using pvmove I can allocate a larger new piece of disk and online move 
all the data from an old pv to a new one as well. In my experence with 
working with large san system rays are not in general extended, whole 
new ones are added instead. Personally I would not extend and existing 
array with an additional mirror concat, I would prefer to use raid 10 or 
use software striping in LVM with seperately presented LUNs for each 
mirrored pair as that would work the disk harder.

James
