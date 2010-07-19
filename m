Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6JJ6HY4009552
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 15:06:17 -0400
Received: from web137320.mail.in.yahoo.com (web137320.mail.in.yahoo.com
	[121.101.151.147])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o6JJ68SC020600
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 15:06:09 -0400
Message-ID: <512034.66107.qm@web137320.mail.in.yahoo.com>
Date: Tue, 20 Jul 2010 00:36:07 +0530 (IST)
From: andiket a <truly_linux@yahoo.co.in>
In-Reply-To: <AANLkTiknRBZed0bWdmqb17og_i474Dvz-MNkmuSOUG_6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-750901209-1279566367=:66107"
Subject: Re: [linux-lvm] COW store
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

--0-750901209-1279566367=:66107
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Greg,

You got absolutely right.
That is exactly what I actually wanted to ask.

I didn't know about this pv stuff for original LVs n snapshot LVs.
Let me look at the lvcreate once again.

I want the cow store to go on to a separate physical device.



--- On Mon, 19/7/10, Greg Freemyer <greg.freemyer@gmail.com> wrote:

From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] COW store
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Date: Monday, 19 July, 2010, 9:15 PM

On Mon, Jul 19, 2010 at 7:14 AM, andiket a <truly_linux@yahoo.co.in> wrote:
>
> Hi,
>
> Is it possible to specify a different device or to be specific a differen=
t VG than original VG to create a cow store for snapshot.
>
> If I have a an LV in VG1 then I don't snapshot to create cow store (snaps=
hot LV) on same VG but to use VG2.
>
>
> Thanks.
>

Your question would make a lot more sense as:

=3D=3D=3D
Is it possible to specify a different device or to be specific a
different PV than original PV to create a cow store for snapshot?
=3D=3D=3D

Answer: Yes, when you create your main LVs and snapshot LVs you can
specify which PVs they use.

Greg

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=0A=0A
--0-750901209-1279566367=:66107
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Greg,<br><br>You got absolutely right.<br>Tha=
t is exactly what I actually wanted to ask.<br><br>I didn't know about this=
 pv stuff for original LVs n snapshot LVs.<br>Let me look at the lvcreate o=
nce again.<br><br>I want the cow store to go on to a separate physical devi=
ce.<br><br><br><br>--- On <b>Mon, 19/7/10, Greg Freemyer <i>&lt;greg.freemy=
er@gmail.com&gt;</i></b> wrote:<br><blockquote style=3D"border-left: 2px so=
lid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"><br>From: Greg =
Freemyer &lt;greg.freemyer@gmail.com&gt;<br>Subject: Re: [linux-lvm] COW st=
ore<br>To: "LVM general discussion and development" &lt;linux-lvm@redhat.co=
m&gt;<br>Date: Monday, 19 July, 2010, 9:15 PM<br><br><div class=3D"plainMai=
l">On Mon, Jul 19, 2010 at 7:14 AM, andiket a &lt;<a ymailto=3D"mailto:trul=
y_linux@yahoo.co.in"
 href=3D"/mc/compose?to=3Dtruly_linux@yahoo.co.in">truly_linux@yahoo.co.in<=
/a>&gt; wrote:<br>&gt;<br>&gt; Hi,<br>&gt;<br>&gt; Is it possible to specif=
y a different device or to be specific a different VG than original VG to c=
reate a cow store for snapshot.<br>&gt;<br>&gt; If I have a an LV in VG1 th=
en I don't snapshot to create cow store (snapshot LV) on same VG but to use=
 VG2.<br>&gt;<br>&gt;<br>&gt; Thanks.<br>&gt;<br><br>Your question would ma=
ke a lot more sense as:<br><br>=3D=3D=3D<br>Is it possible to specify a dif=
ferent device or to be specific a<br>different PV than original PV to creat=
e a cow store for snapshot?<br>=3D=3D=3D<br><br>Answer: Yes, when you creat=
e your main LVs and snapshot LVs you can<br>specify which PVs they use.<br>=
<br>Greg<br><br>_______________________________________________<br>linux-lv=
m mailing list<br><a ymailto=3D"mailto:linux-lvm@redhat.com" href=3D"/mc/co=
mpose?to=3Dlinux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a
 href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blan=
k">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HO=
W-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http=
://tldp.org/HOWTO/LVM-HOWTO/</a><br></div></blockquote></td></tr></table><b=
r>
--0-750901209-1279566367=:66107--
