Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4LAcV7m019090
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 06:38:31 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.183])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4LAcT9r005983
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 06:38:29 -0400
Message-ID: <4651769C.6050007@sas-clan.de>
Date: Mon, 21 May 2007 12:38:20 +0200
From: BigMac <bigmac@sas-clan.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] f*cked up metadata on 1of3 LVM-disks
References: <4641F72E.6050907@sas-clan.de>
In-Reply-To: <4641F72E.6050907@sas-clan.de>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Nobody an idea how to recover the lvm meta data on the disk?
The data itself an the other disks are fine, just the first sectors of
/dev/hdc are gone by installing grub on it.

I had a deeper look on the disk with one of those low level disk editors
and there are still parts of the meta-data stored on the disk.
It seems to be that grub messed up just the first 17 sectors of the disk.

Regards,

BigMac



BigMac schrieb:
> Hi lists!
> 
> My fileserver stored it's data on 3 physical disks,building a
> volumegroup with lvm2.
> The mashine was running ubuntu dapper drake for a long time without any
> problems but I decided to switch to ubuntu feisty fawn. Switching from
> debian to dapper drake I installed and removed quite a lot of packages,
> leaving a messy system, so I thought a new and clean installation with
> feisty fawn might be a great idea.
> 
> box config with dapper drake:
> 
> hda: 120GB (PATA) systemdisk
> hdb: unused
> hdc: 250GB (PATA) part of the LVM-array
> hdd: 250GB (PATA) part of the LVM-array
> sda: 400GB (SATA) part of the LVM-array
> sdb: DVD-RW (PATA on additional PCI-controller UDMA-100)
> 
> The additional IDE-controller was installed to be able to install even
> more disks, but as I won't buy any new PATA stuff the controller was
> dispensable.
> 
> new box config:
> 
> hda: 120GB (PATA) systemdisk
> hdb: DVD-RW
> hdc: 250GB (PATA) part of the LVM-array
> hdd: 250GB (PATA) part of the LVM-array
> sda: 400GB (SATA) part of the LVM-array
> 
> I exported the vg before shutting down dapper drake and while installing
> festy fawn to the box I - no idea what did me do so - installed grub to
> hdc. Ooops, this disk was part of the LVM array and so grub f*cked up
> the lvm meta-data on hdc.
> 
> After installing grub to hda the box is running fine, despite the LVM
> which can't find one of the vgs volumes:
> 
> Code:
> 
> bigmac@knecht:~$ sudo pvscan
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> PV /dev/hdd         VG vgdata   lvm2 [232.88 GB / 0    free]
> PV unknown device   VG vgdata   lvm2 [232.88 GB / 0    free]
> PV /dev/sda         VG vgdata   lvm2 [372.61 GB / 4.00 MB free]
> Total: 3 [838.38 GB] / in use: 3 [838.38 GB] / in no VG: 0 [0   ]
> 
> bigmac@knecht:~$ sudo pvdisplay
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> --- Physical volume ---
> PV Name               /dev/hdd
> VG Name               vgdata
> PV Size               232.88 GB / not usable 0
> Allocatable           yes (but full)
> PE Size (KByte)       4096
> Total PE              59618
> Free PE               0
> Allocated PE          59618
> PV UUID               locW5S-HNFK-b1WW-iOLt-olHl-2SNd-fmXKC8
> 
> --- Physical volume ---
> PV Name               unknown device
> VG Name               vgdata
> PV Size               232.88 GB / not usable 0
> Allocatable           yes (but full)
> PE Size (KByte)       4096
> Total PE              59618
> Free PE               0
> Allocated PE          59618
> PV UUID               9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81
> 
> --- Physical volume ---
> PV Name               /dev/sda
> VG Name               vgdata
> PV Size               372.61 GB / not usable 0
> Allocatable           yes
> PE Size (KByte)       4096
> Total PE              95388
> Free PE               1
> Allocated PE          95387
> PV UUID               YUJcsF-3XP7-OrbO-pITp-5z96-gw1A-DI11QS
> 
> 
> bigmac@knecht:~$ sudo vgscan
> Reading all physical volumes.  This may take a while...
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find all physical volumes for volume group vgdata.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find all physical volumes for volume group vgdata.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find all physical volumes for volume group vgdata.
> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.
> Couldn't find all physical volumes for volume group vgdata.
> Volume group "vgdata" not found
> 
> I tried multiple Live-CDs like gparted (with testdisk), Ultimate Boot-CD
> and SystemRescueCd, but none could help.
> 
> Any idea what to do to get the lvm up and running?
> How to restore the metadata on hdc?
> 
> Best Regards,
> 
> BigMac
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
