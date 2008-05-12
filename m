Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CKm8wN030202
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:48:08 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CKlW6U006967
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:47:32 -0400
Received: by fg-out-1718.google.com with SMTP id e21so2382681fga.7
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 13:47:32 -0700 (PDT)
Message-ID: <1c748a490805121347q514af7a1xfcd5df3d5c8c4697@mail.gmail.com>
Date: Mon, 12 May 2008 13:47:30 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <4828A86E.2060808@Media-Brokers.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3786_27919941.1210625250377"
References: <1c748a490805120823w1673e2f4u91b8cc43c0f818df@mail.gmail.com>
	<Pine.LNX.4.44.0805121557010.22122-100000@bmsred.bmsi.com>
	<1c748a490805121326v2e4aea0am3cfbe572a909a0b1@mail.gmail.com>
	<4828A86E.2060808@Media-Brokers.com>
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

------=_Part_3786_27919941.1210625250377
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I got the workaround - it crossed in the mail.

However, let me follow up your (and Stuart's) point. Are you saying that an
unmounted LVM volume will mess up the boot, even if the volume in question
is not mapped to boot or /? I was proceeding under the assumption that LVM
would be happy to sew the pieces together again later, even if the data in
them is trashed.

Larry


On 5/12/08, Charles Marcus <CMarcus@media-brokers.com> wrote:
>
> On 5/12/2008, Larry Dickson (ldickson@cuttedge.com) wrote:
> > A way around all this overprotectiveness would be highly appreciated.
>
> It is not 'over-protectiveness'... I would call it 'highly *desired*
> protectiveness'.
>
> A workaround has already been provided...
>
> --
>
> Best regards,
>
> Charles
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_3786_27919941.1210625250377
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>I got&nbsp;the workaround&nbsp;- it crossed in the mail.</div>
<div>&nbsp;</div>
<div>However, let me follow up your (and Stuart&#39;s)&nbsp;point. Are you saying that an unmounted LVM volume will mess up the boot, even if the volume in question is not mapped to boot or /? I was proceeding under the assumption that LVM would be happy to sew the pieces together again later, even if the data in them is trashed.</div>

<div>&nbsp;</div>
<div>Larry<br><br>&nbsp;</div>
<div><span class="gmail_quote">On 5/12/08, <b class="gmail_sendername">Charles Marcus</b> &lt;<a href="mailto:CMarcus@media-brokers.com">CMarcus@media-brokers.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On 5/12/2008, Larry Dickson (<a href="mailto:ldickson@cuttedge.com">ldickson@cuttedge.com</a>) wrote:<br>&gt; A way around all this overprotectiveness would be highly appreciated.<br>
<br>It is not &#39;over-protectiveness&#39;... I would call it &#39;highly *desired*<br>protectiveness&#39;.<br><br>A workaround has already been provided...<br><br>--<br><br>Best regards,<br><br>Charles<br><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_3786_27919941.1210625250377--
