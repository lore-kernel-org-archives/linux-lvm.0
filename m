Message-ID: <391FC4D1.833698B8@msede.com>
Date: Mon, 15 May 2000 11:35:13 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: kressb@icp.siemens.com
MIME-Version: 1.0
Subject: [linux-lvm] LVM over MD on 2.3.x
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Brian Kress (kressb@icp.siemens.com) ...

-------- Original Message --------
Message-ID: <391F4C50.3842370A@icp.siemens.com>
Date: Sun, 14 May 2000 21:01:04 -0400
From: Brian Kress <kressb@icp.siemens.com>
Subject: LVM over MD on 2.3.x

	Since RAID 1/5 has finally been included in 2.3,
I can not try to get my setup working under 2.3.  I have
run into a problem with getting LVM working over RAID5. This
works under 2.2.x, with LVM 0.8i and RAID 0.90, but with
2.3.99pre8, it doesn't work.  I can get vgscan to find
the VGs, and I can get vgchange to activate them (with
a small hack to the source, anyway), but the kernel driver
has problems.  Any access to an LV returns the contents of
md0.  It looks like the LVM driver isn't remapping blocks
when used over raid.
	I remember Andrea Arcangeli posting to the
linux-kernel list about stacking block drivers and saying
something about this, but I can't find the post.
	Any idea what's going wrong and what I can do
fix it?


Brian Kress
kressb@icp.siemens.com
