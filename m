Message-Id: <1010343969.3c38a0214056f@www.snappymail.ca>
From: IpSo <ipso@snappymail.ca>
Subject: Re: [linux-lvm] VG dissappeared without a trace?
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
In-Reply-To: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sun Jan  6 13:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

A follow up to this, I downloaded uuid_fixer to see if it would help, here's
what I tried:

[root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6
Error: number of PVs passed in does not match number of PVs in /dev/hda6's VG
       1 PVs were passed in and 2 were expected.


[root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6
Error: number of PVs passed in does not match number of PVs in /dev/hdb6's VG
       2 PVs were passed in and 3 were expected.

Hrmm, so it must be looking for the partition I deleted on /dev/hdc. :( I
re-created the partition just to see:

[root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6 /dev/hdc1
Error: number of PVs passed in does not match number of PVs in /dev/hda6's VG
       3 PVs were passed in and 2 were expected.

Figures. I guess I don't have a backup of the vgcfg when /dev/hda6 was all alone
in the VG "quantum". Thats the last time it was working correctly. :(

Quoting IpSo <ipso@snappymail.ca>:

> I was trying to extend my LVM partition to another disk, but being late and
> my
> head not screwed on straight, things went terribly wrong.
> 
> I was using diskdrake (from Mandrake) and what I did was create a LVM
> partition
> /dev/hdb6 and added it to my "quantum" VG which contained a single partition
> of
> /dev/hda6. I was simply doing this as a test (my first time using LVM), so
> as
> soon as it worked, I removed /dev/hdb6 from the "quantum" VG. I then
> proceeded
> to create a larger partition /dev/hdc that I wanted to add to "quantum" for
> good. I added it to the "quantum" VG and attemped to resize the "quantum" VG
> to
> the full size of both /dev/hda6 (17gb) and /dev/hdc (12gb). Everything
> "seemed"
> to go fine, so I exited from diskdrake and rebooted.
> 
> During the reboot, it said it couldn't mount /dev/quantum/1 as it was not a
> proper block device. So I ran the following programs to try and collect as
> much
> data as possible:
> 
> [root@ipso root]# pvscan -v
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- walking through all physical volumes found
> pvscan -- inactive PV "/dev/hda6"  is associated to an unknown VG (run
> vgscan)
> pvscan -- inactive PV "/dev/hdb6"  is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 2 [19.01 GB] / in use: 2 [19.01 GB] / in no VG: 0 [0]
> 
> [root@ipso root]# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> 
> vgcfgrestore -n quantum -l -f /etc/lvmconf/quantum.conf.1.old
> --- Volume group ---
> VG Name               quantum
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               19 GB
> PE Size               4 MB
> Total PE              4865
> Alloc PE / Size       4328 / 16.91 GB
> Free  PE / Size       537 / 2.1 GB
> VG UUID               54LQnu-1gQl-mNuO-KR7U-yypa-woKi-iu7PRF
> 
> [root@ipso lvmconf]# vgcfgrestore -n quantum -l -f
> /etc/lvmconf/quantum.conf
> --- Volume group ---
> VG Name               quantum
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               30.88 GB
> PE Size               4 MB
> Total PE              7904
> Alloc PE / Size       4328 / 16.91 GB
> Free  PE / Size       3576 / 13.97 GB
> VG UUID               54LQnu-1gQl-mNuO-KR7U-yypa-woKi-iu7PRF
> 
> 
> [root@ipso lvmconf]# pvdata -a /dev/hda6
> 
> --- Physical volume ---
> PV Name               /dev/hda6
> VG Name               quantum
> PV Size               16.91 GB / NOT usable 3.12 MB [LVM: 137 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              4328
> Free PE               0
> Allocated PE          4328
> PV UUID               e42Ge3-mpoP-PNat-1xLg-TMjr-4hRU-Q2agG9
> 
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               19 GB
> PE Size               4 MB
> Total PE              4865
> Alloc PE / Size       4328 / 16.91 GB
> Free  PE / Size       537 / 2.1 GB
> VG UUID               54LQnu-1gQl-mNuO-KR7U-yypa-woKi-iu7PRF
> 
> --- List of logical volumes ---
> 
> pvdata -- logical volume "/dev/quantum/1" at offset   0
> pvdata -- logical volume struct at offset   1 is empty
> pvdata -- logical volume struct at offset   2 is empty
> pvdata -- logical volume struct at offset   3 is empty
> pvdata -- logical volume struct at offset   4 is empty
> pvdata -- logical volume struct at offset   5 is empty
> pvdata -- logical volume struct at offset   6 is empty
> pvdata -- logical volume struct at offset   7 is empty
> pvdata -- logical volume struct at offset   8 is empty
> pvdata -- logical volume struct at offset   9 is empty
> pvdata -- logical volume struct at offset  10 is empty
> ...
> pvdata -- logical volume struct at offset 254 is empty
> pvdata -- logical volume struct at offset 255 is empty
> 
> --- List of physical extents ---
> 
> PE: 00000  LV: 001  LE: 00000
> PE: 00001  LV: 001  LE: 00001
> PE: 00002  LV: 001  LE: 00002
> ...
> PE: 04326  LV: 001  LE: 04326
> PE: 04327  LV: 001  LE: 04327
> --- List of physical volume UUIDs ---
> 
> 000: e42Ge3mpoPPNat1xLgTMjr4hRUQ2agG9
> 001: --- EMPTY ---
> 
> 
> 
> [root@ipso lvmconf]# pvdata -a /dev/hdb6
> 
> 
> --- Physical volume ---
> PV Name               /dev/hdb6
> VG Name               quantum
> PV Size               2.1 GB / NOT usable 1.75 MB [LVM: 123 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes
> Cur LV                0
> PE Size (KByte)       4096
> Total PE              537
> Free PE               537
> Allocated PE          0
> PV UUID               PFyl3d-HSJD-adUL-vpzS-Sib3-jy78-tgR569
> 
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               30.88 GB
> PE Size               4 MB
> Total PE              7904
> Alloc PE / Size       4328 / 16.91 GB
> Free  PE / Size       3576 / 13.97 GB
> VG UUID               54LQnu-1gQl-mNuO-KR7U-yypa-woKi-iu7PRF
> 
> --- List of logical volumes ---
> 
> pvdata -- logical volume "/dev/quantum/1" at offset   0
> pvdata -- logical volume struct at offset   1 is empty
> pvdata -- logical volume struct at offset   2 is empty
> pvdata -- logical volume struct at offset   3 is empty
> ...
> pvdata -- logical volume struct at offset 254 is empty
> pvdata -- logical volume struct at offset 255 is empty
> 
> --- List of physical extents ---
> 
> PE: 00000  LV: ---  LE: -----
> PE: 00001  LV: ---  LE: -----
> PE: 00002  LV: ---  LE: -----
> ...
> PE: 00535  LV: ---  LE: -----
> PE: 00536  LV: ---  LE: -----
> --- List of physical volume UUIDs ---
> 
> 000: e42Ge3mpoPPNat1xLgTMjr4hRUQ2agG9
> 001: PFyl3dHSJDadULvpzSSib3jy78tgR569
> 002: TeWEsY1qLF4PPwfZAlljyT3KiE4CCajd
> 
> 
> Unfortunately, I deleted the partition from the larger drive I was planning
> on
> adding to the "quantum" VG, (/dev/hdc it didn't have any data on it yet). I
> don't really care about /dev/hdb6 either, I would just like the data off of
> /dev/hda6.
> 
> Partition table for: /dev/hda6
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1       507    255496+  82  Linux swap
> /dev/hda2           508     39813  19810224    5  Extended
> /dev/hda5           508      4633   2079472+  83  Linux
> /dev/hda6          4634     39813  17730688+  8e  Linux LVM
> 
> Any ideas how I can get /dev/hda6 mountable again? Thanks.
> 
> IpSo
> 
> --------------------------------------------------------------------
> Never worry about viruses in your Email again.
> Get your FREE! virus scanned Email accounts at http://snappymail.ca
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 


IpSo

--------------------------------------------------------------------
Never worry about viruses in your Email again.
Get your FREE! virus scanned Email accounts at http://snappymail.ca
