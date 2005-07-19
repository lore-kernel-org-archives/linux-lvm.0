Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6INxBV15477
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 19:59:11 -0400
Received: from server193.fourx.de (server193-fourx.de [81.169.177.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6INx3Tm022871
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 19:59:04 -0400
Received: from [192.168.1.100] (e178126179.adsl.alicedsl.de [85.178.126.179])
	by server193.fourx.de (Postfix) with ESMTP id 5DE405EC10D
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 01:58:50 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v733)
In-Reply-To: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
References: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
Message-Id: <C6C25616-B34A-40E0-97B1-2E857487AFF8@kitchhiking.org>
Content-Transfer-Encoding: 7bit
From: Constantin Mercier <admin@kitchhiking.org>
Subject: Re: [linux-lvm] PVs not found (kernel 2.4<->devfs?) [was: lvm lost
	after reboot!?]
Date: Tue, 19 Jul 2005 02:00:13 +0200
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I'm still trying to solve the problem explained earlier (see
quote below) and maybe understood better now what might be
relevant information after digging a bit deeper.

-----
What happened:

System: Debian 3.1 (Sarge) / 2.4.27-2 (standard 2.4 kernel from  
netinstall)

# dmesg|grep -B1 -i lvm
device-mapper: 4.1.1-ioctl (2004-04-07) initialised: dm-devel@redhat.com
LVM version 1.0.8(17/11/2003) module loaded

2 VGs, each on an own partition/disk, so no spanning

Disks are working fine (/ and /boot are conventional partions on /dev/ 
hda,
VG WD2000JB-182GB is on /dev/hda4, machine boots fine)

I rebooted the system today and afterwards the LVs did not mount:

cserver:~# cat /var/log/boot|grep -i "block device"
Tue Jul 19 03:16:56 2005: mount: /dev/WD2000JB-182GB/mld is not a  
valid block device
Tue Jul 19 03:16:56 2005: mount: /dev/WD2000JB-182GB/srv is not a  
valid block device
Tue Jul 19 03:16:56 2005: mount: /dev/IBM80G2/costa is not a valid  
block device

I tried a hint from Heinz:

# cserver:/# cp /etc/lvmconf/WD2000JB-182GB.conf /etc/lvmtab.d/
# cserver:/# echo -ne "WD2000JB-182GB\0" > /etc/lvmtab

but then:

# vgchange -ay -v WD2000JB-182GB
vgchange -- locking logical volume manager
vgchange -- using volume group(s) on command line
vgchange -- checking volume group name "WD2000JB-182GB"
vgchange -- checking existence of volume group "WD2000JB-182GB"
vgchange -- reading volume group data for "WD2000JB-182GB" from lvmtab
vgchange -- checking volume group consistency  of "WD2000JB-182GB"
vgchange -- checking if all physical volumes of volume group  
"WD2000JB-182GB" are available
vgchange -- ERROR: can't get name(s) of physical volumes
vgchange -- Please check, if /proc is mounted

-----
Hints:

/proc/lvm _is_ mounted

I read a post in [linux-lvm] *) (similar trouble with LVM after
mounting a SCSI cd-writer) and recalled I had attached
a USB-stick before rebooting.

*) https://www.redhat.com/archives/linux-lvm/2002-January/msg00318.html

devfs seems to be enabled:

# dmesg|grep -i devfs
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0

but not used. But when I booted with the usb stick attached it might  
have
mounted (usbdevfs)?

my /proc/partitions looks like

major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect  
wuse running use aveq

   33     0   80418240 ide/host2/bus0/target0/lun0/disc
   33     1   80413326 ide/host2/bus0/target0/lun0/part1
   22     0     712618 hdc
    3     0  195360984 ide/host0/bus0/target0/lun0/disc
    3     1      48163 ide/host0/bus0/target0/lun0/part1
    3     2     489982 ide/host0/bus0/target0/lun0/part2
    3     3    4883760 ide/host0/bus0/target0/lun0/part3
    3     4  189936495 ide/host0/bus0/target0/lun0/part4
    3    64   80418240 ide/host0/bus0/target1/lun0/disc
    3    65   80418208 ide/host0/bus0/target1/lun0/part1

/proc/partitions looks like:

