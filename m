Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2JEGF6t018820
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 10:16:15 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.182])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2JEFtE0005642
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 10:15:56 -0400
Received: by wa-out-1112.google.com with SMTP id v33so428491wah.19
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 07:15:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1237462677.10568.208.camel@breeves.fab.redhat.com>
References: <37d33d830903190431yf906795j45f2efd5e765a2fd@mail.gmail.com>
	<1237462677.10568.208.camel@breeves.fab.redhat.com>
Date: Thu, 19 Mar 2009 06:15:55 -0800
Message-ID: <1c748a490903190715p40b7346bgf0bd4aefe7432a6c@mail.gmail.com>
Subject: Re: [linux-lvm] liblvm IOCTL/sysfs interface
From: Larry Dickson <ldickson@cuttedge.com>
Content-Type: multipart/alternative; boundary=00163646c1da3f403a0465797060
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

--00163646c1da3f403a0465797060
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Location as well as size is given by

lvdisplay --maps

Larry Dickson
Cutting Edge Networked Storage

On 3/19/09, Bryn M. Reeves <bmr@redhat.com> wrote:
>
> On Thu, 2009-03-19 at 17:01 +0530, Sandeep K Sinha wrote:
> > So, I should see the information like.
> >
> > lvol0
> > vg
> > target1 - /dev/sda5 ----  0 -- 10000 ( BEGIN  -- Length )
> > target2 - /dev/sda6 ----  10001 -- 4000
>
> dmsetup table
>
> >
> > We do maintain these informations inside the kernel, We should atleast
> > have an ioctl or sysfs based interface to extract
> > these information.
> >
> > Liblvm is under development, won't it be of a good use to provide such
> > a functionality.
>
> This is a lower level than liblvm targets (liblvm will work in terms of
> "LVM level" objects; pvs, vgs, lvs). The functionality to observe and
> manipulate the targets used by a specific LVM device is already provided
> by libdevmapper and the dmsetup tool.
>
> Regards,
> Bryn.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--00163646c1da3f403a0465797060
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Location as well as size is given by</div>
<div>=A0</div>
<div>lvdisplay --maps</div>
<div>=A0</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>=A0</div>
<div><span class=3D"gmail_quote">On 3/19/09, <b class=3D"gmail_sendername">=
Bryn M. Reeves</b> &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>=
&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">On Thu, 2009-03-19 at 17:01 +053=
0, Sandeep K Sinha wrote:<br>&gt; So, I should see the information like.<br=
>
&gt;<br>&gt; lvol0<br>&gt; vg<br>&gt; target1 - /dev/sda5 ----=A0=A00 -- 10=
000 ( BEGIN=A0=A0-- Length )<br>&gt; target2 - /dev/sda6 ----=A0=A010001 --=
 4000<br><br>dmsetup table<br><br>&gt;<br>&gt; We do maintain these informa=
tions inside the kernel, We should atleast<br>
&gt; have an ioctl or sysfs based interface to extract<br>&gt; these inform=
ation.<br>&gt;<br>&gt; Liblvm is under development, won&#39;t it be of a go=
od use to provide such<br>&gt; a functionality.<br><br>This is a lower leve=
l than liblvm targets (liblvm will work in terms of<br>
&quot;LVM level&quot; objects; pvs, vgs, lvs). The functionality to observe=
 and<br>manipulate the targets used by a specific LVM device is already pro=
vided<br>by libdevmapper and the dmsetup tool.<br><br>Regards,<br>Bryn.<br>
<br><br>_______________________________________________<br>linux-lvm mailin=
g list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><=
br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://ww=
w.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://=
tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--00163646c1da3f403a0465797060--
