From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm mirroring
Message-ID: <20030225162655.D832@sistina.com>
References: <02ee01c2dadc$7e7ff310$020010ac@romio>
Mime-Version: 1.0
In-Reply-To: <02ee01c2dadc$7e7ff310$020010ac@romio>; from romio@netvision.net.il on Sun, Feb 23, 2003 at 03:40:06AM +0200
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
Date: Tue Feb 25 09:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Feb 23, 2003 at 03:40:06AM +0200, Roman Gavrilov wrote:
> Hello,
> 
> I have 2 physical discs.
> I have 4 partitions on the first disk. 
> I created a volume group "lvmhd" from all of the partitions and later created logical volumes.
> 
> this is the result from the vgdisplay
> --- Volume group ---
> VG Name               lvmhd
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                3
> Open LV               3
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               35.59 GB
> PE Size               32 MB
> Total PE              1139
> Alloc PE / Size       1131 / 35.34 GB
> Free  PE / Size       8 / 256 MB
> VG UUID               xqamqE-9gSs-Xy3O-2tVQ-wYzy-Cp3u-0Wivbd
> 
> and those are the logical volumes
> /dev/lvmhd/lvm_usr    3.0G  980M  1.8G  35% /usr
> /dev/lvmhd/lvm_var    4.9G   65M  4.6G   2% /var
> /dev/lvmhd/lvm_home    27G   33M   25G   1% /home
> 
> later I mirrored the first disk to the second disk with dd if=/dev/hda of=/dev/hdb so if the first disk breaks I can remove it and replace it with the second disk and get the server up in minutes.

This is a copy, no mirror.

> 
> Now I want to be able to use the second disk while I am running from the first. But the volume groups are the same and I am afraid that if I will recreate the logical volumes I'll ruin some thing on the second disk.
> Is there anything I can do about it so I could use the second disk for backups but still have the same architecture as the primary disk ?

With LVM1 rename /dev/hdb to /dev/myhdb, with LVM2 you could change
the device name filter in a configfile.

> is there any way to mount those logical volumes which are mirrors of the primary disk ?
> for example I can do 
> pvdisplay /dev/hdb3 (this is the slave disk which is the mirror of the primary and its not mounted)
> --- Physical volume ---
> PV Name               /dev/hdb3
> VG Name               lvmhd
> PV Size               13.67 GB [28676025 secs] / NOT usable 32.19 MB [LVM: 129 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                3
> PE Size (KByte)       32768
> Total PE              436
> Free PE               0
> Allocated PE          436
> PV UUID               5XenPH-2NLb-cmN0-qEBb-QGuJ-zWxv-otMr7i
> 
> thanks

You would need to change the LVM metadata to do this.

The correct way to have a copy of your VG would have been
to create a second VG which must have a different name from the first one
with PV hdb in it, create all the LVs you have in "lvmhd", which can have the
same names as in "lvmhd" and dd the LVs over.

I presume your VG "lvmhd" takes no writes during the copy.

-- 

Regards,
Heinz    -- The LVM Guy --

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
