Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iAJJuFiX008613
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:56:15 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CVErf-0007DJ-3X
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 19:56:15 +0000
Date: Fri, 19 Nov 2004 19:56:15 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] device mapper Q
Message-ID: <20041119195615.GV24229@agk.surrey.redhat.com>
References: <419E4A7F.9000802@conterra.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <419E4A7F.9000802@conterra.de>
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

On Fri, Nov 19, 2004 at 08:33:19PM +0100, Dieter Stueken wrote:
> Q: For any reason I'm missing
> one of these link. Should I create it by hand?

vgmknodes fixes things

Boot-up scripts should include vgscan --mknodes.

LVM2 will be updated at some point to recognise /dev/mapper/vg-lv
names on the command line, but it doesn't yet - you must always
use vg/lv.

dm-<minor_number> in sysfs/block is something I have no time for
but seems pretty harmless.

But /dev/dm* sounds quite unnecessary.

devfs puts things into /dev/mapper automatically: udev should
be configured to do the same - but it seems it can't because
that would mean userspace call outs running scripts at critical 
times when they are not permitted to block (e.g. must not allocate 
any memory) or else could lock up the whole machine.
So everything should use libdevmapper (or equivalent), often
via dmsetup, to keep /dev/mapper up-to-date.

Alasdair
-- 
agk@redhat.com
