Return-Path: <dparrish@excido.com>
Date: Mon, 29 Jan 2001 16:25:43 +1100 (EST)
From: David Parrish <dparrish@excido.com>
Message-ID: <Pine.LNX.4.21.0101291625150.29156-100000@mordor.parrish.org.au>
MIME-Version: 1.0
Subject: [linux-lvm] [CVS LVM Mon Jan 29 16:18:57 EST 2001] Device /dev/hdc1 doesn't
 exist
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm trying to get LVM going for the first, time.. I'm getting a few
errors, I've looked through the FAQs and can't find anything about these.

If this is a really stupid commonly found problem and it's just a stupid
luser doing it, please point me in the appropriate manual, otherwise,
any help would be appreciated.

LVM CVS checked out today Mon Jan 29 16:18:57 EST 2001





[root@mordor /root]# uname -a
Linux mordor.parrish.org.au 2.4.0-ac11 #7 Sat Jan 27 18:34:52 EST 2001 i686 unknown

[root@mordor /root]# vgscan -?

Logical Volume Manager 0.9
Heinz Mauelshagen, Sistina Software  13/11/2000  (IOP 10)

vgscan -- Volume Group Scan

Synopsis:
---------

vgscan
	[-d/--debug]
	[-h/-?/--help]
	[-v/--verbose]

[root@mordor /root]# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

[root@mordor /root]# pvcreate -v /dev/hdc1
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/hdc1"
pvcreate -- getting physical volume size
pvcreate -- device "/dev/hdc1" doesn't exist

[root@mordor /root]# fdisk /dev/hdc

The number of cylinders for this disk is set to 13328.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/hdc: 15 heads, 63 sectors, 13328 cylinders
Units = cylinders of 945 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdc1             1     13328   6297448+  8e  Linux LVM

Command (m for help): q

[root@mordor /root] pvcreate -d /dev/hdc1
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hdc1"
<22> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> pv_get_size -- CALLED with /dev/hdc1 and BFFFF8E0
<22> pv_check_name -- CALLED with "/dev/hdc1"
<333> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_name -- LEAVING with ret: 0
<22> pv_check_part -- CALLED with /dev/hdc1
<333> pv_check_name -- CALLED with "/dev/hdc1"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> lvm_dir_cache_find -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hdc1"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
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
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 10
<333> lvm_dir_cache_find -- LEAVING
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
<22> lvm_dir_cache -- LEAVING with ret: 10
<22> lvm_dir_cache_find -- CALLED
<333> pv_check_name -- CALLED with "/dev/hdc1"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdc1"
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
<333> lvm_dir_cache -- LEAVING with ret: 10
<22> lvm_dir_cache_find -- LEAVING
<1> pv_get_size -- LEAVING with ret: -236
pvcreate -- device "/dev/hdc1" doesn't exist

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0


-- 
David Parrish
Brainbench MVP for Linux
http://www.brainbench.com/

All men are mortal.  Socrates was mortal.  Therefore, all men are Socrates.
                -- Woody Allen
