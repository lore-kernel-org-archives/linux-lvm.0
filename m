Date: Mon, 27 Aug 2001 23:46:36 -0700
From: Shane Wegner <shane@cm.nu>
Message-ID: <20010827234636.A4171@cm.nu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] No pv after boot
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I'm having trouble bringing up my LVM setup here after a
reboot.  I've tried 0.9.1b7, 1.0 and 1.0.1-rc1 patches and
tools match.  I believe my version is 2 but I am not sure
how to check that.  The kernel used it 2.2.19.

continuum:~# pvscan
pvscan -- reading all physical volumes (this may take a
while...)
pvscan -- ERROR "pv_read(): PV identifier invalid" reading
physical volumes

continuum:~#

The pvscan --debug looks like this.

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> pv_read_all_pv -- CALLED
<1> pv_read_all_pv -- calling lvm_dir_cache
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED with /dev/hda2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<333> lvm_add_dir_cache -- CALLED with /dev/hdg1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING with ret: ADDED
<1> pv_read_all_pv -- calling stat with "/dev/hda2"
<22> pv_read -- CALLED with /dev/hda2
<333> pv_check_name -- CALLED with "/dev/hda2"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/hda2
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hda2
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x804ff38
<333> pv_create_name_from_kdev_t -- CALLED with 3:2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 36
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda2
<22> pv_read -- LEAVING with ret: -269
<1> pv_read_all_pv -- pv_read returned: -269
"
<22> pv_read -- CALLED with /dev/hdg1
<333> pv_check_name -- CALLED with "/dev/hdg1"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdg1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/hdg1
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hdg1
<4444> pv_check_name -- CALLED with "/dev/hdg1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdg1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdg1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x8051ab8
<333> pv_create_name_from_kdev_t -- CALLED with 34:1
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 36
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdg1
<22> pv_read -- LEAVING with ret: -269
<1> pv_read_all_pv -- pv_read returned: -269
<1> pv_read_all_pv -- calling stat with "/dev/hdg2"
<22> pv_read -- CALLED with /dev/hdg2
<333> pv_check_name -- CALLED with "/dev/hdg2"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdg2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED with PV /dev/hdg2
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hdg2
<4444> pv_check_name -- CALLED with "/dev/hdg2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdg2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdg2
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING ret = 0x8050930
<333> pv_create_name_from_kdev_t -- CALLED with 34:2
<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 36
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdg2
<22> pv_read -- LEAVING with ret: -268
<1> pv_read_all_pv -- pv_read returned: -268
<1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<1> pv_read_all_pv -- LEAVING with ret: -268
<1> lvm_error -- CALLED with: -268
<1> lvm_error -- LEAVING with: "pv_read(): PV identifier invalid"
pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volumes

pvscan -- reading all physical volumes (this may take a while...)

If anyone knows how I can correct this or at least recover
the data, I would be greatful.

Thanks in advance,
Shane

-- 
Shane Wegner: shane@cm.nu
              http://www.cm.nu/~shane/
PGP:          1024D/FFE3035D
              A0ED DAC4 77EC D674 5487
              5B5C 4F89 9A4E FFE3 035D
