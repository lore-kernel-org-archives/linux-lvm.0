Message-ID: <3DE0CCBB.3010405@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RAID+LVM
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
Date: Sun Nov 24 06:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM <linux-lvm@sistina.com>

I have a debian system with LVM on top of a RAID.  Once up and running, 
it seems to work OK.  It's the getting it up and running that's a 
problem.  At boot, the raid drive is started, and then

                /sbin/vgscan --verbose >/root/vg.start
                /sbin/vgchange -a y --verbose >>/root/vg.start

This yields :
----vg.start----
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

vgchange -- locking logical volume manager
vgchange -- finding all volume group(s)
vgchange -- no volume groups found
----end----

Now, after the system finishes booting, if login as root and run those 
two commands again, I get.


----vg.start----
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "vg0" from physical volume(s)
vgscan -- found inactive volume group "vg0"
vgscan -- getting block device numbers for logical volumes

vgscan -- checking block device numbers of logical volumes

vgscan -- inserting "vg0" into lvmtab
vgscan -- backing up volume group "vg0"
vgscan -- checking volume group name "vg0"
vgscan -- checking volume group consistency of "vg0"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "vg0" in "/etc/lvmtab.d/vg0.tmp"
vgscan -- storing physical volume data of "vg0" in "/etc/lvmtab.d/vg0.tmp"
vgscan -- storing logical volume data of volume group "vg0" in 
"/etc/lvmtab.d/vg0.tmp"
vgscan -- renaming "/etc/lvmtab.d/vg0.tmp" to "/etc/lvmtab.d/vg0"
vgscan -- removing special files and directory for volume group "vg0"
vgscan -- creating directory and group character special file for "vg0"
vgscan -- creating block device special files for vg0
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

vgchange -- locking logical volume manager
vgchange -- finding all volume group(s)
vgchange -- checking volume group name "vg0"
vgchange -- checking existence of volume group "vg0"
vgchange -- reading volume group data for "vg0" from lvmtab
vgchange -- checking volume group consistency  of "vg0"
vgchange -- checking if all physical volumes of volume group "vg0" are 
available
vgchange -- creating VGDA for "vg0" in kernel
vgchange -- volume group "vg0" successfully activated

vgchange -- unlocking logical volume manager
----end----

and everything works.

Now, maybe this is a question better asked on the RAID list, but what's 
changing between the boot-time process  and later that suddenly makes 
the LVM stuff work?

David Corbin.
