From: Anders Widman <andewid@tnonline.net>
Message-ID: <34789812.20030311121709@tnonline.net>
Subject: Re: [linux-lvm] Mounting one physical disk over network (nfs?)
In-Reply-To: <20030311073654.GA14278@gw.silicide.dk>
References: <1882079468.20030311000434@tnonline.net>
 <20030311073654.GA14278@gw.silicide.dk>
MIME-Version: 1.0
Content-transfer-encoding: 7bit
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
Date: Tue Mar 11 05:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: jon+lvm@silicide.dk
Cc: linux-lvm@sistina.com

> On Tue, Mar 11, 2003 at 12:04:34AM +0100, Anders Widman wrote:
>> 
>>    Is it possible to mount a physical disk with LVM over NFS or Samba?
>> 
>>    My current setup:
>> 
>>    10  disks of on LV in one VG. Would it be possible move one disk to
>>    another computer and still be able to use it in this same LV/VG?
>> 
>>    I have been looking at the /etc/lvm/.cache, but it seems as this is
>>    automatically generated.
>> 
>>    All I need is to be able to access the disk to be able to reduce it
>>    from the LV/VG.

> network block device ?
> or loopback a file and use that in the lvm.

   Network  Block  Device  seem  to  be  what  I need. Now I have another
   problem.   The  network block device works, lvmdiskscan, pvscan and
   pvdisplay works but NOT vgscan, so I can't activate my VG.

Here are some outputs:

-------------------------------------------------
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- filling directory cache...
lvmdiskscan -- walking through all found disks / partitions
lvmdiskscan -- /dev/ide/host4/bus1/target0/lun0/part1 [      55.92 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host4/bus1/target1/lun0/part1 [      55.92 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host4/bus0/target0/lun0/part1 [      71.59 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host4/bus0/target1/lun0/part1 [      71.59 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host2/bus0/target0/lun0/part1 [      55.90 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host2/bus0/target1/lun0/part1 [      55.90 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host0/bus1/target0/lun0/part1 [      76.34 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host0/bus1/target1/lun0/part1 [     152.66 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part1 [      47.03 MB] Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part2 [      27.74 GB] Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part3 [     854.99 MB] Primary   [0x82]
lvmdiskscan -- /dev/ide/host0/bus0/target1/lun0/part1 [      76.34 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/nbd0                              [     114.50 GB] USED LVM network block device
lvmdiskscan -- 10 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 1 network block device
lvmdiskscan -- 12 partitions
lvmdiskscan -- 9 LVM physical volume partitions
-------------------------------------------------

   I  am  not  sure  if  the  last  line  is  correct. There should be 10
   partitions (including the nbd0).

-------------------------------------------------
pvdisplay -- checking physical volume name "/dev/nbd0"
pvdisplay -- reading data of physical volume "/dev/nbd0" from disk
pvdisplay -- creating physical volume device number from name "/dev/nbd0"
pvdisplay -- checking physical volume activity
pvdisplay -- checking physical volume consistency
--- Physical volume ---
PV Name               /dev/nbd0
VG Name               Server
PV Size               114.50 GB [240121665 secs] / NOT usable 32.19 MB [LVM: 142 KB]
PV#                   13
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              3662
Free PE               0
Allocated PE          3662
PV UUID               7ScWsg-0vX4-ccX3-W1sO-mFnz-0Sl0-gDWKmM

pvdisplay -- "/etc/lvmtab.d/Server" doesn't exist
-------------------------------------------------

   This is the same disk when I run pvdisplay on the computer hosting the
   network block device (nbd-server).

-------------------------------------------------
pvdisplay -- checking physical volume name "/dev/hdc1"
pvdisplay -- reading data of physical volume "/dev/hdc1" from disk
pvdisplay -- creating physical volume device number from name "/dev/hdc1"
pvdisplay -- checking physical volume activity
pvdisplay -- checking physical volume consistency
--- Physical volume ---
PV Name               /dev/ide/host0/bus1/target0/lun0/part1
VG Name               Server
PV Size               114.50 GB [240121665 secs] / NOT usable 32.19 MB [LVM: 142 KB]
PV#                   13
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              3662
Free PE               0
Allocated PE          3662
PV UUID               7ScWsg-0vX4-ccX3-W1sO-mFnz-0Sl0-gDWKmM

pvdisplay -- "/etc/lvmtab.d/Server" doesn't exist
-------------------------------------------------

   When I run pvscan:

-------------------------------------------------
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/ide/host4/bus1/target0/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host4/bus1/target1/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host4/bus0/target0/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host4/bus0/target1/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target0/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus1/target1/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1"  is associated to unknown VG "Server" (run vgscan)
pvscan -- inactive PV "/dev/nbd0"                               is associated to unknown VG "Server" (run vgscan)
pvscan -- total: 10 [786.65 GB] / in use: 10 [786.65 GB] / in no VG: 0 [0]
-------------------------------------------------

  Everything looks good here, but when I run vgscan:

-------------------------------------------------
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "Server" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "Server" from physical volume(s)
-------------------------------------------------

  Something is not working..
  What should I do to do correct this?

  //Anders




  
--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
