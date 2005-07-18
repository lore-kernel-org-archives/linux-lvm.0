Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6IFb9V08897
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 11:37:09 -0400
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6IFawML025978
	for <linux-lvm@redhat.com>; Mon, 18 Jul 2005 11:37:02 -0400
Message-ID: <42DBCC8A.1070000@berbee.com>
Date: Mon, 18 Jul 2005 10:36:42 -0500
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm lost after reboot !? how to recover UUID?
References: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
In-Reply-To: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

First figure out if your disks are there:   dmesg|grep [sh]d
Check for partitions:   fdisk -l
then see whether LVM stuff is there:  pvscan ; vgscan
Look at your distro's boot-up process.... maybe you installed a new 
kernel and forgot to include the initrd that activates the VGs (via:   
vgchange -a y)
Or maybe you enabled devfs or something, and the discs now show up with 
a different device path.

kitchhiking.org wrote:

> Hi,
>
> I'm using LVM only for about a month now and it ran flawless until  
> today.
>
> After rebooting the system all my PVs/VGs/LVs were gone, "mount" saying
> e.g.:
>
> > mount: /dev/WD2000JB-182GB/srv is not a valid block device
>
> /etc/lvmtab now is an empty file, /etc/lvmtab.d, /etc/lvm/backup and
> /etc/lvm/archive are empty as well.
>
> This is strange because etc/lvm/lvm.conf says that backups and archives
> should be created but i can't find anything.
>
> What remains are some files in /etc/lvmconf named  
> "WD2000JB-182GB.conf" and
> "IBM80G2.conf" and some older versions of those.
>
> I read on the web *) about recovering the data using pvcreate/ 
> vgcfgrestore,
> but since "/etc/lvm/backup" and "/etc/lvm/archive" are empty I don't  
> know
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
> The System is running Debian Sarge stable (2.4.27-2) on a
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
> > pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no  VALID 
> physical volume "/dev/hde"
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


-- 

----------------------------------------------------------------------
Alan W. Jurgensen - Berbee Information Networks - jurgensen@berbee.com 
