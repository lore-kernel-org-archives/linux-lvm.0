Date: Wed, 20 Oct 1999 14:38:01 +0100
From: David Sutton <pere@legend.co.uk>
Subject: [linux-lvm] LVM patch under Mandrake 6.1
Message-ID: <19991020143801.B4114@squirrel.legend.co.uk>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello all,

  I've just installed a clean version of Linux Mandrake v6.1 onto a intel based system. By examining the SRPM, its running a kernel version v2.2.13pre4.

  The patch went in cleanly and the kernel was recompiled and installed. LVM appears to be working great. My problem is that it seems to have broken RAID support on the box. I'm running raidtools v0.90, installed using the RPM mentioned elsewhere on this list. I'm trying to set up a raid0 array, and mkraid checks the two drives, mentions where it is installing the superblocks, then says that the process is aborted, and to check in /proc/mdstat or syslog. There is no message regarding this in either place.

  Can anyone help me with this? I'm eventually trying to run lvm on raid'ed drives, probably raid5, but at this time not even raid0 seems to work.

Regards,

  David
