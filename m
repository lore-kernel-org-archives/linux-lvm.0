Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0QE1bws008503
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2011 09:01:37 -0500
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0QE1OIx007211
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2011 09:01:25 -0500
Received: by pwj3 with SMTP id 3so306120pwj.33
	for <linux-lvm@redhat.com>; Wed, 26 Jan 2011 06:01:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTim3Z8R4o1KLUiG5z0vkh5nbjbQkRAscf+UUoPUC@mail.gmail.com>
References: <AANLkTim3Z8R4o1KLUiG5z0vkh5nbjbQkRAscf+UUoPUC@mail.gmail.com>
Date: Wed, 26 Jan 2011 08:01:24 -0600
Message-ID: <AANLkTi=CeVNezxZUPNQZEO-M1x9hHQms516WqRF5UfYa@mail.gmail.com>
From: Alberto Rivera <pollochicken@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd32f1ebd9340049ac04455
Subject: Re: [linux-lvm] vgscan
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

--000e0cd32f1ebd9340049ac04455
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 24, 2011 at 10:01 AM, Prathyush <prathyush.r@gmail.com> wrote:

> Hi,
>
> What does vgscan --mknodes command will do. Can i use this for exporting
> the vgs to another system
>
> -- **




From the vgscan(8) man page:

*--mknodes* Also checks the LVM special files in /dev that are needed for
active logical volumes and creates any missing ones and removes unused ones
The years I have been working with lvm I have never had to use this
command.  Typically as long as I mark the volume group as active on the node
that I want the vgscan to be usable  vgchange -a y ${volume_group} takes
care of presenting the device files where on the node it was activated on.


Hope that helps.

--000e0cd32f1ebd9340049ac04455
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Jan 24, 2011 at 10:01 AM, Prathy=
ush <span dir=3D"ltr">&lt;<a href=3D"mailto:prathyush.r@gmail.com">prathyus=
h.r@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex=
; padding-left: 1ex;">
Hi,<br><br>What does vgscan --mknodes command will do. Can i use this for e=
xporting the vgs to another system <br clear=3D"all"><br>-- <i style=3D"fon=
t-family: garamond,serif;"><b><span style=3D"color: rgb(153, 153, 0);"></sp=
an></b></i></blockquote>
<div><br><br><br>From the vgscan(8) man page:<br><br><dl compact><dt><i>--m=
knodes</i>
</dt><dd>Also checks the LVM special files in /dev that are needed for
active logical volumes and creates any missing ones and removes unused
ones</dd></dl><br>The years I have been working with lvm I have never had t=
o use this command.=A0 Typically as long as I mark the volume group as acti=
ve on the node that I want the vgscan to be usable=A0 vgchange -a y ${volum=
e_group} takes care of presenting the device files where on the node it was=
 activated on.<br>
<br><br>Hope that helps.<br>=A0</div></div>

--000e0cd32f1ebd9340049ac04455--
