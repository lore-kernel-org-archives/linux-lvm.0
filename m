Message-ID: <3BF11BB7.60901@inetnow.net>
From: Keith Hopkins <hne@inetnow.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help on LVM/SW-RAID build problems
References: <20011113043112.78140.qmail@web10401.mail.yahoo.com>
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
Date: Tue Nov 13 07:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

BOIK MOON wrote:

>  Hi,
> 
>  > >Is it OK to use the partition type "0x8e" for
>  >>LVM/SW-RAID? How about "0xfd"?
>  >>
>  >you can not create LVM/SW-RAID
>  >you can make LVM over SW-RAID or SW-RAID over LVM
> 
> Why am I getting an error on the partition when I use 0x8e as type?


Because you can not RAID and LVM on the same device at the same time.  You CAN use your physical partitions (/dev/hd*# or sd*#) to create a RAID device and THEN use create LVM on top of the RAID device (/dev/md#).


> 
> Yes, I did not have any error when I used 0xfd as partition type.
> 
> To make SW-RAID over LVM, Should I create the partition using 0x8e(LVM) 
> type?


If you mean the same partition you used when creating the RAID, then NO.


> 


as for the "cannot determine md version: No such file or directory"

You don't have "md" (RAID) support in the kernel.  Configure your kernel for md devices (or, if it is not a boot device, make them as modules)

after you do your mkraid, then pvcreate the /dev/md# and you can use it for lvm (no need to set any partition type on md0).

Lost in Tokyo,
   Keith


> Thanks for your kind answer
> 
> Bo
> 
>   svetljo <galia@st-peter.stw.uni-erlangen.de> wrote:
> 
>     Hi
>     you shouldn't change the softRAID partition id to lvm
>     you had to create the lvm over the RAID
> 
>      >1) fdisk error
>      >
>      >Disk /dev/hdb: 255 heads, 63 sectors, 2434 cylinders
>      >Units = cylinders of 16065 * 512 bytes
>      >
>      > Device Boot Start End Blocks Id
>      >System
>      >/dev/hdb1 1 64 514048+ 8e
>      >Linux LVM
>      >/dev/hdb2 65 702 5124735 8e
>      >Linux LVM
>      >/dev/hdb3 703 1340 5124735 8e
>      >Linux LVM
>      >
>      >
>     you have destroyed the RAID
> 
>      >
>      >Command (m for help): w
>      >The partition table has been altered!
>      >
>      >
>      >2) No such file error
>      >
>      >
>     you have no the raid devices hdb[1-3]
> 
>      >
>      >root@bo:~ > raidstop --all
>      >cannot determine md version: No such file or directory
>      >
>      >kingate@bo:~ > /sbin/mkraid
>      >cannot determine md version: No such file or directory
>      >
>      >kingate@bo:~ > /sbin/mkraid --really-force /dev/md1
>      >cannot determine md version: No such file or directory
>      >
>      >3) Partiton type
>      >
>      > Is it OK to use the partition type "0x8e" for
>      >LVM/SW-RAID? How about "0xfd"?
>      >
>     you can not create LVM/SW-RAID
>     you can make LVM over SW-RAID or SW-RAID over LVM
> 
>      >
>      >Thanks in advance,
>      >
>      >Bo
>      >
>      >-----------------raidtab------------
>      >raiddev /dev/md0
>      > raid-level 0
>      > nr-raid-disks 2
>      > nr-spare-disks 0
>      > chunk-size 4
>      > persistent-superblock 1
>      > device /dev/hdb1
>      > raid-disk 0
>      > device /dev/hdc1
>      > raid-disk 1
>      >
>      >raiddev /dev/md1
>      > raid-level 1
>      > nr-raid-disks 2
>      > nr-spare-disks 0
>      > chunk-size 4
>      > persistent-superblock 1
>      > device /dev/hdb2
>      > raid-disk 0
>      > device /dev/hdc2
>      > raid-disk 1
>      >
>      >raiddev /dev/md2
>      > raid-level 1
>      > nr-raid-disks 2
>      > ; nr-spare-disks 0
>      > chunk-size 4
>      > persistent-superblock 1
>      > device /dev/hdb3
>      > raid-disk 0
>      > device /dev/hdc3
>      > raid-disk 1
>      >
>     that is OK
>     but /dev/hda[1-3] and /dev/hdb[1-3] should be SW-RAID ( partition id)
> 
>     and then
>     pvcreate /dev/md0 /dev/md1 /dev/md2
>     vgcreate
>     .........
> 
>     good luck
> 
