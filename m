Return-Path: <glenn@gecpalau.com>
Message-ID: <3AF337B2.162238F8@gecpalau.com>
Date: Sat, 05 May 2001 08:13:54 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't pvcreate second partition...
References: <B51F0C636E578A4E832D3958690CD73E0130BEDE@es04snlnt>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Diehl, Jeffrey" wrote:

> Hi all.
>
> I'm new to LVM, but think I understad it, at least... <grin>
>
> Anyway, I'm trying to setup the first VG but can't seem to build my PV's.
> The transcript of what I did is at the bottom of this message.
>
> As you can see, I was able to do pvcreate on /dev/sdc2, but not on
> /dev/sdc3.  These partitions are on a hardware raid5.
>
> Am I missing something?
>
> Thanx,
> Mike Diehl,
> Network Monitoring Tool Devl.
> 284-3137
> jdiehl@sandia.gov
>
> Script started on Fri May  4 07:33:56 2001
> [root@filmore /mnt]# fdisk /dev/sdc
>
> The number of cylinders for this disk is set to 30945.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)
>
> Command (m for help): p
>
> Disk /dev/sdc: 255 heads, 63 sectors, 30945 cylinders
> Units = cylinders of 16065 * 512 bytes
>
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sdc1             1     15472 124278808+  8e  Unknown
> /dev/sdc2         15473     15476     32130   8e  Unknown
> /dev/sdc3         15477     15480     32130   8e  Unknown
> /dev/sdc4         15481     15484     32130   8e  Unknown
>
> Command (m for help): w
> The partition table has been altered!
>
> Calling ioctl() to re-read partition table.
> Re-read table failed with error 16: Device or resource busy.
> Reboot your system to ensure the partition table is updated.
>
> WARNING: If you have created or modified any DOS 6.x
> partitions, please see the fdisk manual page for additional
> information.
> Syncing disks.
>
> [root@filmore /mnt]# pvcreate /dev/sdc2
> pvcreate -- physical volume "/dev/sdc2" successfully created
>
> [root@filmore /mnt]# pvcreate /dev/sdc3
> pvcreate -- can't open physical volume "/dev/sdc3" to get its size
>
> pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
>         [-v|--verbose] [-V|--version] PhysicalVolume [PhysicalVolume...]
>
> Script done on Fri May  4 07:34:33 2001
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

Can you try rebooting and trying the pvcreate again? I suspect that it was
because the partition table was unable to be updated.

Glenn
