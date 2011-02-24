Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1OBsxOl012406
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 06:54:59 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OBslH1022149
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 06:54:48 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1PsZmR-0007Mr-Cx
	for linux-lvm@redhat.com; Thu, 24 Feb 2011 12:54:47 +0100
Received: from spike.mokotowplaza.waw.pl ([89.171.67.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 12:54:47 +0100
Received: from tnowak by spike.mokotowplaza.waw.pl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 12:54:47 +0100
From: "Tomasz Nowak" <tnowak@netventure.pl>
Date: Thu, 24 Feb 2011 12:54:21 +0100
Message-ID: <ik5gtr$u2q$1@dough.gmane.org>
References: <ik41em$6rl$1@dough.gmane.org> <4D663807.9010802@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4D663807.9010802@redhat.com>
Subject: [linux-lvm] [SOLVED] Re: Errors after adding new md pv (boot only?)
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

"Bryn M. Reeves"  wrote:
> [...]
> You need to rebuild your initramfs (mkinitrd on CentOS 5.5) to include the
> configuration for the newly defined MD array.
> 
> Something like:
> 
> mkinitrd /boot/initrd-$(uname -r).img $(uname -r)

Bryn, thank you very much. Recreating initrd img solved the problem.

I have no idea why it wasn't neccessary on my previous systems..
Probably, before such disk-upgraded system was first rebooted, initrd*.img
was recreated automaticly during a (yum) kernel update procedure.
That could be an explanation.

-- 
Tomasz
