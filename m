From: Paul Jakma <paul@clubi.ie>
Message-ID: <Pine.LNX.4.56.0401020338570.1343@fogarty.jakma.org>
MIME-Version: 1.0
Subject: [linux-lvm] AWOL LV's
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
Date: Thu Jan  1 21:42:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM list <linux-lvm@sistina.com>

Hi,

Recently I rebooted a server running Linux 2.4.22-pre7 with RedHat's
LVM 1.0.3 RPM. Once the machine had come up, 2 LVs which had existed 
previously had simply disappeared, no trace of them.

I have run pvscan and lvscan, with and without the -D flag, to no 
avail, also upgraded to lvm 1.0.4 and tried again, but no joy, 2 
LVs are just gone. 

eg lvscan:

lvscan
lvscan -- ACTIVE            "/dev/Main_VG/var_lv" [500 MB]
lvscan -- ACTIVE            "/dev/Main_VG/irix_tmp_lv" [1 GB]
lvscan -- ACTIVE            "/dev/Main_VG/usr_i386_lv" [2.44 GB]
lvscan -- ACTIVE            "/dev/Main_VG/squid_cache_lv" [900 MB]
lvscan -- ACTIVE            "/dev/Main_VG/usr_src_lv" [1.17 GB]
lvscan -- ACTIVE            "/dev/Main_VG/var_tmp_lv" [400 MB]
lvscan -- ACTIVE            "/dev/Main_VG/var_cdfs_lv" [1.44 GB]
lvscan -- ACTIVE            "/dev/Main_VG/pgsql_lv" [200 MB]
lvscan -- ACTIVE            "/dev/Main_VG/mp3_lv" [9.74 GB]
lvscan -- ACTIVE            "/dev/Main_VG/usr_local_lv" [1.52 GB]
lvscan -- ACTIVE            "/dev/Main_VG/irix_mips_lv" [1.66 GB]
lvscan -- ACTIVE            "/dev/Main_VG/www_lv" [472 MB]
lvscan -- ACTIVE            "/dev/Main_VG/apt_cache_lv" [1.03 GB]
lvscan -- ACTIVE            "/dev/Main_VG/home_lv" [4.79 GB]
lvscan -- ACTIVE            "/dev/Main_VG/pics_lv" [2 GB]
lvscan -- ACTIVE            "/dev/Main_VG/usr_i386_client_lv" [2.50 GB]
lvscan -- 16 logical volumes with 31.70 GB total in 1 volume group
lvscan -- 16 active logical volumes

pvscan:

pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md1"       of VG "Main_VG" [16.36 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/rd/c0d0p4" of VG "Main_VG" [2.63 GB / 276 MB free]
pvscan -- ACTIVE   PV "/dev/rd/c0d0p5" of VG "Main_VG" [9.77 GB / 572 MB free]
pvscan -- ACTIVE   PV "/dev/rd/c0d0p6" of VG "Main_VG" [3.95 GB / 176 MB free]
pvscan -- total: 4 [32.72 GB] / in use: 4 [32.72 GB] / in no VG: 0 [0]

There is a discrepancy there, lvscan reports 31.70GB, pvscan 32.72 - 
but i'm assuming this is due to metadata overhead.

Where could these LVs have gone to? Its seems I have information on 
one of the missing LVs in cfgdata backups:

[root@hibernia lvmconf]# grep kits *  
Binary file Main_VG.conf.5.old matches
Binary file Main_VG.conf.6.old matches
Binary file Main_VG.conf.7.old matches
Binary file Main_VG.conf.8.old matches
Binary file Main_VG.conf.9.old matches

Though, grepping for the name of the other LV (freeware) doesnt show 
anything. Sadly, the kits LV isnt the important one. :(

Is there anyway to try recover these LVs? Eg, how can I use the
config backup? (i'm afraid to restore it, as i dont want to kill off
LVs created since the old metadata config backup). And is there any 
way to find the other LV? (there's an NFS client wondering where its 
/usr/freeware mount is gone :) ).

And finally, how the hell did these LVs just dissappear? (and yes, I 
will be making cfgbackup's before and after lvcreate's from now on. 
:( ). Is this a known bug?

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org	Key ID: 64A2FF6A
	warning: do not ever send email to spam@dishone.st
Fortune:
Put your best foot forward.  Or just call in and say you're sick.
