Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NFxbhA014497
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:59:37 -0400
Received: from mail-vw0-f202.google.com (mail-vw0-f202.google.com
	[209.85.212.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NFxINd012835
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:59:18 -0400
Received: by vws40 with SMTP id 40so335908vws.23
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 08:59:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29ae894c0910230838o755803d9td6211d953ac343e5@mail.gmail.com>
References: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
	<29ae894c0910230838o755803d9td6211d953ac343e5@mail.gmail.com>
Date: Fri, 23 Oct 2009 10:59:18 -0500
Message-ID: <f6d6a910910230859y205a4a99o515e29fd65040125@mail.gmail.com>
Subject: Re: [linux-lvm] How do I use free PE?
From: Rod Rook <rod.rook@gmail.com>
Content-Type: multipart/alternative; boundary=0016e68e8acd5c4f4204769c4bb2
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

--0016e68e8acd5c4f4204769c4bb2
Content-Type: text/plain; charset=ISO-8859-1

Thank you for your reply. I was thinking of using Gnome parted, but I wanted
to check to see if it can be used with LVM2 partitions.

On Fri, Oct 23, 2009 at 10:38 AM, brem belguebli
<brem.belguebli@gmail.com>wrote:

> Hi,
>
> your underlying disk /dev/sdb2 cannot be part of more than one volume
> group, it'll have to be under VolGroup00.
>
> When you say I don't want to add it to VolGroup00, you may be
> confusing some concepts.
>
> You certainly don't want to add free space under / (which is a
> filesystem) on top of a Logical Volume (LogVol0) which itself is built
> on top of your VolGroup00, isn't it ?
>
> If so, you can create a new Logical volume (let's say
> logvolgeneralstorage, man lvcreate) on top of VolGroup00 which will be
> mounted on /otherstroragethanslash.
>
> Everything is in the man pages (lvcreate, lvs, lvdisplay, mke[234]fs,
> fstab)
>
> 2009/10/23 Rod Rook <rod.rook@gmail.com>:
> > I've installed Fedora 10 on a 250GB SATA hard drive.
> > I want to use the unused portion (free PE= 4378, about 140GB), but I
> don't
> > know how I go about doing it.
> > I don't want to add it to VolGroup00, but I want it made accessible as a
> > general storage space.
> >
> >>
> >> [root@localhost Documents]# pvdisplay /dev/sdb2
> >
> >   --- Physical volume ---
> >   PV Name               /dev/sdb2
> >   VG Name               VolGroup00
> >   PV Size               232.69 GB / not usable 4.58 MB
> >   Allocatable           yes
> >   PE Size (KByte)       32768
> >   Total PE              7446
> >   Free PE               4376
> >   Allocated PE          3070
> >>
> >>   PV UUID               DBf14Y-SLFe-cwZy-m1O7-3Jw9-Xhdf-3u42iX
> >>
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e68e8acd5c4f4204769c4bb2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you for your reply. I was thinking of using Gnome parted, but I
wanted to check to see if it can be used with LVM2 partitions. <br><br>
<div class=3D"gmail_quote">On Fri, Oct 23, 2009 at 10:38 AM, brem belguebli=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:brem.belguebli@gmail.com">brem.bel=
guebli@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.=
8ex; padding-left: 1ex;">
Hi,<br>
<br>
your underlying disk /dev/sdb2 cannot be part of more than one volume<br>
group, it&#39;ll have to be under VolGroup00.<br>
<br>
When you say I don&#39;t want to add it to VolGroup00, you may be<br>
confusing some concepts.<br>
<br>
You certainly don&#39;t want to add free space under / (which is a<br>
filesystem) on top of a Logical Volume (LogVol0) which itself is built<br>
on top of your VolGroup00, isn&#39;t it ?<br>
<br>
If so, you can create a new Logical volume (let&#39;s say<br>
logvolgeneralstorage, man lvcreate) on top of VolGroup00 which will be<br>
mounted on /otherstroragethanslash.<br>
<br>
Everything is in the man pages (lvcreate, lvs, lvdisplay, mke[234]fs, fstab=
)<br>
<br>
2009/10/23 Rod Rook &lt;<a href=3D"mailto:rod.rook@gmail.com">rod.rook@gmai=
l.com</a>&gt;:<br>
<div><div></div><div class=3D"h5">&gt; I&#39;ve installed Fedora 10 on a 25=
0GB SATA hard drive.<br>
&gt; I want to use the unused portion (free PE=3D 4378, about 140GB), but I=
 don&#39;t<br>
&gt; know how I go about doing it.<br>
&gt; I don&#39;t want to add it to VolGroup00, but I want it made accessibl=
e as a<br>
&gt; general storage space.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; [root@localhost Documents]# pvdisplay /dev/sdb2<br>
&gt;<br>
&gt; =A0 --- Physical volume ---<br>
&gt; =A0 PV Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /dev/sdb2<br>
&gt; =A0 VG Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VolGroup00<br>
&gt; =A0 PV Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 232.69 GB / not =
usable 4.58 MB<br>
&gt; =A0 Allocatable=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 yes<br>
&gt; =A0 PE Size (KByte)=A0=A0=A0=A0=A0=A0 32768<br>
&gt; =A0 Total PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 7446<br>
&gt; =A0 Free PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4376<br>
&gt; =A0 Allocated PE=A0=A0=A0=A0=A0=A0=A0=A0=A0 3070<br>
&gt;&gt;<br>
&gt;&gt; =A0 PV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DBf14Y-SLFe-=
cwZy-m1O7-3Jw9-Xhdf-3u42iX<br>
&gt;&gt;<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=
=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt;<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--0016e68e8acd5c4f4204769c4bb2--
