Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9QFKVw6015521
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 11:20:31 -0400
Received: from mail-gx0-f226.google.com (mail-gx0-f226.google.com
	[209.85.217.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9QFKCmC024622
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 11:20:13 -0400
Received: by gxk26 with SMTP id 26so9912635gxk.11
	for <linux-lvm@redhat.com>; Mon, 26 Oct 2009 08:20:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0910251513440.6251@bmsred.bmsi.com>
References: <a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
	<20091025084610.GA737@maude.comedia.it>
	<c268e4660910250613y5d307d92t3ab0f4198d76c373@mail.gmail.com>
	<Pine.LNX.4.64.0910251408410.6251@bmsred.bmsi.com>
	<Pine.LNX.4.64.0910251513440.6251@bmsred.bmsi.com>
Date: Mon, 26 Oct 2009 08:20:11 -0700
Message-ID: <a5a956f70910260820l793f8435s18c68deb252edd81@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=001485f80d6a0edb9d0476d81904
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

--001485f80d6a0edb9d0476d81904
Content-Type: text/plain; charset=ISO-8859-1

Hat do you mean by:"4) switch root (remount won't be good enough since it
changed "underfoot")"
Can you please explain?


On Sun, Oct 25, 2009 at 12:17 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Sun, 25 Oct 2009, Stuart D. Gathman wrote:
>
> > > Ext3 does support shrinking. I've been doing it as far back as 2005.
> >
> > But not while mounted.  (AFAIK)
>
> Poor man's approach:
>
> 1) single user mode
> 2) remount root readonly
> 3) run resize2fs - force it to proceed despite (warranted) dire warnings
> 4) switch root (remount won't be good enough since it changed "underfoot")
>
> Of course, while technically "mounted", it might as well be unmounted
> since you can't keep running applications.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001485f80d6a0edb9d0476d81904
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hat do you mean by:&quot;4) switch root (remount won&#39;t be good eno=
ugh since it changed &quot;underfoot&quot;)&quot;</div>
<div>Can you please explain?<br><br><br></div>
<div class=3D"gmail_quote">On Sun, Oct 25, 2009 at 12:17 PM, Stuart D. Gath=
man <span dir=3D"ltr">&lt;<a href=3D"mailto:stuart@bmsi.com">stuart@bmsi.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div class=3D"im">On Sun, 25 Oct 2009, Stuart D. Gathman wrote:<br><br>&gt;=
 &gt; Ext3 does support shrinking. I&#39;ve been doing it as far back as 20=
05.<br>&gt;<br>&gt; But not while mounted. =A0(AFAIK)<br><br></div>Poor man=
&#39;s approach:<br>
<br>1) single user mode<br>2) remount root readonly<br>3) run resize2fs - f=
orce it to proceed despite (warranted) dire warnings<br>4) switch root (rem=
ount won&#39;t be good enough since it changed &quot;underfoot&quot;)<br>
<br>Of course, while technically &quot;mounted&quot;, it might as well be u=
nmounted<br>since you can&#39;t keep running applications.<br>
<div>
<div></div>
<div class=3D"h5"><br>--<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0Stuart D. Gathman &l=
t;<a href=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>=A0 =A0Busi=
ness Management Systems Inc. =A0Phone: 703 591-0911 Fax: 703 591-6154<br>&q=
uot;Confutatis maledictis, flammis acribus addictis&quot; - background song=
 for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.<br><br>_______________________________________________<br>linux-lvm m=
ailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com=
</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM =
HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">ht=
tp://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--001485f80d6a0edb9d0476d81904--
