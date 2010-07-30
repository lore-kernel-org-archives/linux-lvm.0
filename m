Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6U3kx6c022516
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2010 23:46:59 -0400
Received: from buadh-brath.com (mail.buadh-brath.com [66.109.101.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6U3kjGl017004
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2010 23:46:48 -0400
Date: Thu, 29 Jul 2010 20:46:44 -0700
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20100730034644.GA18951@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: Re: [linux-lvm] Grub 1 vs 2
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 28, 2010 at 02:10:15PM -0400, Stuart D Gathman wrote:
>
> Use a large /boot partition.  The last time I used Ubuntu, it did not
> easily support having a separate /boot filesystem (instead making the
> root fs bootable), so that could be a problem, unless Ubuntu also
> supports grub 2 (with LVM support).

Stuart,

Slightly hijacking this thread, but forking.  Yes, Ubuntu 10.04 does seem to support Grub 2.  In fact, that's where my problem arises.

I guess I didn't understand the implications of switching to Grub 2, because I let Ubuntu 10.04 do so when I was trying to dual boot a Grub 1 machine that I had.  Once it was finished, I could not find the old system at all, and the menu.lst ( or grub.conf or whatever ) in /boot/grub seems to have no effect on anything.  At least changes that I make seem to do nothing.

Certainly I can mount the LVs that comprised the old system, so I know that the install did not overwrite the LVs that I did not tell it to use, but I can not seem to boot the old system.


Any sage advice?


Thanks,
Brian
