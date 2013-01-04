Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r04Eor07030981
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 09:50:54 -0500
Received: from exprod6og122.obsmtp.com (exprod6og122.obsmtp.com [64.18.1.238])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id r04Eoqne017652
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 09:50:52 -0500
Received: by mail-wi0-f198.google.com with SMTP id c10so15449190wiw.5
	for <linux-lvm@redhat.com>; Fri, 04 Jan 2013 06:50:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <50E6BBCF.1000205@redhat.com>
References: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
	<50E6BBCF.1000205@redhat.com>
Date: Fri, 4 Jan 2013 09:50:50 -0500
Message-ID: <CABTYv7XyF5q=CuV3TCN0SbUcn+mLOtBPQZ7469jjdNn27O0sdA@mail.gmail.com>
From: Tyler Gates <tyler.gates@ats.coop>
Content-Type: multipart/alternative; boundary=089e01183fa605c8c404d2779b95
Subject: Re: [linux-lvm] Snapshot causing segault
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--089e01183fa605c8c404d2779b95
Content-Type: text/plain; charset=ISO-8859-1

Thanks Milan I believe you are right about it being a bug. I was able to
trigger the panic with the script provided and the results are very similar
(although I'm now having a hard time recreating my problem on demand).

I should have fun finding this kernel for SLES10 SP4 even though the minor
is only 2 off...

Thanks again for everyone's help.

    Tyler


On Fri, Jan 4, 2013 at 6:23 AM, Milan Broz <mbroz@redhat.com> wrote:

> On 12/31/2012 07:50 PM, Tyler Gates wrote:
> > Hello everyone,
> > I've been having an intermittent problem on random servers
> > segfaulting while trying to create a snapshot under version
> > lvm2-2.02.17-7.38.3 on kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4).
>
> This is almost surely kernel bug, not userspace one.
>
> It is very old kernel, so hard to say exactly which patches are needed
> but my guess is it is very similar to
> https://bugzilla.redhat.com/show_bug.cgi?id=360151
> (note: fixed 2007!) with upstream patch
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=512875bd9661368da6f993205a61213b79ba1df0
>
> (But there can more patches, this is really old and someone need
> to do proper analysis what is going here.)
>
> Milan
>
>


-- 

Tyler Gates*
*

*ATS* | Sr. Systems Administrator

Tyler.Gates@ats.coop

*The Power of **One** Software Solution - **OpenOne*


 910.210.4100 main  |  910.210.4150 fax |  910.210.4118 direct |
910.358.3063 mobile |


This email may contain information that is confidential or attorney-client
privileged and may constitute inside
information. The contents of this email are intended only for the
recipient(s) listed above.  If you are not the
intended recipient, you are directed not to read, disclose, distribute or
otherwise use this transmission.  If you
received this email in error, please notify the sender immediately and
delete the transmission.  Delivery of the
message is not intended to waive any applicable privileges.

--089e01183fa605c8c404d2779b95
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks Milan I believe you are right about it being a bug. I was able to tr=
igger the panic with the script provided and the results are very similar (=
although I&#39;m now having a hard time recreating my problem on demand).<d=
iv>
<br><div>I should have fun finding this kernel for SLES10 SP4 even though t=
he minor is only 2 off...</div><div><br></div><div>Thanks again for everyon=
e&#39;s help.</div><div><br></div><div>=A0 =A0 Tyler</div></div><div class=
=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Fri, Jan 4, 2013 at 6:23 AM, Milan Br=
oz <span dir=3D"ltr">&lt;<a href=3D"mailto:mbroz@redhat.com" target=3D"_bla=
nk">mbroz@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<div class=3D"im">On 12/31/2012 07:50 PM, Tyler Gates wrote:<br>
&gt; Hello everyone,<br>
&gt; I&#39;ve been having an intermittent problem on random servers<br>
&gt; segfaulting while trying to create a snapshot under version<br>
&gt; lvm2-2.02.17-7.38.3 on kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4).<b=
r>
<br>
</div>This is almost surely kernel bug, not userspace one.<br>
<br>
It is very old kernel, so hard to say exactly which patches are needed<br>
but my guess is it is very similar to <a href=3D"https://bugzilla.redhat.co=
m/show_bug.cgi?id=3D360151" target=3D"_blank">https://bugzilla.redhat.com/s=
how_bug.cgi?id=3D360151</a><br>
(note: fixed 2007!) with upstream patch<br>
<a href=3D"http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.g=
it;a=3Dcommitdiff;h=3D512875bd9661368da6f993205a61213b79ba1df0" target=3D"_=
blank">http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcommitdiff;h=3D512875bd9661368da6f993205a61213b79ba1df0</a><br>

<br>
(But there can more patches, this is really old and someone need<br>
to do proper analysis what is going here.)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Milan<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><p><span style=3D"font-style:normal">Tyler Gates</span><font color=3D"#00=
8000"><b><br></b></font></p><p><font color=3D"#008000"><b>ATS</b></font> | =
Sr. Systems
Administrator</p><p><a href=3D"mailto:Tyler.Gates@ats.coop" target=3D"_blan=
k">Tyler.Gates@ats.coop</a></p>
<p><i>The Power of </i><font color=3D"#ff0000"><i><b>One</b></i></font><i>
Software Solution - </i><i><b>OpenOne</b></i></p>
<p><br>=A0<font>910.210.4100 main=A0 |=A0
910.210.4150 fax | =A0910.210.4118 direct |=A0 910.358.3063
mobile | </font>
</p>
<p><font color=3D"#1f497d"><font style=3D"font-size:8pt" size=3D"1"><br>
This email may contain information that is confidential or attorney-client =
privileged and may constitute inside<br>
information.=A0The contents of this email are intended only for the recipie=
nt(s) listed above.=A0 If you are not the<br>
intended recipient, you are directed not to read, disclose, distribute or o=
therwise use this transmission.=A0 If you<br>
received this email in error, please notify the sender immediately and dele=
te the transmission.=A0 Delivery of the<br>
message is not intended to waive any applicable privileges.</font></font></=
p>
</div>

--089e01183fa605c8c404d2779b95--
