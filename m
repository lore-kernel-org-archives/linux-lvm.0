Return-Path: <root@case.toyota.com>
From: root <root@case.toyota.com>
Message-Id: <200102051822.f15IMHW01674@case.toyota.com>
Date: Mon, 5 Feb 2001 10:22:17 -0800 (PST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm buglet in 0.9.1_beta
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

Hi All,

I am seeing a buglet with recent lvm (0.9.1_betax) and Compaq "smart" 
controllers. The lvm is functional, but the reporting is buggy; 
specifically, lvmdiskscan reports that no valid disks/partitions are 
found, despite the fact that there are functional logical volumes.

Perhaps the problems is the non-conventional disk enumeration
scheme with the compaq cxontroller, "df" looks like this:

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ida/c0d0p1        1007928    220196    736532  24% /
/dev/ida/c0d0p8        2015904    251196   1662304  14% /home
/dev/ida/c0d0p7        1007928       240    956488   1% /opt
/dev/ida/c0d0p9        4031856   1660688   2166356  44% /usr
/dev/ida/c0d0p3        2015920     56232   1857280   3% /var
/dev/lxlvm/lvm1        3225352   1879936   1181576  62% /disks/backup

In accordance with the recommendation of folks onm lkml, I have
included the outputs of "cat /proc/partitions" and "lvmdiskscan -d" 

Thanks for your support, more info available if desired.

major minor  #blocks  name

  72     0   17768400 ida/c0d0
  72     1    1024064 ida/c0d0p1
  72     2     514080 ida/c0d0p2
  72     3    2048160 ida/c0d0p3
  72     4          1 ida/c0d0p4
  72     5     514064 ida/c0d0p5
  72     6     514064 ida/c0d0p6
  72     7    1024064 ida/c0d0p7
  72     8    2048144 ida/c0d0p8
  72     9    4096304 ida/c0d0p9
  72    10    5985344 ida/c0d0p10
  58     0    3276800 lvma

<1> lvm_dir_cache -- CALLED
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<22> lvm_add_dir_cache -- CALLED
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache_hit -- CALLED
<333> lvm_dir_cache_hit -- LEAVING with ret: 0
<22> lvm_add_dir_cache -- LEAVING
<1> lvm_dir_cache -- LEAVING with ret: 11
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> pv_get_size -- CALLED with /dev/ida/c0d0 and BFFFF8A8
<22> pv_check_name -- CALLED with "/dev/ida/c0d0"
<333> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_part -- CALLED with /dev/ida/c0d0
<333> pv_check_name -- CALLED with "/dev/ida/c0d0"
<4444> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ida/c0d0"
<55555> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 11
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_check_part -- LEAVING with -231
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<22> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED with "/dev/ida/c0d0"
<4444> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- LEAVING
<22> lvm_check_partitioned_dev -- CALLED
<22> lvm_check_partitioned_dev -- LEAVING
<1> pv_get_size -- BEFORE llseek 0:0
<1> pv_get_size -- part[0].sys_ind: 83  part[0].nr_sects: 2048128
<1> pv_get_size -- first == 1
<1> pv_get_size -- part_i == part_i_tmp
<1> pv_get_size -- LEAVING with ret: 2048128
<1> pv_check_part -- CALLED with /dev/ida/c0d0
<22> pv_check_name -- CALLED with "/dev/ida/c0d0"
<333> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED with "/dev/ida/c0d0"
<4444> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- LEAVING
<22> lvm_partition_count -- CALLED
<22> lvm_partition_count -- LEAVING with ret: 16
<1> pv_check_part -- LEAVING with -231
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> pv_get_size -- CALLED with /dev/ida/c0d0p1 and BFFFF8A8
<22> pv_check_name -- CALLED with "/dev/ida/c0d0p1"
<333> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0p1"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_part -- CALLED with /dev/ida/c0d0p1
<333> pv_check_name -- CALLED with "/dev/ida/c0d0p1"
<4444> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0p1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/ida/c0d0p1"
<55555> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0p1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 11
<333> lvm_dir_cache_find -- LEAVING
<333> lvm_partition_count -- CALLED
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_check_part -- LEAVING with 1
<22> lvm_dir_cache -- CALLED
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<333> lvm_add_dir_cache -- CALLED
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache_hit -- CALLED
<4444> lvm_dir_cache_hit -- LEAVING with ret: 1
<333> lvm_add_dir_cache -- LEAVING
<22> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED with "/dev/ida/c0d0p1"
<4444> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0p1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 11
<22> lvm_dir_cache_find -- LEAVING
<22> lvm_check_partitioned_dev -- CALLED
<22> lvm_check_partitioned_dev -- LEAVING
<1> pv_get_size -- BEFORE llseek 0:0
<1> pv_get_size -- LEAVING with ret: 2048128
<1> lvm_show_size -- CALLED
<1> lvm_show_size -- LEAVING
<1> pv_read -- CALLED with /dev/ida/c0d0p1
<22> pv_check_name -- CALLED with "/dev/ida/c0d0p1"
<333> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0p1"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_read_already_red -- CALLED
<22> pv_read_already_red -- LEAVING with ret: 0
<22> pv_flush -- CALLED to flush /dev/ida/c0d0p1
<333> pv_check_name -- CALLED with "/dev/ida/c0d0p1"
<4444> lvm_check_chars -- CALLED with name: "/dev/ida/c0d0p1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_flush -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/ida/c0d0p1
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<22> pv_copy_from_disk -- CALLED
<22> pv_copy_from_disk -- LEAVING
<22> pv_create_name_from_kdev_t -- CALLED with 72:1
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 11
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/ida/c0d0p1
<1> pv_read -- LEAVING with ret: -268
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_check_partitioned_dev -- CALLED
<1> lvm_check_partitioned_dev -- LEAVING
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
<1> lvm_partition_count -- CALLED
<1> lvm_partition_count -- LEAVING with ret: 16
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/ida/c0d0p1  [    1000.06 MB] free whole disk
lvmdiskscan -- no valid disks / partitions found
lvmdiskscan -- please check your disk device special files!
