From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] restoring volume group from file
Message-ID: <20030428104904.A27830@sistina.com>
References: <20030424163942.GH12350@mit.edu> <20030425112124.B16006@sistina.com> <20030426201622.GA3368@mit.edu>
Mime-Version: 1.0
In-Reply-To: <20030426201622.GA3368@mit.edu>; from jwa@mit.edu on Sat, Apr 26, 2003 at 04:16:22PM -0400
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
Date: Mon Apr 28 03:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Apr 26, 2003 at 04:16:22PM -0400, James W Anderson wrote:
> Thanks for responding.
> 
> vgck seems to say that things are alright:
> 
> # vgck /dev/vg00
> vgck -- VGDA of "vg00" in lvmtab is consistent
> vgck -- VGDA of "vg00" on physical volume is consistent
> 

Odd, vgscan should find your VG fine in that case :(
You say that fsck can't find the superblocks but can you read (dd) the
LVs fine after the restore ?

> I also did try to restore all of the old metadata backups, but to no
> avail.
> 
> Do you have any other suggestions?  I still do not understand why
> vgcfgrestore say that the sizes are different, since I did a
> block-by-block copy from the original partition.

vgcfgrestore checks the _exact_ size of the PV before restorring the meatadata.
To get around this constraint which is aiming to prove that the device to
restore to is the right one, user can use the ignore flag if (s)he knows what
(s)he's doing ;)

Regards,
Heinz    -- The LVM Guy --


> 
> Thank you again for your help.
> 
> On Fri, Apr 25, 2003 at 11:21:24AM +0200, Heinz J . Mauelshagen wrote:
> > 
> > James,
> > 
> > sounds like you had a problem with your LVs before you copied already,
> > which I assume was the reason to copy hde5 and run vgcfgrestore.
> > 
> > What does vgck (metadata checker) display ?
> > 
> > Maybe you have better luck with an older metadata backup from
> > /etc/lvmconf ?
> > 
> > On Thu, Apr 24, 2003 at 12:39:42PM -0400, James W Anderson wrote:
> > > Hi,
> > > 
> > > I recently made a copy of an lvm partition to a file, using dd:
> > > 
> > > dd if=/dev/hde5 of=lvm-file bs=...
> > > 
> > > I would now like to mount this file, which contains a single volume
> > > group, on a different machine.  Here is what I have done so far:
> > > 
> > > 1) create a loopback device for the file
> > > 
> > > # losetup /dev/loop0 lvm-file
> > > 
> > > 2) pvscan, detects the volume group
> > > 
> > > # pvscan
> > > pvscan -- reading all physical volumes (this may take a while...)
> > > pvscan -- inactive PV "/dev/loop0" of VG "vg00" [23.45 GB / 3.20 GB free]
> > > pvscan -- total: 1 [23.46 GB] / in use: 1 [23.46 GB] / in no VG: 0 [0]
> > > 
> > > 3) Now, when I try to do vgcfgrestore, I get the following error:
> > > 
> > > # vgcfgrestore -n vg00 -f vg00.conf -o /dev/hde5 /dev/loop0
> > > vgcfgrestore -- size of physical volume /dev/loop0 differs from backup
> > > 
> > > 
> > > I tried passing the -i option to tell it to ignore the size
> > > difference, and then it did create the volume group, but all of the
> > > logical volumes are unusable---e2fsck cannot find the superblocks on
> > > the filesystems.
> > > 
> > > Does anyone have any suggestions as to what I might try to get this to
> > > work?  Any help would be tremendously appreciated.
> > > 
> > > Many thanks,
> > > James
> > > 
> > > 
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
