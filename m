Return-Path: <root@srv.sistina.com>
Date: Fri, 11 May 2001 12:54:19 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
Message-ID: <20010511125419.A17283@sistina.com>
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit> <20010509093510.B4918@sistina.com> <20010509201416.A20867@mercury.mercury.multiweb.nl> <20010509212629.A8512@sistina.com> <20010510223037.A32588@mercury.mercury.multiweb.nl>
Mime-Version: 1.0
In-Reply-To: <20010510223037.A32588@mercury.mercury.multiweb.nl>; from dave@xs4all.nl on Thu, May 10, 2001 at 10:30:37PM +0200
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

On Thu, May 10, 2001 at 10:30:37PM +0200, Dave Wapstra wrote:
> On 09 May, 2001 at 21:26:29 +0000, Heinz J. Mauelshagen <Mauelshagen@sistina.com> wrote:
> > On Wed, May 09, 2001 at 08:14:16PM +0200, Dave Wapstra wrote:
> > > On 09 May, 2001 at 09:35:10 +0000, Heinz J. Mauelshagen <Mauelshagen@sistina.com> wrote:
> > > > 
> > > > Steps needed (crossing your fingers that the flaky drive can still stand this):
> > > > 
> > > > - install or use an additional drive of at least the size of the flaky one
> > > > - pvcreate that drive
> > > > - vgextend the VG by it
> > > > - pvmove /dev/FlakyDrive
> > > > - wait until pvmove is done
> > > > - vgreduce VG /dev/FlakyDrive
> > > 
> > > I'm trying to backup the data that is still available (backup was a
> > > thing that was still in progress... :) ) 
> > > 
> > > pvmove is not really happy with the current situation.
> > 
> > I don't understand you here.
> > Did you try the above steps and something failed?
> 
> Yes, the pvmove command didn't finish succesfully.  Unfortunately, I
> haven't saved the output, so I cannot show you what the exact messages were.

:-(

> 
> > > Can I just do "vgreduce ftp /dev/sdc" after I finished rescueing most of the data?
> > > 
> > 
> > Sure.
> > In case you've got a backup, you could remove or reduce LVs so that *no*
> > PEs are allocated on /dev/sdc.
> > You can check with "pvdisplay -v /dev/sdc" which LV(s) have PEs allocated
> > on that PV and run lvremove/lvreduce in order to free that PV.
> > 
> > Once pvdisplay tells you that no PEs are allocated (Allocated PE 0) you
> > can run "vgreduce VGName /dev/sdc".
> 
> Actually, my colleage already removed the complete volume configuration
> and started from scratch.

Oops, he was faster than us ;-)

> 
> The thing is, I've had this problem before.  It seemed that a power
> failure caused us some troubles. However, after re-initialising the
> disks (pv/vg/lv), creating a new filesystem and restoring the backup,
> everything is fine again.
> 
> Even /dev/sdc is not complaining at all.

I wouldn't count on that disk, because SCSI errors were displayed before.

> 
> # pvdisplay /dev/sdc
> --- Physical volume ---
> PV Name               /dev/sdc
> VG Name               ftp
> PV Size               8.43 GB / NOT usable 1.34 MB [LVM: 129 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              2159
> Free PE               0
> Allocated PE          2159
> PV UUID               none
> 
> Seems the disk is full, and no SCSI messages in the log files (?)
> 
> After the new filesystem has been created, the system was powered down
> (switched off) twice to check if this is trigerring anything. In both
> cases fsck successfully restored any errors.
> 
> I'm not sure if this is a hardware problem or not. The disk seems to
> work fine, however in some situations SCSI errors occur.

As I said: believe in a hardware problem.
You could follow piles of old threads in regard to flaky cables et al.

> 
> Any suggestions on testing the disk for hardware problems are appreciated.
> (dd if=/dev/sdc of=/dev/null ?)

You need to read/write trash the disk.
Create a test LV with all the PEs on sdc, run bonnie with a huge file
all day and see if you can trigger SCSI errors.

> 
> 
> -Dave
> 
> -- 
> Dave Wapstra
> dave@xs4all.nl
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
