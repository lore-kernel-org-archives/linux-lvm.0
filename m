Message-ID: <AA3DDC70DA86CF44935406327B97F2F048E302@bc1msg01>
From: "Baker, Brendon" <BBaker@fnb.co.za>
MIME-Version: 1.0
Subject: [linux-lvm] Error when trying to change root to LVM
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
Date: Fri Dec  5 00:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi Everyone

I have an old IBM server 320. I need to create a volume group as there is
not enough space to perform upgrades etc.
As I can only only do a text install and you cannot create Logical Volumes
in the text install, i have installed the OS on one of the 2 gig drives in
the machine. I then go about trying to create an LVM etc. (Please remember
that these are SCSI drives)
I manage to create a volume group on the remaining 2 drives and then create
a logical volume on these. I then mount this as an ext3 and copy the entire
os over using find / -xdev | cpio -pvmd /mnt
This all works fine. I then run lvmcreate_initrd to create a new ramdisk. I
go to my boot which is on a different partition and edit grub.conf so that
it reflects the ramdisk and i change the kernel parameter to point to the
logical volume ie. /dev/vg1/root
I also edit the fstab so that the /dev/vg1/root is mounted as /.
I then reboot and get the following error:
Mounting root filesystem
Mount: error 6 mounting ext3
pivotroot: pivot_root(/sysroot,/sysroot/initrd) failed: 2
umount /initrd/proc failed: 2
Freeing unused kernel memory: 120k freed
Kernel pani: No init found. Try passing init=option to kernel.

I have checked and there is a initrd directory in the Logical volume as I
copied the entire root. I have noticed that it doesnt seem to initialise the
logical volume before it tries to mount the root filesystem. Is this right?
How do I get it to do this?

Thanks


___________________________________________________________________________________________________


The views expressed in this email are, unless otherwise stated, those of the author and not those
of the FirstRand Banking Group or its management.  The information in this e-mail is confidential
and is intended solely for the addressee. Access to this e-mail by anyone else is unauthorised. 
If you are not the intended recipient, any disclosure, copying, distribution or any action taken or 
omitted in reliance on this, is prohibited and may be unlawful.
Whilst all reasonable steps are taken to ensure the accuracy and integrity of information and data 
transmitted electronically and to preserve the confidentiality thereof, no liability or 
responsibility whatsoever is accepted if information or data is, for whatever reason, corrupted 
or does not reach its intended destination.

                               ________________________________
