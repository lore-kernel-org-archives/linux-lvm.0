Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2VKxuj12311
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 15:59:56 -0500
Received: from gatekeeper.osp.nl ([193.78.233.1])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2VKxr1X012401
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 15:59:54 -0500
Received: (from amavis@localhost)
	by gatekeeper.osp.nl (8.12.2+patch/8.12.2) id i2VKxlif014046
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 22:59:47 +0200
Received: from osp.nl (localhost.osp.nl [127.0.0.1])
	by gatekeeper.osp.nl (8.12.2+patch/8.12.2) with ESMTP id i2VKxkgh013951
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 22:59:46 +0200
Message-ID: <406B259C.9000001@osp.nl>
Date: Wed, 31 Mar 2004 22:10:04 +0200
From: Martijn Schoemaker <martijn@osp.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm 1 unable to boot
References: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>	<20040331154915.GD27360@tykepenguin.com>
	<1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>
In-Reply-To: <1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>
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

Hi,

You can set this as an 'append ramdisksize=<size>' in your
lilo/bootloader config, but this does not always seem to
work. Best way seems to increase this number in the kernel,
but this means you need to build a new kernel first, and for
that, well, you need to be able to boot :)

Don't know much about GRUB, but the append option seems the
best solution for you.

Cheers,
Martijn

Geoff Dolman wrote:
> On Wed, 2004-03-31 at 16:49, Patrick Caulfield wrote:
> 
>>On Wed, Mar 31, 2004 at 03:59:39PM +0100, Geoff Dolman wrote:
>>
>>>Hi
>>>
>>>I have a machine with the following partition structure:
>>>
>>>/dev/sda1 /boot (ext3)
>>>/dev/sda2 swap
>>>/dev/sda3 LVM
>>>
>>>The LVM (1.03/rh9) contains one PV and this has Volume00 in it which
>>>contains lvs for slash, usr, var, /usr/local and so on...
>>>
>>>I rebooted the machine for the first time in ages (same kernel
>>>configuration as the last reboot and no changes - or very few).
>>>
>>>The machine won't reboot - it panics because of a message (something)
>>>like:
>>>
>>>vgscan found inactive "Volume00"
>>>Error 28 Unable to make /etc/lvmtab.d/Volume00/Volume00.tmp
>>>vg_cfgbackup.c line 273
>>>
>>
>>Error 28 is ENOSPC - your initrd is too small to hold the metadata backups.
> 
> 
> Thanks - but how do I fix this?
> 
> cheers
> 
> Geoff
> 

-- 
There's someone in my head, but it's not me.
--- Pink Floyd
