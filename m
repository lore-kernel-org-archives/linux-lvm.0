From: "Arie Bant@mail.com" <abant@mail.com>
Message-ID: <002701c25d0a$c10ac5c0$28bf18ac@abant.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't start LVM root fs
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
Date: Sun Sep 15 17:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@Sistina.com

Hello Heinz,

Thanks for LVM.  I have been using it on HP-UX and AIX and provided one can
control the placing of the LV's over the disk so as to avoid excessive head
movement it saves a few problems here and there.

Hint: On AIX and HP-UX one can, but does not have to, control in which area
of the disk an LV is placed, or even which PV's will be part of it.  This
allows leaving spaces between LV's which later can be used to grow them.
The advantage over just making the LV bigger in the first place is that the
intermediate space can be used for growing either LV at a time when one does
not know which LV is going to need more space.

But now my problem:

I have installed LVM 1.0.1 on my Mandrake 8.0 Linux box (PIII 550Mhz, 512
MB) from the Mandrake 8.2 DVDROM.  No problems.
After creating boot partition, PV, VG and root/usr/var LV's on an extra disk
(/dev/sdb) added to the system,
I have copied the content of the boot directory to the bootpart on the new
disk,
root/usr/var to the new LV's,
used lvmcreate _initrd to create a new boot image,
copied that to the new bootpart,
modified lilo.conf as suggested in the man page for lvmcreate _initrd and
ran lilo and
rebooted from the new FS.
First time vgscan complained that LVM was not installed and suggested
checking the module stuff.

Indeed I could not find where in the new boot image the lvm module got
loaded.  I then modified modules.conf to load the LVM module on the
appropriate devices ( 54 & 109 ), added the module in the appropriate place
in the "lib"directory tree and tried again.
The system now boots a little further, vgscan has created /etc/lvmtab and
/etc/lvmtab.d, until vgchange says it can not find any volume groups.

When I reboot from the existing system it is fine and all the logical
volumes are accessible.

Any suggestions how to proceed?

Note: There is a third disk in the system (/dev/sdc/, containing the swap
file system.  This used to be /dev/sdb before I added  the new disk.  I have
changed all references to the "old" /dev/sdb into /dev/sdc in /etc/fstab of
the current root FS.
I have also taken care that the /etc/fstab in the new root LV  resembles the
current situation seen from the point of view when that becomes the current
root FS and that lilo.conf in the new boot/root FS is correct for the
situation when in all works and the new disk becomes /dev/sda (I am taking
the old drive out)

Best Regards,

Arie Bant.
*******************************
Maes,  Llandrillo
Corwen,  LL21 0TE
United Kingdom
tel.: +44 (0)1490 440 487/370
e-mail: abant@mail.com





*******************************
Maes,  Llandrillo
Corwen,  LL21 0TE
United Kingdom
tel.: +44 (0)1490 440 487/370
fax.: +44 (0)870 284 1575 (via e-mail)
e-mail: abant@mail.com
