Return-Path: <root@srv.sistina.com>
Date: Mon, 29 Jan 2001 16:34:32 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] [CVS LVM Mon Jan 29 16:18:57 EST 2001] Device /dev/hdc1 doesn'texist
Message-ID: <20010129163432.J8567@srv.sistina.com>
References: <Pine.LNX.4.21.0101291625150.29156-100000@mordor.parrish.org.au>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0101291625150.29156-100000@mordor.parrish.org.au>; from dparrish@excido.com on Mon, Jan 29, 2001 at 04:25:43PM +1100
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
To: linux-lvm@Sistina.com

Hi David,

did you check that your /dev entries are setup correctly?
The error returned by pv_get_size() makes me believe that there could be
something wrong.

In special they should look like:

brw-rw----   1 root     disk      22,   0 Mar 11  2000 /dev/hdc
brw-rw----   1 root     disk      22,   1 Mar 11  2000 /dev/hdc1
brw-rw----   1 root     disk      22,  10 Mar 11  2000 /dev/hdc10
brw-rw----   1 root     disk      22,  11 Mar 11  2000 /dev/hdc11
brw-rw----   1 root     disk      22,  12 Mar 11  2000 /dev/hdc12
brw-rw----   1 root     disk      22,  13 Mar 11  2000 /dev/hdc13
brw-rw----   1 root     disk      22,  14 Mar 11  2000 /dev/hdc14
brw-rw----   1 root     disk      22,  15 Mar 11  2000 /dev/hdc15
brw-rw----   1 root     disk      22,   2 Mar 11  2000 /dev/hdc2
brw-rw----   1 root     disk      22,   3 Mar 11  2000 /dev/hdc3
brw-rw----   1 root     disk      22,   4 Mar 11  2000 /dev/hdc4
brw-rw----   1 root     disk      22,   5 Mar 11  2000 /dev/hdc5
brw-rw----   1 root     disk      22,   6 Mar 11  2000 /dev/hdc6
brw-rw----   1 root     disk      22,   7 Mar 11  2000 /dev/hdc7
brw-rw----   1 root     disk      22,   8 Mar 11  2000 /dev/hdc8
brw-rw----   1 root     disk      22,   9 Mar 11  2000 /dev/hdc9

for /dev/hdc.


On Mon, Jan 29, 2001 at 04:25:43PM +1100, David Parrish wrote:
> I'm trying to get LVM going for the first, time.. I'm getting a few
> errors, I've looked through the FAQs and can't find anything about these.
> 
> If this is a really stupid commonly found problem and it's just a stupid
> luser doing it, please point me in the appropriate manual, otherwise,
> any help would be appreciated.
> 
> LVM CVS checked out today Mon Jan 29 16:18:57 EST 2001
> 
> 
> 
> 
> 
> [root@mordor /root]# uname -a
> Linux mordor.parrish.org.au 2.4.0-ac11 #7 Sat Jan 27 18:34:52 EST 2001 i686 unknown
> 
> [root@mordor /root]# vgscan -?
> 
> Logical Volume Manager 0.9
> Heinz Mauelshagen, Sistina Software  13/11/2000  (IOP 10)
> 
> vgscan -- Volume Group Scan
> 
> Synopsis:
> ---------
> 
> vgscan
> 	[-d/--debug]
> 	[-h/-?/--help]
> 	[-v/--verbose]
> 
> [root@mordor /root]# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> [root@mordor /root]# pvcreate -v /dev/hdc1
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/hdc1"
> pvcreate -- getting physical volume size
> pvcreate -- device "/dev/hdc1" doesn't exist
> 
> [root@mordor /root]# fdisk /dev/hdc
> 
> The number of cylinders for this disk is set to 13328.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., old versions of LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)
> 
> Command (m for help): p
> 
> Disk /dev/hdc: 15 heads, 63 sectors, 13328 cylinders
> Units = cylinders of 945 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdc1             1     13328   6297448+  8e  Linux LVM
> 
> Command (m for help): q
> 
> [root@mordor /root] pvcreate -d /dev/hdc1
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> pv_check_name -- CALLED with "/dev/hdc1"
> <22> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <22> lvm_check_dev -- LEAVING with ret: 1
> <1> pv_check_name -- LEAVING with ret: 0
> <1> pv_get_size -- CALLED with /dev/hdc1 and BFFFF8E0
> <22> pv_check_name -- CALLED with "/dev/hdc1"
> <333> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <22> pv_check_part -- CALLED with /dev/hdc1
> <333> pv_check_name -- CALLED with "/dev/hdc1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> lvm_dir_cache_find -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/hdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 0
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 10
> <333> lvm_dir_cache_find -- LEAVING
> <22> pv_check_part -- LEAVING with -231
> <22> lvm_dir_cache -- CALLED
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 1
> <333> lvm_add_dir_cache -- LEAVING
> <22> lvm_dir_cache -- LEAVING with ret: 10
> <22> lvm_dir_cache_find -- CALLED
> <333> pv_check_name -- CALLED with "/dev/hdc1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/hdc1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 10
> <22> lvm_dir_cache_find -- LEAVING
> <1> pv_get_size -- LEAVING with ret: -236
> pvcreate -- device "/dev/hdc1" doesn't exist
> 
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> 
> 
> -- 
> David Parrish
> Brainbench MVP for Linux
> http://www.brainbench.com/
> 
> All men are mortal.  Socrates was mortal.  Therefore, all men are Socrates.
>                 -- Woody Allen
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
