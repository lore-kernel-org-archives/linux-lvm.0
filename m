From: John Moser <jmoser@erc.wisc.edu>
Subject: Re: [linux-lvm] Volume group not found on restart
In-Reply-To: <E631530D51ABD411B823009027855C5B0278A4@THOR>
Message-ID: <Pine.SGI.4.33.0205141308440.6259177-100000@erc2000.erc.wisc.edu>
MIME-Version: 1.0
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
Date: Tue May 14 13:10:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Murthy Kambhampaty <Murthy.Kambhampaty@goeci.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Just a quick glance over your problem (I'm not too familiar with the rest
of your problem).  But the most common reason for that particular error
(not a valid block device), is because the volume group isn't active.
Have you tried:

vgchange -a y

first, and then try to mount your filesystem?

-John


On Tue, 14 May 2002, Murthy Kambhampaty wrote:

> I have an unexpected error reading an LV:
>
> # mount -a
> mount: /dev/db_vol/db_dir is not a valid block device
>
> I'd like help recovering the data on the partition. Information about the
> circumstance under which I first got the error, and some addtional info are
> attached below. The system is a RH7.2 system installed with the XFS1.0.2a
> installer and updated to the XFS CVS kernel from April 4. (LVM version in
> kernel with LVM tools from lvm-tools-1.0.1rc4-2 rpm).
>
> Thanks for the help,
> 	Murthy
>
> Addtional information follows:
>
> I have a VG called "db_vol" and an LV within called "db_dir" on a hardware
> RAID-5 volume hanging off a Mylex Acceleraid 352 raid controller (linux
> DAC960 driver). This volume has been up and functional, with an XFS
> filesystem for a while (the last VGDA backup is from March 21). Yesterday, I
> added a new RAID set and did a test on the new volume (defined a single
> (linux native) primaly partition and XFS filesystem on the partition then
> mounted the partition to /mnt/tempmnt) with "time dd=/dev/zero
> of=/mnt/tempmnt/mungie.txt bs=512k count=10000". This led to my system
> slowing down and at logout I got an error message saying init was spawning
> ttys too fast. I power-cycled my machine after a short wait, with gritted
> teeth, and on the XFS check message, I chose "yes" to recheck the integrity
> of the XFS filesystems. The unexpected error message has been produced since
> then.
>
> vgdisplay output for the volume is:
>
> # /sbin/vgdisplay -d db_vol
> <1> lvm_check_kernel_lvmtab_consistency -- CALLED
> <22> vg_check_active_all_vg -- CALLED
> <333> vg_status_get_count -- CALLED
> <333> vg_status_get_count -- LEAVING with ret: 0
> <22> vg_check_active_all_vg -- LEAVING with ret: -331  ptr: (null)
> <22> lvm_tab_vg_check_exist_all_vg -- CALLED
> <333> lvm_tab_read -- CALLED
> <333> lvm_tab_read -- LEAVING with ret: 0  data: 804B4A0  size: 1
> <22> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
> <1> lvm_check_kernel_lvmtab_consistency -- LEAVING with ret: 1
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> vg_check_name -- CALLED with VG: db_vol
> <22> lvm_check_chars -- CALLED with name: "db_vol"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <1> vg_check_name -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- CALLED with vg_name: "db_vol"
> <22> vg_check_name -- CALLED with VG: db_vol
> <333> lvm_check_chars -- CALLED with name: "db_vol"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_tab_read -- CALLED
> <22> lvm_tab_read -- LEAVING with ret: 0  data: 804B4A0  size: 1
> <1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
> vgdisplay -- volume group "db_vol" not found
>
>
> When I check the db_vol.conf file in /etc/lvmconf, I get  "vgcfgrestore --
> ERROR: different structure size stored in "/etc/lvmconf/db_vol.conf" than
> expected in file vg_cfgrestore.c [line 120]" (full command output below).
>
> /sbin/vgcfgrestore -t -d -n db_vol  -ll
> <1> vg_check_name -- CALLED with VG: db_vol
> <22> lvm_check_chars -- CALLED with name: "db_vol"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <1> vg_check_name -- LEAVING with ret: 0
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_dont_interrupt -- LEAVING
> <1> vg_cfgrestore -- CALLED
> <22> vg_check_name -- CALLED with VG: db_vol
> <333> lvm_check_chars -- CALLED with name: "db_vol"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> vgcfgrestore -- ERROR: different structure size stored in
> "/etc/lvmconf/db_vol.conf" than expected in file vg_cfgrestore.c [line 120]
> <1> vg_cfgrestore -- LEAVING with ret: -328
> <1> lvm_error -- CALLED with: -328
> <1> lvm_error -- LEAVING with: "vg_cfgrestore(): read"
> vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
> "db_vol"
>
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
