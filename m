Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2VFnEJh020842
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 16:49:14 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.30)
	id 1B8hxr-0001jm-IL
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 16:49:15 +0100
Date: Wed, 31 Mar 2004 16:49:15 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] lvm 1 unable to boot
Message-ID: <20040331154915.GD27360@tykepenguin.com>
References: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>
Sender: Patrick <patrick@tykepenguin.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 31, 2004 at 03:59:39PM +0100, Geoff Dolman wrote:
> Hi
> 
> I have a machine with the following partition structure:
> 
> /dev/sda1 /boot (ext3)
> /dev/sda2 swap
> /dev/sda3 LVM
> 
> The LVM (1.03/rh9) contains one PV and this has Volume00 in it which
> contains lvs for slash, usr, var, /usr/local and so on...
> 
> I rebooted the machine for the first time in ages (same kernel
> configuration as the last reboot and no changes - or very few).
> 
> The machine won't reboot - it panics because of a message (something)
> like:
> 
> vgscan found inactive "Volume00"
> Error 28 Unable to make /etc/lvmtab.d/Volume00/Volume00.tmp
> vg_cfgbackup.c line 273
> 

Error 28 is ENOSPC - your initrd is too small to hold the metadata backups.
-- 

patrick
