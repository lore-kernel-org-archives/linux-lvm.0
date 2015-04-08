Received: from arthur.brq.redhat.com (vpn1-5-55.ams2.redhat.com [10.36.5.55])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t38DsaAm003774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 8 Apr 2015 09:54:39 -0400
Message-ID: <5525331B.20604@redhat.com>
Date: Wed, 08 Apr 2015 15:54:35 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <1428468634.31919.250585153.41525C63@webmail.messagingengine.com>
In-Reply-To: <1428468634.31919.250585153.41525C63@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to lvcreate _new_ LVs on existing VG with
 existing LVs and plenty of room?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 04/08/2015 06:50 AM, lyndat3@your-mail.com wrote:
> Hi,
>
> I'm unable to create a new LV on an existing VG with LVs.
>
> I'm on
>
> 	uname -rm
> 		3.19.3-1.gf10e7fc-default x86_64

Is it a home-brewed kernel? Have you tried with a different one?


>
> 	lvm version
> 		LVM version:     2.02.98(2) (2012-10-15)
> 		Library version: 1.03.01 (2011-10-15)
> 		Driver version:  4.29.0

This looks like you might have a mismatch of device-mapper and LVM.

Where did you get that device-mapper from? I am not aware of any 1.03.01 
version.

>
> I have a VG with lots ov available space
>
> 	vgs
> 		VG      #PV #LV #SN Attr   VSize   VFree
> 		VG0       1   7   0 wz--n- 930.19g 855.19g
>
> It's already got LVs on it
>
> 	lvs
> 		LV             VG      Attr      LSize  Pool Origin Data%  Move Log Cpy%Sync Convert
> 		LV_ROOT        VG0     -wi-ao--- 20.00g
> 		LV_HOME        VG0     -wi-ao--- 40.00g
> 		LV_SWAP        VG0     -wi-ao---  2.00g
> 		...
>
> Time's passed.  Now, when I attempt to create a new LV on the VG, if fails with
>
> 	lvcreate -L 30G   -n LV_TEST   /dev/VG0
> 		/dev/md1: lseek 18446744071795900416 failed: Invalid argument

18446744071795900416 - this is an interesting number, actually it is 
2**64 - 1825 * 2**20. Looks like some integer overflow.

Run the command with -vvvv and attach the output, along with metadata 
(/etc/lvm/backup/VG0), please.

Run the command under strace and post the output, please.

>
> and in syslog I see
>
> 	Apr 07 21:34:21 xen01 kernel:  md1: unknown partition table

This looks like a MD issue. Is this some hardware raid?

>
> The VG's on a RAID1 array.
>
> 	pvs
> 		PV         VG      Fmt  Attr PSize   PFree
> 		/dev/md1   VG0     lvm2 a--  930.19g 855.19g
>
> 	cat /proc/mdstat
> 		...
> 		md1 : active raid1 sdg4[0] sdh4[1]
> 		      975404544 blocks super 1.0 [2/2] [UU]
> 		      bitmap: 0/8 pages [0KB], 65536KB chunk
> 		...
>
> consisting of two Linux-RAID partitions on a gpt disk
>
> 	sgdisk -p /dev/sdg
> 		Disk /dev/sdg: 1953525168 sectors, 931.5 GiB
> 		Logical sector size: 512 bytes
> 		Disk identifier (GUID): ...
> 		Partition table holds up to 128 entries
> 		First usable sector is 34, last usable sector is 1953525134
> 		Partitions will be aligned on 2048-sector boundaries
> 		Total free space is 2015 sectors (1007.5 KiB)
>
> 		Number  Start (sector)    End (sector)  Size       Code  Name
> 		   1            2048            4095   1024.0 KiB  EF02  BIOS Boot Partition
> 		   2            4096          618495   300.0 MiB   EF00  EFI System Partition
> 		   3          618496         2715646   1024.0 MiB  FD00  RAID for /boot
> 		   4         2715648      1953525134   930.2 GiB   FD00  RAID for LVMs
>
> 	sgdisk -p /dev/sdh
> 		Disk /dev/sdh: 1953525168 sectors, 931.5 GiB
> 		Logical sector size: 512 bytes
> 		Disk identifier (GUID): ...
> 		Partition table holds up to 128 entries
> 		First usable sector is 34, last usable sector is 1953525134
> 		Partitions will be aligned on 2048-sector boundaries
> 		Total free space is 2015 sectors (1007.5 KiB)
>
> 		Number  Start (sector)    End (sector)  Size       Code  Name
> 		   1            2048            4095   1024.0 KiB  EF02  BIOS Boot Partition
> 		   2            4096          618495   300.0 MiB   EF00  EFI System Partition
> 		   3          618496         2715646   1024.0 MiB  FD00  RAID for /boot
> 		   4         2715648      1953525134   930.2 GiB   FD00  RAID for LVMs
>
> The RAID's healthy, the system boots, and I can see/use all the existing LVs on the VG/PV.
>
> I just can't create new LVs anymore.
>
> Any suggestions at to problem & fix?
>
> LT
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
