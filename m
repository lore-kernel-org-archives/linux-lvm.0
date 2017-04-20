Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06F5B80B01
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2017 09:27:01 +0000 (UTC)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AD0989C2F
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2017 09:26:59 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id r203so42044573oib.3
	for <linux-lvm@redhat.com>; Thu, 20 Apr 2017 02:26:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170418160015.GA4820@redhat.com>
References: <CABGge9ziQcu5a++kTJ-mOFEZet=W6YtuPMb4fxJGMmHRqu3Fbg@mail.gmail.com>
	<20170418160015.GA4820@redhat.com>
From: Charles Koprowski <cko@audaxis.com>
Date: Thu, 20 Apr 2017 11:26:18 +0200
Message-ID: <CABGge9yUfY02boFs8btDkRpFitwm6ZSAv8YpCRGPOwoV8pLyUQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113d1d501dd8fd054d95be6a
Subject: Re: [linux-lvm] ubuntu xenial + lvmlockd
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a113d1d501dd8fd054d95be6a
Content-Type: text/plain; charset=UTF-8

2017-04-18 18:00 GMT+02:00 David Teigland <teigland@redhat.com>:

> On Thu, Apr 13, 2017 at 06:14:54PM +0200, Charles Koprowski wrote:
> > Hi all,
> >
> > I'm trying to set up a shared VG between 2 ubuntu servers (xenial) using
> > lvmlockd for locking.
> >
> > Unfortunately, even if the default config (lvm.conf) mentions the
> > possibillity to use lvmlockd (use_lvmlockd = 1), I cannot find any trace
> of
> > the daemon lvmlockd or lvmlockctl tool in ubuntu.
> >
> > Does anyone already done this before ?
> >
> > Do I have to build lvm from source in order to use lvmlockd ?
>
> I'd guess that lvm was not built with lvmlockd support, in which case you
> would need to rebuild it with one or both of --enable-lockd-sanlock,
> --enable-lockd-dlm (and I'm going to rename those options to be "lvmlockd"
> in a minute.)
>

Thank you David !

Would you consider the use of lvmlockd + sanlock as "production ready" ?

My goal here is to replace an existing cluster of 5 nodes using clvmd + dlm
+ corosync to access a shared VG of 6 TB containing around 300 LVs.

The current solution is working fine but I find using dlm + corosync "just"
for locking a bit overkill.

Regards,

Charles

--001a113d1d501dd8fd054d95be6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2017=
-04-18 18:00 GMT+02:00 David Teigland <span dir=3D"ltr">&lt;<a href=3D"mail=
to:teigland@redhat.com" target=3D"_blank">teigland@redhat.com</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l-">On Thu, Apr 13, 2017 at 06:14:54PM +0200, Charles Koprowski wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m trying to set up a shared VG between 2 ubuntu servers (xenial)=
 using<br>
&gt; lvmlockd for locking.<br>
&gt;<br>
&gt; Unfortunately, even if the default config (lvm.conf) mentions the<br>
&gt; possibillity to use lvmlockd (use_lvmlockd =3D 1), I cannot find any t=
race of<br>
&gt; the daemon lvmlockd or lvmlockctl tool in ubuntu.<br>
&gt;<br>
&gt; Does anyone already done this before ?<br>
&gt;<br>
&gt; Do I have to build lvm from source in order to use lvmlockd ?<br>
<br>
</span>I&#39;d guess that lvm was not built with lvmlockd support, in which=
 case you<br>
would need to rebuild it with one or both of --enable-lockd-sanlock,<br>
--enable-lockd-dlm (and I&#39;m going to rename those options to be &quot;l=
vmlockd&quot;<br>
in a minute.)<br></blockquote><div><br></div><div>Thank you David !</div><d=
iv><br></div><div>Would you consider the use of lvmlockd + sanlock as &quot=
;production ready&quot; ?</div><div><br></div><div>My goal here is to repla=
ce an existing cluster of 5 nodes using clvmd + dlm + corosync to access a =
shared VG of 6 TB containing around 300 LVs.</div><div><br></div><div>The c=
urrent solution is working fine but I find using=C2=A0dlm + corosync &quot;=
just&quot; for locking a bit overkill.</div><div><br></div><div>Regards,</d=
iv><div><br></div><div>Charles</div></div><div class=3D"gmail_signature"></=
div>
</div></div>

--001a113d1d501dd8fd054d95be6a--
