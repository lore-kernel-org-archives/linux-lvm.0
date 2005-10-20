Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KC50V14789
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 08:05:00 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.207])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9KC4xYO014123
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 08:04:59 -0400
Received: by qproxy.gmail.com with SMTP id c12so342983qbc
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:04:59 -0700 (PDT)
Message-ID: <80d985600510200458yd761c5bl22097cbc9b4e4afa@mail.gmail.com>
Date: Thu, 20 Oct 2005 20:58:40 +0900
From: Craig Hagerman <craighagerman@gmail.com>
Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
In-Reply-To: <80d985600510200257x1bf60c71o505ebff40c2ed7a2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_896_15046479.1129809520029"
References: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
	<43576233.8030605@gmx.net>
	<80d985600510200257x1bf60c71o505ebff40c2ed7a2@mail.gmail.com>
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

------=_Part_896_15046479.1129809520029
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 10/20/05, Craig Hagerman <craighagerman@gmail.com> wrote:
>
> On 10/20/05, Klaus Strebel <klaus.strebel@gmx.net> wrote:
> >
> > What says vgscan in debug mode (you need vgscan before doing a
> > vgchange).
>
>
Just in case this is helpful, here is what pvscan reports. Note, where it
says "unknown device" is has got to be /dev/sda2:

$ pvscan
Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
PV /dev/sdb1 VG media_vg lvm2 [233.75 GB / 772.00 MB free]
PV unknown device VG media_vg lvm2 [186.30 GB / 186.30 GB free]
Total: 2 [420.06 GB] / in use: 2 [420.06 GB] / in no VG: 0 [0 ]

------=_Part_896_15046479.1129809520029
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div><span class=3D"gmail_quote">On 10/20/05, <b class=3D"gmail_sen=
dername">Craig Hagerman</b> &lt;<a href=3D"mailto:craighagerman@gmail.com">=
craighagerman@gmail.com</a>&gt; wrote:</span><blockquote class=3D"gmail_quo=
te" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt=
 0.8ex; padding-left: 1ex;">
<div><span class=3D"q"><span class=3D"gmail_quote">On 10/20/05, <b class=3D=
"gmail_sendername">Klaus Strebel</b> &lt;<a href=3D"mailto:klaus.strebel@gm=
x.net" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,=
this)">klaus.strebel@gmx.net
</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0px 0px 0px 0.8ex; padding-left: 1ex;">What says vgscan =
in debug mode (you need vgscan before doing a vgchange).</blockquote></span=
>
</div></blockquote><div><br>
Just in case this is helpful, here is what pvscan reports. Note, where it s=
ays &quot;unknown device&quot; is has got to be /dev/sda2:<br>
<br>
$ pvscan<br>
&nbsp; Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Sm=
j6'.<br>
&nbsp; PV /dev/sdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG media_vg&n=
bsp;&nbsp; lvm2 [233.75 GB / 772.00 MB free]<br>
&nbsp; PV unknown device&nbsp;&nbsp; VG media_vg&nbsp;&nbsp; lvm2 [186.30 G=
B / 186.30 GB free]<br>
&nbsp; Total: 2 [420.06 GB] / in use: 2 [420.06 GB] / in no VG: 0 [0&nbsp;&=
nbsp; ]<br>
&nbsp;<br>
</div><br></div><br>

------=_Part_896_15046479.1129809520029--
