Message-Id: <4.2.1.9.19991014203859.00a7ad30@mail.msy.bellsouth.net>
Date: Thu, 14 Oct 1999 20:44:59 -0500
From: Daniel Whicker <heimdall@mail.org>
Subject: [linux-lvm] Problem with 2.2.11 / LVM 0.7 / DEVFS
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Gang,
	I just compiled 2.2.11 with LVM 0.7 and Devfs v99 and am running into an 
odd problem.  Whenever I issue a vgscan it simply doesn't see one of my 
VGs.  It doesn't error out, and it doesn't display anything about my second 
VG in verbose mode.  It saw a small test VG on my first disk, but not the 
VG on the second disk.  I set up the entire second disk as an LVM disk (no 
partition table).  I can see the /dev/hdX entries, and I can see the 
/dev/ide/hd/cXXX entries.  If I reboot the machine without devfs, I can see 
and use the VG on the second disk just fine.

Anyone have any ideas?

Thanks,
Daniel
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
