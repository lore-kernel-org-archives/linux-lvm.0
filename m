Message-Id: <199910071902.VAA16233@e35.msede.com>
Subject: Re: [linux-lvm] Problems with raid1 and LVM and initrd
Date: Thu, 7 Oct 99 21:02:02 MESZ
In-Reply-To: <m11ZIFi-000D4UC@londo.rhein-main.de>; from "Torsten Neumann" at Oct 7, 99 8:26 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torsten@londo.rhein-main.de
Cc: linux-lvm@msede.com

> I'm trying to setup LVM on top of a md-raid1 device, and then put my root
> filesystem on it. Setting up raid1 was no problem, setting up LVM on top of
> it - no problem. Setting up a second VG on other partitions - no problem.
[snip]
> The problem is the vgscan call. It doesn't find vg00, it just finds vg01.
> Inserting some debug code ( pvdisplay, pvscan, bash ) in the above it looks
> to me that /dev/md0 is correctly initialized. But the lvm-commands just
> returns error codes. The result is an error while booting the
> real-root-device, since there are no drivers it couldn't boot. (init not
> found)

This could be related to a consistency problem with the dynamically
assigned LVM minors. vgscan creates a /etc/lvmtab and /etc/lvmtab.d
(and the correcsponding dev files -- can't remember of head) on your
_ramdisk_. Later LVM tries to access the possibly inconsistent data
(and dev files) on your hard disk.

Please have a look at
http://linux.msede.com/lvm/mlist/archive/0382.html
http://linux.msede.com/lvm/mlist/archive/0383.html

Please try the following:

I assume the vgscan on the ram disk completes w/o problem.
Could you transfer the /etc/lvmtab, /etc/lvmtab.d/*
to your hard disk and make sure the LVM dev files are the same?

You should be able to simply call an interactive shell in the
linuxrc.


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
