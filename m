Return-Path: <root@srv.sistina.com>
Date: Wed, 9 May 2001 21:26:29 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
Message-ID: <20010509212629.A8512@sistina.com>
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit> <20010509093510.B4918@sistina.com> <20010509201416.A20867@mercury.mercury.multiweb.nl>
Mime-Version: 1.0
In-Reply-To: <20010509201416.A20867@mercury.mercury.multiweb.nl>; from dave@xs4all.nl on Wed, May 09, 2001 at 08:14:16PM +0200
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

On Wed, May 09, 2001 at 08:14:16PM +0200, Dave Wapstra wrote:
> On 09 May, 2001 at 09:35:10 +0000, Heinz J. Mauelshagen <Mauelshagen@sistina.com> wrote:
> > 
> > On Tue, May 08, 2001 at 02:05:16PM -0700, Day, Evan wrote:
> > > It looks like device 2 is having issues:
> > > 
> > > SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002
> > > 
> 
> Ok. Sounds reasonable ;)  It seems /dev/sdc is giving troubles.
> 
> > In case the PEs on the flaky device are still readable:
> > extending your VG and using pvmove is the way to go.
> > 
> > Steps needed (crossing your fingers that the flaky drive can still stand this):
> > 
> > - install or use an additional drive of at least the size of the flaky one
> > - pvcreate that drive
> > - vgextend the VG by it
> > - pvmove /dev/FlakyDrive
> > - wait until pvmove is done
> > - vgreduce VG /dev/FlakyDrive
> 
> I'm trying to backup the data that is still available (backup was a
> thing that was still in progress... :) ) 
> 
> pvmove is not really happy with the current situation.

I don't understand you here.
Did you try the above steps and something failed?

> 
> Can I just do "vgreduce ftp /dev/sdc" after I finished rescueing most of the data?
> 

Sure.
In case you've got a backup, you could remove or reduce LVs so that *no*
PEs are allocated on /dev/sdc.
You can check with "pvdisplay -v /dev/sdc" which LV(s) have PEs allocated
on that PV and run lvremove/lvreduce in order to free that PV.

Once pvdisplay tells you that no PEs are allocated (Allocated PE 0) you
can run "vgreduce VGName /dev/sdc".

> > You should have your LVs offline in case you have an older version than
> > LVM 0.9.1 Beta 7, because they had a pvmove related bug which could cause
> > oopses when you moved PEs in use.
> > 
> > BTW: you need to configure MD (RAID 1 or 5) or use hardware raid subsystems
> >      to avoid suffering from such flaky disk problems.
> 
> I haven't looked at RAID yet. The striping option of LVM is not really
> an option, since I cannot add any disks to the volume.

That's true today.
There's a tiny item on the TODO list to enhance this ;-)

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
