Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CM89cv012140
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 18:08:09 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.155])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CM7sTn018139
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 18:07:55 -0400
Received: by fg-out-1718.google.com with SMTP id e21so2401841fga.7
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 15:07:54 -0700 (PDT)
Message-ID: <1c748a490805121507j1bbf6a13sd03111667eda783f@mail.gmail.com>
Date: Mon, 12 May 2008 15:07:53 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <1c748a490805121347q514af7a1xfcd5df3d5c8c4697@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3901_7564209.1210630073654"
References: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
	<Pine.LNX.4.44.0805121557010.22122-100000@bmsred.bmsi.com>
	<1c748a490805121326v2e4aea0am3cfbe572a909a0b1@mail.gmail.com>
	<4828A86E.2060808@Media-Brokers.com>
	<1c748a490805121347q514af7a1xfcd5df3d5c8c4697@mail.gmail.com>
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

------=_Part_3901_7564209.1210630073654
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OK, I got it to work using your workaround. Thanks, Stuart.

NEXT QUESTION...

How do I get LVM to put all the extents of the ramdisk BEFORE any of the
extents of the raid array? Even if I list the pvs, ramdisk first, in the
lvcreate command and/or start with the ramdisk in a vgcreate followed by
adding the raid array in a vgextend... it always ignores the ramdisk and
only assigns extents from the raid array. (I suppose it is putting the
ramdisk at the end, where it is useless for my purposes.)

TIA,

Larry

On 5/12/08, Larry Dickson <ldickson@cuttedge.com> wrote:
>
> I got the workaround - it crossed in the mail.
>
> However, let me follow up your (and Stuart's) point. Are you saying that
> an unmounted LVM volume will mess up the boot, even if the volume in
> question is not mapped to boot or /? I was proceeding under the assumption
> that LVM would be happy to sew the pieces together again later, even if the
> data in them is trashed.
>
> Larry
>
>
>  On 5/12/08, Charles Marcus <CMarcus@media-brokers.com> wrote:
> >
> > On 5/12/2008, Larry Dickson (ldickson@cuttedge.com) wrote:
> > > A way around all this overprotectiveness would be highly appreciated.
> >
> > It is not 'over-protectiveness'... I would call it 'highly *desired*
> > protectiveness'.
> >
> > A workaround has already been provided...
> >
> > --
> >
> > Best regards,
> >
> > Charles
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>

------=_Part_3901_7564209.1210630073654
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>OK, I got it to work using your workaround. Thanks, Stuart.</div>
<div>&nbsp;</div>
<div>NEXT QUESTION... </div>
<div>&nbsp;</div>
<div>How do I get LVM to put all the extents of the ramdisk BEFORE any of the extents of the raid array? Even if I list the pvs, ramdisk first,&nbsp;in the lvcreate command and/or start with the ramdisk in a vgcreate followed by adding the raid array in a vgextend... it always ignores the ramdisk and only assigns extents from the raid array. (I suppose it is putting the ramdisk at the end, where it is useless for my purposes.)<br>
&nbsp;</div>
<div>TIA,</div>
<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 5/12/08, <b class="gmail_sendername">Larry Dickson</b> &lt;<a href="mailto:ldickson@cuttedge.com">ldickson@cuttedge.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div>I got&nbsp;the workaround&nbsp;- it crossed in the mail.</div>
<div>&nbsp;</div>
<div>However, let me follow up your (and Stuart&#39;s)&nbsp;point. Are you saying that an unmounted LVM volume will mess up the boot, even if the volume in question is not mapped to boot or /? I was proceeding under the assumption that LVM would be happy to sew the pieces together again later, even if the data in them is trashed.</div>

<div>&nbsp;</div><span class="sg">
<div>Larry<br><br>&nbsp;</div></span>
<div><span class="e" id="q_119dee354b322133_2">
<div><span class="gmail_quote">On 5/12/08, <b class="gmail_sendername">Charles Marcus</b> &lt;<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:CMarcus@media-brokers.com" target="_blank">CMarcus@media-brokers.com</a>&gt; wrote:</span> 
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On 5/12/2008, Larry Dickson (<a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:ldickson@cuttedge.com" target="_blank">ldickson@cuttedge.com</a>) wrote:<br>
&gt; A way around all this overprotectiveness would be highly appreciated.<br><br>It is not &#39;over-protectiveness&#39;... I would call it &#39;highly *desired*<br>protectiveness&#39;.<br><br>A workaround has already been provided...<br>
<br>--<br><br>Best regards,<br><br>Charles<br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></span></div></blockquote></div><br>

------=_Part_3901_7564209.1210630073654--
