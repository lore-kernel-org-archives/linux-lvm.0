Return-Path: <glenn@gecpalau.com>
Message-ID: <3AED170B.D5483465@gecpalau.com>
Date: Mon, 30 Apr 2001 16:40:59 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------41CEE5DA16222B0ACA817BF1"
Subject: [linux-lvm] New details on VGScan crash on 2.4.4
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------41CEE5DA16222B0ACA817BF1
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Well, after much deliberation as to how BADLY I needed a /usr partition
under 2.4.4....

I booted it in single-user (blech) under 2.4.4 and ran vgscan and got:

segmentation fault

So I went about investigating as to whether I could get more info than
that.....

vgscan -d >& vgscan.log generated the textfile vgscan1.txt I am
attaching to this email...hopefully it sheds some light (?)

as a comparison I have rebooted to 2.3.3 and re-run vgscan -d
>&vgscan2.log which is the vgscan2.txt I have attached to this email.

Any takers?

Glenn

--------------41CEE5DA16222B0ACA817BF1
Content-Type: text/plain; charset=us-ascii;
 name="vgscan.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vgscan.txt"

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: 0
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_check_devfs -- CALLED
<4444> lvm_check_devfs -- LEAVING with ret: 0
<333> lvm_dir_cache -- calling scandir() with /dev/ida
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/ida
<333> lvm_dir_cache -- calling scandir() with /dev/ide/hd
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/ide/hd
<333> lvm_dir_cache -- calling scandir() with /dev/loop
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/loop
<333> lvm_dir_cache -- calling scandir() with /dev/md
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/md
<333> lvm_dir_cache -- calling scandir() with /dev/rd
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/rd
<333> lvm_dir_cache -- calling scandir() with /dev/sd
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/sd
<333> lvm_dir_cache -- calling scandir() with /dev/cciss
<333> lvm_dir_cache -- AFTER calling scandir() with /dev/cciss
<333> lvm_dir_cache -- calling scandir() with /dev
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- AFTER calling scandir() with /dev
<333> lvm_dir_cache -- LEAVING with ret: 2
<22> pv_read_all_pv -- calling stat with "/dev/cdrom"
<333> pv_read -- CALLED with /dev/cdrom
<4444> pv_check_name -- CALLED with "/dev/cdrom"
<55555> lvm_check_chars -- CALLED with name: "/dev/cdrom"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/cdrom
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/cdrom
<55555> pv_check_name -- CALLED with "/dev/cdrom"
<666666> lvm_check_chars -- CALLED with name: "/dev/cdrom"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: -272
<22> pv_read_all_pv -- pv_read returned: -272
<22> pv_read_all_pv -- calling stat with "/dev/root"
<333> pv_read -- CALLED with /dev/root
<4444> pv_check_name -- CALLED with "/dev/root"
<55555> lvm_check_chars -- CALLED with name: "/dev/root"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/root
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/root
<55555> pv_check_name -- CALLED with "/dev/root"
<666666> lvm_check_chars -- CALLED with name: "/dev/root"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/root
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:4
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 2
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/root
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/root and 0xbffffce4
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 2
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/root"
<666666> lvm_check_chars -- CALLED with name: "/dev/root"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 2
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16

