From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] RAID Failure Problems
Message-ID: <20030602114637.E5039@sistina.com>
References: <1054146530.1176.19.camel@mosix>
Mime-Version: 1.0
In-Reply-To: <1054146530.1176.19.camel@mosix>; from mschilli@vss.fsi.com on Wed, May 28, 2003 at 01:28:50PM -0500
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
Date: Mon Jun  2 04:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 28, 2003 at 01:28:50PM -0500, Matt Schillinger wrote:
> I recently had a RAID disk failure, which, due to a firmware bug, a
> second drive went down.. Anyway, the data is being rebuilt (via RAID
> Controller) now. It is online, but when i do a vgscan, i now only see 2
> of the 4 volumes that were setup.  I am using reiserfs on all
> filesystems affected.
> 
> Anyway, for lvm, i have simply used: 'pvcreate /dev/sda' (for the
> /dev/sda). In other words, I didn't fdisk and set to Linux LVM. From
> what I've seen, this so far has caused no problems.  Anyway, now, when i
> do a vgscan, i only see 2 of the volumes.  When I do a pvdata /dev/sda
> (one of the PVs not showing up), i get what looks like corrupted
> naming..

This is a bit confusing. Did you pvcreate /dev/sda which was under
construction by the RAID controller. If so that would have been a mistake,
because the rebuild should have been completely transparent to LVM.
You pvdata output pelow convinces me, that you didn't run pvcreate though.

Because you mention a RAID controller firmware bug: are you sure that this
bug didn't toast your data silently before ?

If you rebuild ended successfully, you might want to vgcfgrestore(8) your
LVM metadata to all PVs (you need to run "pvcreate -ff ..." on all of them).
Check with "vgcfgrestore -ll ..." if the metadata backups are valid before
you go for the real restore.

"vgscan;vgchange -ay" will activated your VG and you need to check the
filesystem integrity then (because of the assumed firmware data toaster ;)

Regards,
Heinz    -- The LVM Guy --


> 
> 
> --------------------------------
> 
> [root@thor root]# pvdata /dev/sda
> --- Physical volume ---
> PV Name               /dev/sda
> VG Name               ???
> PV Size               93.13 GB [195312500 secs] / NOT usable 2.49 GB
> [LVM: 16.15 MB]
> PV#                   48979801
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              23840
> Free PE               0
> Allocated PE          23840
> PV UUID               ?
> 
> 
> --- List of logical volumes ---
> 
> Segmentation fault
> [root@thor root]#
> 
> 
> Is there a way I can fix this?
> 
> Thanks for all your help,
> 
> -- 
> Matt Schillinger
> System Administrator
> FlightSafety International
> mschilli@vss.fsi.com
> 314-551-8403
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
