Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8IAtsmg028735
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2014 06:55:54 -0400
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8IAtqFJ004801
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2014 06:55:53 -0400
Received: by mail-qc0-f178.google.com with SMTP id w7so306047qcr.23
	for <linux-lvm@redhat.com>; Thu, 18 Sep 2014 03:55:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140918101656.GI2407@agk-dp.fab.redhat.com>
References: <CAA8m+Y0nXi3w6tHjSr1sbUazeCJ7THdQVO66hNkn-=7K6MgsTw@mail.gmail.com>
	<20140918101656.GI2407@agk-dp.fab.redhat.com>
Date: Thu, 18 Sep 2014 03:55:51 -0700
Message-ID: <CAA8m+Y2_Rk9zmbrFemkFVAHVeJNgyQYtKrSWuBY_+UDxpvvnjg@mail.gmail.com>
From: Pirate Fibonacci <pirate112358@gmail.com>
Content-Type: multipart/alternative; boundary=001a1132f084f834f4050354d3e4
Subject: Re: [linux-lvm] =?utf-8?b?4oCYTFZNRVRBRF9QSURGSUxF4oCZIHVuZGVjbGFy?=
	=?utf-8?q?ed_when_compiling?=
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
To: Pirate Fibonacci <pirate112358@gmail.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--001a1132f084f834f4050354d3e4
Content-Type: text/plain; charset=UTF-8

I started with no options, and then with below

./configure --with-lvmetad_pidfile=/run/lvmetad.pid

same results in both cases.

config.log:LVMETAD_PIDFILE='''
config.status:S["LVMETAD_PIDFILE"]=""

make distclean before no help

shouldn't configure with no options work? suggestions...

thanks



On Thu, Sep 18, 2014 at 3:16 AM, Alasdair G Kergon <agk@redhat.com> wrote:

> On Wed, Sep 17, 2014 at 02:43:27PM -0700, Pirate Fibonacci wrote:
> > error happens from lvm2/daemons/lvmetad
>
> What error messages?
>
> > the log says it's unset... not sure how to tell configure how to set this
> > variable in
> > the header files?
>
> What is the configure line that are you using?
>
> If you've been experimenting with different ones, it's a good idea to 'make
> distclean' before starting again.
>
> Alasdair
>
>

--001a1132f084f834f4050354d3e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>I started with no options, and then with be=
low<br><div><div><br>./configure --with-lvmetad_pidfile=3D/run/lvmetad.pid<=
br><div class=3D"gmail_extra"><br>same results in both cases.<br><br>config=
.log:LVMETAD_PIDFILE=3D&#39;&#39;&#39;<br>config.status:S[&quot;LVMETAD_PID=
FILE&quot;]=3D&quot;&quot;<br><br>make distclean before no help<br><br></di=
v><div class=3D"gmail_extra">shouldn&#39;t configure with no options work? =
suggestions...<br><br></div><div class=3D"gmail_extra">thanks<br><br></div>=
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Sep 1=
8, 2014 at 3:16 AM, Alasdair G Kergon <span dir=3D"ltr">&lt;<a href=3D"mail=
to:agk@redhat.com" target=3D"_blank">agk@redhat.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 17, 2014 at=
 02:43:27PM -0700, Pirate Fibonacci wrote:<br>
&gt; error happens from lvm2/daemons/lvmetad<br>
<br>
What error messages?<br>
<span class=3D""><br>
&gt; the log says it&#39;s unset... not sure how to tell configure how to s=
et this<br>
&gt; variable in<br>
&gt; the header files?<br>
<br>
</span>What is the configure line that are you using?<br>
<br>
If you&#39;ve been experimenting with different ones, it&#39;s a good idea =
to &#39;make<br>
distclean&#39; before starting again.<br>
<span class=3D""><font color=3D"#888888"><br>
Alasdair<br>
<br>
</font></span></blockquote></div><br></div></div></div></div>

--001a1132f084f834f4050354d3e4--
