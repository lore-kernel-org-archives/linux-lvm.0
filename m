Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBD6mU100461
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 01:48:30 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBD6mHwR022959
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 01:48:18 -0500
Received: by wproxy.gmail.com with SMTP id i4so58723wra
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 22:48:17 -0800 (PST)
Message-ID: <40b3fe60512122248y5634c779p993fa953d09640c@mail.gmail.com>
Date: Tue, 13 Dec 2005 12:18:17 +0530
From: neelima dahiya <neelima.dahiya@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_12193_31137801.1134456497248"
Subject: [linux-lvm] prob using lvm2
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
To: linux-lvm@redhat.com

------=_Part_12193_31137801.1134456497248
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

I've got a a 80GB HD partitioned automatically during Fedora Core 4 setup.
That is the disk carries 8 partitions where the first to 4th i.e (/dev/hda1
to /dev/hda4) are dedicated to windows OS and (/dev/hda5) is mounted as
/boot and (/dev/sda6) as /home (/dev/hda7) as swap & (/dev/hda8) as /.

I have lvm2 installed on my system.

Now can i use lvm2 on the top of all and if yes how?

When i issued the command:

lvm> pvcreate /dev/hda5

the following message was displayed:

  /var/lock/lvm/P_orphans: open failed: Permission denied
  Can't get lock for orphan PVs

please reply.

