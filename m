From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: Data recovered successfully... RE: [linux-lvm] Volume group not f ound on restart [resent]
Message-ID: <20020603120313.C14161@sistina.com>
References: <E631530D51ABD411B823009027855C5B0278C9@THOR>
Mime-Version: 1.0
In-Reply-To: <E631530D51ABD411B823009027855C5B0278C9@THOR>; from Murthy.Kambhampaty@goeci.com on Fri, May 31, 2002 at 06:36:22PM -0400
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
Date: Mon Jun  3 05:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 31, 2002 at 06:36:22PM -0400, Murthy Kambhampaty wrote:
> Heinz, thanks for the help recovering the data -- running a 1.1rc2 kernel
> and tools, and vgchange -qn -ay "db_vol" I was able to mount the (fs on the)
> lv and recover the data.
> 
> Having done that, I was, however unable to remove the lv or the vg (the
> volume is set as "static" and so lvremove refuses to do its thing, and on
> from there ...).

That's intentionally in order to avoid situations, where a volume group
without quorum is activated and due to some strange cosmic particles ;-)
regains qourum afterwards giving as inconsistent metadata.
We'll probably have an overwrite for the static mode with no qourum VGs
in LVM2.

> So, I fdisked the partition to a linux partition and did a
> vgscan and pvscan, which gives me 'pvscan -- ERROR "pv_read(): PV identifier
> invalid" reading physical volumes'. But apparently this is just LVM's way of
> saying, I've scanned for PVs and found none with a valid identifier:

Yes :)

> if I
> pvcreate a physical volume the message goes away ;) Is there a better way?

Well, we'ld need a code change to display a different message.

> 
> I could not replicate the other problem mentioned in my e-mail below; I find
> this hard to believe, but since it was early enough, I must have done an
> lvremove correctly, but did not properly do the vgreduce before removing the
> hdd on which I was putting the snapshots, to create the problem I had.

That seams to be the likely reason.

> 
> Thanks again for helping me recover these data, and I look forward to LVM2.

You're welcome.

> In the meanwhile, I will be patching the XFS cvs kernel to LVM 1.0.4 for
> production use.

FYI: LVM 1.0.4 has a locking flaw preventing pvmoves in active volume groups.
     Works fine in inactive ones.
     If you check out with "-r LVM_BRANCH_1-0" from CVS, you'll get a fix for
     that (Please look for complete CVS access instructions at www.sistina.com).
     LVM 1.0.5 won't probably come out before next week because I'll
     be heading down to LinuxTag.

Regards,
Heinz    -- The LVM Guy --


> 	Murthy
> 
> PS: All three linux boxes here run LVM - one on Mylex raid, one on 3ware
> raid, and the third on single scsi and ide disks. Except for system volumes,
> LVM allows me to forego partitioning physical volumes; I just put them whole
> into a given volumen group and create lvs as necessary. It may not be
> superior to the alternative, but it sure sounds cutting-edge compared to
> having a "DOS partition table" floating around - how OLD is that :-)
> 	SMK
> 
> 
> 
> > -----Original Message-----
> > From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> > Sent: Friday, May 24, 2002 04:33
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] Volume group not found on restart [resent]
> > 
> > 
> > On Thu, May 23, 2002 at 03:09:12PM -0400, Murthy Kambhampaty wrote:
> > > Heinz, thanks for the response.
> > > 
> > > > Strange.
> > > > If you were able to "lvremove /dev/db_vol/snap_db" it 
> > shouldn't be 
> > > > visible in the metadata I got from you.
> > > > 
> > > > But it still is in there and has extents allocated on the 
> > > > physical volume
> > > > you wanted to remove from the volumegroup "db_vol". Unless 
> > > > there was no
> > > > extents allocated on physical volume /dev/sda, running 
> > > > "vgreduce db_vol /dev/sda" was impossible.
> > > > 
> > > > The steps needed would have been:
> > > > 
> > > > - close /dev/db_vol/db_snap by unmounting it
> > > > - successfully removing the LV with "lvremove /dev/db_vol_snap"
> > > > - reducing the volume group successfully with "vgreduce 
> > > > db_vol /dev/sda"
> > > > 
> > > > To check it:
> > > > - vgdisplay -v db_vol # just showing 1 PV in VG "db_vol"
> > > > - pvscan              # showing /dev/sda to be an unused PV
> > > > 
> > > I'm pretty sure I went throught the sequence you describe 
> > above, and the
> > > pvscan at the end said /dev/sda was in "db_vol. I'll 
> > replicate the setup (I
> > > have two volumes that are now tmp volumes with filesystems 
> > on disk, which
> > > I'll convert to two different PVs and go through building 
> > up and tearing
> > > down the setup I had before) and let you know if I get the 
> > same behavior.
> > 
> > Ok.
> > In case you are able to replicate it, I'ld be very interested 
> > to find out
> > why it happens in order to come up with a fix.
> > 
> > > 
> > > > 
> > > > > 
> > > > > > > 
> > > > > > > So, the preferred course here is to "to change the metadata 
> > > > > > in order to get
> > > > > > > rid of the gone physical volume", and all will be well. 
> > > > > > 
> > > > > > So there's cons vs. (temporarly) trying 1.1-rc to quorum 
> > > > > > activate db_vol
> > > > > > in order to retrieve the data?
> > > > > > 
> > > > > Only to the extent that your message indicated that LVM 
> > > > 1.1-rc2 was unstable
> > > > > (BTW, do I only install the userspace tools and retain my 
> > > > LVM 1.0.1rc4
> > > > > kernel code (or do I have to patch the XFS cvs kernel with 
> > > > the LVM 1.1-rc2
> > > > > kernel code to implement this alternative?)
> > > > 
> > > > You can go with just the tools in a temporary location.
> > > I tried it (download 1.1-rc2, built the kernel and tools, 
> > installed the
> > > tools (about which time I got your message), then ran 
> > "vgscan; vgchange -qn
> > > -ay "db_vol") and got the error message "vgchange -- driver 
> > doesn't support
> > > volume group quorum!"
> > 
> > Sorry, my fault :(
> > Forgot to mention.
> > 
> > > 
> > > I'll install the patched kernel, and try it. Once I recover 
> > the data, I can
> > > go back to the stock 2.4.18-xfs kernel, installing the lvm-tools rpm
> > > supplied with RH 7.2.
> > > 
> > > I'll let you know how it goes ... ;)
> > 
> > Thanks.
> > 
> > > 	Murthy
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > -- 
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > =-=-=-=-=-=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina 
> > Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > =-=-=-=-=-=-=-=-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
