Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TLGeqN030020
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 17:16:40 -0400
Received: from swlx166.swmed.edu (swlx166.swmed.edu [199.165.152.166])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7TLGWXp028077
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 17:16:32 -0400
Received: from peters.swmed.org ([129.112.118.137])
	by swlx166.swmed.edu with esmtp (Exim 4.44) id 1GIAwc-0002tT-F2
	for linux-lvm@redhat.com; Tue, 29 Aug 2006 16:16:27 -0500
Message-ID: <44F4AEAA.808@utsouthwestern.edu>
Date: Tue, 29 Aug 2006 16:16:26 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <001f01c6cbae$74be1480$0a00000a@thomas>
In-Reply-To: <001f01c6cbae$74be1480$0a00000a@thomas>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Ran vgreduce --missing to remove broken disk,	am
	I screwed?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thomas Novin wrote:

>>I had a disk that stopped working. After booting I could see with
>>pvdisplay
>>that the disk was missing. After reading everything I could find via
>>google
>>I thought that you were supposed to run 'vgreduce --remove-missing
>>volgrp0'
>>to remove the missing disk from the group.
>>
>>After this the volume group looks OK but the entire logical volume got
>>removed! Am I screwed now or is there any way to salvage the data which is
>>on the remaining three disks?
>>    
>>
>
>Please someone answer this, is there any solution to this problem? To
>clarify:
>
>- Disk failure
>- Ran 'vgreduce --remove-missing volgrp0' (probably not such a good idea)
>- /dev/volgrp0/ emtpy. 'lvdisplay' doesn't show anything.
>
>So, can I somehow restore my logical volume? The three other physical
>disks/partitions are intact.
>
>Thanks in advance,
>
>Thomas Novin
>  
>

You will probably be able to restore your config from a backup. Look in 
/etc/lvmconf . Or, look for files that may be backups of your 
configuration. You should be able to do some sort of vgcfgrestore 
command using a previous conf and get back to, at least, where you were 
before doing the remove.

Peter
