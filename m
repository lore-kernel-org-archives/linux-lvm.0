Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m83EmPK4015510
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 10:52:03 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.239])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m83EPeQO019747
	for <linux-lvm@redhat.com>; Wed, 3 Sep 2008 10:25:41 -0400
Received: by rv-out-0506.google.com with SMTP id f6so2687982rvb.51
	for <linux-lvm@redhat.com>; Wed, 03 Sep 2008 07:25:40 -0700 (PDT)
Message-ID: <1c748a490809030725p2c4da85clf3b195e768212453@mail.gmail.com>
Date: Wed, 3 Sep 2008 07:25:39 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] 15 snapshot limit?
In-Reply-To: <200809030904.m839490W010033@beta.mvs.co.il>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_16766_21684092.1220451939306"
References: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>
	<48B85CB6.1080403@redhat.com>
	<1c748a490808291412w17dd93f9qcd1454979e77c181@mail.gmail.com>
	<1c748a490809020731i39b214ebhc6e76fd964fc75b4@mail.gmail.com>
	<1c748a490809021519i294d1d9fp912ce93cbf6f75d2@mail.gmail.com>
	<200809030904.m839490W010033@beta.mvs.co.il>
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
To: ehud@unix.mvs.co.il, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Scott Smyth <scotts@cuttedge.com>, Michael Ehman <mpe@cuttedge.com>, Marcos Busby <marcosb@cuttedge.com>

------=_Part_16766_21684092.1220451939306
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

It's MAX LV 0 which I suppose means unlimited (or default?) - though I can't
seem to find it documented anywhere. I'll check out Milan's upgrades. A
"magic formula" sure would be nice, as an unpredictable limit on the number
of snapshots is pretty annoying for a customer product. I wonder if
something is following a "grab half of what's left" strategy; that would
explain a near-independence of memory. There ought to be a way to require
ALL resources to be statically assigned.

Larry

On 9/3/08, Ehud Karni <ehud@unix.mvs.co.il> wrote:
>
> On Tue, 2 Sep 2008 15:19:53 -0700, Larry Dickson wrote:
> >
> > in my case 15 is the max
> > snapshot count, not 32.
>
> I followed this thread from the beginning and I have a simple question.
> What is your Maximum Logical Volume number ?
> Check it with `vgdisplay' at the "MAX LV" line.
>
> If this is the real problem, you can change it with `vgchange'.
>
> Ehud.
>
>
> --
> Ehud Karni           Tel: +972-3-7966-561  /"\
> Mivtach - Simon      Fax: +972-3-7966-667  \ /  ASCII Ribbon Campaign
> Insurance agencies   (USA) voice mail and   X   Against   HTML   Mail
> http://www.mvs.co.il  FAX:  1-815-5509341  / \
> GnuPG: 98EA398D <http://www.keyserver.net/>    Better Safe Than Sorry
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_16766_21684092.1220451939306
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>It&#39;s MAX LV 0 which I suppose means unlimited (or default?) - though I can&#39;t seem to find it documented anywhere. I&#39;ll check out Milan&#39;s upgrades. A &quot;magic formula&quot; sure would be nice, as an unpredictable limit on the number of snapshots is pretty annoying for a customer product. I wonder if something is following a &quot;grab half of what&#39;s left&quot; strategy; that would explain a near-independence of memory. There ought to be a way to require ALL resources to be statically assigned.</div>

<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 9/3/08, <b class="gmail_sendername">Ehud Karni</b> &lt;<a href="mailto:ehud@unix.mvs.co.il">ehud@unix.mvs.co.il</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Tue, 2 Sep 2008 15:19:53 -0700, Larry Dickson wrote:<br>&gt;<br>&gt; in my case 15 is the max<br>&gt; snapshot count, not 32.<br>
<br>I followed this thread from the beginning and I have a simple question.<br>What is your Maximum Logical Volume number ?<br>Check it with `vgdisplay&#39; at the &quot;MAX LV&quot; line.<br><br>If this is the real problem, you can change it with `vgchange&#39;.<br>
<br>Ehud.<br><br><br>--<br>Ehud Karni&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tel: +972-3-7966-561&nbsp;&nbsp;/&quot;\<br>Mivtach - Simon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax: +972-3-7966-667&nbsp;&nbsp;\ /&nbsp;&nbsp;ASCII Ribbon Campaign<br>Insurance agencies&nbsp;&nbsp; (USA) voice mail and&nbsp;&nbsp; X&nbsp;&nbsp; Against&nbsp;&nbsp; HTML&nbsp;&nbsp; Mail<br>
<a href="http://www.mvs.co.il">http://www.mvs.co.il</a>&nbsp;&nbsp;FAX:&nbsp;&nbsp;1-815-5509341&nbsp;&nbsp;/ \<br>GnuPG: 98EA398D &lt;<a href="http://www.keyserver.net/">http://www.keyserver.net/</a>&gt;&nbsp;&nbsp;&nbsp;&nbsp;Better Safe Than Sorry<br><br>_______________________________________________<br>
linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_16766_21684092.1220451939306--
