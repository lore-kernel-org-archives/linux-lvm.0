Message-Id: <4.1.19990212193421.0096ea60@mail.msy.bellsouth.net>
Date: Fri, 12 Feb 1999 19:36:47 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: Re: [linux-lvm] Snapshot compile...
In-Reply-To: <9902130131.AA01815@mailgate99.telekom.de>
References: <4.1.19990212192108.00958d40@mail.msy.bellsouth.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
Reply-To: linux-lvm@msede.com
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

>Did you copy LVM/0.6alpha/kernel/lvm.h to /usr/src/linux/include/linux/lvm.h
>and LVM/0.6alpha/kernel/lvm.c to /usr/src/linux/drivers/block/lvm.c to
>compile the kernel parts?

Sure did.  I just did a diff against them to double check.  The files in
the kernel are the same from the snapshot.  Maybe I missed something when I
recompiled the kernel.  I did a make clean, make dep, make, make zImage,
and then the make modules where it failed.  Is there anything else that I
might have missed?  I'm pretty sure that make clean should have deleted all
my outdated object files...

									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
