Message-Id: <4.1.19990213090201.009663a0@mail.msy.bellsouth.net>
Date: Sat, 13 Feb 1999 09:05:18 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: [linux-lvm] 0.6alpha
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
Reply-To: linux-lvm@msede.com
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I hardcoded the LVM_DRIVER_IOP in the lvm.c and that fixed the compile time
errors, however, after installing the new kernel and modules and tools,
rebooting, LVM was unable to do vgscan.  It reported an error with locking
problems and suggested that the LVM module hadn't loaded.  I did an "rmmod"
and an "insmod" on it, but that didn't help.  I then compiled the 0.5
module and did an "rmmod" and an "insmod" and that resolved it.  Did I
break something when I moved that value from lvm.h to lvm.c?  Also, is
there anything specific you would like me to test?

Thanx,
Daniel
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
