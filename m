Message-ID: <38AA49DF.A7F19810@tenure.com>
Date: Wed, 16 Feb 2000 00:55:27 -0600
From: Byron Pearce <bpearce@tenure.com>
Reply-To: bpearce@tenure.com
MIME-Version: 1.0
Subject: [linux-lvm] Installation on Debian (LVM Newbie)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Pardon the interruption with what I am certain will be considered a
trivial question, but I just getting on the Linux LVM bandwagon (taking
the leap from the world of Sun and HP). . .

I am running a home system with Debian v2.1 and I am trying to determine
the best way to get things setup.  I have installed the source code into
the 2.2.13 kernel (yes, I upgraded it) and compiled all support for LVM
into the kernel, as well as installing the LVM software onto the
system.  So far, so good.

When I attempt to run pvcreate as per the LVM-HOWTO, however, it
complains as follows:

    # pvcreate /dev/sda1
    pvcreate -- invalid partition type 0x83 for "/dev/sda1" (must be
0x8e)

If I am understanding this message correctly, it is instructing me to
make certain the the partition type is set to 8E through cfdisk.
However, I note that this partition type is not defined (or at least
isn't in my version of Linux).  Am I observing things correctly or
missing something obvious?  I am assuming that the only way to correct
this is to change that partition type and to reload Linux.  If so,
that's fine as this is a new system that I am playing with to get
working.  I assume that I would simply set the partition type on the
disk to 8E and then move on.  Will Linux boot like this?  Or does it
require at least a small Linux native partition first?

This is a lead into my second question (assuming worst case scenario
from above) is more general.  I am wondering how the majority of you are
setting up LVM on your systems.  In a traditional LVM environment (at
least on the systems I have worked with), the entire physical disk is
given to the LVM and then the file systems are mounted from the logical
volumes created in the individual volume groups.  So, assuming an 18GB
physical SCSI disk, which I have, I would simply create a 18GB "/"
partition and give this over to LVM as /dev/sda1, from where I would
create swap, /tmp, /opt, /usr, etc. and mount them from within Linux.

Is there a gotcha involved that I may be missing?  On some systems, you
have to leave a small partition out of the LVM to mount the bootstrap
O/S from (say, a 20MB partition or so) and then everything else can be
under the LVM.  I am just trying to make certain that if I have to
reload, that I only have to do it once and that I setup the disks
correclty.

TIA for any insight.

--
====================================================================
Byron Pearce                         mailto:bpearce@tenure.com
Tenure Systems, Inc.                 Arlington, Texas

"It's hard to be a ninja when you wear a beeper."
