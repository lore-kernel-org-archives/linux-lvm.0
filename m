Return-Path: <cbourne@xapnet.com>
Message-ID: <3B7C2E8A.8B342B25@xapnet.com>
Date: Thu, 16 Aug 2001 13:35:22 -0700
From: Chris Bourne <cbourne@xapnet.com>
MIME-Version: 1.0
References: <200108162001.f7GK1r299082@harmonyworks.net>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #291 - 15 msgs
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
To: linux-lvm@sistina.com

linux-lvm-request@sistina.com wrote:

> Send linux-lvm mailing list submissions to
>         linux-lvm@sistina.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.sistina.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
>         linux-lvm-request@sistina.com
>
> You can reach the person managing the list at
>         linux-lvm-admin@sistina.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
> Today's Topics:
>
>    1. Re: [lvm-devel] Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com (Andrea Arcangeli)
>    2. Re: Adding a mirror after-the-fact (Luca Berra)
>    3. RE: Renumbered drives hosed VG. (Diehl, Jeffrey)
>    4. Re: Help with redhat install (gerry@dorfam.ca)
>    5. Re: Help with redhat install (Jason Tackaberry)
>    6. Re: Help with redhat install (Jason Tackaberry)
>    7. Problem using lvreduce (Faux Pas III)
>    8. Re: Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com (Joe Thornber)
>    9. Re: Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com (Joe Thornber)
>   10. Re: Why can't I get more bandwidth by adding more dis
>        ks? (STEFANG(GMX))
>   11. RE: Problem using lvreduce (Soohoon Lee)
>   12. lvm-mod PLEASE HELP!!! (Chris Bourne)
>   13. Re: lvm-mod PLEASE HELP!!! (Neil Macvicar)
>   14. Re: lvm-mod PLEASE HELP!!! (Lewis Bergman)
>
> --__--__--
>
> Message: 1
> Date: Wed, 15 Aug 2001 23:19:32 +0200
> From: Andrea Arcangeli <andrea@suse.de>
> To: Christoph Hellwig <hch@suse.de>, lvm-devel@sistina.com,
>         Joe Thornber <thornber@btconnect.com>, Kurt Garloff <garloff@suse.de>,
>         linux-lvm@sistina.com, linux-kernel@vger.kernel.org
> Subject: Re: [lvm-devel] Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
> Reply-To: linux-lvm@sistina.com
>
> On Wed, Aug 15, 2001 at 10:20:30PM +0200, Christoph Hellwig wrote:
> > In principle yes, but beta7 is the wrong target, the one that needs to
> > be converted easily is the old (=0.9) format, people using betas should
> > really know what they are doing while a seamless upgrade from the latest
> > release version is a must.
>
> fine with me, beta7 or 0.9 doesn't matter in this respect.
>
> Andrea
>
> --__--__--
>
> Message: 2
> Date: Wed, 15 Aug 2001 23:30:04 +0200
> From: Luca Berra <bluca@comedia.it>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Adding a mirror after-the-fact
> Reply-To: linux-lvm@sistina.com
>
> On Wed, Aug 15, 2001 at 10:56:23AM +0200, Heinz J . Mauelshagen wrote:
> > On Tue, Aug 14, 2001 at 05:11:59PM -0400, Jason Tackaberry wrote:
> > > I know this isn't strictly an LVM question, but ...
> > >
> > > Suppose I have a volume group with 1 physical volume, say a 9GB disk.
> > > Now, after some time, I decide I want to mirror this VG with another 9GB
> > > disk.  What options do I have?  AFAICS, the only way to do this would be
> > > to start from scratch?  This is a pretty simple and presumably common
> > > thing to want to do, so I hope I'm wrong.  :)
> >
> > Yes, you are (with 2.4 kernels) ;-)
> >
> > You could either mirror the whole disk using MD *without* persistent superblocks
> >
> raid superblock is at end of disk, so you could also
> create an lv with only the last PE of the PV and NEVER USE it
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> --__--__--
>
> Message: 3
> From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
> To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
> Subject: RE: [linux-lvm] Renumbered drives hosed VG.
> Date: Wed, 15 Aug 2001 15:47:22 -0600
> Reply-To: linux-lvm@sistina.com
>
> Well, if I do a vgscan, it should find all of the VG's, right?  The log
> below indicates that this isn't happening.  All I want to do is create a
> large volume, move the data from the Database VG onto that new volume, then
> incorporate the space used by Database into the new volume and resize my
> filesystem.  This should not take 2 days!
>
> Any help would be most appreciated.
>
> Script started on Wed Aug 15 08:29:02 2001
>
> [root@filmore jdiehl]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "Database"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: you may not have an actual VGDA backup of your volume
> group
>
> [root@filmore jdiehl]# vgcreate Database2 -s 8M /dev/sdc6
> vgcreate -- "/dev/sdc6" is no new physical volume
> vgcreate -- physical volume "/dev/sdc6" already belongs to volume group
> "Database2"
>
> [root@filmore jdiehl]#
> [root@filmore jdiehl]# exit
>
> Mike Diehl,
> Network Monitoring Tool Devl.
> Sandia National Laboratories.
> (505) 284-3137
> jdiehl@sandia.gov
>
> > -----Original Message-----
> > From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> > Sent: August 15, 2001 2:57 AM
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] Renumbered drives hosed VG.
> >
> >
> > On Tue, Aug 14, 2001 at 02:52:17PM -0600, Diehl, Jeffrey wrote:
> > > Hi all,
> > >
> > > I recently upgraded from a modular kernel to a monolithic
> > kernel, which
> > > renumbered all of my drives.  sda became sdb, sdb became
> > sdc and adc became
> > > sda, etc.  Now one of my VG's is hosed.  How do I recover from this?
> >
> > A vgscan run should excatly address this.
> > Did it take place after the changes and *before* "vgchange -ay"?
> >
> > >
> > > Thanx,
> > > Mike Diehl,
> > > Network Monitoring Tool Devl.
> > > 284-3137
> > > jdiehl@sandia.gov
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
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>
> --__--__--
>
> Message: 4
> Date: Wed, 15 Aug 2001 17:47:18 -0400 (EDT)
> From: <gerry@dorfam.ca>
> To: <linux-lvm@sistina.com>
> Subject: Re: [linux-lvm] Help with redhat install
> Reply-To: linux-lvm@sistina.com
>
> Although 2.4.2-2 has lvm support built in I don't believe it is enabled in
> the default kernel.  I think you have to recompile the kernel and enable
> it.
>
> I forget what version is in the kernel.  With lvm 1.0 just released you
> may wish to patch the kernel source to the latest level so it will work
> with lvm 1.0 and then recompile.
>
> Gerry
>
> On Wed, 15 Aug 2001, Chris Bourne wrote:
>
> > Hello!!
> >          I am trying to get lvm working on redhat 7.1 with kernel
> > 2.4.2-2. I down loaded the source rpm's 1)
> > lvm-iop-0.9.1_beta6-1.src.rpm   2)
> > lvm-iop-patchgen-0.9.1_beta6-1.src.rpm  and the base rpm 3)
> > lvm-base-1.1-1.i386.rpm. I did a rpm --rebuild and ran the rpm command
> > and all seemed to install well with no problems. The problem I did
> > discover is that there is no lvm dir. in /proc and the lvm-mod is
> > nowhere to be found. I was under the impression that kernel 2.4 has lvm
> > already built in. I did a insmod lvm-mod and modprobe lvm-mod and nada.
> > I cannot figure out what I am doing wrong or if I should not be using
> > this version of lvm and use lvm 1.0 instaed (will it work on redhat?).
> > Thanks, Chris.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>
> Gerry
> --
> "The lyfe so short, the craft so long to learne"  Geoffrey Chaucer
>
> --__--__--
>
> Message: 5
> Date: Wed, 15 Aug 2001 18:19:59 -0400
> From: Jason Tackaberry <tack@linux.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Help with redhat install
> Reply-To: linux-lvm@sistina.com
>
> > Although 2.4.2-2 has lvm support built in I don't believe it is enabled in
> > the default kernel.  I think you have to recompile the kernel and enable
> > it.
>
> If you have to recompile the kernel to get LVM support and download the
> userland lvm tools (since I don't see an lvm rpm), I don't think that
> quite qualifies as "built in."
>
> Jason.
>
> --__--__--
>
> Message: 6
> Date: Wed, 15 Aug 2001 18:23:10 -0400
> From: Jason Tackaberry <tack@linux.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Help with redhat install
> Reply-To: linux-lvm@sistina.com
>
> * Jason Tackaberry (tack@linux.com) [010815 18:21]:
> > > Although 2.4.2-2 has lvm support built in I don't believe it is enabled in
> > > the default kernel.  I think you have to recompile the kernel and enable
> > > it.
> >
> > If you have to recompile the kernel to get LVM support and download the
> > userland lvm tools (since I don't see an lvm rpm), I don't think that
> > quite qualifies as "built in."
>
> Nevermind.  I guess I would have been right if you were talking about
> RedHat, and not the kernel that comes with it. :)
>
> Sorry,
> Jason.
>
> --__--__--
>
> Message: 7
> Date: Wed, 15 Aug 2001 19:50:08 -0400
> From: Faux Pas III <fauxpas@trellisinc.com>
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Problem using lvreduce
> Reply-To: linux-lvm@sistina.com
>
> I have been having a problem removing a drive from a running
> volume group.  I repeat this by creating a volume group from
> /dev/sda, /dev/sdb (each 18gb), /dev/hde, and /dev/hdg (each
> 30gb).  I create an LV that spans all physical extents in
> this group.  I then try to use lvreduce to take 4400 PE's out
> of the group (slightly more than occupy either of the two
> scsi drives).
>
> Gryphon:~# lvreduce -l -4400 /dev/test_vg/test_lv
> lvreduce -- WARNING: reducing active logical volume to 72.62 GB
> lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
> lvreduce -- do you really want to reduce "/dev/test_vg/test_lv"? [y/n]: y
> lvreduce -- ERROR "pv_check_consistency_all_pv(): PE" volume group "test_vg" is inconsistent
> lvreduce -- WARNING: you don't have an automatic backup of "test_vg"
> lvreduce -- logical volume "/dev/test_vg/test_lv" successfully reduced
>
> After this, all manner of badness ensues, including:
>
> Gryphon:~# vgdisplay
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan
>
> In any event, I'm not able to pvmove or vgreduce to get the drive out of
> the volume group as I would expect.   This is on 2.4.8 + LVM 1.0, and also
> manifests on 2.4.7 + LVM 0.9.1beta8.  I can provide any other diagnostic
> info that would be helpful, as I can reproduce this problem easily.
>
> --
> Josh Litherland (fauxpas@trellisinc.com)
>  It is by caffeine alone that I set my mind in motion.
>   It is by the juice of Mtn Dew that thoughts acquire speed.
>
> --__--__--
>
> Message: 8
> Date: Thu, 16 Aug 2001 11:05:26 +0100
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
> From: Joe Thornber <thornber@btconnect.com>
> Reply-To: linux-lvm@sistina.com
>
> On Wed, Aug 15, 2001 at 03:24:32PM -0500, Eric M. Hopper wrote:
> > On Wed, Aug 15, 2001 at 09:06:22PM +0100, Joe Thornber wrote:
> > >
> > > From looking at the metadata I have no way of knowing which version of
> > > software the PV was created with.  This is a sorry state of affairs,
> > > but sadly true.  So the upgrade script does the following:
> > >
> > > o interrogate the existing tools that created the PV to find where they put
> > >   the PE's
> > >
> > > o write this value into the new field.
> > >
> > > At this point the new driver, and tools should be installed.
> >
> >       So, has the metadata also been updated to have a version number
> > field in an easily found location?  This is a very unpleasant state of
> > affairs, and it will happen again if you haven't done this.
>
> The metadata has always had a version number field.  This is a single
> integer field rather than a major/minor/patchlevel triplet which I
> would prefer.  This field used to be set to 1, and is now set to two
> since the extra field was added.  The real problem was that the
> metadata format wasn't self consistent, it didn't tell you everything
> you needed to know, there was 'magic' in the tools.
>
> >       This helps my peace of mind about doing the upgrade.  Perhaps
> > now I will do it with confidence that it will work and I'll get the
> > order of operations right.
>
> Read the instructions and follow the steps carefully and you should
> have no trouble.
>
> >
> >       One question I have:
> >
> >       Does it hurt for the old drivers to be in the kernel at the time
> > you run the upgrade script if none of the VGs are 'active'?
>
> Let's see ... I think the old drivers do need to be present, so if
> necessary a dummy LV can be created on empty PV's in order to get
> pvdisplay to show the location of the start PE.  Yes.
>
> >       I compiled LVM into my kernel instead of leaving it as a module,
> > so if it were a problem, I'd have to compile a new kernel that didn't
> > have the drivers.
>
> If I were you I'd have builds of both the old and new kernel/tools
> ready before you start.
>
> - Joe
>
> --__--__--
>
> Message: 9
> Date: Thu, 16 Aug 2001 11:08:02 +0100
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
> From: Joe Thornber <thornber@btconnect.com>
> Reply-To: linux-lvm@sistina.com
>
> On Wed, Aug 15, 2001 at 11:13:30PM +0200, Andrea Arcangeli wrote:
> > On Wed, Aug 15, 2001 at 11:55:48AM -0600, Andreas Dilger wrote:
> > > Saying you "need" the old versions of the installed tools to read the
> > > on disk data is bogus, IMNSHO.  You could easily have a flag which says
> > > "calculate the PE offsets using the old algorithm or the new algorithm".
> >
> > Definitely. This is what I was asking for. That would be optimal.
>
> I'm going to go through all the beta releases and confirm this, but as
> I understand it there are not just two ways of calculating it.
> Otherwise yes it would be easy.
>
> - Joe
>
> --__--__--
>
> Message: 10
> From: "STEFANG(GMX)" <sgiessler@gmx.net>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Why can't I get more bandwidth by adding more dis
>         ks?
> Date:  Wed, 15 Aug 2001 21:15:48 +0200
> Reply-To: linux-lvm@sistina.com
>
> Hallo list,
>
> on Fri, 10 Aug 2001, James Mello (kingjamm@colltech.com) wrote:
>
> > In this case instead of writing seqentially, you can use an a random call
> > followed by an fseek to write a block or block(s) to a relatively random
> > location. If I can get some time, I'll try to write something up. But I'd
> > venture to say that someone out there has written a tool that already does
> > this. Perhaps a google search may be in order.
>
> If you don't mind, to do the test's on a filesystem (instead of raw
> IO) you can use bonnie.  Raw IO benchmarks usually only matter for
> Databases installed on raw devices...   For practical considerations
> a filesystem and bonnie seem more appropriate.
>
> CU,
>    Stefan
> --
> Stefan Giessler                                       e-mail:
> sgiessler@gmx.net
>
> I'd never join any club that would have the likes of me as a member.
>                                                                 -- Groucho
> Marx
>
> --__--__--
>
> Message: 11
> From: Soohoon Lee <soohoon.lee@api-networks.com>
> To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
> Subject: RE: [linux-lvm] Problem using lvreduce
> Date: Thu, 16 Aug 2001 13:06:39 -0400
> Reply-To: linux-lvm@sistina.com
>
> That's the problem what I had.
> I posted fix and waiting verification but
> mail traffic saying they are busy with 1.0 release and PE start point
> problem.
> And seems, this problem is also related to that PE start point problem.
> Anyway, quick and no warranty fix is
>
> --- pv_release_pe.c.old Thu Aug 16 09:23:35 2001
> +++ pv_release_pe.c     Wed Aug 15 09:09:06 2001
> @@ -85,7 +85,7 @@
>           }
>           pe_index = ( vg->lv[l]->lv_current_pe[p].pe -
>                        LVM_VGDA_SIZE ( vg->pv[pv_num]) / SECTOR_SIZE) /
> -                      vg->pe_size;
> +                      vg->pe_size - 1;
>           debug ( "pv_release_pe -- pv_name: %s  pe: %lu  sector: %lu\n",
>                    vg->pv[pv_num]->pv_name,
>                    pe_index,
>
> -----Original Message-----
> From: Faux Pas III [mailto:fauxpas@trellisinc.com]
> Sent: Wednesday, August 15, 2001 7:50 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Problem using lvreduce
>
> I have been having a problem removing a drive from a running
> volume group.  I repeat this by creating a volume group from
> /dev/sda, /dev/sdb (each 18gb), /dev/hde, and /dev/hdg (each
> 30gb).  I create an LV that spans all physical extents in
> this group.  I then try to use lvreduce to take 4400 PE's out
> of the group (slightly more than occupy either of the two
> scsi drives).
>
> Gryphon:~# lvreduce -l -4400 /dev/test_vg/test_lv
> lvreduce -- WARNING: reducing active logical volume to 72.62 GB
> lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
> lvreduce -- do you really want to reduce "/dev/test_vg/test_lv"? [y/n]: y
> lvreduce -- ERROR "pv_check_consistency_all_pv(): PE" volume group "test_vg"
> is inconsistent
> lvreduce -- WARNING: you don't have an automatic backup of "test_vg"
> lvreduce -- logical volume "/dev/test_vg/test_lv" successfully reduced
>
> After this, all manner of badness ensues, including:
>
> Gryphon:~# vgdisplay
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan
>
> In any event, I'm not able to pvmove or vgreduce to get the drive out of
> the volume group as I would expect.   This is on 2.4.8 + LVM 1.0, and also
> manifests on 2.4.7 + LVM 0.9.1beta8.  I can provide any other diagnostic
> info that would be helpful, as I can reproduce this problem easily.
>
> --
> Josh Litherland (fauxpas@trellisinc.com)
>  It is by caffeine alone that I set my mind in motion.
>   It is by the juice of Mtn Dew that thoughts acquire speed.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> --__--__--
>
> Message: 12
> Date: Thu, 16 Aug 2001 12:53:33 -0700
> From: Chris Bourne <cbourne@xapnet.com>
> Organization: Xapnet
> To: lvm <linux-lvm@sistina.com>
> Subject: [linux-lvm] lvm-mod PLEASE HELP!!!
> Reply-To: linux-lvm@sistina.com
>
> Hello !!!
>            I really need help with this install concerning the module
> lvm-mod. I am running redaht 7.1 with kernel 2.4.2-2. I have know
> installed lvm-1.0 and applied the patch. I have basically read and
> followed the directions over and over and still when I insmod lvm-mod It
> tells me no module to be found and I cannot figure it out. 1) I ran the
> configure script 2) ran make to create the patch and applied it 3)  ran
> make and make install.  Thanks, Chris.
>
> --__--__--
>
> Message: 13
> From: "Neil Macvicar" <neilm@foobarhouse.com>
> To: <linux-lvm@sistina.com>
> Subject: Re: [linux-lvm] lvm-mod PLEASE HELP!!!
> Date: Thu, 16 Aug 2001 20:55:46 +0100
> Organization: FoobarHouse Systems
> Reply-To: linux-lvm@sistina.com
>
> Try 'depmod -a' as root.
>
> --Neil.
>
> ----- Original Message -----
> From: "Chris Bourne" <cbourne@xapnet.com>
> To: "lvm" <linux-lvm@sistina.com>
> Sent: Thursday, August 16, 2001 8:53 PM
> Subject: [linux-lvm] lvm-mod PLEASE HELP!!!
>
> > Hello !!!
> >            I really need help with this install concerning the module
> > lvm-mod. I am running redaht 7.1 with kernel 2.4.2-2. I have know
> > installed lvm-1.0 and applied the patch. I have basically read and
> > followed the directions over and over and still when I insmod lvm-mod It
> > tells me no module to be found and I cannot figure it out. 1) I ran the
> > configure script 2) ran make to create the patch and applied it 3)  ran
> > make and make install.  Thanks, Chris.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> --__--__--
>
> Message: 14
> From: Lewis Bergman <lbergman@abi.tconline.net>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvm-mod PLEASE HELP!!!
> Date: Thu, 16 Aug 2001 14:58:16 -0500
> Reply-To: linux-lvm@sistina.com
>
> On Thursday 16 August 2001 02:53 pm, you wrote:
> > Hello !!!
> >            I really need help with this install concerning the module
> > lvm-mod. I am running redaht 7.1 with kernel 2.4.2-2. I have know
> > installed lvm-1.0 and applied the patch. I have basically read and
> > followed the directions over and over and still when I insmod lvm-mod It
> > tells me no module to be found and I cannot figure it out. 1) I ran the
> > configure script 2) ran make to create the patch and applied it 3)  ran
> > make and make install.  Thanks, Chris.
> >
> After you applied the patch to the kernel did you then
> make dep clean bzlilo modules modules_install   ?
> You can substitute bzlilo for bzimage and then do the copying by hand to be
> safe. If you haven't done the last two then there would be no modules
> installed. Did you check under /lib/modules/kernelversion/ for the lvm
> modules?
> --
> Lewis Bergman
> Texas Communications
> 4309 Maple St.
> Abilene, TX 79602-8044
> 915-695-6962
>
> --__--__--
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest

I have tried everyones recommendations and still nothing. Thank you all for your help. I will continue to bang my head
against the wall. Chris.
