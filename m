Return-Path: <clausen@conectiva.com.br>
Message-ID: <3A102693.F00BCA80@conectiva.com.br>
Date: Mon, 13 Nov 2000 15:36:19 -0200
From: Andrew Clausen <clausen@conectiva.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Linux crashed; PV died
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm sending this for Claudio Matsuoka, a friend of mine from Conectiva.
Due to the problem described below, he can't sent it himself :-(



After a solid lock on my system (probably due to a problem with the RTL
8139 driver), it seems that my PV disappeared. fdisk -l and pvscan
output follow (is pvscan looking for PVs in /dev/hdc only?). Any ideas
on how can I recover this system?

Kernel 2.4.0-test12, LVM 0.8final + all patches collected by Christoph
Hellwig:
 
kernel test12
lvm 0.8-final + all patches

Disk /dev/hda: 255 heads, 63 sectors, 1027 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1         4     32098+  83  Linux
/dev/hda2             5        86    658665   83  Linux
/dev/hda3            87      1027   7558582+  8e  Linux LVM


# pvscan -d -vv /dev/hda3
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 6
<1> pv_read_all_pv -- CALLED
<1> pv_read_all_pv -- calling lvm_dir_cache
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 0
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<22> lvm_dir_cache -- LEAVING with ret: 1
<1> pv_read_all_pv -- calling stat with "/dev/hdc"
<22> pv_read -- CALLED with /dev/hdc
<333> pv_check_name -- CALLED eith "/dev/hdc"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hdc
<4444> pv_check_name -- CALLED eith "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdc
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 22:0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 1
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdc
<22> pv_read -- LEAVING with ret: -255
<1> pv_read_all_pv -- pv_read returned: -255
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<1> pv_read_all_pv -- LEAVING with ret: 0
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- no valid physical volumes found
