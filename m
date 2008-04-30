Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UF9Ytd010087
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 11:09:34 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.237])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UF9K9F007549
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 11:09:20 -0400
Received: by wx-out-0506.google.com with SMTP id t16so531580wxc.6
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 08:09:20 -0700 (PDT)
Message-ID: <1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
Date: Wed, 30 Apr 2008 08:09:19 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <48187B91.4060901@verizon.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1252_8835283.1209568159215"
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
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

------=_Part_1252_8835283.1209568159215
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Gerry, for the benefit of the rest of us who are depending on snapshot -

Was there much writing and/or reading going on between the time your backup
was made, and the time of the hang?

I know that snapshot works by putting an extra load on every write to the
origin volume. Is there any reason, known to knowledgeable LVM designers on
this list, why this should lead to "hundreds of errors" when a system hang
takes place? I assume stuff got caught in a half-committed state, but
_hundreds_... ???

Thanks,

Larry

On 4/30/08, Gerry Reno <greno@verizon.net> wrote:
>
> I ran e2fsck against the new logvol and it found the filesystem and the
> journal but
> the filesystem was corrupted with hundreds of errors.  At this point I
> just reformatted
> the device and now I'm loading the backup onto it.
>
> How do I handle the LVM metadata?  The restored metadata will not be
> correct.  Or does
> LVM have a way to figure this out?
>
>
> Gerry
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_1252_8835283.1209568159215
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Gerry, for the benefit of the rest of us who are depending on snapshot -</div>
<div>&nbsp;</div>
<div>Was there much writing and/or reading&nbsp;going on between the time your backup was made, and the time of the hang?</div>
<div>&nbsp;</div>
<div>I know that snapshot works by putting an extra load on every write to the origin volume. Is there any reason, known to knowledgeable LVM designers on this list, why this should lead to &quot;hundreds of errors&quot; when a system hang takes place? I assume stuff got caught in a half-committed state, but _hundreds_... ???<br>
&nbsp;</div>
<div>Thanks,</div>
<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 4/30/08, <b class="gmail_sendername">Gerry Reno</b> &lt;<a href="mailto:greno@verizon.net">greno@verizon.net</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">I ran e2fsck against the new logvol and it found the filesystem and the journal but<br>the filesystem was corrupted with hundreds of errors. &nbsp;At this point I just reformatted<br>
the device and now I&#39;m loading the backup onto it.<br><br>How do I handle the LVM metadata? &nbsp;The restored metadata will not be correct. &nbsp;Or does<br>LVM have a way to figure this out? 
<div><span class="e" id="q_1199fa3ccf24d97d_1"><br><br><br>Gerry<br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</span></div></blockquote></div><br>

------=_Part_1252_8835283.1209568159215--
