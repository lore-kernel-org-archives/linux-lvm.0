Date: Mon, 12 Jun 2000 19:25:43 +0200
From: Luca Berra <bluca@comedia.it>
Subject: [linux-lvm] RAID+LVM+DEVFS+2.4.0-test1=BUG???
Message-ID: <20000612192543.A24143@colombina.comedia.it>
Reply-To: bluca@comedia.it
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii


hello i am having problems with the lvm tools on the setup
i mentioned in the subject, as you can see from the traces attached
if i do pvcreate /dev/md2, it looks up geometry from the first scsi disk
and fails since the second partition there is an extended partition
if i do pvcreate /dev/md/2 it fails nevertheless with a different error

any ideas?

Regards,
L.
-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=trace_pvcreate_dev_md2

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 6
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED eith "/dev/md2"
<22> lvm_check_chars -- CALLED with name: "/dev/md2"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/md2 and BFFFF7E4
<22> pv_check_name -- CALLED eith "/dev/md2"
<333> lvm_check_chars -- CALLED with name: "/dev/md2"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_part -- CALLED with /dev/md2
<333> pv_check_name -- CALLED eith "/dev/md2"
<4444> lvm_check_chars -- CALLED with name: "/dev/md2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED eith "/dev/md2"
<55555> lvm_check_chars -- CALLED with name: "/dev/md2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 24
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_check_part -- LEAVING with 2
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 24
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED eith "/dev/md2"
<4444> lvm_check_chars -- CALLED with name: "/dev/md2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 24
<22> lvm_dir_cache_find -- LEAVING
<22> lvm_check_partitioned_dev -- CALLED
<22> lvm_check_partitioned_dev -- LEAVING
<1> pv_get_size -- BEFORE llseek 0:0
<1> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 16352
<1> pv_get_size -- first == 1
<1> pv_get_size -- part[1].sys_ind: 5  part[1].nr_sects: 8450048
<1> pv_get_size -- DOS/LINUX/WIN98_EXTENDED_PARTITION
<1> pv_get_size -- part_i == part_i_tmp
<1> pv_get_size -- LEAVING with ret: 8450048
pvcreate -- can't use DOS extended partition "/dev/md2"

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=trace_pvcreate_dev_md_2

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 6
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED eith "/dev/md/2"
<22> lvm_check_chars -- CALLED with name: "/dev/md/2"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/md/2 and BFFFF7E4
<22> pv_check_name -- CALLED eith "/dev/md/2"
<333> lvm_check_chars -- CALLED with name: "/dev/md/2"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_part -- CALLED with /dev/md/2
<333> pv_check_name -- CALLED eith "/dev/md/2"
<4444> lvm_check_chars -- CALLED with name: "/dev/md/2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED eith "/dev/md/2"
<55555> lvm_check_chars -- CALLED with name: "/dev/md/2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 24
<333> lvm_dir_cache_find -- LEAVING
<22> pv_check_part -- LEAVING with -218
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 24
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED eith "/dev/md/2"
<4444> lvm_check_chars -- CALLED with name: "/dev/md/2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 24
<22> lvm_dir_cache_find -- LEAVING
<1> pv_get_size -- LEAVING with ret: -223
pvcreate -- device "/dev/md/2" doesn't exist

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

--+QahgC5+KEYLbs62--