Thanks & regards
neelima
On 12/12/05, linux-lvm-request@redhat.com <linux-lvm-request@redhat.com>
wrote:
>
> Send linux-lvm mailing list submissions to
>         linux-lvm@redhat.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://www.redhat.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
>         linux-lvm-request@redhat.com
>
> You can reach the person managing the list at
>         linux-lvm-owner@redhat.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
>
> Today's Topics:
>
>    1. Re: LVM onFly features (Michael Loftis)
>    2. Re: LVM onFly features (Nathan Scott)
>    3. Converting LVM back to Ext2? (Andrey Subbotin)
>    4. Re: Converting LVM back to Ext2? (Anil Kumar Sharma)
>    5. Re: Newbie of LVM (Alasdair G Kergon)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Sun, 11 Dec 2005 18:14:39 -0700
> From: Michael Loftis <mloftis@wgops.com>
> Subject: Re: [linux-lvm] LVM onFly features
> To: Nathan Scott <nathans@sgi.com>
> Cc: linux-xfs@oss.sgi.com, linux-lvm@redhat.com
> Message-ID: <9CD94D4B0F3B63057B4C2BC0@dhcp-2-206.wgops.com>
> Content-Type: text/plain; charset=3Dus-ascii; format=3Dflowed
>
>
>
> --On December 12, 2005 9:15:39 AM +1100 Nathan Scott <nathans@sgi.com>
> wrote:
>
>
> >> XFS has terrible unpredictable performance in production.  Also it has
> >> very
> >
> > What on earth does that mean?  Whatever it means, it doesn't
> > sound right - can you back that up with some data please?
>
> The worst problems we had we're likely most strongly related to running
> out
> of journal transaction space.  When XFS was under high transaction load
> sometimes it would just hang everything syncing meta-data.  From what I
> understand this has supposedly been dealt with, but we were still having
> these issues when we decommissioned the last XFS based server a year ago.
> Another datapoint is the fact we primarily served via NFS, which XFS
> (atleast at the time) still didn't behave great with, I never did see any
> good answers on that as I recall.
>
> >
> >> bad behavior when recovering from crashes,
> >
> > Details?  Are you talking about this post of yours:
> > http://oss.sgi.com/archives/linux-xfs/2003-06/msg00032.html
>
> That particular behavior happened a lot.  And it wasn't annoying that it
> happened, so much so that it happened after the system claimed it was
> clean.  Further, yes, that hardware has been fully checked out.  There's
> nothing wrong with the hardware.  I wish there was, that'd make me feel
> better honestly.  The only thing I can reason is bugs in the XFS
> fsck/repair tools, or *maybe* an interaction with XFS and the DAC960
> controller, or NFS.  The fact that XFS has weird interactions with NFS at
> all bugs me, but I don't understand the code involved well enough.  There
> might be a decent reason.
>
> >
> > There have been several fixes in this area since that post.
> >
> >> often times it's tools totally fail to clean the filesystem.
> >
> > In what way?  Did you open a bug report?
> >
> >> It also needs larger kernel stacks because
> >> of some of the really deep call trees,
> >
> > Those have been long since fixed as far as we are aware.  Do you
> > have an actual example where things can fail?
>
> We pulled it out of production and replaced XFS with Reiser.  At the time
> Reiser was far more mature on Linux.  XFS Linux implementation (in
> combination with other work in the block layer as you mention later) may
> have matured to atleast a similar (possibly moreso) point now.  I've just
> personally lost more data due to XFS than Reiser.  I've also had problems
> with ext3 in the (now distant) past while it was teething still.
>
>
> >> so when you use it with LVM or MD it
> >> can oops unless you use the larger kernel stacks.
> >
> > Anything can oops in combination with enough stacked device drivers
> > (although there has been block layer work to resolve this recently,
> > so you should try again with a current kernel...).  If you have an
> > actual example of this still happening, please open a bug or at least
> > let the XFS developers know of your test case.  Thanks.
>
> That was actually part of the problem.  There was no time, and no
> hardware,
> to try to reproduce the problem in the lab.  This isn't an XFS problem
> specifically, this is an Open Source problem really....If you encounter a
> bug, and you're unlucky enough to be a bit of an edge case, you better be
> prepared to pony up with hardware and mantime to diagnose and reproduce i=
t
> or it might not get fixed.  Again though, this is common to the whole ope=
n
> source community, and not XFS, Linux, LVM, or any other project specific.
>
> Having said that, if you can reproduce it, and get good details, the open
> source community has a far better track record of *really* fixing and
> addressing bugs than any commercial software.
>
> >
> >> We also have had
> >> problems with the quota system but the details on that have faded.
> >
> > Seems like details of all the problems you described have faded.
> > Your mail seems to me like a bit of a troll ... I guess you had a
> > problem or two a couple of years ago (from searching the lists)
> > and are still sore.  Can you point me to mailing list reports of
> > the problems you're refering to here or bug reports you've opened
> > for these issues?  I'll let you know if any of them are still
> > relevent.
>
> No, we had dozens actually.  The only ones that were really crippling wer=
e
> when XFS would suddenly unmount in the middle of the business day for no
> apparent reason.  Without details bug reports are ignored, and we couldn'=
t
> really provide details or filesystem dumps because there was too much
> data,
> and we had to get it back online.  We just moved as fast as we could away
> from XFS.  It wasn't just a one day thing, or a week, there was a trail o=
f
> crashes with XFS at the time.  Sometimes the machine was so locked up fro=
m
> XFS pulling the rug out that the console was wedged up pretty badly too.
>
> I wanted to provide the information as a data point from the other side a=
s
> it were not get into a pissing match with the XFS developers and
> community.
> XFS is still young, as is ReiserFS.  and while Reiser is a completely new
> FS and XFS has roots in IRIX and other implementations, their age is
> similar since XFS' Linux implementation is around the same age.  If the
> state has change in the last 6-12 months then so much the better.  The
> facts are that XFS during operation had many problems, and as we pulled i=
t
> out still had many unresolved problems as we replaced it with ReiserFS.
> And Reiser has been flawless except for one problem already mentioned on
> Linux-LVM very clearly caused by an external SAN/RAID problem which EMC
> has
> corrected (completely as an aside -- anyone running a CX series REALLY
> needs to be on the latest code rev, you might never run into the bug, and
> i'm still not sure exactly which one we hit, there were atleast two that
> could have caused the data corruption, but if you do, it can be ugly).
>
>
> The best guess that I have as to why we had such a bad time with XFS was
> the XFS+NFS interaction and possibly an old (unknown to me -- this is jus=
t
> a guess) bug that may have created some minor underlying corruption that
> the repair tools couldn't fully fix or diagnose may have caused our
> continual (seemingly random) problems.  I don't believe in really random
> problems, atleast not in computers anyway.
>
> >
> > cheers.
> >
> > --
> > Nathan
> >
>
>
>
> --
> "Genius might be described as a supreme capacity for getting its
> possessors
> into trouble of all kinds."
> -- Samuel Butler
>
>
>
> ------------------------------
>
> Message: 2
> Date: Mon, 12 Dec 2005 13:28:30 +1100
> From: Nathan Scott <nathans@sgi.com>
> Subject: Re: [linux-lvm] LVM onFly features
> To: Michael Loftis <mloftis@wgops.com>
> Cc: linux-xfs@oss.sgi.com, linux-lvm@redhat.com
> Message-ID: <20051212132830.A7432365@wobbly.melbourne.sgi.com>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On Sun, Dec 11, 2005 at 06:14:39PM -0700, Michael Loftis wrote:
> > --On December 12, 2005 9:15:39 AM +1100 Nathan Scott <nathans@sgi.com>
> > The worst problems we had we're likely most strongly related to running
> out
> > of journal transaction space.  When XFS was under high transaction load
>
> Can you define "high load" for your scenario?
>
> > sometimes it would just hang everything syncing meta-data.  From what I
>
> There is no situation in which XFS will "hang everything".  A process
> that is modifying the filesystem may be paused briefly waiting for space
> to become available in the log, and that involves flushing the in-core
> log buffers.  But only processes that need log space will be paused
> waiting for that (relatively small) write to complete.  This is also not
> a behaviour peculiar to XFS, and with suitable tuning in terms of mkfs/
> mount/sysctl parameters, it can be completely controlled.
>
> > understand this has supposedly been dealt with, but we were still havin=
g
> > these issues when we decommissioned the last XFS based server a year
> ago.
>
> I'd like some more information describing your workload there if
> you could provide it.  Thanks.
>
> > Another datapoint is the fact we primarily served via NFS, which XFS
> > (atleast at the time) still didn't behave great with, I never did see
> any
> > good answers on that as I recall.
>
> Indeed.  Early 2.6 kernels did have XFS/NFS interaction problems,
> with NFS using generation number zero as "magic", and XFS using
> that as a valid gen number.  That was fixed a long time ago.
>
> > controller, or NFS.  The fact that XFS has weird interactions with NFS
> at
> > all bugs me, but I don't understand the code involved well
> enough.  There
> > might be a decent reason.
>
> No, there's no reason, and XFS does not have "wierd interactions"
> with NFS.
>
> > >> It also needs larger kernel stacks because
> > >> of some of the really deep call trees,
> > >
> > > Those have been long since fixed as far as we are aware.  Do you
> > > have an actual example where things can fail?
> >
> > We pulled it out of production and replaced XFS with Reiser.  At the
> time
> > Reiser was far more mature on Linux.  XFS Linux implementation (in
>
> Not because of 4K stacks though surely?  That kernel option wasn't around
> then I think, and the reiserfs folks have also had a bunch of work to do
> in that area too.
>
> > > Seems like details of all the problems you described have faded.
> > > Your mail seems to me like a bit of a troll ... I guess you had a
> > > problem or two a couple of years ago (from searching the lists)
> > > and are still sore.  Can you point me to mailing list reports of
> > > the problems you're refering to here or bug reports you've opened
> > > for these issues?  I'll let you know if any of them are still
> > > relevent.
> >
> > No, we had dozens actually.  The only ones that were really crippling
> were
> > when XFS would suddenly unmount in the middle of the business day for n=
o
> > apparent reason.  Without details bug reports are ignored, and we
> couldn't
>
> The NFS issue had the unfortunate side effect of causing filesystem
> corruption and hence forced filesystem shutdowns would result.  There
> were also bugs on that error handling path, so probably you hit two
> independent XFS bugs on a pretty old kernel version.
>
> > I wanted to provide the information as a data point from the other side
> as
> > it were not get into a pissing match with the XFS developers and
> community.
>
> You were claiming long-resolved issues that existed in an XFS version
> from an early 2.6 kernel as still relevent.  That is quite misleading,
> and doesn't provide useful information to anyone.
>
> cheers.
>
> --
> Nathan
>
>
>
> ------------------------------
>
> Message: 3
> Date: Mon, 12 Dec 2005 15:25:23 +0700
> From: Andrey Subbotin <eploko@gmail.com>
> Subject: [linux-lvm] Converting LVM back to Ext2?
> To: linux-lvm@redhat.com
> Message-ID: <45980936.20051212152523@gmail.com>
> Content-Type: text/plain; charset=3Dus-ascii
>
> Hello all.
>
> I've got a 200GB HD partitioned automatically during Fedora Core 4 setup.
> That is the disk carries 2 partitions where the first one (/dev/sda1) is
> ext3 mounted as /boot and the second one (/dev/sda2) is an LVM.
>
> That is all clear and fancy but the problem is I'm faced with the fact I
> need to migrate the HD to Ext2 FS, so I could convert it to FAT32 later, =
so
> I could access it from a copy of the Windows OS I happen to boot recently=
 to
> do some work. The LVM on /dev/sda2 is full of data I need to save and the
> problem is I don't have a spare HD to temporarily copy all those 200GB to=
.
>
> If I had a spare HD I would eventually mount it, make a new Ext2 partitio=
n
> on it and then copy all the data from the LogicalVolume to the new
> partition. Then I would fire up fdisk and kill the LVM, thus freeing the
> space on the drive. Then, moving the data back to the first HD would be a
> snap. But without a spare disk I face a real challenge.
>
> My initial idea was to reduce the FS inside the LogicalVolume (it has
> ~40GB free of space) and then reduce the size of the LogicalVolume and th=
en
> reduce the PhysicalVolume /dev/sda2 by the freed number of cylinders. The=
n,
> I would create an ext2 partition over the freed cylinders and move some
> files from the LogicalVolume onto it. Then I thought I would repeat the
> process several times effectively migrating my data from the ever-shrinki=
ng
> LVM to the ever-growing plain Ext2 FS.
>
> The problem is I have little idea how I can shrink an LVM partition on
> /dev/sda2. And there seem to be very little information on this on the ne=
t.
>
> So far, I have lvreduce'd the FS inside the LogicalVolume and the
> LogicalVolume itselft to 35700000 4k blocks. Now, how do I redeuce the
> number of cyllinders occupied by the LVM on /dev/sda?
>
> I would really apreciate any help or ideas.
> Thanks a lot in advance.
>
> --
> See you,
> Andrey
>
> ICQ UIN: 114087545
> Journal: http://www.livejournal.com/users/e_ploko/
>
>
>
> ------------------------------
>
> Message: 4
> Date: Mon, 12 Dec 2005 19:50:30 +0530
> From: Anil Kumar Sharma <xplusaks@gmail.com>
> Subject: Re: [linux-lvm] Converting LVM back to Ext2?
> To: Andrey Subbotin <eploko@gmail.com>, LVM general discussion and
>         development <linux-lvm@redhat.com>
> Message-ID:
>         <52fe6b680512120620m2d9d462erdc37b7f3d79183de@mail.gmail.com>
> Content-Type: text/plain; charset=3D"iso-8859-1"
>
> U may reduce LV size and get some free space but that still will be lying
> on
> PV and there is no pvreduce (afaik).
>
> So, I think (I may be wrong), U are out of luck. Get your luck back, have
> same temporary storage for your data to change the size or convert PV.
>
> UC, LVM is good for multi-partitions and multi-disks, everything in
> multiples. That's the playground for LVM.
> When U (re)start for FC4 or FC5, have your linux space on multiple PV's.
> I will suggest utilize all 4 primary  partitions,
> 1. boot, 2. dual boot (if required) else PV and 3.& 4 also PV's. Swap goe=
s
> in LVM.
> LVM can make them look like one or as desired partitions (LV's), which U
> can
> change as per your requirements, even for dual boot.
>
> Hard luck with "auto partition" - it is good for itself! smart fellow not
> caring for our moods.
>
>
>
>
> On 12/12/05, Andrey Subbotin <eploko@gmail.com> wrote:
> >
> > Hello all.
> >
> > I've got a 200GB HD partitioned automatically during Fedora Core 4
> setup.
> > That is the disk carries 2 partitions where the first one (/dev/sda1) i=
s
> > ext3 mounted as /boot and the second one (/dev/sda2) is an LVM.
> >
> > That is all clear and fancy but the problem is I'm faced with the fact =
I
> > need to migrate the HD to Ext2 FS, so I could convert it to FAT32 later=
,
> so
> > I could access it from a copy of the Windows OS I happen to boot
> recently to
> > do some work. The LVM on /dev/sda2 is full of data I need to save and
> the
> > problem is I don't have a spare HD to temporarily copy all those 200GB
> to.
> >
> > If I had a spare HD I would eventually mount it, make a new Ext2
> partition
> > on it and then copy all the data from the LogicalVolume to the new
> > partition. Then I would fire up fdisk and kill the LVM, thus freeing th=
e
> > space on the drive. Then, moving the data back to the first HD would be
> a
> > snap. But without a spare disk I face a real challenge.
> >
> > My initial idea was to reduce the FS inside the LogicalVolume (it has
> > ~40GB free of space) and then reduce the size of the LogicalVolume and
> then
> > reduce the PhysicalVolume /dev/sda2 by the freed number of cylinders.
> Then,
> > I would create an ext2 partition over the freed cylinders and move some
> > files from the LogicalVolume onto it. Then I thought I would repeat the
> > process several times effectively migrating my data from the
> ever-shrinking
> > LVM to the ever-growing plain Ext2 FS.
> >
> > The problem is I have little idea how I can shrink an LVM partition on
> > /dev/sda2. And there seem to be very little information on this on the
> net.
> >
> > So far, I have lvreduce'd the FS inside the LogicalVolume and the
> > LogicalVolume itselft to 35700000 4k blocks. Now, how do I redeuce the
> > number of cyllinders occupied by the LVM on /dev/sda?
> >
> > I would really apreciate any help or ideas.
> > Thanks a lot in advance.
> >
> > --
> > See you,
> > Andrey
> >
> > ICQ UIN: 114087545
> > Journal: http://www.livejournal.com/users/e_ploko/
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>
>
> --
> Anil Kumar Shrama
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL:
> https://www.redhat.com/archives/linux-lvm/attachments/20051212/312e7a1b/a=
ttachment.html
>
> ------------------------------
>
> Message: 5
> Date: Mon, 12 Dec 2005 15:21:26 +0000
> From: Alasdair G Kergon <agk@redhat.com>
> Subject: Re: [linux-lvm] Newbie of LVM
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <20051212152126.GA25866@agk.surrey.redhat.com>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On Fri, Dec 09, 2005 at 02:12:43PM -0500, Matthew Gillen wrote:
> > Way Loss wrote:
>
> > > /dev/md5              153G  119G   27G  82% /www
>
> > >     My md5 is almost full and I wanna use LVM to merge
> > > my md5 with a new partition from a new hdd. I wanna
> > > ask if this possible for LVM to merge 2 partition
> > > together while one of them have data on it? I can't
> > > suffer any data loss and want to make sure that LVM
> > > works perfectly to what I want.
>
> > You're out of luck.  You can't take an existing partition and keep the
> > data yet switch it over to LVM.
>
> See also:
>   https://www.redhat.com/archives/linux-lvm/2005-October/msg00110.html
>
> Alasdair
> --
> agk@redhat.com
>
>
>
> ------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest, Vol 22, Issue 12
> *****************************************
>

------=_Part_12193_31137801.1134456497248
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,<br>
<br>
I've got a a 80GB HD partitioned automatically during Fedora Core 4
setup. That is the disk carries 8 partitions where the first to 4th i.e
(/dev/hda1&nbsp; to /dev/hda4) are dedicated to windows OS and
(/dev/hda5) is mounted as /boot and (/dev/sda6) as /home (/dev/hda7) as
swap &amp; (/dev/hda8) as /.<br><br>
I have lvm2 installed on my system.<br>
<br>
Now can i use lvm2 on the top of all and if yes how?<br>
<br>
When i issued the command:<br>
<br>
lvm&gt; pvcreate /dev/hda5<br>
<br>
the following message was displayed:<br>
<br>
&nbsp; /var/lock/lvm/P_orphans: open failed: Permission denied<br>
&nbsp; Can't get lock for orphan PVs<br>
<br>
please reply.<br>
<br>
Thanks &amp; regards <br>
neelima<br><div><span class=3D"gmail_quote">On 12/12/05, <b class=3D"gmail_=
sendername"><a href=3D"mailto:linux-lvm-request@redhat.com">linux-lvm-reque=
st@redhat.com</a></b> &lt;<a href=3D"mailto:linux-lvm-request@redhat.com">l=
inux-lvm-request@redhat.com
</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1=
ex;">Send linux-lvm mailing list submissions to<br>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"mailto:linux-lvm@redhat.com">
linux-lvm@redhat.com</a><br><br>To subscribe or unsubscribe via the World W=
ide Web, visit<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.c=
om/mailman/listinfo/linux-lvm</a><br>or, via email, send a message with sub=
ject or body 'help' to
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"mailto:linux=
-lvm-request@redhat.com">linux-lvm-request@redhat.com</a><br><br>You can re=
ach the person managing the list at<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;<a href=3D"mailto:linux-lvm-owner@redhat.com">linux-lvm-owner@r=
edhat.com
</a><br><br>When replying, please edit your Subject line so it is more spec=
ific<br>than &quot;Re: Contents of linux-lvm digest...&quot;<br><br><br>Tod=
ay's Topics:<br><br>&nbsp;&nbsp; 1. Re: LVM onFly features (Michael Loftis)=
<br>&nbsp;&nbsp; 2. Re: LVM onFly features (Nathan Scott)
<br>&nbsp;&nbsp; 3. Converting LVM back to Ext2? (Andrey Subbotin)<br>&nbsp=
;&nbsp; 4. Re: Converting LVM back to Ext2? (Anil Kumar Sharma)<br>&nbsp;&n=
bsp; 5. Re: Newbie of LVM (Alasdair G Kergon)<br><br><br>------------------=
----------------------------------------------------
<br><br>Message: 1<br>Date: Sun, 11 Dec 2005 18:14:39 -0700<br>From: Michae=
l Loftis &lt;<a href=3D"mailto:mloftis@wgops.com">mloftis@wgops.com</a>&gt;=
<br>Subject: Re: [linux-lvm] LVM onFly features<br>To: Nathan Scott &lt;<a =
href=3D"mailto:nathans@sgi.com">
nathans@sgi.com</a>&gt;<br>Cc: <a href=3D"mailto:linux-xfs@oss.sgi.com">lin=
ux-xfs@oss.sgi.com</a>, <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@r=
edhat.com</a><br>Message-ID: &lt;<a href=3D"mailto:9CD94D4B0F3B63057B4C2BC0=
@dhcp-2-206.wgops.com">
9CD94D4B0F3B63057B4C2BC0@dhcp-2-206.wgops.com</a>&gt;<br>Content-Type: text=
/plain; charset=3Dus-ascii; format=3Dflowed<br><br><br><br>--On December 12=
, 2005 9:15:39 AM +1100 Nathan Scott &lt;<a href=3D"mailto:nathans@sgi.com"=
>nathans@sgi.com
</a>&gt;<br>wrote:<br><br><br>&gt;&gt; XFS has terrible unpredictable perfo=
rmance in production.&nbsp;&nbsp;Also it has<br>&gt;&gt; very<br>&gt;<br>&g=
t; What on earth does that mean?&nbsp;&nbsp;Whatever it means, it doesn't<b=
r>&gt; sound right - can you back that up with some data please?
<br><br>The worst problems we had we're likely most strongly related to run=
ning out<br>of journal transaction space.&nbsp;&nbsp;When XFS was under hig=
h transaction load<br>sometimes it would just hang everything syncing meta-=
data.&nbsp;&nbsp;From what I
<br>understand this has supposedly been dealt with, but we were still havin=
g<br>these issues when we decommissioned the last XFS based server a year a=
go.<br>Another datapoint is the fact we primarily served via NFS, which XFS
<br>(atleast at the time) still didn't behave great with, I never did see a=
ny<br>good answers on that as I recall.<br><br>&gt;<br>&gt;&gt; bad behavio=
r when recovering from crashes,<br>&gt;<br>&gt; Details?&nbsp;&nbsp;Are you=
 talking about this post of yours:
<br>&gt; <a href=3D"http://oss.sgi.com/archives/linux-xfs/2003-06/msg00032.=
html">http://oss.sgi.com/archives/linux-xfs/2003-06/msg00032.html</a><br><b=
r>That particular behavior happened a lot.&nbsp;&nbsp;And it wasn't annoyin=
g that it
<br>happened, so much so that it happened after the system claimed it was<b=
r>clean.&nbsp;&nbsp;Further, yes, that hardware has been fully checked out.=
&nbsp;&nbsp;There's<br>nothing wrong with the hardware.&nbsp;&nbsp;I wish t=
here was, that'd make me feel
<br>better honestly.&nbsp;&nbsp;The only thing I can reason is bugs in the =
XFS<br>fsck/repair tools, or *maybe* an interaction with XFS and the DAC960=
<br>controller, or NFS.&nbsp;&nbsp;The fact that XFS has weird interactions=
 with NFS at<br>
all bugs me, but I don't understand the code involved well enough.&nbsp;&nb=
sp;There<br>might be a decent reason.<br><br>&gt;<br>&gt; There have been s=
everal fixes in this area since that post.<br>&gt;<br>&gt;&gt; often times =
it's tools totally fail to clean the filesystem.
<br>&gt;<br>&gt; In what way?&nbsp;&nbsp;Did you open a bug report?<br>&gt;=
<br>&gt;&gt; It also needs larger kernel stacks because<br>&gt;&gt; of some=
 of the really deep call trees,<br>&gt;<br>&gt; Those have been long since =
fixed as far as we are aware.&nbsp;&nbsp;Do you
<br>&gt; have an actual example where things can fail?<br><br>We pulled it =
out of production and replaced XFS with Reiser.&nbsp;&nbsp;At the time<br>R=
eiser was far more mature on Linux.&nbsp;&nbsp;XFS Linux implementation (in=
<br>combination with other work in the block layer as you mention later) ma=
y
<br>have matured to atleast a similar (possibly moreso) point now.&nbsp;&nb=
sp;I've just<br>personally lost more data due to XFS than Reiser.&nbsp;&nbs=
p;I've also had problems<br>with ext3 in the (now distant) past while it wa=
s teething still.
<br><br><br>&gt;&gt; so when you use it with LVM or MD it<br>&gt;&gt; can o=
ops unless you use the larger kernel stacks.<br>&gt;<br>&gt; Anything can o=
ops in combination with enough stacked device drivers<br>&gt; (although the=
re has been block layer work to resolve this recently,
<br>&gt; so you should try again with a current kernel...).&nbsp;&nbsp;If y=
ou have an<br>&gt; actual example of this still happening, please open a bu=
g or at least<br>&gt; let the XFS developers know of your test case.&nbsp;&=
nbsp;Thanks.<br>
<br>That was actually part of the problem.&nbsp;&nbsp;There was no time, an=
d no hardware,<br>to try to reproduce the problem in the lab.&nbsp;&nbsp;Th=
is isn't an XFS problem<br>specifically, this is an Open Source problem rea=
lly....If you encounter a
<br>bug, and you're unlucky enough to be a bit of an edge case, you better =
be<br>prepared to pony up with hardware and mantime to diagnose and reprodu=
ce it<br>or it might not get fixed.&nbsp;&nbsp;Again though, this is common=
 to the whole open
<br>source community, and not XFS, Linux, LVM, or any other project specifi=
c.<br><br>Having said that, if you can reproduce it, and get good details, =
the open<br>source community has a far better track record of *really* fixi=
ng and
<br>addressing bugs than any commercial software.<br><br>&gt;<br>&gt;&gt; W=
e also have had<br>&gt;&gt; problems with the quota system but the details =
on that have faded.<br>&gt;<br>&gt; Seems like details of all the problems =
you described have faded.
<br>&gt; Your mail seems to me like a bit of a troll ... I guess you had a<=
br>&gt; problem or two a couple of years ago (from searching the lists)<br>=
&gt; and are still sore.&nbsp;&nbsp;Can you point me to mailing list report=
s of<br>
&gt; the problems you're refering to here or bug reports you've opened<br>&=
gt; for these issues?&nbsp;&nbsp;I'll let you know if any of them are still=
<br>&gt; relevent.<br><br>No, we had dozens actually.&nbsp;&nbsp;The only o=
nes that were really crippling were
<br>when XFS would suddenly unmount in the middle of the business day for n=
o<br>apparent reason.&nbsp;&nbsp;Without details bug reports are ignored, a=
nd we couldn't<br>really provide details or filesystem dumps because there =
was too much data,
<br>and we had to get it back online.&nbsp;&nbsp;We just moved as fast as w=
e could away<br>from XFS.&nbsp;&nbsp;It wasn't just a one day thing, or a w=
eek, there was a trail of<br>crashes with XFS at the time.&nbsp;&nbsp;Somet=
imes the machine was so locked up from
<br>XFS pulling the rug out that the console was wedged up pretty badly too=
.<br><br>I wanted to provide the information as a data point from the other=
 side as<br>it were not get into a pissing match with the XFS developers an=
d community.
<br>XFS is still young, as is ReiserFS.&nbsp;&nbsp;and while Reiser is a co=
mpletely new<br>FS and XFS has roots in IRIX and other implementations, the=
ir age is<br>similar since XFS' Linux implementation is around the same age=
.&nbsp;&nbsp;If the
<br>state has change in the last 6-12 months then so much the better.&nbsp;=
&nbsp;The<br>facts are that XFS during operation had many problems, and as =
we pulled it<br>out still had many unresolved problems as we replaced it wi=
th ReiserFS.
<br>And Reiser has been flawless except for one problem already mentioned o=
n<br>Linux-LVM very clearly caused by an external SAN/RAID problem which EM=
C has<br>corrected (completely as an aside -- anyone running a CX series RE=
ALLY
<br>needs to be on the latest code rev, you might never run into the bug, a=
nd<br>i'm still not sure exactly which one we hit, there were atleast two t=
hat<br>could have caused the data corruption, but if you do, it can be ugly=
).
<br><br><br>The best guess that I have as to why we had such a bad time wit=
h XFS was<br>the XFS+NFS interaction and possibly an old (unknown to me -- =
this is just<br>a guess) bug that may have created some minor underlying co=
rruption that
<br>the repair tools couldn't fully fix or diagnose may have caused our<br>=
continual (seemingly random) problems.&nbsp;&nbsp;I don't believe in really=
 random<br>problems, atleast not in computers anyway.<br><br>&gt;<br>&gt; c=
heers.
<br>&gt;<br>&gt; --<br>&gt; Nathan<br>&gt;<br><br><br><br>--<br>&quot;Geniu=
s might be described as a supreme capacity for getting its possessors<br>in=
to trouble of all kinds.&quot;<br>-- Samuel Butler<br><br><br><br>---------=
---------------------
<br><br>Message: 2<br>Date: Mon, 12 Dec 2005 13:28:30 +1100<br>From: Nathan=
 Scott &lt;<a href=3D"mailto:nathans@sgi.com">nathans@sgi.com</a>&gt;<br>Su=
bject: Re: [linux-lvm] LVM onFly features<br>To: Michael Loftis &lt;<a href=
=3D"mailto:mloftis@wgops.com">
mloftis@wgops.com</a>&gt;<br>Cc: <a href=3D"mailto:linux-xfs@oss.sgi.com">l=
inux-xfs@oss.sgi.com</a>, <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm=
@redhat.com</a><br>Message-ID: &lt;<a href=3D"mailto:20051212132830.A743236=
5@wobbly.melbourne.sgi.com">
20051212132830.A7432365@wobbly.melbourne.sgi.com</a>&gt;<br>Content-Type: t=
ext/plain; charset=3Dus-ascii<br><br>On Sun, Dec 11, 2005 at 06:14:39PM -07=
00, Michael Loftis wrote:<br>&gt; --On December 12, 2005 9:15:39 AM +1100 N=
athan Scott &lt;
<a href=3D"mailto:nathans@sgi.com">nathans@sgi.com</a>&gt;<br>&gt; The wors=
t problems we had we're likely most strongly related to running out<br>&gt;=
 of journal transaction space.&nbsp;&nbsp;When XFS was under high transacti=
on load<br>
<br>Can you define &quot;high load&quot; for your scenario?<br><br>&gt; som=
etimes it would just hang everything syncing meta-data.&nbsp;&nbsp;From wha=
t I<br><br>There is no situation in which XFS will &quot;hang everything&qu=
ot;.&nbsp;&nbsp;A process
<br>that is modifying the filesystem may be paused briefly waiting for spac=
e<br>to become available in the log, and that involves flushing the in-core=
<br>log buffers.&nbsp;&nbsp;But only processes that need log space will be =
paused
<br>waiting for that (relatively small) write to complete.&nbsp;&nbsp;This =
is also not<br>a behaviour peculiar to XFS, and with suitable tuning in ter=
ms of mkfs/<br>mount/sysctl parameters, it can be completely controlled.<br=
><br>&gt; understand this has supposedly been dealt with, but we were still=
 having
<br>&gt; these issues when we decommissioned the last XFS based server a ye=
ar ago.<br><br>I'd like some more information describing your workload ther=
e if<br>you could provide it.&nbsp;&nbsp;Thanks.<br><br>&gt; Another datapo=
int is the fact we primarily served via NFS, which XFS
<br>&gt; (atleast at the time) still didn't behave great with, I never did =
see any<br>&gt; good answers on that as I recall.<br><br>Indeed.&nbsp;&nbsp=
;Early 2.6 kernels did have XFS/NFS interaction problems,<br>with NFS using=
 generation number zero as &quot;magic&quot;, and XFS using
<br>that as a valid gen number.&nbsp;&nbsp;That was fixed a long time ago.<=
br><br>&gt; controller, or NFS.&nbsp;&nbsp;The fact that XFS has weird inte=
ractions with NFS at<br>&gt; all bugs me, but I don't understand the code i=
nvolved well enough.&nbsp;&nbsp;There
<br>&gt; might be a decent reason.<br><br>No, there's no reason, and XFS do=
es not have &quot;wierd interactions&quot;<br>with NFS.<br><br>&gt; &gt;&gt=
; It also needs larger kernel stacks because<br>&gt; &gt;&gt; of some of th=
e really deep call trees,
<br>&gt; &gt;<br>&gt; &gt; Those have been long since fixed as far as we ar=
e aware.&nbsp;&nbsp;Do you<br>&gt; &gt; have an actual example where things=
 can fail?<br>&gt;<br>&gt; We pulled it out of production and replaced XFS =
with Reiser.&nbsp;&nbsp;At the time
<br>&gt; Reiser was far more mature on Linux.&nbsp;&nbsp;XFS Linux implemen=
tation (in<br><br>Not because of 4K stacks though surely?&nbsp;&nbsp;That k=
ernel option wasn't around<br>then I think, and the reiserfs folks have als=
o had a bunch of work to do
<br>in that area too.<br><br>&gt; &gt; Seems like details of all the proble=
ms you described have faded.<br>&gt; &gt; Your mail seems to me like a bit =
of a troll ... I guess you had a<br>&gt; &gt; problem or two a couple of ye=
ars ago (from searching the lists)
<br>&gt; &gt; and are still sore.&nbsp;&nbsp;Can you point me to mailing li=
st reports of<br>&gt; &gt; the problems you're refering to here or bug repo=
rts you've opened<br>&gt; &gt; for these issues?&nbsp;&nbsp;I'll let you kn=
ow if any of them are still
<br>&gt; &gt; relevent.<br>&gt;<br>&gt; No, we had dozens actually.&nbsp;&n=
bsp;The only ones that were really crippling were<br>&gt; when XFS would su=
ddenly unmount in the middle of the business day for no<br>&gt; apparent re=
ason.&nbsp;&nbsp;Without details bug reports are ignored, and we couldn't
<br><br>The NFS issue had the unfortunate side effect of causing filesystem=
<br>corruption and hence forced filesystem shutdowns would result.&nbsp;&nb=
sp;There<br>were also bugs on that error handling path, so probably you hit=
 two<br>
independent XFS bugs on a pretty old kernel version.<br><br>&gt; I wanted t=
o provide the information as a data point from the other side as<br>&gt; it=
 were not get into a pissing match with the XFS developers and community.
<br><br>You were claiming long-resolved issues that existed in an XFS versi=
on<br>from an early 2.6 kernel as still relevent.&nbsp;&nbsp;That is quite =
misleading,<br>and doesn't provide useful information to anyone.<br><br>che=
ers.<br>
<br>--<br>Nathan<br><br><br><br>------------------------------<br><br>Messa=
ge: 3<br>Date: Mon, 12 Dec 2005 15:25:23 +0700<br>From: Andrey Subbotin &lt=
;<a href=3D"mailto:eploko@gmail.com">eploko@gmail.com</a>&gt;<br>Subject: [=
linux-lvm] Converting LVM back to Ext2?
<br>To: <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br=
>Message-ID: &lt;<a href=3D"mailto:45980936.20051212152523@gmail.com">45980=
936.20051212152523@gmail.com</a>&gt;<br>Content-Type: text/plain; charset=
=3Dus-ascii
<br><br>Hello all.<br><br>I've
got a 200GB HD partitioned automatically during Fedora Core 4 setup.
That is the disk carries 2 partitions where the first one (/dev/sda1)
is ext3 mounted as /boot and the second one (/dev/sda2) is an LVM.<br><br>T=
hat
is all clear and fancy but the problem is I'm faced with the fact I
need to migrate the HD to Ext2 FS, so I could convert it to FAT32
later, so I could access it from a copy of the Windows OS I happen to
boot recently to do some work. The LVM on /dev/sda2 is full of data I
need to save and the problem is I don't have a spare HD to temporarily
copy all those 200GB to.<br><br>If I had a spare HD I would eventually
mount it, make a new Ext2 partition on it and then copy all the data
from the LogicalVolume to the new partition. Then I would fire up fdisk
and kill the LVM, thus freeing the space on the drive. Then, moving the
data back to the first HD would be a snap. But without a spare disk I
face a real challenge.<br><br>My initial idea was to reduce the FS
inside the LogicalVolume (it has ~40GB free of space) and then reduce
the size of the LogicalVolume and then reduce the PhysicalVolume
/dev/sda2 by the freed number of cylinders. Then, I would create an
ext2 partition over the freed cylinders and move some files from the
LogicalVolume onto it. Then I thought I would repeat the process
several times effectively migrating my data from the ever-shrinking LVM
to the ever-growing plain Ext2 FS.<br><br>The problem is I have little
idea how I can shrink an LVM partition on /dev/sda2. And there seem to
be very little information on this on the net.<br><br>So far, I have
lvreduce'd the FS inside the LogicalVolume and the LogicalVolume
itselft to 35700000 4k blocks. Now, how do I redeuce the number of
cyllinders occupied by the LVM on /dev/sda?<br><br>I would really apreciate=
 any help or ideas.<br>Thanks a lot in advance.<br><br>--<br>See you,<br>An=
drey<br><br>ICQ UIN: 114087545<br>Journal: <a href=3D"http://www.livejourna=
l.com/users/e_ploko/">
http://www.livejournal.com/users/e_ploko/</a><br><br><br><br>--------------=
----------------<br><br>Message: 4<br>Date: Mon, 12 Dec 2005 19:50:30 +0530=
<br>From: Anil Kumar Sharma &lt;<a href=3D"mailto:xplusaks@gmail.com">xplus=
aks@gmail.com
</a>&gt;<br>Subject: Re: [linux-lvm] Converting LVM back to Ext2?<br>To: An=
drey Subbotin &lt;<a href=3D"mailto:eploko@gmail.com">eploko@gmail.com</a>&=
gt;, LVM general discussion and<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;development &lt;<a href=3D"mailto:linux-lvm@redhat.com">
linux-lvm@redhat.com</a>&gt;<br>Message-ID:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&lt;<a href=3D"mailto:52fe6b680512120620m2d9d462erdc37b=
7f3d79183de@mail.gmail.com">52fe6b680512120620m2d9d462erdc37b7f3d79183de@ma=
il.gmail.com</a>&gt;<br>Content-Type: text/plain; charset=3D&quot;iso-8859-=
1&quot;
<br><br>U may reduce LV size and get some free space but that still will be=
 lying on<br>PV and there is no pvreduce (afaik).<br><br>So, I think (I may=
 be wrong), U are out of luck. Get your luck back, have<br>same temporary s=
torage for your data to change the size or convert PV.
<br><br>UC, LVM is good for multi-partitions and multi-disks, everything in=
<br>multiples. That's the playground for LVM.<br>When U (re)start for FC4 o=
r FC5, have your linux space on multiple PV's.<br>I will suggest utilize al=
l 4 primary&nbsp;&nbsp;partitions,
<br>1. boot, 2. dual boot (if required) else PV and 3.&amp; 4 also PV's. Sw=
ap goes<br>in LVM.<br>LVM can make them look like one or as desired partiti=
ons (LV's), which U can<br>change as per your requirements, even for dual b=
oot.
<br><br> Hard luck with &quot;auto partition&quot; - it is good for itself!=
 smart fellow not<br>caring for our moods.<br><br><br><br><br>On 12/12/05, =
Andrey Subbotin &lt;<a href=3D"mailto:eploko@gmail.com">eploko@gmail.com</a=
>
&gt; wrote:<br>&gt;<br>&gt; Hello all.<br>&gt;<br>&gt; I've got a 200GB HD =
partitioned automatically during Fedora Core 4 setup.<br>&gt; That is the d=
isk carries 2 partitions where the first one (/dev/sda1) is<br>&gt; ext3 mo=
unted as /boot and the second one (/dev/sda2) is an LVM.
<br>&gt;<br>&gt; That is all clear and fancy but the problem is I'm faced w=
ith the fact I<br>&gt; need to migrate the HD to Ext2 FS, so I could conver=
t it to FAT32 later, so<br>&gt; I could access it from a copy of the Window=
s OS I happen to boot recently to
<br>&gt; do some work. The LVM on /dev/sda2 is full of data I need to save =
and the<br>&gt; problem is I don't have a spare HD to temporarily copy all =
those 200GB to.<br>&gt;<br>&gt; If I had a spare HD I would eventually moun=
t it, make a new Ext2 partition
<br>&gt; on it and then copy all the data from the LogicalVolume to the new=
<br>&gt; partition. Then I would fire up fdisk and kill the LVM, thus freei=
ng the<br>&gt; space on the drive. Then, moving the data back to the first =
HD would be a
<br>&gt; snap. But without a spare disk I face a real challenge.<br>&gt;<br=
>&gt; My initial idea was to reduce the FS inside the LogicalVolume (it has=
<br>&gt; ~40GB free of space) and then reduce the size of the LogicalVolume=
 and then
<br>&gt; reduce the PhysicalVolume /dev/sda2 by the freed number of cylinde=
rs. Then,<br>&gt; I would create an ext2 partition over the freed cylinders=
 and move some<br>&gt; files from the LogicalVolume onto it. Then I thought=
 I would repeat the
<br>&gt; process several times effectively migrating my data from the ever-=
shrinking<br>&gt; LVM to the ever-growing plain Ext2 FS.<br>&gt;<br>&gt; Th=
e problem is I have little idea how I can shrink an LVM partition on<br>
&gt; /dev/sda2. And there seem to be very little information on this on the=
 net.<br>&gt;<br>&gt; So far, I have lvreduce'd the FS inside the LogicalVo=
lume and the<br>&gt; LogicalVolume itselft to 35700000 4k blocks. Now, how =
do I redeuce the
<br>&gt; number of cyllinders occupied by the LVM on /dev/sda?<br>&gt;<br>&=
gt; I would really apreciate any help or ideas.<br>&gt; Thanks a lot in adv=
ance.<br>&gt;<br>&gt; --<br>&gt; See you,<br>&gt; Andrey<br>&gt;<br>&gt; IC=
Q UIN: 114087545
<br>&gt; Journal: <a href=3D"http://www.livejournal.com/users/e_ploko/">htt=
p://www.livejournal.com/users/e_ploko/</a><br>&gt;<br>&gt; ________________=
_______________________________<br>&gt; linux-lvm mailing list<br>&gt; <a h=
ref=3D"mailto:linux-lvm@redhat.com">
linux-lvm@redhat.com</a><br>&gt; <a href=3D"https://www.redhat.com/mailman/=
listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><b=
r>&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">
http://tldp.org/HOWTO/LVM-HOWTO/</a><br>&gt;<br><br><br><br>--<br>Anil Kuma=
r Shrama<br>-------------- next part --------------<br>An HTML attachment w=
as scrubbed...<br>URL: <a href=3D"https://www.redhat.com/archives/linux-lvm=
/attachments/20051212/312e7a1b/attachment.html">
https://www.redhat.com/archives/linux-lvm/attachments/20051212/312e7a1b/att=
achment.html</a><br><br>------------------------------<br><br>Message: 5<br=
>Date: Mon, 12 Dec 2005 15:21:26 +0000<br>From: Alasdair G Kergon &lt;<a hr=
ef=3D"mailto:agk@redhat.com">
agk@redhat.com</a>&gt;<br>Subject: Re: [linux-lvm] Newbie of LVM<br>To: LVM=
 general discussion and development &lt;<a href=3D"mailto:linux-lvm@redhat.=
com">linux-lvm@redhat.com</a>&gt;<br>Message-ID: &lt;<a href=3D"mailto:2005=
1212152126.GA25866@agk.surrey.redhat.com">
20051212152126.GA25866@agk.surrey.redhat.com</a>&gt;<br>Content-Type: text/=
plain; charset=3Dus-ascii<br><br>On Fri, Dec 09, 2005 at 02:12:43PM -0500, =
Matthew Gillen wrote:<br>&gt; Way Loss wrote:<br><br>&gt;
&gt;
/dev/md5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;153G&nbsp;&nbsp;119G&nbsp;&nbsp;
27G&nbsp;&nbsp;82% /www<br><br>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; My md5 is =
almost full and I wanna use LVM to merge<br>&gt; &gt; my md5 with a new par=
tition from a new hdd. I wanna<br>&gt; &gt; ask if this possible for LVM to=
 merge 2 partition<br>&gt; &gt; together while one of them have data on it?=
 I can't
<br>&gt; &gt; suffer any data loss and want to make sure that LVM<br>&gt; &=
gt; works perfectly to what I want.<br><br>&gt; You're out of luck.&nbsp;&n=
bsp;You can't take an existing partition and keep the<br>&gt; data yet swit=
ch it over to LVM.
<br><br>See also:<br>&nbsp;&nbsp;<a href=3D"https://www.redhat.com/archives=
/linux-lvm/2005-October/msg00110.html">https://www.redhat.com/archives/linu=
x-lvm/2005-October/msg00110.html</a><br><br>Alasdair<br>--<br><a href=3D"ma=
ilto:agk@redhat.com">
agk@redhat.com</a><br><br><br><br>------------------------------<br><br>___=
____________________________________________<br>linux-lvm mailing list<br><=
a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br><br>End of linux-l=
vm Digest, Vol 22, Issue 12<br>*****************************************<br=
></blockquote></div><br>

------=_Part_12193_31137801.1134456497248--
