Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1RIUoXE004220
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 13:30:50 -0500
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1RIUmU8019029
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 13:30:48 -0500
Received: by mail-bk0-f42.google.com with SMTP id jk7so426505bkc.15
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 10:30:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20130227100446.GB2459@raspberrypi>
References: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
	<20130227100446.GB2459@raspberrypi>
Date: Wed, 27 Feb 2013 15:30:47 -0300
Message-ID: <CAEZ+n-gv=9Gdg8b3xKW5JraNVvRhc3fqiYUvL+6vt4Wrdda02A@mail.gmail.com>
From: Leo Antonio <heiligerstein@gmail.com>
Content-Type: multipart/alternative; boundary=0015174760bc0d3a2e04d6b8f9c9
Subject: Re: [linux-lvm] How does LVM-Cache work?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0015174760bc0d3a2e04d6b8f9c9
Content-Type: text/plain; charset=ISO-8859-1

Thanks for answers.


I take a look in dm-cache-target, I really dont knew this project.

Joe, what is the best way to continue this discussion?

Do you have some documentation besides what is into kernel source, like
Papers, Architecture Projects etc?
What is the best way to start to understand this?


Thanks!


2013/2/27 <thornber@redhat.com>

> On Tue, Feb 26, 2013 at 03:44:43PM -0300, Leo Antonio wrote:
> > Hello, everyone.
> >
> > I'm willing to do research about second-level cache using SSDs and I
> think
> > that the best way to do this is using LVM/Device Mapper, because other
> > implementations are based on FUSE, virtualization layers, and others.
> >
> > What I'm trying to do is to develop a subsystem that will put hot
> > blocks/PEs on SSDs-Cache, as well as group related blocks/PEs on cache
> > automatically. Not simply put on SSD the most  used files or directories.
> >
> > The problem is that I could not find any documentation about DM or LVM to
> > help my research and development.
> >
> > Could you point me to some documentation or what's the best way to
> > accomplish this?
>
> See my dm-cache target in this branch of my tree:
>
> https://github.com/jthornber/linux-2.6/tree/thin-dev
>
>
> https://github.com/jthornber/linux-2.6/blob/thin-dev/drivers/md/dm-cache-target.c
>
> There's still a lot of work to do on the policy plug-ins, so if you
> like to get involved that would be great.
>
> - Joe
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0015174760bc0d3a2e04d6b8f9c9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for answers.<div><br></div><div><br></div><div>I take a look in dm-c=
ache-target, I really dont knew this project.</div><div><br></div><div>Joe,=
 what is the best way to continue this discussion?=A0</div><div><br></div>
<div>Do you have some documentation besides what is into kernel source, lik=
e Papers, Architecture Projects etc?</div><div>What is the best way to star=
t to understand this?</div><div><br></div><div><br></div><div>Thanks!</div>
<div><br><br><div class=3D"gmail_quote">2013/2/27  <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:thornber@redhat.com" target=3D"_blank">thornber@redhat.com<=
/a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Tue, Feb 26, 2013 at 03:44:43PM -0300, Leo Antonio wro=
te:<br>
&gt; Hello, everyone.<br>
&gt;<br>
&gt; I&#39;m willing to do research about second-level cache using SSDs and=
 I think<br>
&gt; that the best way to do this is using LVM/Device Mapper, because other=
<br>
&gt; implementations are based on FUSE, virtualization layers, and others.<=
br>
&gt;<br>
&gt; What I&#39;m trying to do is to develop a subsystem that will put hot<=
br>
&gt; blocks/PEs on SSDs-Cache, as well as group related blocks/PEs on cache=
<br>
&gt; automatically. Not simply put on SSD the most =A0used files or directo=
ries.<br>
&gt;<br>
&gt; The problem is that I could not find any documentation about DM or LVM=
 to<br>
&gt; help my research and development.<br>
&gt;<br>
&gt; Could you point me to some documentation or what&#39;s the best way to=
<br>
&gt; accomplish this?<br>
<br>
</div>See my dm-cache target in this branch of my tree:<br>
<br>
<a href=3D"https://github.com/jthornber/linux-2.6/tree/thin-dev" target=3D"=
_blank">https://github.com/jthornber/linux-2.6/tree/thin-dev</a><br>
<br>
<a href=3D"https://github.com/jthornber/linux-2.6/blob/thin-dev/drivers/md/=
dm-cache-target.c" target=3D"_blank">https://github.com/jthornber/linux-2.6=
/blob/thin-dev/drivers/md/dm-cache-target.c</a><br>
<br>
There&#39;s still a lot of work to do on the policy plug-ins, so if you<br>
like to get involved that would be great.<br>
<br>
- Joe<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></div>

--0015174760bc0d3a2e04d6b8f9c9--
