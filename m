Message-Id: <3C551D0D.DF331C04@coventive.com>
From: Mozo Hu <mozo@coventive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Dose LVM really work with NBD/ENBD ?
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
Date: Mon Jan 28 03:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I've tried for several days to make LVM work

with NBD, but didn't get the expected result.

The old posts said LVM actually support NBD

before "0.8final", and does it still now?

Thanks.

--------- some messages from lvcreate -d

....

<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 6
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 30
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: (null)

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
<1> pv_read -- LEAVING with ret: -278
<1> pv_check_active -- CALLED
<22> pv_status -- CALLED with VG , PV: "/dev/nda1"
<333> vg_check_name -- CALLED with VG:
<4444> lvm_check_chars -- CALLED with name: ""
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_check_name -- CALLED with "/dev/nda1"
<4444> lvm_check_chars -- CALLED with name: "/dev/nda1"
<4444> lvm_check_chars -- LEAVING with ret: 0

....

<55555> lvm_get_device_type leaving with 6
<4444> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 1
<22> pv_check_consistency -- LEAVING with ret: 0
<22> lvm_check_uuid -- CALLED with uuidstr: "CClwdbfh6e0PdP92plh2qoZIUasJxFvJ"
<22> lvm_check_uuid -- LEAVING with ret: 0
<22> pv_copy_to_disk -- CALLED
<22> pv_copy_to_disk -- LEAVING
<1> pv_write -- LEAVING with ret: 0
pvcreate -- physical volume "/dev/nda1" successfully created
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104

-- One cannot think beyond his vocabulary. --
Chung-Hsien Hu <mozo@coventive.com>
Assistant Manager R&D Div. at Coventive Technologies. <www.coventive.com>
