Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n94NhMA1025713
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 19:43:22 -0400
Received: from mail-vw0-f193.google.com (mail-vw0-f193.google.com
	[209.85.212.193])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n94Nh4OJ028880
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 19:43:04 -0400
Received: by vws31 with SMTP id 31so1715080vws.19
	for <linux-lvm@redhat.com>; Sun, 04 Oct 2009 16:43:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091004230248.36789207@fixlaptop.gillibert.homelinux.net>
References: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
	<20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
	<f6d6a910910040823lffdc70fkff4d2e4a15d49349@mail.gmail.com>
	<20091004191106.08a50ebf@fixlaptop.gillibert.homelinux.net>
	<f6d6a910910041049r79912d8ap558c31788a3c233c@mail.gmail.com>
	<20091004230248.36789207@fixlaptop.gillibert.homelinux.net>
Date: Sun, 4 Oct 2009 18:43:04 -0500
Message-ID: <f6d6a910910041643v158464d4m587f1105fa43f8af@mail.gmail.com>
Subject: Re: [linux-lvm] Unmounting file system hangs up...
From: Thinking Outside the Well <rod.rook@gmail.com>
Content-Type: multipart/alternative; boundary=0016363b7cfeed47210475248e0b
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

--0016363b7cfeed47210475248e0b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks you for your advice, Andre.

rod

On Sun, Oct 4, 2009 at 4:02 PM, Andr=E9 Gillibert <rcvxdg@gmail.com> wrote:

> Thinking Outside the Well <rod.rook@gmail.com> wrote:
>
> > CentOS-5 is on a hard drive of the same computer. /etc/fstab does not
> > explicitly mount CentOS-5, but Fedora-10 somehow mounts all hard drives
> > including NTFS drives. I must have done something to do this, but I
> forgot
> > what I did. Do you have any idea what I did and how I remedy this
> situation?
> >
>
> Two things may concur to this automatic mount.
> 1) hald (Hardware Abstraction Layer Daemon)
> This informs software about which hardware, including hard drives, is
> currently connected, and when removable drives are inserted or removed.
> 2) The desktop or file manager (nautilus on GNOME, konqueror or dolphin o=
n
> KDE).
> It gets the list of connected devices from hald, through the d-bus system=
,
> and, may automatically mount cold plugged and hot plugged drives.
>
> As I neither use GNOME, nor KDE, I don't know what exact setting triggers
> this behavior, but, ideally, you should configure the relevant applicatio=
n
> (nautilus, dolphin or konqueror) to disable this behavior, or make them
> properly unmount the drives.
>
> --
> Andr=E9 Gillibert
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016363b7cfeed47210475248e0b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks you for your advice, Andre.<br><br>rod<br><br><div class=3D"gmail_qu=
ote">On Sun, Oct 4, 2009 at 4:02 PM, Andr=E9 Gillibert <span dir=3D"ltr">&l=
t;<a href=3D"mailto:rcvxdg@gmail.com">rcvxdg@gmail.com</a>&gt;</span> wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class=3D"im"=
>Thinking Outside the Well &lt;<a href=3D"mailto:rod.rook@gmail.com">rod.ro=
ok@gmail.com</a>&gt; wrote:<br>

<br>
</div><div class=3D"im">&gt; CentOS-5 is on a hard drive of the same comput=
er. /etc/fstab does not<br>
&gt; explicitly mount CentOS-5, but Fedora-10 somehow mounts all hard drive=
s<br>
&gt; including NTFS drives. I must have done something to do this, but I fo=
rgot<br>
&gt; what I did. Do you have any idea what I did and how I remedy this situ=
ation?<br>
&gt;<br>
<br>
</div>Two things may concur to this automatic mount.<br>
1) hald (Hardware Abstraction Layer Daemon)<br>
This informs software about which hardware, including hard drives, is curre=
ntly connected, and when removable drives are inserted or removed.<br>
2) The desktop or file manager (nautilus on GNOME, konqueror or dolphin on =
KDE).<br>
It gets the list of connected devices from hald, through the d-bus system, =
and, may automatically mount cold plugged and hot plugged drives.<br>
<br>
As I neither use GNOME, nor KDE, I don&#39;t know what exact setting trigge=
rs this behavior, but, ideally, you should configure the relevant applicati=
on (nautilus, dolphin or konqueror) to disable this behavior, or make them =
properly unmount the drives.<br>

<font color=3D"#888888"><br>
--<br>
</font><div><div></div><div class=3D"h5">Andr=E9 Gillibert<br>
<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--0016363b7cfeed47210475248e0b--
