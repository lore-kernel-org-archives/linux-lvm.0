From: Jesse Keating <jkeating@pogolinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200301311028.44505.jkeating@pogolinux.com>
Subject: [linux-lvm] LVM Boot issues, unable to create /etc/lvmtab.d/data.tmp
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
Date: Fri Jan 31 12:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm having some very strange boot issues w/ an LVM system.  I have 2 nearly 
identical systems.  Dual Xeon, 3ware 8 port controller, 8 200gig IDE drives 
connected to it, raid 5, and one 40gig IDE drive connected to the standard 
IDE bus.

On the single 40gig drive, there is a /boot partition and a swap partition.  
On the 3ware array (/dev/sda) there is a LVM Volume Group, named "data".  
Within data, there is a Logical Volume, "os".  This volume contains the / 
file system.

On one system, I can boot using the /boot partition, then have it mount / 
cleanly.  vgscan fires up from the initrd, finds the "data" group, writes 
this info out to /etc/lvmtab.d/data.tmp (/etc of the initrd, not the actual 
system /etc), then activates data, so that it can mount the "os" volume.  
System continues to boot as expected.

On the other system, same kernel, same initrd (very same, made it on one 
system, using it on both), vgscan finds "data", then tries to write to 
/etc/lvmtab.d/data.tmp, but throws an "Error 2 Unable to write ....".  Then 
it will not try to activate data, and it will not be able to mount /, which 
causes a kernel panic.

What in the heck is going on?!  Could the initrd somehow be mounted as 
read-only?  I'm using grub as the boot loader on both systems.  Is there 
anything I can pass to grug, that would allow the initrd to be mounted 
read/write?

help?!

-- 
Jesse Keating RHCE MCSE
Pogo Linux -- Support Tech
tel: (888) 828-7646
