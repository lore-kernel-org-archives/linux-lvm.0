Received: from alatyr.brq.redhat.com (vpn1-4-12.ams2.redhat.com [10.36.4.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id s0G64ijC030181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Jan 2014 01:04:46 -0500
Message-ID: <52D7767C.6060706@redhat.com>
Date: Thu, 16 Jan 2014 07:04:44 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>
In-Reply-To: <87zjmxzmga.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 01/15/2014 09:19 AM, Marius Vollmer wrote:
>  # ls /dev/mapper/TEST-*
>  /dev/mapper/TEST-pool        /dev/mapper/TEST-pool_tmeta  /dev/mapper/TEST-thin
>  /dev/mapper/TEST-pool_tdata  /dev/mapper/TEST-pool-tpool
> 
> How can a program tell that only /dev/mapper/TEST-thin can really be
> used as a block device, and the rest should be ignored?
> 
> Is there a way to do this by looking at "udevadm info", for example?
> 
> (What seems to work is skipping all nodes that have
> DM_UDEV_IGNORE_DISK_RULES_FLAG set to true.  Is this maybe even
> documented somewhere?)

Those flags were primarily targeted to direct udev processing.
But it could be used as DM_UDEV_DISABLE_DISK_RULES_FLAG should
be always set for internal devices...

This flag actually means that udev should skip scanning the device
for metadata and it should skip creating any symlinks in /dev/disk
directory - which is a directory with symlink names based on metadata
found (e.g. filesystem uuid, subsystem names etc.).

However, for your purpose, I'd better use DM_UDEV_DISABLE_OTHER_RULES_FLAG
which just tells that everything else other than DM/LVM related should
skip this device.

For now, these flags are only documented directly in libdevmapper.h
(as they were only meant to direct udev rules and these situations
were all audited directly by communicating with other teams).
I could probably add a few lines to the man page directly though as
others could use this even when reading udev database...

Anyway, the most important rule for avoiding internal devices and
using the right ones is to follow /dev/<vgname>/<lvname> existence,
as already said in this thread. 

-- 
Peter
