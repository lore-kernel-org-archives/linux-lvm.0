Return-Path: <harvell@americasm01.nt.com>
Date: Sat, 30 Dec 2000 00:07:05 -0600
Message-Id: <200012300607.AAA03772@smtprch2.nortelnetworks.com>
From: "Harvell, Joe [NGC:B828:EXCH]" <harvell@americasm01.nt.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] kernel oops when trying to extend volume group
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I get a kernel oops when I try to extend my volume group.  I reproduce the problem as follows:

vgscan
vgchange -a y root
vgextend -v root /dev/sda8 /dev/sdd7

I get the following output to stdout:

[root@regina jharvell]# vgextend -v root /dev/sda8 /dev/sdd7
vgextend -- locking logical volume manager
vgextend -- checking volume group name "root"
vgextend -- checking volume group "root" existence
vgextend -- checking for inactivity of volume group
vgextend -- reading data of volume group "root" from lvmtab
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- reading data for all physical volumes from disk(s)
vgextend -- extending VGDA structures of volume group "root"
vgextend -- volume group "root" will be extended by 2 new physical volumes
vgextend -- extending volume group "root" by physical volume "/dev/sda8" in kernel
Segmentation fault

and the following log on the console:


Dec 27 22:48:17 regina kernel: LVM version 0.9  by Heinz Mauelshagen  (13/11/2000)
Dec 27 22:48:17 regina kernel: lvm -- Module successfully initialized
Dec 27 22:50:40 regina kernel: Unable to handle kernel NULL pointer dereference at virtual address 0000002c
Dec 27 22:50:40 regina kernel:  printing eip:
Dec 27 22:50:40 regina kernel: e08f9d9f
Dec 27 22:50:40 regina kernel: *pde = 00000000
Dec 27 22:50:40 regina kernel: Oops: 0000
Dec 27 22:50:40 regina kernel: CPU:    0
Dec 27 22:50:40 regina kernel: EIP:    0010:[<e08f9d9f>]
Dec 27 22:50:40 regina kernel: EFLAGS: 00010246
Dec 27 22:50:40 regina kernel: eax: 00002f2f   ebx: 00000000   ecx: d818f000   edx: 00000000
Dec 27 22:50:40 regina kernel: esi: 0000002c   edi: 0000002c   ebp: 0000002f   esp: dad0dd60
Dec 27 22:50:40 regina kernel: ds: 0018   es: 0018   ss: 0018
Dec 27 22:50:40 regina kernel: Process vgextend (pid: 24034, stackpage=dad0d000)
Dec 27 22:50:40 regina kernel: Stack: 080513d8 e08f80f8 d818f000 00000000 4004fe03 4004fe03 e08f7bab d818f000 
Dec 27 22:50:40 regina kernel:        00000000 080513d8 d818f000 00000002 080513d8 de68ca40 e08f5703 d818f000 
Dec 27 22:50:40 regina kernel:        080513d8 cd3d9c00 080513d8 d3e7e540 c0122d76 c72eb000 c1890a98 00000000 
Dec 27 22:50:40 regina kernel: Call Trace: [<e08f80f8>] [<e08f7bab>] [<e08f5703>] [do_anonymous_page+70/128] [llc_oui+4049/4593] [llc_oui+4049/4593] [iget4+192/208] 
Dec 27 22:50:40 regina kernel:        [vsprintf+807/864] [sr_mod:__insmod_sr_mod_O/lib/modules/2.4.0-test11/kernel/drivers/s+-100656/96] [sr_mod:__insmod_sr_mod_O/lib/modules/2.4.0-test11/kernel/drivers/s+-100507/96] [timer_bh+539/608] [timer_interrupt+133/256] [cached_lookup+14/80] [path_walk+1855/2080] [chrdev_open+54/64] 
Dec 27 22:50:40 regina kernel:        [dentry_open+189/320] [filp_open+73/96] [getname+90/160] [sys_ioctl+374/400] [system_call+51/56] 
Dec 27 22:50:40 regina kernel: Code: ac 38 e0 75 03 8d 56 ff 84 c0 75 f4 ff b1 f4 08 00 00 89 d5 

The only modification I had to make to the lvm 0.9 source code (so that it would compile) was to change line 79 from:

#define	LVM_HD_NAME /* display nice names in /proc/partitions */

to:

#undef	LVM_HD_NAME /* display nice names in /proc/partitions */


kernel: 2.4.0-test11
lvm: 0.9 (module)
lvm configuration:

[root@regina jharvell]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda7"  of VG "root" [1 GB / 0 free]
pvscan -- inactive PV "/dev/sda8"  is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sda9"  is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sda10" is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sda11" is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sda14" is in no VG  [215.98 MB]
pvscan -- inactive PV "/dev/sdb8"  is in no VG  [1000.98 MB]
pvscan -- ACTIVE   PV "/dev/sdd6"  of VG "root" [1 GB / 0 free]
pvscan -- inactive PV "/dev/sdd7"  is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sdd8"  is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sdd9"  is in no VG  [1 GB]
pvscan -- inactive PV "/dev/sdd11" is in no VG  [216.98 MB]
pvscan -- total: 12 [10.41 GB] / in use: 2 [2 GB] / in no VG: 10 [8.41 GB]

root@regina jharvell]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "root"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual VGDA backup of your volume group

[root@regina jharvell]# lvscan
lvscan -- ACTIVE           "/dev/root/opt" [2 GB] striped[2]
lvscan -- 1 logical volumes with 2 GB total in 1 volume group
lvscan -- 1 active logical volumes

[root@regina jharvell]# cat /proc/lvm/global
LVM module version 0.9 (13/11/2000)

Total:  1 VG  2 PVs  1 LV (0 LVs open)
Global: 12431 bytes malloced   IOP version: 10   0:02:41 active

VG:  root  [2 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 2097152 /512 total  2097152 /512 used  0 /0 free
  PVs: [AA] sda7                   1048576 /256      1048576 /256            0 /0     
       [AA] sdd6                   1048576 /256      1048576 /256            0 /0     
    LV:  [AWDS2 ] opt                        2097152 /512      close
