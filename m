From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009072344.RAA21636@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM support for LILO
Date: Thu, 7 Sep 2000 17:44:03 -0600 (MDT)
In-Reply-To: <20000908004640.A24191@gruyere.muc.suse.de> from "Andi Kleen" at Sep 08, 2000 12:46:40 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Linux LVM mailing list <linux-lvm@msede.com>, isdfa@visi.com

Andi Kleen, you write:
> I hacked lilo, but I never tested them really because I didn't have a spare
> HD to experiment with the changed PV format at that time (I noticed the
> problem with the PV format only after I did that work :-()  You can have
> the untested patches if you want.  From visual inspection the translated
> blocks looked ok.

Yes, please send me a copy...

> A full solution requires more work, e.g. at least a LV flag so that
> LVM can urge the user to rerun lilo after a *move. Support in lilo for LVs
> spread over multiple devices would also be nice (I just cheated by requiring
> it all on a single device) 

Yes, this was discussed a bit in the past, but like all things Linux, it
is better to have something now instead of later.  However, I don't even
know if it would be possible to boot from multiple devices, since I think
this may even be a BIOS thing to load the blocks, otherwise we would never
be restricted to BIOS devices for boot...

> It just does not make much sense then, because with a DOS partition table
> you can as well have a partition based /boot

It's still not good to have a partition-based /boot, because you can't
migrate it, enlarge it, etc (carefully, mind you).  There are still some
limitations for LVM based /boot, but if you have /dev/hda1 that is all
in LVM, you are free to manage it any way you want.  The partition table
is only a few kB...  You can make all your other disks full LVM disks
and save a few more kB, if you are TOTALLY SURE you will never want to
boot from any of them...

Cheers, Andreas
