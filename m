Return-Path: <root@srv.sistina.com>
Date: Fri, 16 Mar 2001 10:20:18 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Missing volume group
Message-ID: <20010316102018.C18955@sistina.com>
References: <Pine.LNX.4.30.0103151534430.20746-100000@bongo.fms.indiana.edu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.30.0103151534430.20746-100000@bongo.fms.indiana.edu>; from jsissom@indiana.edu on Thu, Mar 15, 2001 at 03:49:54PM -0500
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jay, this is a problem related to a previous version of 0.9.1

Please get the 0.9.1 Beta 6 tarball from www.sistina.com and follow the
instructions in the contained INSTALL and PATCHES/README to update your
LVM installation.

You might like to remove the rpm package before in order to avoid the wrong
LVM version in the rpm database.

Until you have successfully update your LVM configuration, stay with the
vgcfgrestore'd system and avoid running vgscan.
In general vgscan is not needed anyway in case you *didn't* change your
disk related hardware configuration.


BTW: you can use e2fsadm(8) contained in the LVM distribution to resize
     a LV *and* the contained ext2 filesystem in a single step.


Regards,
Heinz    -- The LVM Guy --


On Thu, Mar 15, 2001 at 03:49:54PM -0500, Jay Sissom wrote:
> Hello, I made some changes to my LVM setup on my box and was surprised to
> find that my volume group was gone when I turned on the computer this
> afternoon.  I don't know if this is a bug or if I did something wrong.
> I'll try to list all the things that I did.  I would appreciate if someone
> could let me know if I did something wrong or if I uncovered a bug.  I
> would also appreciate if someone could tell me how I could correct this
> problem.
> 
> I have a RedHat 6.2 system with kernel 2.4.2.  I am using the lvm_mod
> module directly from the 2.4.2 kernel.  I am using the lvm-0_9-1 rpm.
> 
> I have a volume group called storage made up of two partitions /dev/hda5
> and /dev/hdb1.  Here is information about them:
> 
> [root@js /root]# pvdisplay /dev/hda5
> --- Physical volume ---
> PV Name               /dev/hda5
> VG Name               storage
> PV Size               20.49 GB / NOT usable 2.84 MB [LVM: 140 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              5246
> Free PE               0
> Allocated PE          5246
> PV UUID               dsQm1p-6sTR-Czku-d1eV-Wj6Y-R4al-QWVjA2
> 
> [root@js /root]# pvdisplay /dev/hdb1
> --- Physical volume ---
> PV Name               /dev/hdb1
> VG Name               storage
> PV Size               28.62 GB / NOT usable 3.7 MB [LVM: 149 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              7327
> Free PE               0
> Allocated PE          7327
> PV UUID               bsAfjN-20M6-tBcd-Zw1s-cb1B-SIO3-XktC1l
> 
> The physical volume /dev/hdb1 was 295 PE's smaller, so I extended it using
> these commands:
> 
> 
> umount /dev/storage/storage_lv
> 
> lvextend -l+295 /dev/storage/storage_lv
> 
> I then resized my ext2 file system:
> 
> resize2fs /dev/storage/storage_lv
> 
> mount /dev/storage/storage_lv /storage
> 
> This all worked great.  When I turned off my computer, then turned it on
> later, the volume group was gone.
> 
> When vgscan was run, it gave this output:
> 
> [root@js /root]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> I searched and found out about the vgcfgrestore command and I ran these
> commands:
> 
> [root@js /root]# vgcfgrestore -n storage /dev/hda5
> vgcfgrestore -- VGDA for "storage" successfully restored to physical
> volume "/dev/hda5"
> 
> [root@js /root]# vgcfgrestore -n storage /dev/hdb1
> vgcfgrestore -- VGDA for "storage" successfully restored to physical
> volume "/dev/hdb1"
> 
> [root@js /root]# vgchange -ay
> vgchange -- volume group "storage" successfully activated
> 
> Now my volume is back, but I'm afraid it will disappear if I run vgscan
> again.  I did the backup command to backup the configuration, but got
> this:
> 
> root@js /root]# vgcfgbackup -v
> vgcfgbackup -- finding all volume groups
> vgcfgbackup -- volume group found: storage
> vgcfgbackup -- locking logical volume manager
> vgcfgbackup -- checking volume group name "storage"
> vgcfgbackup -- checking existence of volume group "storage"
> vgcfgbackup -- ERROR: volume group "storage" has an invalid number of
> physical volumes
> vgcfgbackup -- ERROR "vg_cfgbackup(): vg_check_exist" backing up volume
> group "storage"
> 
> Any help fixing this would be greatly appreciated.  This volume has 45.5GB
> of data on it and I don't have a tape drive that big!  I could restore it
> if necessary, but really REALLY don't want to! :)
> 
> If this is a FAQ, please point me to the information.  I searched and
> couldn't find anything.
> 
> Thanks
> Jay
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