major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect  
wuse running use aveq

   33     0   80418240 ide/host2/bus0/target0/lun0/disc 5084 46140  
102448 5800 0 0 0 0 -2 10974830 21005752
   33     1   80413326 ide/host2/bus0/target0/lun0/part1 2 6 16 0 0 0  
0 0 0 0 0
   22     0     712618 hdc 23 6 112 4540 0 0 0 0 -158 10963830 41273884
    3     0  195360984 ide/host0/bus0/target0/lun0/disc 25141 147207  
504590 78200 6251 13538 158714 72850 -2 10971270 21150982
    3     1      48163 ide/host0/bus0/target0/lun0/part1 29 553 1164  
240 12 5 34 850 0 740 1090
    3     2     489982 ide/host0/bus0/target0/lun0/part2 1 0 8 10 0 0  
0 0 0 10 10
    3     3    4883760 ide/host0/bus0/target0/lun0/part3 10688 16077  
213418 32450 6239 13533 158680 72000 0 28160 104450
    3     4  189936495 ide/host0/bus0/target0/lun0/part4 9 27 72 0 0  
0 0 0 0 0 0
    3    64   80418240 ide/host0/bus0/target1/lun0/disc 19 61 226 100  
3 0 24 10 -2 10974860 21000062
    3    65   80418208 ide/host0/bus0/target1/lun0/part1 12 0 90 30 3  
0 24 10 0 40 40

Alan was so kind to give a couple of advises but I admittedly think
I could not provide enough detail to make him able to help me out.

Sorry for being so unstructured in my eralier descriptions,
I was a bit panicking earlier the day.

I'd be really grateful for any further advice.

TIA for your efforts,
Constantin


> Constantin Mercier wrote:

> Hi,
>
> I'm using LVM only for about a month now and it ran flawless until  
> today.
>
> After rebooting the system all my PVs/VGs/LVs were gone, "mount"  
> saying
> e.g.:
>
> > mount: /dev/WD2000JB-182GB/srv is not a valid block device
>
> /etc/lvmtab now is an empty file, /etc/lvmtab.d, /etc/lvm/backup and
> /etc/lvm/archive are empty as well.
>
> This is strange because etc/lvm/lvm.conf says that backups and  
> archives
> should be created but i can't find anything.
>
> What remains are some files in /etc/lvmconf named  
> "WD2000JB-182GB.conf" and
> "IBM80G2.conf" and some older versions of those.
>
> I read on the web *) about recovering the data using pvcreate/ 
> vgcfgrestore,
> but since "/etc/lvm/backup" and "/etc/lvm/archive" are empty I  
> don't know
> how to retrieve the UUIDs of my PVs.
>
> *) http://codeworks.gnomedia.com/archives/2005/general/lvm_recovery/
>
> Of course I don't have any further backup of these, since I first  
> read about their
> importance doing that when digging for hints howto recover my data.
>
> (stupid me (tm))
>
> The System is running Debian Sarge stable (2.4.27) on a
> P3/Intel BX with 3 harddrives attached to it. LVM is Version 1.08
>
> from /etc/fstab:
>
> #lvm
> /dev/WD2000JB-182GB/mld  /home/mld       auto   
> suid,dev,exec              0 0
> /dev/WD2000JB-182GB/srv  /srv/foo        auto   
> suid,noexec,nodev          0 0
> /dev/IBM80G2/costa_home  /home/costa     auto   
> suid,noexec,nodev          0 0
>
> where:
>
> /dev/WD2000JB-182GB/ is situated on /dev/hda (a 200GB Harddisk)
> /dev/IBM80G2/costa_home sits on /dev/hde (an 80GB Harddisk attached  
> to an onboard
>                                           HPT366 ATA66 Controller)
>
> pvdisplay /dev/WD2000JB-182GB says:
>
> > cserver:/etc/lvm# pvdisplay /dev/hde
> > pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no  
> VALID physical volume "/dev/hde"
>
> vgdisplay just returns:
>
> > cserver:/etc/lvm# vgdisplay
> > vgdisplay -- no volume groups found
>
> If any of you has a clou how i could recover my data (or just the  
> UUIDs) or
> maybe rebuild the LVM I'd be really grateful.
>
> Hope to hear from you,
> Constantin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
