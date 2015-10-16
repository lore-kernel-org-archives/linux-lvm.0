Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9GIt8qf031474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2015 14:55:08 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id 5FD6B8EA3B
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2015 18:55:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1ZnA9f-0006L4-BI
	for linux-lvm@redhat.com; Fri, 16 Oct 2015 20:55:03 +0200
Received: from pool-71-170-186-66.dllstx.fios.verizon.net ([71.170.186.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2015 20:55:03 +0200
Received: from arequipeno by pool-71-170-186-66.dllstx.fios.verizon.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 16 Oct 2015 20:55:03 +0200
From: Ian Pilcher <arequipeno@gmail.com>
Date: Fri, 16 Oct 2015 12:54:59 -0500
Message-ID: <mvrdlj$6r9$1@ger.gmane.org>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20150911125104.GA8027@rh-vpn>
Subject: [linux-lvm] LVM cache (or dm-cache) shutdown
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 09/11/2015 07:51 AM, Joe Thornber wrote:
> No, this is not expected.  The most likely cause is your system was
> not shutdown cleanly so dm-cache has no choice but to assume all
> blocks are dirty and need writing back.  Make sure your volumes are
> being deactivated as part of shutdown.

What exactly is required to cleanly shutdown an LVM cache or dm-cache
device?

AFAICT, systemd does a DM_DEV_REMOVE ioctl on all device mapper devices
during shutdown/reboot.  Is this sufficient?

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
-------- "I grew up before Mark Zuckerberg invented friendship" --------
========================================================================
