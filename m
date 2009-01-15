Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0FAxoiG019694
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 05:59:51 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n0FAxnTf023331
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 05:59:49 -0500
Message-ID: <496F1706.3080403@redhat.com>
Date: Thu, 15 Jan 2009 10:59:18 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can no longer mount logical volume after a kernal
	panic. HELP!
References: <BLU117-W51CBAE0430A271DF3DC52FFAD70@phx.gbl>
In-Reply-To: <BLU117-W51CBAE0430A271DF3DC52FFAD70@phx.gbl>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Bob Smith wrote:
> 
> I have been using LVM for quite a while to create a 3.64 stripe out of 4 x 1TB drives.  I use this as storage for my MythTV.  Tonight my system had a kernel panic, and when I rebooted I was no longer able to mount my LV, when I do I get:
> 
> ----------------------------------------------------------------------------------------------------------------------------------------------
> mount: wrong fs type, bad option, bad superblock on /dev/mapper/stripe-raid,
>        missing codepage or helper program, or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so

Did anything appear in dmesg? What does "file -s 
/dev/mapper/stripe-raid" say?

> When I do an fdisk -l /dev/stripe/raid (I know these are really dumb names for the lv and vg):

Why are you expecting there to be a partition table on the LV? That's 
something that you'd only normally do if you're using the LV as "whole 
disk" storage for an entire machine (e.g. exporting it via iSCSI or 
using it as storage for some kind of virtual machine).

Normally with LVM, file systems go directly onto the LV.

> Which makes me really worried that something has happened to the partition table when I was forced to reboot after the kernel panic.  Doing fdisk /dev/stripe/raid shows:

See above - I wouldn't normally expect there to be a partition table 
*inside* the LV.

Regards,
Bryn.
