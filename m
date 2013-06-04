Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r54AxJwm022959
	for <linux-lvm@redhat.com>; Tue, 4 Jun 2013 06:59:19 -0400
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54AxI7s000706
	for <linux-lvm@redhat.com>; Tue, 4 Jun 2013 06:59:18 -0400
Received: by mail-ob0-f180.google.com with SMTP id eh20so82147obb.39
	for <linux-lvm@redhat.com>; Tue, 04 Jun 2013 03:59:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEp_DRC=xOm-yWLGR27PnsuLPTTXcPMnKLSmk+iS1VLDG0hKtw@mail.gmail.com>
References: <CAEp_DRC=xOm-yWLGR27PnsuLPTTXcPMnKLSmk+iS1VLDG0hKtw@mail.gmail.com>
Date: Tue, 4 Jun 2013 22:59:17 +1200
Message-ID: <CAEHxbC3-j2kB5NuuYgxiWtH9cDqTCs8NXmTO-wccnj+4RotTKQ@mail.gmail.com>
From: Greg Zapp <greg.zapp@gmail.com>
Content-Type: multipart/alternative; boundary=001a113319d0fc4ed104de51f850
Subject: Re: [linux-lvm] Mounted,
	but idle LVM volume causes constant disk writes
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

--001a113319d0fc4ed104de51f850
Content-Type: text/plain; charset=ISO-8859-1

This is just a general stab, but has the filesystem been fully initialized
on those?  The default for ext4 is to do a lazy initialization of the
filesystem and journal when you create it.  Depending on the size of the
file system this can last for some time.  To prevent this use:
mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0

-Greg


On Tue, Jun 4, 2013 at 5:46 PM, Bostjan Skufca <bostjan@a2o.si> wrote:

> Hello,
>
> If LVM2 volume is mounted (ext4 fs), why is there constant write activity
> to the devices below (sw raid in this case) despite not using the mounted
> volume at all?
>
> I am seing this on multiple hosts. On this particular one I am seeing
> around 20 writes per second on average, but they occur in batches of around
> 50-90 writeIOps on every 3-4 seconds. If I mount the same filesystem (ext4)
> on sw raid1 without LVM in between, I see the expected 0 write IOps when
> not using the filesystem.
>
> Kernel versions where I noticed this: 3.0.13 (sysrescd) 3.4.1, 3.9.4
> (custom compiled). I noticed it on all systems where lvm is in use.
>
> Thank you for the hints,
> b.
>
>
> PS: I did search the web first, but I could not find the answer. Sorry if
> this has been answered before, maybe I was searching for the wrong terms.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a113319d0fc4ed104de51f850
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is just a general stab, but has the filesystem b=
een fully initialized on those?=A0 The default for ext4 is to do a lazy ini=
tialization of the filesystem and journal when you create it.=A0 Depending =
on the size of the file system this can last for some time.=A0 To prevent t=
his use:<br>
<span class=3D""></span>mkfs.ext4 <span class=3D"">-E</span> <span class=3D=
"">lazy_itable_init</span>=3D<span class=3D"">0</span>,<span class=3D"">laz=
y_journal_init</span>=3D<span class=3D"">0<br><br></span></div><span class=
=3D"">-Greg<br>
</span></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">=
On Tue, Jun 4, 2013 at 5:46 PM, Bostjan Skufca <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:bostjan@a2o.si" target=3D"_blank">bostjan@a2o.si</a>&gt;</span>=
 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello,<div><br></div><div>I=
f LVM2 volume is mounted (ext4 fs), why is there constant write activity to=
 the devices below (sw raid in this case) despite not using the mounted vol=
ume at all?<br>
</div><div>
<br></div><div>I am seing this on multiple hosts. On this particular one I =
am seeing around 20 writes per second on average, but they occur in batches=
 of around 50-90 writeIOps on every 3-4 seconds. If I mount the same filesy=
stem (ext4) on sw raid1 without LVM in between, I see the expected 0 write =
IOps when not using the filesystem.</div>

<div><br></div><div>Kernel versions where I noticed this: 3.0.13 (sysrescd)=
 3.4.1, 3.9.4 (custom compiled). I noticed it on all systems where lvm is i=
n use.</div><div><br></div><div>Thank you for the hints,</div>
<div>b.</div><div><br></div><div><br></div><div>PS: I did search the web fi=
rst, but I could not find the answer. Sorry if this has been answered befor=
e, maybe I was searching for the wrong terms.</div>
<div><br></div></div>
<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
</div>

--001a113319d0fc4ed104de51f850--
