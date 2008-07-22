Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6MG7kXb023548
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 12:07:46 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.155])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m6MG7TdU020235
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 12:07:31 -0400
Received: by fg-out-1718.google.com with SMTP id e21so1061758fga.7
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 09:07:29 -0700 (PDT)
Message-ID: <1c748a490807220907x19fa0990occ05853440884fcb@mail.gmail.com>
Date: Tue, 22 Jul 2008 09:07:27 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
In-Reply-To: <1216700602.7888.37.camel@corn.betterworld.us>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_87729_8613156.1216742847627"
References: <1216674096.7888.5.camel@corn.betterworld.us>
	<1216674897.20588.14.camel@behemoth.csg.stercomm.com>
	<1216700602.7888.37.camel@corn.betterworld.us>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_87729_8613156.1216742847627
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Perhaps I'm being unfair, but making valuable stuff depend on md raid1
scares me. We've had trouble when an event happens (i.e. primary goes bad)
and have had to do stuff by hand. For real peace of mind, I would think of
a backup strategy involving another system; snapshot is nice for that.
Perhaps your unused big disk could go on that system. Just a practical note.

Larry Dickson
Cutting Edge Networked Storage

On 7/21/08, Ross Boylan <ross@biostat.ucsf.edu> wrote:
>
> On Mon, 2008-07-21 at 16:14 -0500, Chris Cox wrote:
> > On Mon, 2008-07-21 at 14:01 -0700, Ross Boylan wrote:
> > > If I have a Volume Group with partitions from 2 different physical
> disks
> > > on it, and I confine my logical volumes to particular physical disks,
> > > will I be able to recover the logical volumes on disk 1 if disk 2
> fails?
> >
> > What is a disk?  If a disk means a LUN off of a hw RAID'd subsystem,
> > then you already have a level of protection.  You know what I mean?
> I think so.  That's not what I mean by "physical disks," by which I
> meant the things you can buy and stick into a slot in the case.  My
> understanding is that a LUN is a virtual drive present to the world by
> the RAID system.
>
> I'm talking about separate physical disk drives.  I'm still not clear
> after reading your response (including below) whether disk 2 failing
> will make the LV's on disk 1 unusable (i.e., not relatively
> straightforward to recover), but it sounds as if that's the case.
>
> >
> > In that case, if all of the "disks" in a PV already have some kind
> > of RAID protection, then there isn't too much of an issue.
> >
> > So.. in my opinion.... LVM on top of RAID'd disks.
> Thanks.  I hadn't actually appreciated that RAID needed to be done below
> LVM (I was somewhat thrown off by experience with EVMS and the fact that
> one can stripe in LVM).
>
> >
> > >
> > > I have several disks, but they are all different sizes and so don't
> seem
> > > like good candidates for a scheme with redundancy (e.g., RAID 5).
> >
> > Ok.
> >
> > > Because of my concern that combining disks into the same volume group
> > > would mean a failure of 1 would effectively wipe them all out, I have
> so
> > > far used separate VG's for each disk.  However, this is awkward.
> >
> > True.  I think you simply have to bite the bullet and decide if
> > getting matched storage (for RAID) or somehow some kind of RAID'd
> > infrastructure is something you just have to pay for... otherwise, you
> > probably just live with the risk... or go with separation like you are
> > now (still risky, but not all eggs in one basket).
> Maybe the separate VGs for separate disks doesn't buy me much.
> Individual disk failures will still take some stuff with them.  Either I
> have backups (I do), in which case I can recover, and could recover even
> if all my VGs fail, or I don't, in which case I'm sunk anyway.
>
> There are of course issues of recovery speed with the different
> approaches, but that doesn't mean I'm getting much extra safety by
> keeping distinct VGs.
> >
> > >
> > > So, my general question is what the best approach would be in this
> > > situation, multiple disks of much different sizes.  The existing disks
> > > all have separate VG's on them.  The biggest disk is empty so far.
> >
> > Since reliability seems important to you... I'd go with the separated
> > scheme you mentioned.  Sorry.. there really isn't a silver bullet for
> > this scenario.  Even so... you can't really say you have reliability,
> > you've somewhat improved the situation with separation to help
> > mitigate the damage, but without something like RAID, you're ultimately
> > going to lose something (not speaking about the value of backups of
> > course).
> Real RAID is probably something I should consider, since my backups are
> on my disks until I burn them to DVD, monthly.  The worst case scenario
> in this setup is pretty bad.  I should also keep the on disk backups on
> separate disks, in multiple copies, etc.
>
>
> Thanks for your advice.
> Ross
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_87729_8613156.1216742847627
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Perhaps I&#39;m being unfair, but making valuable stuff depend on md raid1 scares me. We&#39;ve had trouble when an event happens (i.e. primary goes bad) and have had to do stuff by hand. For real peace of mind, I would think of a&nbsp;backup strategy involving another system; snapshot is nice for that. Perhaps your unused big disk could go on that system. Just a practical note.</div>

