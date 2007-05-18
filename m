Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4IGDox7011260
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 12:13:50 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.234])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4IGDl9g002998
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 12:13:47 -0400
Received: by wr-out-0506.google.com with SMTP id i28so1041524wra
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 09:13:46 -0700 (PDT)
Message-ID: <230d1df80705180913p15155a1ahe0d1076d81d636c4@mail.gmail.com>
Date: Fri, 18 May 2007 12:13:45 -0400
From: "Saad Shakhshir" <saads@alum.mit.edu>
Sender: shakhshir@gmail.com
Subject: Re: [linux-lvm] Restoring data after losing a drive
In-Reply-To: <230d1df80705130902i4e40a3b9v2bd5781c4cf3eb2f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_61236_3130153.1179504825929"
References: <230d1df80705121607i34a7526eo72981413f6dd1ff4@mail.gmail.com>
	<Pine.LNX.4.44.0705122115480.27083-100000@bmsred.bmsi.com>
	<230d1df80705130902i4e40a3b9v2bd5781c4cf3eb2f@mail.gmail.com>
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

------=_Part_61236_3130153.1179504825929
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Does anyone have ideas on this?  I would really appreciate the help.

On 5/13/07, Saad Shakhshir <saads@alum.mit.edu> wrote:
>
> Right now after running 'vgreduce --removemissing' it resized the volume
> group to include only the available drives.  I got back my one small logical
> volume (/dev/fileserver/home) and the data is all intact.  The other large
> logical volume which spanned the rest of the drives (including the one that
> went bad) isn't there anymore.  So it thinks that the majority of the volume
> group is unused space, however there is data on there.  If I now create a
> logical volume on the remaining space in the volume group, will it
> automatically see the data that is there?
>
> Where does the filesystem information get stored in terms of inode
> locations?  Will that get overwritten now if I create a new logical volume?
>
> On 5/12/07, Stuart D. Gathman <stuart@bmsi.com> wrote:
> >
> > On Sat, 12 May 2007, Saad Shakhshir wrote:
> >
> > > The data on the damaged disk is not recoverable at this
> > point.  However
> > > there is data on the other remaining good disks that was part of that
> > one
> > > large logical volume.  At this point I want to get back the remaining
> > data
> > > that was in that logical volume and on the remaining good physical
> > volumes
> > > without the data that was on the physical volume I lost.  I know that
> > the
> > > data is still intact on those drives... I just need to know how to get
> > my
> > > system to recognise that it's still there.
> >
> > The solution involves restoring the metadata to memory or a replacement
> > hard
> > drive from /etc/lvm (if it is intact) or a backup.  I'll let the experts
> > talk about details.
> >
> > However, the LVM should be able to handle losing a PV and still bring
> > LVs
> > for that PV online.  Any attempted IO would result in errors, of course.
> > But the metadata for a PV should be automatically loadable even with
> > the PV missing.  When the missing PV blows a hole in your large LV,
> > it would simplify recovering the pieces if the missing data got I/O
> > errors.
> > If you replace the drive and restore the metadata, the missing data will
> >
> > have whatever is on the drive.  It might help recovery to write a
> > pattern
> > to the replacement drive to help recognize the missing data.
> >
> > You will also need to be a filesystem wizard to navigate with a huge
> > hole
> > like that.  If you have one large file with a regular record format, it
> > might be simplest to scan all blocks for records - then paste any
> > missing
> >
> > I used to run into such problems a lot, and developed a filesystem where
> >
> > each block is tagged with the inode of the file it belonged to.  The
> > recovery program can recover each and every readable block into the
> > proper file in the proper location regardless of how much of the
> > filesystem
> > is missing or garbled due to horrendous errors.  There is no inode table
> > either - any block can be an inode (so blowing away the first part of
> > the
> > filesystem doesn't lose all your files).  There are drawbacks to
> > this approach, of course.  E.g. block size is reduced by the header
> > present on every block (and is therefore not a power of 2).
> >
> > --
> >               Stuart D. Gathman <stuart@bmsi.com >
> >     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> > 591-6154
> > "Confutatis maledictis, flammis acribus addictis" - background song for
> > a Microsoft sponsored "Where do you want to go from here?" commercial.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>

------=_Part_61236_3130153.1179504825929
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Does anyone have ideas on this?&nbsp; I would really appreciate the help.<br><br><div><span class="gmail_quote">On 5/13/07, <b class="gmail_sendername">Saad Shakhshir</b> &lt;<a href="mailto:saads@alum.mit.edu">saads@alum.mit.edu
</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Right now after running &#39;vgreduce --removemissing&#39; it resized the volume group to include only the available drives.&nbsp; I got back my one small logical volume (/dev/fileserver/home) and the data is all intact.&nbsp; The other large logical volume which spanned the rest of the drives (including the one that went bad) isn&#39;t there anymore.&nbsp; So it thinks that the majority of the volume group is unused space, however there is data on there.&nbsp; If I now create a logical volume on the remaining space in the volume group, will it automatically see the data that is there?
<br><br>Where does the filesystem information get stored in terms of inode locations?&nbsp; Will that get overwritten now if I create a new logical volume?<div><span class="e" id="q_112862d22a7ff102_1"><br><br><div><span class="gmail_quote">
On 5/12/07, <b class="gmail_sendername">
Stuart D. Gathman</b> &lt;<a href="mailto:stuart@bmsi.com" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">stuart@bmsi.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

On Sat, 12 May 2007, Saad Shakhshir wrote:<br><br>&gt; The data on the damaged disk is not recoverable at this point.&nbsp;&nbsp;However<br>&gt; there is data on the other remaining good disks that was part of that one<br>&gt; large logical volume.&nbsp;&nbsp;At this point I want to get back the remaining data
<br>&gt; that was in that logical volume and on the remaining good physical volumes<br>&gt; without the data that was on the physical volume I lost.&nbsp;&nbsp;I know that the<br>&gt; data is still intact on those drives... I just need to know how to get my
<br>&gt; system to recognise that it&#39;s still there.<br><br>The solution involves restoring the metadata to memory or a replacement hard<br>drive from /etc/lvm (if it is intact) or a backup.&nbsp;&nbsp;I&#39;ll let the experts<br>

talk about details.<br><br>However, the LVM should be able to handle losing a PV and still bring LVs<br>for that PV online.&nbsp;&nbsp;Any attempted IO would result in errors, of course.<br>But the metadata for a PV should be automatically loadable even with
<br>the PV missing.&nbsp;&nbsp;When the missing PV blows a hole in your large LV,<br>it would simplify recovering the pieces if the missing data got I/O errors.<br>If you replace the drive and restore the metadata, the missing data will
<br>have whatever is on the drive.&nbsp;&nbsp;It might help recovery to write a pattern<br>to the replacement drive to help recognize the missing data.<br><br>You will also need to be a filesystem wizard to navigate with a huge hole
<br>like that.&nbsp;&nbsp;If you have one large file with a regular record format, it<br>might be simplest to scan all blocks for records - then paste any missing<br><br>I used to run into such problems a lot, and developed a filesystem where
<br>each block is tagged with the inode of the file it belonged to.&nbsp;&nbsp;The<br>recovery program can recover each and every readable block into the<br>proper file in the proper location regardless of how much of the filesystem
<br>is missing or garbled due to horrendous errors.&nbsp;&nbsp;There is no inode table<br>either - any block can be an inode (so blowing away the first part of the<br>filesystem doesn&#39;t lose all your files).&nbsp;&nbsp;There are drawbacks to
<br>this approach, of course.&nbsp;&nbsp;E.g. block size is reduced by the header<br>present on every block (and is therefore not a power of 2).<br><br>--<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">
stuart@bmsi.com
</a>&gt;<br>&nbsp;&nbsp;&nbsp;&nbsp;Business Management Systems Inc.&nbsp;&nbsp;Phone: 703 591-0911 Fax: 703 591-6154<br>&quot;Confutatis maledictis, flammis acribus addictis&quot; - background song for<br>a Microsoft sponsored &quot;Where do you want to go from here?&quot; commercial.
<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">https://www.redhat.com/mailman/listinfo/linux-lvm
</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>
</span></div></blockquote></div><br>

------=_Part_61236_3130153.1179504825929--
