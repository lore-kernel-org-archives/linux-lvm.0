From: Anders Widman <andewid@tnonline.net>
Message-ID: <4117008562.20021125013930@tnonline.net>
Subject: Re: [linux-lvm] Accessing LVM partitions from a rescue system
In-Reply-To: <200211242207.33235.pantaleimon@home.no>
References: <200211242207.33235.pantaleimon@home.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sun Nov 24 18:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Pantaleimon <linux-lvm@sistina.com>

Looks  like  something  is wrong with accessing all of your disks from
the rescue floppy.. look at the pvscan:

From rescue environment:
   pvscan -- total: 20 [201.08 GB}

Normal boot:
   pvscan -- total: 21 [211.14 GB]

You  need  to  sort  out what disks/partitions that are not accessible
from  the  rescue  disks...  You can also try ungrading LVM as 1.01 is
quite old...

- Anders

> Hello

> I am trying to mount my LVM partitions manually after booting into a
> rescue system from floppies. I am not able to do this. During a normal
> boot from my harddisk LVM works just fine. Notice the output from
> pvscan and lvmdiskscan below. I ran those commands first from the
> rescue system and then from a normally booted system. In the rescue
> system /dev/hda16 is not there. I don't know if that is related to my
> problem, though.

> Here are the details of what I am doing:

> Setup:

> boot partition      /dev/hda2 type Linux with Ext2
> root partition      /dev/hda3 type Linux with Reiserfs
> other partitions    /dev/hda[6-16] type LVM
>                     /hdb[6-15] type LVM

> One volume group exists called "system" comprising all the above LVM partitions
> LVM version is 1.0.1-rc2(30/08/2001)


> Rescue boot procedure:

> 1. Booting rescue system (SuSE 7.3 rescue disk).

> 2. Loading LVM and Reiser modules from floppy. These are nor included on
>    the rescue disk.

> 3. Mounting HD root-partition /dev/hda3 on /mnt to get access to the
>    LVM programs in what has now become /mnt/sbin.

> 4. Linking /mnt/lib/* from /lib since the LVM programs need more
>    libraries than those included in rescue the system.

> 5. Freeing space on /. I have noticed that my normal root-partition
>    /dev/hda3 holds a file called /etc/lvmtab.d/system ("system" is the
>    name of my volume group) which is 256K so I expect the
>    rescue-system RAM-disk will need at least that amount of free space.

> 6. Running vgscan and vgchange -ay. Vgscan reports the creation of
>    /etc/lvmtab" and "/etc/lvmtab.d but doesn't report finding any
>    volume groups. Vgchange reports that there are no volume groups to
>    activate. Here is the output:

>        vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
>        vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
>        vgscan -- reading all physical volumes (this may take a while...)
>        vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>        vgscan -- WARNING: This program does not do a VGDA backup of your volume group

>        vgchange -- locking logical volume manager
>        vgchange -- finding all volume group(s)
>        vgchange -- no volume groups found

> Here is the output of some commands run in the rescue system:

> df -h

> Filesystem            Size  Used  Avail  Capacity Mounted on
> /dev/ram2             3.5M  2.8M   702K     80%   /
> /dev/hda3             200M  102M    99M     51%   /mnt

> mount

> /dev/ram2 on / type ext2 (rw)
> proc on /proc type proc (rw)
> /dev/hda3 on /mnt type reiserfs (rw)

> pvscan

> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda6"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda7"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda8"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda9"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda10"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda11"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda12"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda13"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda14"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda15"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb6"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb7"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb8"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb9"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb10"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb11"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb12"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb13"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb14"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdb15"  is associated to an unknown VG (run vgscan)
> pvscan -- total: 20 [201.08 GB] / in use: 20 [201.08 GB] / in no VG: 0 [0]

> lvmdiskscan

> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/hda1  [     494.16 MB] Primary  DOS 16bit [0x06]
> lvmdiskscan -- /dev/hda2  [      23.53 MB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda3  [     203.95 MB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda4  [     111.08 GB] DOS extended partition [0x05]
> lvmdiskscan -- /dev/hda5  [    1004.03 MB] Extended LINUX swap partition [0x82]
> lvmdiskscan -- /dev/hda6  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda7  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda8  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda9  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda10 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda11 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda12 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda13 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda14 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda15 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb1  [       9.77 GB] Primary   [0x0C]
> lvmdiskscan -- /dev/hdb2  [     102.02 GB] DOS extended partition [0x05]
> lvmdiskscan -- /dev/hdb5  [    1004.03 MB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hdb6  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb7  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb8  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb9  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb10 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb11 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb12 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb13 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb14 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb15 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- 2 disks
> lvmdiskscan -- 0 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 28 partitions
> lvmdiskscan -- 20 LVM physical volume partitions

> Here is the output of some commands run after a normal boot:

> pvscan

> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hda6"  of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda7"  of VG "system" [9.97 GB / 3.12 GB free]
> pvscan -- ACTIVE   PV "/dev/hda8"  of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda9"  of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda10" of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda11" of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda12" of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda13" of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda14" of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda15" of VG "system" [9.97 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda16" of VG "system" [10.00 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb6"  of VG "system" [10.06 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb7"  of VG "system" [10.06 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb8"  of VG "system" [10.06 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb9"  of VG "system" [10.06 GB / 6.56 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb10" of VG "system" [10.06 GB / 10.06 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb11" of VG "system" [10.06 GB / 10.06 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb12" of VG "system" [10.06 GB / 10.06 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb13" of VG "system" [10.06 GB / 10.06 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb14" of VG "system" [10.06 GB / 10.06 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb15" of VG "system" [10.06 GB / 10.06 GB free]
> pvscan -- total: 21 [211.14 GB] / in use: 21 [211.14 GB] / in no VG: 0 [0]

> lvmdiskscan

> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/hda1  [     494.16 MB] Primary  DOS 16bit [0x06]
> lvmdiskscan -- /dev/hda2  [      23.53 MB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda3  [     203.95 MB] Primary  LINUX native partition [0x83]
> lvmdiskscan -- /dev/hda4  [     111.08 GB] DOS extended partition [0x05]
> lvmdiskscan -- /dev/hda5  [    1004.03 MB] Extended LINUX swap partition [0x82]
> lvmdiskscan -- /dev/hda6  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda7  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda8  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda9  [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda10 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda11 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda12 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda13 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda14 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda15 [      10.00 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda16 [      10.06 GB] USED LVM whole disk
> lvmdiskscan -- /dev/hdb1  [       9.77 GB] Primary   [0x0C]
> lvmdiskscan -- /dev/hdb2  [     102.02 GB] DOS extended partition [0x05]
> lvmdiskscan -- /dev/hdb5  [    1004.03 MB] Extended LINUX native partition [0x83]
> lvmdiskscan -- /dev/hdb6  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb7  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb8  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb9  [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb10 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb11 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb12 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb13 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb14 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hdb15 [      10.10 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- 3 disks
> lvmdiskscan -- 1 whole disk
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 28 partitions
> lvmdiskscan -- 20 LVM physical volume partitions


> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
