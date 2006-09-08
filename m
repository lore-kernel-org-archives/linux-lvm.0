Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88AhR3C010307
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 06:43:27 -0400
Received: from mail.ambra.ro (mail1.ambra.ro [86.107.248.1])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k88AhIG4028335
	for <linux-lvm@redhat.com>; Fri, 8 Sep 2006 06:43:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ambra.ro (Postfix) with ESMTP id 4A66E75F48
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 13:40:25 +0300 (EEST)
Received: from mail.ambra.ro ([127.0.0.1])
	by localhost (mail68 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 21318-05 for <linux-lvm@redhat.com>;
	Fri,  8 Sep 2006 13:40:23 +0300 (EEST)
Received: from [127.0.0.1] (ppp901058647.ambra.ro [86.105.90.47])
	by mail.ambra.ro (Postfix) with ESMTP id E0C0075F28
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2006 13:40:22 +0300 (EEST)
Message-ID: <4501491E.90103@ambra.ro>
Date: Fri, 08 Sep 2006 13:42:38 +0300
From: Sterpu Victor <victor@ambra.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on centos with raid1 and grub
References: <45012C0E.9080509@ambra.ro>
In-Reply-To: <45012C0E.9080509@ambra.ro>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I do need a fast answer if possible.
So the quick question is "How can I mount a LVM partition, made on a 
RAID partition on another computer?"
Thank you.

Sterpu Victor wrote:

> After a reboot I couldn't boot from none of my hdd's.
> I receive just a grub console. Now I must reinstall grub, but in order 
> to do this I need to know the name of the root partion in the LVM.
> To find out this I moved one of the hdd's in another computer and I 
> tried to mount the LVM partition.
>
> I do "modprobe dm-mod" and when I do "vgchange -ay" I get the message:
>  File descriptor 3 left open
>  File descriptor 5 left open
>  File descriptor 7 left open
>  No volume groups found
> I have no LVM devices in /dev.
> The alternative is to reinstall the OS, but....
>
> Thank you.
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
