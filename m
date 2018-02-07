Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDBB6F965
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 22:10:41 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB97D2BFA6
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 22:10:24 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id B75395FCEA
	for <linux-lvm@redhat.com>; Wed,  7 Feb 2018 23:10:23 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 07 Feb 2018 23:10:23 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <080fb0a6027e5b15e004de36c05a852a@assyoma.it>
References: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
	<36e66a2bedd0821a7976d82c01c8660a@assyoma.it>
	<74c6270dfd9e5f5784556593a706f24a@xenhideout.nl>
	<080fb0a6027e5b15e004de36c05a852a@assyoma.it>
Message-ID: <83dc55a6a8d09cc714c963bfb4576083@xenhideout.nl>
Subject: Re: [linux-lvm] Saying goodbye to LVM
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

Gionatan Danti schreef op 07-02-2018 22:19:

>> LVM just has conceptual problems.
> 
> As a CentOS user, I *never* encountered such problems. I really think
> these are caused by the lack of proper integration testing from
> Debian/Ubuntu.

That would only apply to udev/boot problems, not the tooling issues.

If you never make DD copies, you never run into such issues.

And if you don't use Cache you won't have those missing PV issues 
either.

Maybe I am just great at finding missing features but LVM has in the end 
cost me a lot more time than it has saved me.

I mean, if I had just stuck to regular partitions I would have been 
further ahead in life by now ;-).

Including any lack of LVM expertise I would have had by then. Which, in 
the end, I don't think is worth it.


> But hey - all key LVM developers are RedHat people, so
> it should be expected (for the better/worse).

The denialist nature of Linux people ensures that even if LVM upstream 
says UPGRADE, Ubuntu will say "why? everything works fine for me".

Or, "I never ran into such issues" ;-).

> True. I never use it with boot device.

Even on Solaris it is limited, for example the root pool cannot have an 
external log device (that means SLOG). Then, you have no clue if this is 
also going to be the case on Linux or not ;-). And Grub supports booting 
from a root dataset but only barely, I don't think anything else (e.g. a 
ZVOL) is any kind of realism. The biggest downside is inflexibility in 
shrinking pools, and people complain about ZVOL snapshots requiring a 
lot of space.

Btrfs, on the other hand, supports removing disks from raid sets and 
just reorganizing what's left.

> LVM and XFS are, on the other
> hand, extremely well integrated into mainline kernel/userspace
> utilities.

Except that apparently there are (or were, or can be) extreme 
initramfs/udev issues and the Ubuntu support/integration has been flimsy 
at best -- what's not flimsy is Grub support, it will even load an 
embedded LVM just fine.

I mean you can have an LV on a PV that is an LV on a PV and Grub will be 
able to read it, the Ubuntu initramfs will not.

> Hence my great interest in stratis...

I don't deny you there but I wonder if I'm not better off sticking to 
ordinary partitions ;-).

But my main idea is to use compressed ZVOLs if I can.

You can just stick partition tables on those too. ZFS has a lot of 
different "models".
