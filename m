Message-ID: <3919F2D5.50FBDADE@mobilestor.com>
Date: Wed, 10 May 2000 17:37:57 -0600
From: "Jeffrey E. Mast" <jmast@mobilestor.com>
MIME-Version: 1.0
Subject: [linux-lvm] raid & LVM
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM Mailing List <linux-lvm@msede.com>


I have been playing around with the kernel linux-2.3.99-pre7-8
(0.8final) and attempting to try out
using software raid0 with LVM. The problem I am having is that
apparently /proc/partitions
reports /dev/mda instead of /dev/md0 and pvcreate cannot find /dev/md0.

This may be due to raid not really being incorporated into the kernel
yet or if something else
changed in the kernel. Anyone know why?

Anyway, I made a link from /dev/md0 to /dev/mda and pvcreate works.
However, doing
a vgscan segfaults. The segfault occurs in pv_read_all_pv.c during the
check for MD and
clear out doubles.

Maybe I am being too bold trying this out before the full raid is
incorporated into the kernel, but
I wanted to see what the current status was.

Thanks,

Jeff
