Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6IG4aV19320
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 12:04:36 -0400
Received: from server193.fourx.de (server193-fourx.de [81.169.177.193])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6IG4ZTY002023
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 12:04:35 -0400
Received: from [192.168.1.100] (e178126179.adsl.alicedsl.de [85.178.126.179])
	by server193.fourx.de (Postfix) with ESMTP id F2A535EC0FB
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 18:04:20 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v733)
In-Reply-To: <42DBCC8A.1070000@berbee.com>
References: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
	<42DBCC8A.1070000@berbee.com>
Message-Id: <9372D58F-F175-4461-9F61-CAB3DE767861@kitchhiking.org>
Content-Transfer-Encoding: 7bit
From: "kitchhiking.org" <admin@kitchhiking.org>
Subject: Re: [linux-lvm] lvm lost after reboot !? how to recover UUID?
Date: Mon, 18 Jul 2005 18:05:44 +0200
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alan,

first of all thx for the quick response.

I already checked for the physical presence and function of the  
disks, also checked SMART parameters with
smartctl -> everything is fine.

I changed nothing to the installed system. No new kernel, nothing.

devfs was enabled already before.

pvdisplay/vgdisplay didn't find anything (see my previous post).

vgchange -a y can't find a VG, too.

I have absolutely no clue what happened. I already thought maybe  
there were still some filesystem writes cached
and non flushed, when I rebooted but that would be really strange...

Any more ideas?

Regards,
Constantin

Am 18.07.2005 um 17:36 schrieb Alan Jurgensen:

> First figure out if your disks are there:   dmesg|grep [sh]d
> Check for partitions:   fdisk -l
> then see whether LVM stuff is there:  pvscan ; vgscan
> Look at your distro's boot-up process.... maybe you installed a new  
> kernel and forgot to include the initrd that activates the VGs  
> (via:   vgchange -a y)
> Or maybe you enabled devfs or something, and the discs now show up  
> with a different device path.
