Date: Wed, 23 Aug 2000 22:43:00 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000823224300.E8398@gospelcom.net>
References: <20000823194847.D8398@gospelcom.net> <200008240002.e7O02bo03155@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <200008240002.e7O02bo03155@webber.adilger.net>; from adilger@turbolinux.com on Wed, Aug 23, 2000 at 06:02:37PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

also sprach adilger:
> Have you tried running "pvcreate -v -d /dev/md0"?  It may be that you
> get some more clues with this.  Maybe even strace of the above.  It
> looks like pvcreate is not getting the correct "dev" or "rdev" from the
> inode...

I ran ``strace -o pv.strace -ff -s 100 -v pvcreate -d -v /dev/md0 > pv.out
2>pv.debug''. I've attached the three output files (gzip'd for pv.strace).

The problem occurs in pv_get_size() starting around line 87. The device name
is looked up in the cache. If found, it is tested to be a partitioned device
or not. This call returns false for the /dev/md? devices; MD_MAJOR is not
listed as a valid major number for partitioned devices (rightly so, I
think).

Since lvm_check_partitioned_dev() returns FALSE, the for loop is never
executed, and ``i'' remains at the value to which it was initialized (0) on
line 50. However, i is then used at line 103 to get the device name:

  strncpy ( disk_dev_name, dir_cache[i].dev_name, sizeof ( disk_dev_name) - 1);

This obviously assumes we're dealing solely with partitioned devices, which
in my case I'm not. Since i=0, dir_cache[i].dev_name is the name of the
first device: /dev/sda. The strace provides evidence of this:

  write(2, "lvm_check_partitioned_dev -- LEAVING\n", 37) = 37
  open("/dev/sda", O_RDONLY)              = 5

Everywhere else in the strace references /dev/md0, which is what I used on
the cmdline.

Do these files help any?

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
"I don't know why, but first C programs tend to look a lot worse than
first programs in any other language (maybe except for fortran, but then
I suspect all fortran programs look like `firsts')"
(By Olaf Kirch)


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pv.out"

pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/md0"
pvcreate -- getting physical volume size
pvcreate -- checking partition type

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pv.debug"

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 6
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED eith "/dev/md0"
<22> lvm_check_chars -- CALLED with name: "/dev/md0"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/md0 and BFFFF76C
<22> pv_check_name -- CALLED eith "/dev/md0"
<333> lvm_check_chars -- CALLED with name: "/dev/md0"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_part -- CALLED with /dev/md0
<333> pv_check_name -- CALLED eith "/dev/md0"
<4444> lvm_check_chars -- CALLED with name: "/dev/md0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED eith "/dev/md0"
<55555> lvm_check_chars -- CALLED with name: "/dev/md0"
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
<4444> lvm_dir_cache -- LEAVING with ret: 20
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_check_part -- LEAVING with -218
<22> lvm_dir_cache -- CALLED
<22> lvm_dir_cache -- LEAVING with ret: 20
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED eith "/dev/md0"
<4444> lvm_check_chars -- CALLED with name: "/dev/md0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 20
<22> lvm_dir_cache_find -- LEAVING
<22> lvm_check_partitioned_dev -- CALLED
<22> lvm_check_partitioned_dev -- LEAVING
<1> pv_get_size -- BEFORE llseek 0:0
<1> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 32067
<1> pv_get_size -- first == 1
<1> pv_get_size -- part_i == part_i_tmp
<1> pv_get_size -- LEAVING with ret: 32067
pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

--pf9I7BMVVzbSWLtt
Content-Type: application/x-gzip
Content-Disposition: attachment; filename="pv.strace.gz"
Content-Transfer-Encoding: base64

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
L4l2/YcgKuSXr1/9H2XgVdPAKQEA

--pf9I7BMVVzbSWLtt--
