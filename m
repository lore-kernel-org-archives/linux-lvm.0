Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n94FNS5Z002103
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 11:23:28 -0400
Received: from mail-vw0-f193.google.com (mail-vw0-f193.google.com
	[209.85.212.193])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n94FNACa023004
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 11:23:10 -0400
Received: by vws31 with SMTP id 31so1573991vws.19
	for <linux-lvm@redhat.com>; Sun, 04 Oct 2009 08:23:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
References: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
	<20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
Date: Sun, 4 Oct 2009 10:23:09 -0500
Message-ID: <f6d6a910910040823lffdc70fkff4d2e4a15d49349@mail.gmail.com>
Subject: Re: [linux-lvm] Unmounting file system hangs up...
From: Thinking Outside the Well <rod.rook@gmail.com>
Content-Type: multipart/alternative; boundary=0016363b80d821318304751d93a5
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

--0016363b80d821318304751d93a5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you for your quick response, Andre.
I agree you are right on your suggestion that Fedora is trying to umount a
network file system. I think it actually is trying to umount a CentOS file
system installed in another hard drive. The reason why I think that way is
that whenever I log on to CentOS, it complains that something is wrong with
the file system and checks it

Do you know how to tell Fedora not to umount CentOS file system?

rod

On Sun, Oct 4, 2009 at 9:38 AM, Andr=E9 Gillibert <rcvxdg@gmail.com> wrote:

> Thinking Outside the Well <rod.rook@gmail.com> wrote:
> > Hello,
> >
> > I am using Fedora 10 and LVM. Lately when I shut down or restart the
> Linux
> > box, it hangs at the stage of "Unmounting file system".
> >
> >
> >    - Turning off swap  --- OK
> >    - Turning off quotas --- OK
> >    - Unmounting pipe file system  --- OK
> >    - Unmounting file system ---  hangs up
> >
> > Although I can turn off or restart the box manually, I am a bit concern=
ed
> > whether it is the beginning of more serious problems later.
> > Your suggestion will be greatly appreciated.
>
> You should find exactly which command hangs.
> It might be as simple as a fs that it cannot umount because it's busy.
> Or maybe something like Fedora trying to umount a network file system aft=
er
> the network has been shut down.
>
> In doubt, check the health of your disk with fsck, badblocks and
> smartmontools.
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

--0016363b80d821318304751d93a5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you for your quick response, Andre. <br>I agree you are right on your=
 suggestion that Fedora is trying to umount a network file system. I think =
it actually is trying to umount a CentOS file system installed in another h=
ard drive. The reason why I think that way is that whenever I log on to Cen=
tOS, it complains that something is wrong with the file system and checks i=
t <br>
<br>Do you know how to tell Fedora not to umount CentOS file system?<br><br=
>rod<br><br><div class=3D"gmail_quote">On Sun, Oct 4, 2009 at 9:38 AM, Andr=
=E9 Gillibert <span dir=3D"ltr">&lt;<a href=3D"mailto:rcvxdg@gmail.com">rcv=
xdg@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div><div></div><=
div class=3D"h5">Thinking Outside the Well &lt;<a href=3D"mailto:rod.rook@g=
mail.com">rod.rook@gmail.com</a>&gt; wrote:<br>

&gt; Hello,<br>
&gt;<br>
&gt; I am using Fedora 10 and LVM. Lately when I shut down or restart the L=
inux<br>
&gt; box, it hangs at the stage of &quot;Unmounting file system&quot;.<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0- Turning off swap =A0--- OK<br>
&gt; =A0 =A0- Turning off quotas --- OK<br>
&gt; =A0 =A0- Unmounting pipe file system =A0--- OK<br>
&gt; =A0 =A0- Unmounting file system --- =A0hangs up<br>
&gt;<br>
&gt; Although I can turn off or restart the box manually, I am a bit concer=
ned<br>
&gt; whether it is the beginning of more serious problems later.<br>
&gt; Your suggestion will be greatly appreciated.<br>
<br>
</div></div>You should find exactly which command hangs.<br>
It might be as simple as a fs that it cannot umount because it&#39;s busy.<=
br>
Or maybe something like Fedora trying to umount a network file system after=
 the network has been shut down.<br>
<br>
In doubt, check the health of your disk with fsck, badblocks and smartmonto=
ols.<br>
<br>
--<br>
Andr=E9 Gillibert<br>
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
</blockquote></div><br>

--0016363b80d821318304751d93a5--