--------------41CEE5DA16222B0ACA817BF1
Content-Type: text/plain; charset=us-ascii;
 name="vgscan2.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vgscan2.txt"

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: 0
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 15
<22> pv_read_all_pv -- calling stat with "/dev/scsi/host0/bus0/target5/lun0/disc"
<333> pv_read -- CALLED with /dev/scsi/host0/bus0/target5/lun0/disc
<4444> pv_check_name -- CALLED with "/dev/scsi/host0/bus0/target5/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/scsi/host0/bus0/target5/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/scsi/host0/bus0/target5/lun0/disc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/scsi/host0/bus0/target5/lun0/disc
<55555> pv_check_name -- CALLED with "/dev/scsi/host0/bus0/target5/lun0/disc"
<666666> lvm_check_chars -- CALLED with name: "/dev/scsi/host0/bus0/target5/lun0/disc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/scsi/host0/bus0/target5/lun0/disc
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/scsi/host0/bus0/target5/lun0/disc
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/scsi/host0/bus0/target5/lun0/part4"
<333> pv_read -- CALLED with /dev/scsi/host0/bus0/target5/lun0/part4
<4444> pv_check_name -- CALLED with "/dev/scsi/host0/bus0/target5/lun0/part4"
<55555> lvm_check_chars -- CALLED with name: "/dev/scsi/host0/bus0/target5/lun0/part4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/scsi/host0/bus0/target5/lun0/part4
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/scsi/host0/bus0/target5/lun0/part4
<55555> pv_check_name -- CALLED with "/dev/scsi/host0/bus0/target5/lun0/part4"
<666666> lvm_check_chars -- CALLED with name: "/dev/scsi/host0/bus0/target5/lun0/part4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/scsi/host0/bus0/target5/lun0/part4
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 8:4
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/scsi/host0/bus0/target5/lun0/part4
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/disc"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/disc
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/disc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/disc
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/disc"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/disc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/disc
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/disc
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part1"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part1
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part1
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part1"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:1
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part2"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part2
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part2"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part2
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part2
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part2"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:2
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part2
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part3"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part3
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part3"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part3
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part3
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part3"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part3
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:3
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part3
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part4"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part4
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part4
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part4
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part4
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:4
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part4
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/ide/host0/bus0/target0/lun0/part4 and 0xbffff9d4
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: C  part[0].nr_sects: 30507372
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 642600
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 5  part[2].nr_sects: 24852555
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 4016250
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 4016250
<333> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus0/target0/lun0/part4"  pv: 804C620
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/ide/host0/bus0/target0/lun0/part4 warlock1
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part5"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part5
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part5
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:5
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part5
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5 and 0xbffff9d4
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: C  part[0].nr_sects: 30507372
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 642600
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 5  part[2].nr_sects: 24852555
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 4016250
<333> pv_get_size -- first == 1
<333> pv_get_size -- BEFORE llseek 0:1DB4FD3
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 10233342
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 10233342
<333> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus0/target0/lun0/part5"  pv: 804CB30
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/ide/host0/bus0/target0/lun0/part5 warlock1
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part6"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part6
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part6
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part6
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:6
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part6
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6 and 0xbffff9d4
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: C  part[0].nr_sects: 30507372
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 642600
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 5  part[2].nr_sects: 24852555
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 4016250
<333> pv_get_size -- first == 1
<333> pv_get_size -- BEFORE llseek 0:1DB4FD3
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 10233342
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 9960300
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:2777610
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 9960237
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 9960237
<333> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus0/target0/lun0/part6"  pv: 804D0C0
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/ide/host0/bus0/target0/lun0/part6 warlock1
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part7"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part7
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part7
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part7
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part7
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:7
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part7
<4444> system_id_check_exported -- CALLED
<4444> system_id_check_exported -- LEAVING with ret: 0
<333> pv_read -- LEAVING with ret: 0
<333> pv_get_size -- CALLED with /dev/ide/host0/bus0/target0/lun0/part7 and 0xbffff9d4
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> lvm_dir_cache_find -- LEAVING
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING
<4444> lvm_partition_count -- CALLED
<4444> lvm_partition_count -- LEAVING with ret: 16
<333> pv_get_size -- BEFORE llseek 0:0
<333> pv_get_size -- part[0].sys_ind: C  part[0].nr_sects: 30507372
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 83  part[1].nr_sects: 642600
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[2].sys_ind: 5  part[2].nr_sects: 24852555
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[3].sys_ind: 8E  part[3].nr_sects: 4016250
<333> pv_get_size -- first == 1
<333> pv_get_size -- BEFORE llseek 0:1DB4FD3
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 10233342
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 9960300
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:2777610
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 9960237
<333> pv_get_size -- first == 1
<333> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 3903795
<333> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<333> pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
<333> pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
<333> pv_get_size -- BEFORE llseek 0:313DB0E
<333> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 3903732
<333> pv_get_size -- first == 1
<333> pv_get_size -- part_i == part_i_tmp
<333> pv_get_size -- LEAVING with ret: 3903732
<333> pv_check_volume -- CALLED  dev_name: "/dev/ide/host0/bus0/target0/lun0/part7"  pv: 804D6D0
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_check_volume -- LEAVING with ret: 1
<22> pv_read_all_pv: allocating for /dev/ide/host0/bus0/target0/lun0/part7 warlock1
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part8"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part8
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part8"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part8
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part8
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part8"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part8"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part8
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:8
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part8
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part9"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part9
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part9"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part9"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part9
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part9
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part9"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part9"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part9
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:9
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part9
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target0/lun0/part10"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part10
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part10"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part10"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part10
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target0/lun0/part10
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part10"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part10"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part10
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:10
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part10
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target1/lun0/disc"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/disc
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target1/lun0/disc"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target1/lun0/disc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target1/lun0/disc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/disc
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target1/lun0/disc"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target1/lun0/disc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/disc
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:64
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target1/lun0/disc
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- calling stat with "/dev/ide/host0/bus0/target1/lun0/part1"
<333> pv_read -- CALLED with /dev/ide/host0/bus0/target1/lun0/part1
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target1/lun0/part1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target1/lun0/part1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target1/lun0/part1
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/ide/host0/bus0/target1/lun0/part1
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target1/lun0/part1"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target1/lun0/part1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/ide/host0/bus0/target1/lun0/part1
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_copy_from_disk -- CALLED
<4444> pv_copy_from_disk -- LEAVING
<4444> pv_create_name_from_kdev_t -- CALLED with 3:65
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache -- CALLED
<55555> lvm_dir_cache -- LEAVING with ret: 15
<4444> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target1/lun0/part1
<333> pv_read -- LEAVING with ret: -268
<22> pv_read_all_pv -- pv_read returned: -268
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 4
<22> pv_read_all_pv -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- checking vg_name: warlock1[0/0]
<1> vg_check_exist_all_vg -- before vg_check_exist ( warlock1)
<22> vg_check_exist -- CALLED with VG: warlock1
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> pv_read_all_pv -- CALLED
<55555> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<55555> pv_read_all_pv -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<7777777> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED with VG: warlock1
<7777777> lvm_check_chars -- CALLED with name: "warlock1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<55555> pv_read_uuidlist -- CALLED with /dev/ide/host0/bus0/target0/lun0/part4
<666666> lvm_check_uuid -- CALLED with uuidstr: "ahvp9M9f01vcrrHWoRcrO2KG2NRwbBw4"
<666666> lvm_check_uuid -- LEAVING with ret: 0
<666666> lvm_check_uuid -- CALLED with uuidstr: "xYZp0EM476wg2XS0oPd1BV45rAQXYWzC"
<666666> lvm_check_uuid -- LEAVING with ret: 0
<666666> lvm_check_uuid -- CALLED with uuidstr: "56sHK9xmLUnPuXv73UBjE37MX2MCrWtV"
<666666> lvm_check_uuid -- LEAVING with ret: 0
<666666> lvm_check_uuid -- CALLED with uuidstr: "Zr9uY9fPdFToDx7EEo5YCPPcJdqP6dki"
<666666> lvm_check_uuid -- LEAVING with ret: 0
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<666666> lvm_check_uuid -- CALLED with uuidstr: ""
<666666> lvm_check_uuid -- LEAVING with ret: -1
<55555> pv_read_uuidlist -- LEAVING with ret: 4
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part5"
<333> vg_read -- pv[1]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part6"
<333> vg_read -- pv[2]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part7"
<333> vg_read -- pv[3]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part4"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<666666> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<7777777> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part5
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING
<666666> pv_create_name_from_kdev_t -- CALLED with 3:5
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 15
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part5
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- CALLED
<55555> vg_copy_from_disk -- LEAVING
<4444> vg_read_from_pv -- LEAVING with ret: 0
<333> vg_read -- LEAVING with ret: 0
<22> vg_check_exist -- before pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv -- CALLED
<4444> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<4444> pv_read_all_pv -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_read_uuidlist -- CALLED with /dev/ide/host0/bus0/target0/lun0/part4
<55555> lvm_check_uuid -- CALLED with uuidstr: "ahvp9M9f01vcrrHWoRcrO2KG2NRwbBw4"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "xYZp0EM476wg2XS0oPd1BV45rAQXYWzC"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "56sHK9xmLUnPuXv73UBjE37MX2MCrWtV"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: "Zr9uY9fPdFToDx7EEo5YCPPcJdqP6dki"
<55555> lvm_check_uuid -- LEAVING with ret: 0
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<4444> pv_read_uuidlist -- LEAVING with ret: 4
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 4  pv_count: 4
<22> vg_check_exist -- LEAVING with ret: 1
<1> vg_check_exist_all_vg -- HIT vg_name: warlock1
<1> vg_check_exist_all_vg -- vg_name_ptr[0]: warlock1
<1> vg_check_exist_all_vg -- checking vg_name: warlock1[1/1]
<1> vg_check_exist_all_vg -- checking vg_name: warlock1[2/1]
<1> vg_check_exist_all_vg -- checking vg_name: warlock1[3/1]
<1> vg_check_exist_all_vg -- LEAVING with 1 VGs
<1> vg_check_active -- CALLED with VG: warlock1
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: warlock1
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: 0
<1> vg_check_active -- LEAVING with ret: 1
<1> vg_read_with_pv_and_lv -- CALLED
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_read -- CALLED
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> vg_read -- pv[0]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part5"
<22> vg_read -- pv[1]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part6"
<22> vg_read -- pv[2]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part7"
<22> vg_read -- pv[3]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part4"
<333> vg_read_from_pv -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part5
<55555> pv_read_already_red -- LEAVING with ret: 1
<4444> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_copy_from_disk -- CALLED
<55555> pv_copy_from_disk -- LEAVING
<55555> pv_create_name_from_kdev_t -- CALLED with 3:5
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 15
<55555> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part5
<55555> system_id_check_exported -- CALLED
<55555> system_id_check_exported -- LEAVING with ret: 0
<4444> pv_read -- LEAVING with ret: 0
<4444> vg_copy_from_disk -- CALLED
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read_from_pv -- LEAVING with ret: 0
<22> vg_read -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER vg_read;  vg_this->lv_cur: 5
<22> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pv_of_vg
<22> pv_read_all_pe_of_vg -- CALLED
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- pv_count: 4
<333> pv_read_pe -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5 and 1249
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part5 with 1249 PE at address 804B580
<333> pv_read_pe -- CALLED with /dev/ide/host0/bus0/target0/lun0/part6 and 1215
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part6 with 1215 PE at address 804B584
<333> pv_read_pe -- CALLED with /dev/ide/host0/bus0/target0/lun0/part7 and 476
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part7 with 476 PE at address 804B588
<333> pv_read_pe -- CALLED with /dev/ide/host0/bus0/target0/lun0/part4 and 490
<4444> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part4 with 490 PE at address 804B58C
<333> pv_check_number -- CALLED
<333> pv_check_number -- LEAVING with ret: 3
<22> pv_read_all_pe_of_vg -- AFTER LOOP of pv_read_pe
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part5 with 1249 PE at 805A640 for PV #0
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part6 with 1215 PE at 805B9C8 for PV #1
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part7 with 476 PE at 8059A30 for PV #2
<22> pv_read_all_pe_of_vg -- /dev/ide/host0/bus0/target0/lun0/part4 with 490 PE at 805D478 for PV #3
<22> pv_read_all_pe_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pe_of_vg
<22> lv_read_all_lv -- CALLED
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part5"
<333> vg_read -- pv[1]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part6"
<333> vg_read -- pv[2]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part7"
<333> vg_read -- pv[3]->pv_name: "/dev/ide/host0/bus0/target0/lun0/part4"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/ide/host0/bus0/target0/lun0/part5
<666666> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<7777777> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> pv_read_already_red -- CALLED with PV /dev/ide/host0/bus0/target0/lun0/part5
<666666> pv_read_already_red -- LEAVING with ret: 1
<55555> pv_read -- going to read /dev/ide/host0/bus0/target0/lun0/part5
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING
<666666> pv_create_name_from_kdev_t -- CALLED with 3:5
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 15
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ide/host0/bus0/target0/lun0/part5
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- CALLED
<55555> vg_copy_from_disk -- LEAVING
<4444> vg_read_from_pv -- LEAVING with ret: 0
<333> vg_read -- LEAVING with ret: 0
<22> lv_read_all_lv -- lv_max: 256
<22> lv_read_all_lv -- BEFORE pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "warlock1"
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<22> lv_read_all_lv -- l: 256  nl: 5  vg_this->lv_cur: 5
<22> lv_read_all_lv -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 4  vg_this->pv_max: 256  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 256
<1> vg_read_with_pv_and_lv -- vg_this->lv[1]->lv_allocated_le: 1536
<1> vg_read_with_pv_and_lv -- vg_this->lv[2]->lv_allocated_le: 256
<1> vg_read_with_pv_and_lv -- vg_this->lv[3]->lv_allocated_le: 256
<1> vg_read_with_pv_and_lv -- vg_this->lv[4]->lv_allocated_le: 125
<22> vg_setup_pointers_for_snapshots -- CALLED
<22> vg_setup_pointers_for_snapshots -- LEAVING
<1> vg_read_with_pv_and_lv -- LEAVING with ret: 0
<1> lvm_tab_vg_insert -- CALLED with warlock1
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804B580  size: 1
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_vg_insert -- LEAVING with ret: 0
<1> vg_cfgbackup -- CALLED
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency_with_pv_and_lv -- CALLED
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency_all_pv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part5"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part6"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part7"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- CALLED with name: "/dev/ide/host0/bus0/target0/lun0/part4"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency_all_pv -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<333> lv_check_consistency_all_lv -- vg->lv[0]: 80623B0  name: /dev/warlock1/root
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/warlock1/root"
<666666> lvm_check_chars -- CALLED with name: "/dev/warlock1/root"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED with VG: warlock1
<7777777> lvm_check_chars -- CALLED with name: "warlock1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[1]: 80635F0  name: /dev/warlock1/usr
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/warlock1/usr"
<666666> lvm_check_chars -- CALLED with name: "/dev/warlock1/usr"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED with VG: warlock1
<7777777> lvm_check_chars -- CALLED with name: "warlock1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[2]: 8069830  name: /dev/warlock1/lib
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/warlock1/lib"
<666666> lvm_check_chars -- CALLED with name: "/dev/warlock1/lib"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED with VG: warlock1
<7777777> lvm_check_chars -- CALLED with name: "warlock1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[3]: 806AA70  name: /dev/warlock1/usrlocal
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/warlock1/usrlocal"
<666666> lvm_check_chars -- CALLED with name: "/dev/warlock1/usrlocal"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED with VG: warlock1
<7777777> lvm_check_chars -- CALLED with name: "warlock1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[4]: 806BCB0  name: /dev/warlock1/rootpart
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/warlock1/rootpart"
<666666> lvm_check_chars -- CALLED with name: "/dev/warlock1/rootpart"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED with VG: warlock1
<7777777> lvm_check_chars -- CALLED with name: "warlock1"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<333> lv_check_consistency_all_lv -- LEAVING with ret: 0
<22> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<1> vg_cfgbackup -- LEAVING with ret: 0
<1> vg_remove_dir_and_group_and_nodes -- CALLED
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_check_devfs -- CALLED
<22> lvm_check_devfs -- LEAVING with ret: 1
<1> vg_remove_dir_and_group_and_nodes -- LEAVING with ret: 0
<1> vg_create_dir_and_group_and_nodes -- CALLED
<22> vg_create_dir_and_group -- CALLED
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> lvm_check_devfs -- CALLED
<333> lvm_check_devfs -- LEAVING with ret: 1
<22> vg_create_dir_and_group -- LEAVING with ret: 0
<22> lv_create_node -- CALLED
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/warlock1/root"
<55555> lvm_check_chars -- CALLED with name: "/dev/warlock1/root"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> lvm_check_devfs -- CALLED
<333> lvm_check_devfs -- LEAVING with ret: 1
<22> lv_create_node -- LEAVING with 0
<22> lv_create_node -- CALLED
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/warlock1/usr"
<55555> lvm_check_chars -- CALLED with name: "/dev/warlock1/usr"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> lvm_check_devfs -- CALLED
<333> lvm_check_devfs -- LEAVING with ret: 1
<22> lv_create_node -- LEAVING with 0
<22> lv_create_node -- CALLED
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/warlock1/lib"
<55555> lvm_check_chars -- CALLED with name: "/dev/warlock1/lib"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> lvm_check_devfs -- CALLED
<333> lvm_check_devfs -- LEAVING with ret: 1
<22> lv_create_node -- LEAVING with 0
<22> lv_create_node -- CALLED
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/warlock1/usrlocal"
<55555> lvm_check_chars -- CALLED with name: "/dev/warlock1/usrlocal"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> lvm_check_devfs -- CALLED
<333> lvm_check_devfs -- LEAVING with ret: 1
<22> lv_create_node -- LEAVING with 0
<22> lv_create_node -- CALLED
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/warlock1/rootpart"
<55555> lvm_check_chars -- CALLED with name: "/dev/warlock1/rootpart"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: warlock1
<666666> lvm_check_chars -- CALLED with name: "warlock1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED with VG: warlock1
<55555> lvm_check_chars -- CALLED with name: "warlock1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> lvm_check_devfs -- CALLED
<333> lvm_check_devfs -- LEAVING with ret: 1
<22> lv_create_node -- LEAVING with 0
<1> vg_create_dir_and_group_and_nodes -- LEAVING with ret: 0
<1> vg_check_active -- CALLED with VG: warlock1
<22> vg_check_name -- CALLED with VG: warlock1
<333> lvm_check_chars -- CALLED with name: "warlock1"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: warlock1
<333> vg_check_name -- CALLED with VG: warlock1
<4444> lvm_check_chars -- CALLED with name: "warlock1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: 0
<1> vg_check_active -- LEAVING with ret: 1
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "warlock1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


--------------41CEE5DA16222B0ACA817BF1--
