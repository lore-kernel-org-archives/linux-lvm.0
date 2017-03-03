Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CABC92D5D4
	for <linux-lvm@redhat.com>; Fri,  3 Mar 2017 18:08:09 +0000 (UTC)
Received: from hathor.ankh.org (hathor.ankh.org [149.255.109.145])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE66B635F0
	for <linux-lvm@redhat.com>; Fri,  3 Mar 2017 18:08:07 +0000 (UTC)
Received: from apple.ocado.com ([91.206.0.43] helo=[10.252.24.87])
	by hathor.ankh.org with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.82) (envelope-from <oolon@ankh.org>) id 1cjrKO-0003d0-5U
	for linux-lvm@redhat.com; Fri, 03 Mar 2017 17:49:16 +0000
References: <CAJWdRQgunTFRS7fmHYTDw1MA7bPCQk+1TAD_q1dq4L2qog_rTA@mail.gmail.com>
From: James Hawtin <oolon@ankh.org>
Message-ID: <d6e53b4c-25df-28e1-b7c4-f22fec3b2da3@ankh.org>
Date: Fri, 3 Mar 2017 17:49:10 +0000
MIME-Version: 1.0
In-Reply-To: <CAJWdRQgunTFRS7fmHYTDw1MA7bPCQk+1TAD_q1dq4L2qog_rTA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Changing from standard partition to LVM partition
 without reinstalling
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 03/03/17 09:51, Amjad Syed wrote:
> Hello,
>
> We are using  RHEL  7.2 servers to create two node  Active/Passive 
>  High available system with shared storage (SAN). We are using pacemaker.
>
> The existing  Partition on HDD of  Server is of standard type and  we 
> would like to move it to LVM type as we have just two nodes and we are 
> not going to use clvm.
>
> The current partition on HDD is as follows
> /   ->  50 GB
> swap -> 25 GB
> /u01 -> 200GB
>
> What is the best way to change the partition type to LVM without 
> reinstallation?
>
Its possible but its quite difficult to do as you don't have a seperate 
/boot partion. I don't know if RHEL 7.2 has an LVM aware grub. Moving it 
to LVM would require a new initrd which can cause lots of problems. If I 
was doing it I would use tar or dump to copy the information off the 
disk. Repartition it with LVM with a physical partiton for /boot, do 
some fiddling with a boot disk to sort the boot out then it done. That 
is alot of work for very little gain IMHO, so I would question why you 
want to convert this to LVM are you looking to reclaim space from / to 
use elseware? Is you swap space far to big and you with to use that space?

Personally I would add a temporary new disk to the system create an LVM 
PV on that create a VG/LV for /u01 and format it and copy the data from 
/u01. The I would delete the existing swap and /u01 partitions. Create a 
new partition using all the free space on the old disk as and LVM PV, 
add it to the VG, the use pvmove to move the data back from the tempory 
disk back to the main one. If I wished to steal some space from / I 
would create a filesystem based swap file on / or just create a smaller 
swap from the lvm. This all has the advantage that you don't have to fix 
the boot, saving a lot of effort, and redoing an initrd from a boot disc 
is not something to be done by the inexperienced. However this would 
just require making new filesystems and copying data.

James
