Message-ID: <3A1186DA.AAED9963@dorf.rwth-aachen.de>
Date: Tue, 14 Nov 2000 19:39:22 +0100
From: Robert Perkuhn <robatp@dorf.RWTH-Aachen.DE>
MIME-Version: 1.0
Subject: [linux-lvm] problem on booting
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi!

Stupid question:

I've got RedHat 7 with 2.4.0-test-10. LVM works fine (1 VG over 2disks
(hda5/hdc5), two LV mounted), except that the LVs are not auto-mounted
in the boot-process. He hangs when the first LV is about to be mounted.
When I put the LVs out of the fstab everything is fine.

I guess the reason is that the VG ist not set active. Because when I
mount the LVs manually, I first have to activate the VG (every time).

How can I make the LVM auto-activate the VG in the boot process?

thx for a little HELP !!!


bye

robatp
