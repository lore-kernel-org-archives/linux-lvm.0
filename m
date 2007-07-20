Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6K0ehHR012766
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 20:40:43 -0400
Received: from vms044pub.verizon.net (vms044pub.verizon.net [206.46.252.44])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6K0eg3p006478
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 20:40:42 -0400
Received: from [192.168.2.102] ([71.100.89.137])
	by vms044.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0JLG0012PCJI0RB9@vms044.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 19 Jul 2007 19:40:30 -0500 (CDT)
Date: Thu, 19 Jul 2007 20:40:29 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] extending raw partition and logical partition
In-reply-to: <469FFECE.5020903@verizon.net>
Message-id: <46A0047D.1050402@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <469FFECE.5020903@verizon.net>
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

Nevermind.
pvresize /dev/sda2  did the trick.  (I'm not working with LVM tools 
everyday so you forget some of these things :-\ )


Gerry Reno wrote:
> I have 3 disk physical partitions:
> /dev/sda1
> /dev/sda2
> /dev/sda3
>
> VolGroup02 uses physical volume /dev/sda2.
> I needed some more space on my logical partition 
> /dev/VolGroup02/LogVol00 (only LV in Group) so I went ahead and 
> deleted /dev/sda3 which left a bunch of free space.  So then I went 
> into fdisk and removed /dev/sda2 and recreated it with the same 
> starting cyl and made the new end cyl the same as the old /dev/sda3 so 
> I should have all the space in both the old partitions.  Rebooted, 
> checked fdisk -l and sure enough it had all the space.  But now when I 
> do a vgdisplay I still don't see any FREE PE.  It shows exactly the 
> same as before I expanded the physical partition.  So how can I expand 
> the LV if there is no FREE PE?
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