<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 7/21/08, <b class="gmail_sendername">Ross Boylan</b> &lt;<a href="mailto:ross@biostat.ucsf.edu">ross@biostat.ucsf.edu</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Mon, 2008-07-21 at 16:14 -0500, Chris Cox wrote:<br>&gt; On Mon, 2008-07-21 at 14:01 -0700, Ross Boylan wrote:<br>
&gt; &gt; If I have a Volume Group with partitions from 2 different physical disks<br>&gt; &gt; on it, and I confine my logical volumes to particular physical disks,<br>&gt; &gt; will I be able to recover the logical volumes on disk 1 if disk 2 fails?<br>
&gt;<br>&gt; What is a disk?&nbsp;&nbsp;If a disk means a LUN off of a hw RAID&#39;d subsystem,<br>&gt; then you already have a level of protection.&nbsp;&nbsp;You know what I mean?<br>I think so.&nbsp;&nbsp;That&#39;s not what I mean by &quot;physical disks,&quot; by which I<br>
meant the things you can buy and stick into a slot in the case.&nbsp;&nbsp;My<br>understanding is that a LUN is a virtual drive present to the world by<br>the RAID system.<br><br>I&#39;m talking about separate physical disk drives.&nbsp;&nbsp;I&#39;m still not clear<br>
after reading your response (including below) whether disk 2 failing<br>will make the LV&#39;s on disk 1 unusable (i.e., not relatively<br>straightforward to recover), but it sounds as if that&#39;s the case.<br><br>&gt;<br>
&gt; In that case, if all of the &quot;disks&quot; in a PV already have some kind<br>&gt; of RAID protection, then there isn&#39;t too much of an issue.<br>&gt;<br>&gt; So.. in my opinion.... LVM on top of RAID&#39;d disks.<br>
Thanks.&nbsp;&nbsp;I hadn&#39;t actually appreciated that RAID needed to be done below<br>LVM (I was somewhat thrown off by experience with EVMS and the fact that<br>one can stripe in LVM).<br><br>&gt;<br>&gt; &gt;<br>&gt; &gt; I have several disks, but they are all different sizes and so don&#39;t seem<br>
&gt; &gt; like good candidates for a scheme with redundancy (e.g., RAID 5).<br>&gt;<br>&gt; Ok.<br>&gt;<br>&gt; &gt; Because of my concern that combining disks into the same volume group<br>&gt; &gt; would mean a failure of 1 would effectively wipe them all out, I have so<br>
&gt; &gt; far used separate VG&#39;s for each disk.&nbsp;&nbsp;However, this is awkward.<br>&gt;<br>&gt; True.&nbsp;&nbsp;I think you simply have to bite the bullet and decide if<br>&gt; getting matched storage (for RAID) or somehow some kind of RAID&#39;d<br>
&gt; infrastructure is something you just have to pay for... otherwise, you<br>&gt; probably just live with the risk... or go with separation like you are<br>&gt; now (still risky, but not all eggs in one basket).<br>Maybe the separate VGs for separate disks doesn&#39;t buy me much.<br>
Individual disk failures will still take some stuff with them.&nbsp;&nbsp;Either I<br>have backups (I do), in which case I can recover, and could recover even<br>if all my VGs fail, or I don&#39;t, in which case I&#39;m sunk anyway.<br>
<br>There are of course issues of recovery speed with the different<br>approaches, but that doesn&#39;t mean I&#39;m getting much extra safety by<br>keeping distinct VGs.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; So, my general question is what the best approach would be in this<br>
&gt; &gt; situation, multiple disks of much different sizes.&nbsp;&nbsp;The existing disks<br>&gt; &gt; all have separate VG&#39;s on them.&nbsp;&nbsp;The biggest disk is empty so far.<br>&gt;<br>&gt; Since reliability seems important to you... I&#39;d go with the separated<br>
&gt; scheme you mentioned.&nbsp;&nbsp;Sorry.. there really isn&#39;t a silver bullet for<br>&gt; this scenario.&nbsp;&nbsp;Even so... you can&#39;t really say you have reliability,<br>&gt; you&#39;ve somewhat improved the situation with separation to help<br>
&gt; mitigate the damage, but without something like RAID, you&#39;re ultimately<br>&gt; going to lose something (not speaking about the value of backups of<br>&gt; course).<br>Real RAID is probably something I should consider, since my backups are<br>
on my disks until I burn them to DVD, monthly.&nbsp;&nbsp;The worst case scenario<br>in this setup is pretty bad.&nbsp;&nbsp;I should also keep the on disk backups on<br>separate disks, in multiple copies, etc.<br><br><br>Thanks for your advice.<br>
Ross<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_87729_8613156.1216742847627--
