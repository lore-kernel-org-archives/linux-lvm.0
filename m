Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9RGXK55026552
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 12:33:20 -0400
Received: from mail-iw0-f194.google.com (mail-iw0-f194.google.com
	[209.85.223.194])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9RGWxBv013959
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 12:33:02 -0400
Received: by iwn32 with SMTP id 32so248375iwn.23
	for <linux-lvm@redhat.com>; Tue, 27 Oct 2009 09:32:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4AE711B2.1060800@worldspice.net>
References: <4AE711B2.1060800@worldspice.net>
Date: Tue, 27 Oct 2009 08:32:59 -0800
Message-ID: <1c748a490910270932i4358d850va6d3a232775950dc@mail.gmail.com>
Subject: Re: [linux-lvm] Quick Question RE Snapshots
From: Larry Dickson <ldickson@cuttedge.com>
Content-Type: multipart/alternative; boundary=001636920ca93605f80476ed3b84
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

--001636920ca93605f80476ed3b84
Content-Type: text/plain; charset=ISO-8859-1

In my experience yes - if you are doing long sequential writes, snapshot
turns them into random IO. If you were doing short random writes to begin
with, then snapshot should not have such a huge relative effect, because the
non-snapshot performance is already slow.

Larry Dickson
Cutting Edge Networked Storage

On 10/27/09, Ryan Anderson <ryan@worldspice.net> wrote:

> I'm sure this has been covered before, but I didn't see it in the
> archive: Is a near 90% drop in write performance "normal" snapshot
> behavior? If so, :(
>
> If not, are there any good resources I should be looking at? Every
> search I perform comes up with one of two types of articles on the matter:
>
>
> 1) Snapshots are  awesome! They let you...(list of really nifty things)
>
> 2) Snapshots suck! My system is completely useless while they're active!
>
> --
> Ryan Anderson
> (901) 843 9300
> Systems Engineer
> WorldSpice Technologies
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--001636920ca93605f80476ed3b84
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>In my experience yes - if you are doing long sequential writes, snapsh=
ot turns them into random IO. If you were doing short random writes to begi=
n with, then snapshot should not have such a huge relative effect, because =
the non-snapshot performance is already slow.</div>

<div>=A0</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br><br><span class=3D"gmail_quote">On 1=
0/27/09, <b class=3D"gmail_sendername">Ryan Anderson</b> &lt;<a href=3D"mai=
lto:ryan@worldspice.net">ryan@worldspice.net</a>&gt; wrote:</span></div>
<div>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">I&#39;m sure this has been cover=
ed before, but I didn&#39;t see it in the<br>archive: Is a near 90% drop in=
 write performance &quot;normal&quot; snapshot<br>
behavior? If so, :(<br><br>If not, are there any good resources I should be=
 looking at? Every<br>search I perform comes up with one of two types of ar=
ticles on the matter:<br><br><br>1) Snapshots are=A0=A0awesome! They let yo=
u...(list of really nifty things)<br>
<br>2) Snapshots suck! My system is completely useless while they&#39;re ac=
tive!<br><br>--<br>Ryan Anderson<br>(901) 843 9300<br>Systems Engineer<br>W=
orldSpice Technologies<br><br><br>_________________________________________=
______<br>
linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm=
@redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux=
-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM=
 HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOW=
TO/LVM-HOWTO/</a><br>
<br></blockquote></div><br>

--001636920ca93605f80476ed3b84--
