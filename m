Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3S9lHO24053
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 05:47:17 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3S9lD7k029783
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 05:47:14 -0400
Received: from 113.red-83-49-30.pooles.rima-tde.net ([83.49.30.113]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DR5bo-0006yq-00
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 11:47:01 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DR5bW-0007j1-00
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 11:46:42 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] pvmove hangs
Date: Thu, 28 Apr 2005 11:46:41 +0200
Message-Id: <20050428094506.M1118@pk25.com>
In-Reply-To: <426F8DD4.1090801@nextra.ro>
References: <426F8DD4.1090801@nextra.ro>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

too much dificult for me, only have one idea, update lvm to last version and
check changelog for some updates about pvmove.

If you solve the problem, please sumarice.

Good Luck!

On Wed, 27 Apr 2005 16:04:20 +0300, Gergely Imre wrote
> let me 'restart' this thread. i ran into another problem. or it's 
> the same?
> 
> [root@test etc]# fdisk -l
> 
> Disk /dev/sda: 4294 MB, 4294967296 bytes
> 255 heads, 63 sectors/track, 522 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sda1               1          17      136521   82  Linux swap
> /dev/sda2   *          18         267     2008125   83  Linux
> /dev/sda3             268         392     1004062+  8e  Linux LVM
> /dev/sda4             393         522     1044225   8e  Linux LVM
> 
> i installed FC2 on sda2, i upgraded the kernel to 2.6.11.7, created 
> a VG and LV out of sda3+sda4, like this:
> 
> [root@test etc]# vgdisplay -v
>     Finding all volume groups
>     Finding volume group "test"
>   --- Volume group ---
>   VG Name               test
>   System ID
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  56
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               1.95 GB
>   PE Size               4.00 MB
>   Total PE              499
>   Alloc PE / Size       244 / 976.00 MB
>   Free  PE / Size       255 / 1020.00 MB
>   VG UUID               E012hQ-KRPN-ygZI-myIs-XfbV-68tt-6S44wH
> 
>   --- Logical volume ---
>   LV Name                /dev/test/root
>   VG Name                test
>   LV UUID                wqoG5m-X3Fn-Gsaj-8P9t-cSwS-AXi4-IJ5j2P
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                976.00 MB
>   Current LE             244
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:0
> 
>   --- Physical volumes ---
>   PV Name               /dev/sda3
>   PV UUID               1FWdvz-Bg30-VGNp-sq2P-HpD3-9x0t-s3QNAV
>   PV Status             allocatable
>   Total PE / Free PE    245 / 1
> 
>   PV Name               /dev/sda4
>   PV UUID               rwLsxX-3h8f-Z7tc-Jmgv-375C-RFvP-KnxNOj
>   PV Status             allocatable
>   Total PE / Free PE    254 / 254
> 
> so, practically the root LV is on sda3. i moved the system from sda2 
> to sda3, now the whole / is on /dev/mapper/test-root, and it's 
> working fine.
> 
> [root@test etc]# df -T
> Filesystem    Type   1K-blocks      Used Available Use% Mounted on
> /dev/mapper/test-root
>               ext3      983704    638908    294828  69% /
> none         tmpfs       63464         0     63464   0% /dev/shm
> 
> grub.conf:
> title Fedora Core (2.6.11.7)
>         root (hd0,1)
>         kernel /boot/vmlinuz-2.6.11.7 ro root=/dev/mapper/test-root
>         initrd /boot/initrd-2.6.11.7.img
> 
> so, the /boot directory stayed on /dev/sda2.
> 
> fstab:
> [root@test etc]# cat /etc/fstab
> /dev/mapper/test-root   /                       ext3    defaults     
>    1 1 none                    /dev/pts                devpts  gid=5,
> mode=620  0 0 none                    /dev/shm                tmpfs  
>  defaults        0 0 /dev/sda1               swap                    
> swap    defaults        . . .
> 
> so far so good. now let's say i want to remove sda3. to do this, i need
> to pvmove everything from sda3 to sda4. if i run
> 
> pvmove -vv /dev/sda3
> 
> i get the following:
> 
> [root@test root]# pvmove -vv /dev/sda3
>       Setting global/locking_type to 1
>       Setting global/locking_dir to /var/lock/lvm
>       File-based locking enabled.
>       /dev/sda3: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda1: No label detected
>       /dev/sda2: No label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>     Finding volume group "test"
>       Locking /var/lock/lvm/V_test WB
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>     Archiving volume group "test" metadata.
>     Creating logical volume pvmove0
>       Getting target version for mirror
>       Moving /dev/sda3:0-243 of test/root
>     Moving 244 extents of logical volume test/root
>       Finding volume group for uuid
> E012hQKRPNygZImyIsXfbV68tt6S44wHwqoG5mX3FnGsaj8P9tcSwSAXi4IJ5j2P
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>     Found volume group "test"
>       Setting activation/missing_stripe_filler to /dev/ioerror
>     Updating volume group metadata
>     Creating volume group backup "/etc/lvm/backup/test"
>       Finding volume group for uuid
> E012hQKRPNygZImyIsXfbV68tt6S44wHwqoG5mX3FnGsaj8P9tcSwSAXi4IJ5j2P
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>     Found volume group "test"
>       Locking memory
>       Suspending test-root
>       Finding volume group for uuid
> E012hQKRPNygZImyIsXfbV68tt6S44wH860Z8k3Rbibp4LTSyFNUkHANkOMh0qdK
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>       /dev/sda3: lvm2 label detected
>       /dev/sda4: lvm2 label detected
>     Found volume group "test"
>     Loading test-pvmove0
>       Setting activation/mirror_region_size to 512
> 
> and that's it... i wait around 20 minutes, nothing. no picture, no
> sound... i can't do anything, so i have to do a hard reset. there is 
> no disk activity whatsoever.
> 
> after the reset, i quickly log in, and i find (running lvs) that it's
> continuing the pvmove, like nothing happened:
> 
> lvs[root@test root]# lvs
>   LV      VG   Attr   LSize   Origin Snap%  Move      Copy%
>   pvmove0 test p-C-ao 976.00M               /dev/sda3  44.67
>   root    test -wI-ao 976.00M
> 
> i didn't run anything, still, pvmove continues. after a while it
> finishes, and it seems like everything is OK.
> 
> [root@test root]# lvs
>   LV   VG   Attr   LSize   Origin Snap%  Move Copy%
>   root test -wi-ao 976.00M
> [root@test root]#
> 
> [root@test root]# vgdisplay -v
>     Finding all volume groups
>     Finding volume group "test"
>   --- Volume group ---
>   VG Name               test
>   System ID
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  60
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               1.95 GB
>   PE Size               4.00 MB
>   Total PE              499
>   Alloc PE / Size       244 / 976.00 MB
>   Free  PE / Size       255 / 1020.00 MB
>   VG UUID               E012hQ-KRPN-ygZI-myIs-XfbV-68tt-6S44wH
> 
>   --- Logical volume ---
>   LV Name                /dev/test/root
>   VG Name                test
>   LV UUID                wqoG5m-X3Fn-Gsaj-8P9t-cSwS-AXi4-IJ5j2P
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                976.00 MB
>   Current LE             244
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:1
> 
>   --- Physical volumes ---
>   PV Name               /dev/sda3
>   PV UUID               1FWdvz-Bg30-VGNp-sq2P-HpD3-9x0t-s3QNAV
>   PV Status             allocatable
>   Total PE / Free PE    245 / 245
> 
>   PV Name               /dev/sda4
>   PV UUID               rwLsxX-3h8f-Z7tc-Jmgv-375C-RFvP-KnxNOj
>   PV Status             allocatable
>   Total PE / Free PE    254 / 10
> 
> now everything is on sda4, i could remove sda3. but here's the thing...
> i do a reboot, and i get the following error:
> 
> http://terran.noc.astral.ro/pvmove/boot.png
> 
> but if i give the root password, /dev/mapper/test-root is mounted, 
> and if i remount it read-write, it seems to be alright. but if i try 
> to fsck /dev/mapper/test-root, it still gives me this error 
> [root@test root]# fsck /dev/mapper/test-root fsck 1.35 (28-Feb-2004) 
> e2fsck 1.35 (28-Feb-2004) fsck.ext3: No such device or address while 
> trying to open /dev/mapper/test-root Possibly non-existent or swap device?
> [root@test root]#
> 
> i look in /dev/mapper:
> 
> [root@test root]# cd /dev/mapper
> [root@test mapper]# ll
> total 0
> crw-------  1 root root  10, 63 Apr 27 15:43 control
> brw-------  1 root root 253,  0 Apr 27 15:43 test-pvmove0
> brw-------  1 root root 253,  1 Apr 27 15:43 test-root
> [root@test mapper]#
> 
> it did not remove test-pvmove0, after finishing the move. another
> strange thing is that now test-root has major/minor 253,1 and
> test-pvmove0 has 253,0.
> 
> i removed test-*
> [root@test mapper]# rm test-pvmove0 test-root
> rm: remove block special file `test-pvmove0'? y
> rm: remove block special file `test-root'? y
> 
> then i did a lvm vgmknodes (i looked this up in /etc/rc.sysinit:)
> 
> [root@test mapper]# lvm vgmknodes
> [root@test mapper]# ls -la
> total 124
> drwxr-xr-x   2 root root    4096 Apr 27 15:59 .
> drwxr-xr-x  24 root root  118784 Apr 27 15:55 ..
> crw-------   1 root root  10, 63 Apr 27 15:43 control
> brw-------   1 root root 253,  0 Apr 27 15:59 test-root
> 
> it created the test-root node, but with major/minor 253,0, so now the
> fsck is working again:
> [root@test mapper]# fsck /dev/mapper/test-root
> fsck 1.35 (28-Feb-2004)
> e2fsck 1.35 (28-Feb-2004)
> /dev/mapper/test-root is mounted.
> 
> WARNING!!!  Running e2fsck on a mounted filesystem may cause
> SEVERE filesystem damage.
> 
> Do you really want to continue (y/n)? no
> 
> check aborted.
> 
> if i do a reboot now, everything is alright again, and in fact i got
> what i wanted, it moved everything from sda3 to sda4. but what about 
> all these problems?
> 
> it's not over yet :)
> now i want to move everything back to sda3. but this time i do a:
> 
> [root@test root]# mount / -o remount,noatime
> 
> then the moving:
> 
> [root@test root]# pvmove -v /dev/sda4
>     Finding volume group "test"
>     Archiving volume group "test" metadata.
>     Creating logical volume pvmove0
>     Moving 244 extents of logical volume test/root
>     Found volume group "test"
>     Updating volume group metadata
>     Creating volume group backup "/etc/lvm/backup/test"
>     Found volume group "test"
>     Found volume group "test"
>     Loading test-pvmove0
>     Found volume group "test"
>     Loading test-root
>     Checking progress every 15 seconds
>   /dev/sda4: Moved: 11.9%
>   /dev/sda4: Moved: 21.7%
>   /dev/sda4: Moved: 32.4%
>   /dev/sda4: Moved: 45.5%
>   /dev/sda4: Moved: 56.1%
>   /dev/sda4: Moved: 67.6%
>   /dev/sda4: Moved: 78.3%
>   /dev/sda4: Moved: 89.3%
>   /dev/sda4: Moved: 99.6%
>   /dev/sda4: Moved: 100.0%
>     Found volume group "test"
>     Found volume group "test"
>     Found volume group "test"
>     Loading test-pvmove0
>     Found volume group "test"
>     Loading test-root
>     Found volume group "test"
>     Found volume group "test"
>     Removing temporary pvmove LV
>     Writing out final volume group after pvmove
>     Creating volume group backup "/etc/lvm/backup/test"
> 
> during to move, i run lvs a couple of times, nothing unusual.
> 
> [root@test root]# lvs
>   LV      VG   Attr   LSize   Origin Snap%  Move      Copy%
>   pvmove0 test p-C-ao 976.00M               /dev/sda4  22.95
>   root    test -wI-ao 976.00M
> 
> but what is unusual, is this:
> 
> [root@test root]# cd /dev/mapper/
> [root@test mapper]# ll
> total 0
> crw-------  1 root root  10, 63 Apr 27 16:01 control
> brw-------  1 root root 253,  1 Apr 27 16:03 test-pvmove0
> brw-------  1 root root 253,  0 Apr 27 15:59 test-root
> [root@test mapper]#
> 
> now it created test-pvmove0 with 253,1, and it didn't touch test-
> root. and after pvmove was finished, it removed test-pvmove0 also. 
> now that i call a proper pvmove ;) i run vgdisplay just to be sure:
> 
> [root@test root]# vgdisplay -v
>     Finding all volume groups
>     Finding volume group "test"
>   --- Volume group ---
>   VG Name               test
>   System ID
>   Format                lvm2
>   Metadata Areas        2
>   Metadata Sequence No  63
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                2
>   Act PV                2
>   VG Size               1.95 GB
>   PE Size               4.00 MB
>   Total PE              499
>   Alloc PE / Size       244 / 976.00 MB
>   Free  PE / Size       255 / 1020.00 MB
>   VG UUID               E012hQ-KRPN-ygZI-myIs-XfbV-68tt-6S44wH
> 
>   --- Logical volume ---
>   LV Name                /dev/test/root
>   VG Name                test
>   LV UUID                wqoG5m-X3Fn-Gsaj-8P9t-cSwS-AXi4-IJ5j2P
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                976.00 MB
>   Current LE             244
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           253:0
> 
>   --- Physical volumes ---
>   PV Name               /dev/sda3
>   PV UUID               1FWdvz-Bg30-VGNp-sq2P-HpD3-9x0t-s3QNAV
>   PV Status             allocatable
>   Total PE / Free PE    245 / 1
> 
>   PV Name               /dev/sda4
>   PV UUID               rwLsxX-3h8f-Z7tc-Jmgv-375C-RFvP-KnxNOj
>   PV Status             allocatable
>   Total PE / Free PE    254 / 254
> 
> everything is in place (on sda3). sda4 is empty like it should.
> 
> could somebody explain this to me? what's happening here?
> 
> the box i was playing on is a vmware emulated comp (128MB ram, 4GB 
> hdd), with a buslogic scsi adapter. i installed fedora core 2 custom,
>  with no packages selected, after that i did a yum update. kernel 2.6.11.7
> vanilla, with no patches at all, compiled with minimum stuff. latest
> lvm2 and device-mapper.
> 
> output of ps:
> 
> [root@test root]# ps ax
>   PID TTY      STAT   TIME COMMAND
>     1 ?        S      0:02 init [3]
>     2 ?        SWN    0:00 [ksoftirqd/0]
>     3 ?        SW<    0:00 [events/0]
>     4 ?        SW<    0:00 [khelper]
>     9 ?        SW<    0:00 [kthread]
>    17 ?        SW<    0:00 [kblockd/0]
>    71 ?        SW     0:00 [pdflush]
>    72 ?        SW     0:00 [pdflush]
>    74 ?        SW<    0:00 [aio/0]
>    73 ?        SW     0:00 [kswapd0]
>   659 ?        SW     0:00 [kseriod]
>   694 ?        SW     0:00 [scsi_eh_0]
>   715 ?        SW<    0:00 [kcryptd/0]
>   716 ?        SW<    0:00 [kmirrord/0]
>   751 ?        SW     0:00 [kjournald]
>  1722 ?        S      0:00 syslogd -m 0
>  1726 ?        S      0:00 klogd -x
>  1749 ?        S      0:00 /usr/sbin/sshd
>  1761 ?        S      0:00 crond
>  1785 tty1     S      0:00 /sbin/mingetty tty1
>  1807 tty2     S      0:00 /sbin/mingetty tty2
>  1818 tty3     S      0:00 /sbin/mingetty tty3
>  1819 tty4     S      0:00 /sbin/mingetty tty4
>  1906 tty5     S      0:00 /sbin/mingetty tty5
>  1937 tty6     S      0:00 /sbin/mingetty tty6
>  1972 ?        R      0:00 sshd: root@pts/0
>  1974 pts/0    S      0:00 -bash
>  2010 ?        S      0:00 sshd: root@pts/1
>  2012 pts/1    S      0:00 -bash
>  2047 pts/0    R      0:00 ps ax
> 
> (sorry for the long mail;)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=======================================================================================
En tus apuros y afanes, acude a los refranes. 
=======================================================================================
