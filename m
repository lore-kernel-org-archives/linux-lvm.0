Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4CN7ZIE015621
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 19:07:35 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.239])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4CN7Xv8004254
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 19:07:33 -0400
Received: by wr-out-0506.google.com with SMTP id i28so1397894wra
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 16:07:32 -0700 (PDT)
Message-ID: <230d1df80705121607i34a7526eo72981413f6dd1ff4@mail.gmail.com>
Date: Sat, 12 May 2007 19:07:32 -0400
From: "Saad Shakhshir" <saads@alum.mit.edu>
Sender: shakhshir@gmail.com
Subject: Re: [linux-lvm] Restoring data after losing a drive
In-Reply-To: <1178999494.4538.3.camel@shark.themaw.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_178735_26868632.1179011252241"
References: <230d1df80705112029w7b4b9fd0ncf7a733363b44705@mail.gmail.com>
	<1178999494.4538.3.camel@shark.themaw.net>
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

------=_Part_178735_26868632.1179011252241
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ian, thanks for your response.  Let me clarify.

The data on the damaged disk is not recoverable at this point.  However
there is data on the other remaining good disks that was part of that one
large logical volume.  At this point I want to get back the remaining data
that was in that logical volume and on the remaining good physical volumes
without the data that was on the physical volume I lost.  I know that the
data is still intact on those drives... I just need to know how to get my
system to recognise that it's still there.

On 5/12/07, Ian Kent <ikent@redhat.com> wrote:
>
> On Fri, 2007-05-11 at 23:29 -0400, Saad Shakhshir wrote:
> > I lost one of my drives that was a physical volume in my lvm.  The
> > volume group spanned across all the drives and so did the logical
> > volume.  I know that the data on the good drives is still intact I
> > just don't know how to get the lvm up and running again to be able to
> > read the data.
> >
> > I tried running 'vgreduce --removemissing fileserver' and that managed
> > to restore my other small logical volume that was located entirely on
> > one of the (still good) physical volumes.  The other large logical
> > volume is still not showing up.
> >
> > I'm going to attach the last good configuration from /etc/lvm/archive
> > The drive that died was pv0.
> >
> > I really hope that someone can help with this.  It's terrible losing
> > so much data...
>
> I don't understand the question.
> How will LVM know what was contained in the blocks on the failed disk?
>
> I think you'll need to restore the damaged volume from backup.
>
> Ian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_178735_26868632.1179011252241
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ian, thanks for your response.&nbsp; Let me clarify.<br><br>The data on the damaged disk is not recoverable at this point.&nbsp; However there is data on the other remaining good disks that was part of that one large logical volume.&nbsp; At this point I want to get back the remaining data that was in that logical volume and on the remaining good physical volumes without the data that was on the physical volume I lost.&nbsp; I know that the data is still intact on those drives... I just need to know how to get my system to recognise that it&#39;s still there.
<br><br><div><span class="gmail_quote">On 5/12/07, <b class="gmail_sendername">Ian Kent</b> &lt;<a href="mailto:ikent@redhat.com">ikent@redhat.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Fri, 2007-05-11 at 23:29 -0400, Saad Shakhshir wrote:<br>&gt; I lost one of my drives that was a physical volume in my lvm.&nbsp;&nbsp;The<br>&gt; volume group spanned across all the drives and so did the logical<br>&gt; volume.&nbsp;&nbsp;I know that the data on the good drives is still intact I
<br>&gt; just don&#39;t know how to get the lvm up and running again to be able to<br>&gt; read the data.<br>&gt;<br>&gt; I tried running &#39;vgreduce --removemissing fileserver&#39; and that managed<br>&gt; to restore my other small logical volume that was located entirely on
<br>&gt; one of the (still good) physical volumes.&nbsp;&nbsp;The other large logical<br>&gt; volume is still not showing up.<br>&gt;<br>&gt; I&#39;m going to attach the last good configuration from /etc/lvm/archive<br>&gt; The drive that died was pv0.
<br>&gt;<br>&gt; I really hope that someone can help with this.&nbsp;&nbsp;It&#39;s terrible losing<br>&gt; so much data...<br><br>I don&#39;t understand the question.<br>How will LVM know what was contained in the blocks on the failed disk?
<br><br>I think you&#39;ll need to restore the damaged volume from backup.<br><br>Ian<br><br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com
</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/
</a><br></blockquote></div><br>

------=_Part_178735_26868632.1179011252241--
