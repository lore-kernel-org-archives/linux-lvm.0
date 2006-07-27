Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RC315O025257
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 08:03:01 -0400
Received: from dot.freshdot.net
	(IDENT:1598613e6c5f4b34290479e1f770f539@dot.freshdot.net
	[80.69.73.239])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6RC2u5e010040
	for <linux-lvm@redhat.com>; Thu, 27 Jul 2006 08:02:58 -0400
Received: from ssmeenk by dot.freshdot.net with local (Exim 4.62)
	(envelope-from <ssm+lvm@freshdot.net>) id 1G64Zm-0004yS-5r
	for linux-lvm@redhat.com; Thu, 27 Jul 2006 14:02:50 +0200
Date: Thu, 27 Jul 2006 14:02:50 +0200
From: Sander Smeenk <ssm+lvm@freshdot.net>
Message-ID: <20060727120250.GB17454@freshdot.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Performance impact of LVM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello list!

I've recently subscribed here as i have some questions about LVM,
particularly the performance impact of LVM on disk IO.

I'm a happy LVM user, on my workstation at home i've used it for a long
time. No special setups or anything, but it's nice to be able to resize
partitions on the fly, or have a number of disks act as one huge disk...

So, when I had to reinstall all servers for the company I work for, i
decided to use LVM for the same reasons stated above. But now i wonder:
Does LVM have any impact on disk IO? Are there any tests done on this
subject?

I couldn't really find any on the internet. Most of the things you find
are implementation issues and 'how does it work' stuff ;-)

I'm running LVM2 (2.02.06) on Debian 'sid' (unstable, but i hate that word)
using linux kernels 2.6.17.xx.

For example, one of my servers has 4x 34gb SCSI disks and 2x IDE disks.
One of the IDE disks has a 250MB boot partition, the rest is LVM
partition, the other IDE disk has one big LVM partition, same goes for
the 4 SCSI disks.

Then i made a scsi_vg01, with all the scsi disks and a ide_vg01 with all
the ide disks, and started lvcreating "partitions" inside those vg's.
That's basically how i set up LVM on all of my servers. Some servers
have different disk-configurations though...

Can anyone shed any light on this approach? Are there impacts on
performance of read / write actions? Any information is welcomed.

Hope to hear from you all!

Kind regards,
Sander.
-- 
| $ perl -e 'length q bless glob and print chr oct ord q mkdir m and print \
| chr ord q xor x and print chr ord q q q and print chr ord uc q map m and \
| print chr ord q qw q and print chr ord q each le and print chr ord q my \
| alarm and print chr oct oct ord uc qw q for q'  -  Don't you LOVE perl?
