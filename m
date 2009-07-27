Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R0pIDm006742
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 20:51:18 -0400
Received: from eastrmmtao107.cox.net (eastrmmtao107.cox.net [68.230.240.59])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6R0o9Qu018898
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 20:50:10 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090727005009.QYBD4885.eastrmmtao107.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 20:50:09 -0400
Message-ID: <4A6CF9C0.6020902@cox.net>
Date: Sun, 26 Jul 2009 19:50:08 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 confused about double UUID
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
In-Reply-To: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
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

On 2009-07-26 19:21, Christian Kujau wrote:
> The subject says LVM is confused, but maybe it's me who is confused:
> 
> I once had a PV made from a single /dev/sdb and all was well. This sdb 
> however was really a 2 disk RAID1 which is now split up, the system now 
> sees both disks, sdb and sdc. Of course, sdb and sdc still have the same 
> UUID:

How did you split the mirrorset?


> # blkid  | egrep 'sd[bc]'
> /dev/sdb1: UUID="1O2Tkq-9Jy8-VfuZ-uzFh-1f6v-iVBD-hcK6Vq" TYPE="lvm2pv" 
> /dev/sdc1: UUID="1O2Tkq-9Jy8-VfuZ-uzFh-1f6v-iVBD-hcK6Vq" TYPE="lvm2pv"
> 
> I decided to continue to use the VG that was set up on the PV, but since 
> lvm comlained[0] about finding the same UUID on more than one device, I 
> tried to instruct lvm to just use sdb for the VG:

Did you reformat sdc before reusing it?  (That should give it a new 
UUID.)

> # grep filter /etc/lvm/lvm.conf | grep -v \#
>    filter = [ "r|^/dev/sdc1$|", "r|/dev/.*/by-path/.*|", \
>               "r|/dev/.*/by-id/.*|", "a/.*/" ]
> 
> Now everything looks fine, no more lvm warnings, vg02 seems to use sdb1, 
> exactly as I wanted:
> 
> # pvs
>   PV         VG   Fmt  Attr PSize   PFree  
>   /dev/sda2  vg01 lvm2 a-   111.67G   9.27G
>   /dev/sdb1  vg02 lvm2 a-   931.46G 137.46G
> 
> 
> But when I access vg02, I can clearly see I/O to/from sdc! I'd really like 
> to use sdc for something else now that sdb is used for vg02, but I'm afraid to 
> do something to sdc, as it still being used - although I don't know why.
> 
> Any ideas?
> 
> Christian.
> 
> # lvm version
>   LVM version:     2.02.26 (2007-06-15)
>   Library version: 1.02.20 (2007-06-15)
>   Driver version:  4.12.0
> # uname -r
> 2.6.24-24-xen                      <-- Ubuntu/8.04

Shouldn't you be asking the Ubuntu forum?

> 
> [0] e.g.
>    Found duplicate PV 1O2Tkq9Jy8VfuZuzFh1f6viVBDhcK6Vq: using 
>    /dev/disk/by-path/pci-fw1.1-scsi-0:0:0:1-part1 not /dev/sdb1


-- 
Scooty Puff, Sr
The Doom-Bringer
