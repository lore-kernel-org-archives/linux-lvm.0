Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4GA9G018519
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 06:09:16 -0400
Received: from shoenix.net (shoenix.xs4all.nl [213.84.65.61])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4GA9E2W021751
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 06:09:15 -0400
Received: (from amavis@localhost) by shoenix.net (/8.12.2) id i4GA9Fep016647
	for linux-lvm@redhat.com; Sun, 16 May 2004 12:09:15 +0200
Received: from osp.nl (localhost [127.0.0.1])
	by shoenix.net (/8.12.2) with ESMTP id i4GA9EhW016621
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 12:09:14 +0200
Message-ID: <40A73771.2030604@osp.nl>
Date: Sun, 16 May 2004 11:42:09 +0200
From: Martijn Schoemaker <martijn@osp.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /boot on lvm?
References: <40A72846.5050801@mlug.missouri.edu>
	<20040516084236.GB8872@percy.comedia.it>
In-Reply-To: <20040516084236.GB8872@percy.comedia.it>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hehehe the eternal discussion :)

Well, I just don't have the guts to put /boot in LVM so I just
put it on a 'md' device. Do boot managers like Lilo and Grub
cope with LVM ? I know Lilo does cope with md since it will
put the boot block on both physical drives when installing. And
how does it work when the bios needs to reference the boot image
which is in an LVM volume ? Does this work at all ? I just
never tried, but I am curious :)

And swap in LVM seems fine to me too. You should only keep
performance in mind. On the other hand, with the fast disks
nowadays I don't think you'll have any problems with normal
usage.

I also put my root in LVM, and this works great. Only thing is
that you might have some problems when migrating to newer LVM
versions, but it is do-able. Having your root in a resizable
volume has many advantages I think.

Just my few cents,
Martijn

Luca Berra wrote:
> On Sun, May 16, 2004 at 01:37:26AM -0700, Michael wrote:
> 
>> Is it okay to put everything, including /boot and other critical Linux 
>> files on an LVM drive? How about swap space?
> 
> i don't have any problem with this kind of setup, but you will find many
> people here that will say just the opposite.
> 
> L.
> 

-- 
There's someone in my head, but it's not me.
--- Pink Floyd
