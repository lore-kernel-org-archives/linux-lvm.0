Message-ID: <20011101233119.P21136@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
Subject: [linux-lvm] pvmove root filesystem?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Nov  1 22:30:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have all of my filesystems on LVM, including my root filesystem.  I
also have a separate /boot partition right at the front of my (boot)
IDE disk which is not LVM.  So my boot disk layout currently looks
like this:

   Device Boot    Start       End    Blocks   Id  System
   /dev/hda1            63     19151      9544+  83  Linux
   /dev/hda2         19152  39102335  19541592   8e  Linux LVM

And I have a bunch of scsi disks in the box too which I am going to
commit to LVM as well, shuffling data around until I have _all_ disks
and filesystems under LVM.

I have done some preliminary bonnie++ benchmarks and it appears that
even my 7200 rpm scsi disk is better than my ide disk, so I want to
migrate my 10k rpm scsi disk into being my boot/root disk (my bios
will support booting from a scsi disk despite there being an ide disk
in the system).

My question is, if I put a small boot partition at the front of the
scsi disk I want to be my new boot disk, dedicate the rest of the disk
to LVM, add it to my "rootvol" LVM volume (which currently has root,
usr, home, var, etc. on the IDE disk) and then pvmove the logical
volumes to the scsi disk, can I safely pvmove the root filesystem
while the machine is running?  I think I would move the root
filesystem first in fact.

Once I have copied the /boot from the ide disk to the scsi disk,
and pvmoved the root filesystem (and possibly all of the rest of the
filesystems in the rootvol) to the SCSI disk, I should be able to do
the required "lilo" magic to get the MBR on the SCSI disk active and
then make it the boot drive and reboot no?

Is there anything about pvmoving the root filesystem that I am missing
in my description above that is going to cause disaster?

Thanx,
b.

-- 
Brian J. Murrell
