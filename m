Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0SFNEw2008670
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 10:23:14 -0500
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0SFNBSf019403
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 10:23:12 -0500
Received: by mail-lb0-f182.google.com with SMTP id w7so456165lbi.41
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 07:23:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52E7A3CC.9000406@um.es>
References: <52E7A3CC.9000406@um.es>
From: Fran Garcia <franchu.garcia@gmail.com>
Date: Tue, 28 Jan 2014 16:22:50 +0100
Message-ID: <CAD+pdNdm+02V3UZfbHfaM1h+DB7gd7Yg0E1hg2eZH2-_HGTpmA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3505cf07b6404f1096668
Subject: Re: [linux-lvm] Mounting a read only disk
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

--001a11c3505cf07b6404f1096668
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hola Angel,

you need to present your snapshot as a RW LUN ; otherwise you won't be able
to activate the VG.

As you should be writing your metadata to the snapshot the original data
will remain unharmed.

Cheers

Fran



On Tue, Jan 28, 2014 at 1:34 PM, Angel L. Mateo <amateo@um.es> wrote:

> Hello guys,
>
>     I'm having a problem I don't know how to solve.
>
>     I have a running system with its disk under LVM2. Physical disks are
> in a SAN and we have no problems with them. Now we have configured an
> automated snapshots of our disks from our SAN to another one (both are HP
> 3par) and we want now the snapshot to be mounted in another system. This
> system has connected the snapshot disk without any problem but we can't
> mount the FS, because we can't activate volumes in it. The "only"
> difference between original disks and snaptshot ones are that this are se=
en
> by the OS as read only disks, so they can't be written.
>
>     In the system trying to mount the snapshot I could see PVs, VGs and
> LVs, as:
>
> amateo_adm@myotis52fa:~$ sudo pvs
>   PV         VG          Fmt  Attr PSize    PFree
>   /dev/sda5  Disk1       lvm2 a-      6.76g      0
>   /dev/sdb   IndexesDisk lvm2 a-     69.98g  20.00g
>   /dev/sdc   UsersDisk   lvm2 a-      2.50t      0
>   /dev/sdd   UsersDisk   lvm2 a-   1023.98g 499.97g
> amateo_adm@myotis52fa:~$ sudo vgs
>   VG          #PV #LV #SN Attr   VSize  VFree
>   Disk1         1   2   0 wz--n-  6.76g      0
>   IndexesDisk   1   1   0 wz--n- 69.98g  20.00g
>   UsersDisk     2   1   0 wz--n-  3.50t 499.97g
> amateo_adm@myotis52fa:~$ sudo lvs
>   LV          VG          Attr   LSize   Origin Snap%  Move Log Copy%
>  Convert
>   root        Disk1       -wi-ao 5.82g
>   swap_1      Disk1       -wi-ao 956.00m
>   vol_indexes IndexesDisk -wi-d- 49.98g
>   vol_users   UsersDisk   -wi-d- 3.01t
>
>     but I can't activate LVs:
>
> amateo_adm@myotis52fa:~$ sudo lvchange -a y UsersDisk/vol_users
>   device-mapper: reload ioctl failed: Invalid argument
>
>     and in the logs I get:
>
> Jan 28 13:32:41 myotis52fa kernel: [ 1789.845945] device-mapper: table:
> 252:0: linear: dm-linear: Device lookup failed
> Jan 28 13:32:41 myotis52fa kernel: [ 1789.846047] device-mapper: ioctl:
> error adding target to table
>
>     the original system and the one trying to mount the snapshot are both
> ubuntu 12.04 with same kernel (3.4.0-030400-generic) and version of lvm2
> (2.02.66-4ubuntu7.4, the packaged by ubuntu).
>
>     Any help?
>
> --
> Angel L. Mateo Mart=C3=ADnez
> Secci=C3=B3n de Telem=C3=A1tica
> =C3=81rea de Tecnolog=C3=ADas de la Informaci=C3=B3n
> y las Comunicaciones Aplicadas (ATICA)
> http://www.um.es/atica
> Tfo: 868887590
> Fax: 868888337
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a11c3505cf07b6404f1096668
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>hola Angel,<br><br>you need to present your snap=
shot as a RW LUN ; otherwise you won&#39;t be able to activate the VG.<br><=
br></div>As you should be writing your metadata to the snapshot the origina=
l data will remain unharmed.<br>

<br></div>Cheers<br><br>Fran<br><br><div><div><div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Tue, Jan 28, 2014 at 1:34 PM, Ange=
l L. Mateo <span dir=3D"ltr">&lt;<a href=3D"mailto:amateo@um.es" target=3D"=
_blank">amateo@um.es</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello guys,<br>
<br>
=C2=A0 =C2=A0 I&#39;m having a problem I don&#39;t know how to solve.<br>
<br>
=C2=A0 =C2=A0 I have a running system with its disk under LVM2. Physical di=
sks are in a SAN and we have no problems with them. Now we have configured =
an automated snapshots of our disks from our SAN to another one (both are H=
P 3par) and we want now the snapshot to be mounted in another system. This =
system has connected the snapshot disk without any problem but we can&#39;t=
 mount the FS, because we can&#39;t activate volumes in it. The &quot;only&=
quot; difference between original disks and snaptshot ones are that this ar=
e seen by the OS as read only disks, so they can&#39;t be written.<br>


<br>
=C2=A0 =C2=A0 In the system trying to mount the snapshot I could see PVs, V=
Gs and LVs, as:<br>
<br>
amateo_adm@myotis52fa:~$ sudo pvs<br>
=C2=A0 PV =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Fmt =C2=A0Attr PSize =C2=A0 =C2=A0PFree<br>
=C2=A0 /dev/sda5 =C2=A0Disk1 =C2=A0 =C2=A0 =C2=A0 lvm2 a- =C2=A0 =C2=A0 =C2=
=A06.76g =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0 /dev/sdb =C2=A0 IndexesDisk lvm2 a- =C2=A0 =C2=A0 69.98g =C2=A020.00=
g<br>
=C2=A0 /dev/sdc =C2=A0 UsersDisk =C2=A0 lvm2 a- =C2=A0 =C2=A0 =C2=A02.50t =
=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0 /dev/sdd =C2=A0 UsersDisk =C2=A0 lvm2 a- =C2=A0 1023.98g 499.97g<br>
amateo_adm@myotis52fa:~$ sudo vgs<br>
=C2=A0 VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#PV #LV #SN Attr =C2=A0 VSize =
=C2=A0VFree<br>
=C2=A0 Disk1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =C2=A0 2 =C2=A0 0 wz--n- =C2=A06=
.76g =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0 IndexesDisk =C2=A0 1 =C2=A0 1 =C2=A0 0 wz--n- 69.98g =C2=A020.00g<br=
>
=C2=A0 UsersDisk =C2=A0 =C2=A0 2 =C2=A0 1 =C2=A0 0 wz--n- =C2=A03.50t 499.9=
7g<br>
amateo_adm@myotis52fa:~$ sudo lvs<br>
=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Attr =C2=A0 LSize =C2=A0 Origin Snap% =C2=A0Move Log Copy% =C2=A0Conv=
ert<br>
=C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0Disk1 =C2=A0 =C2=A0 =C2=A0 -wi-ao 5.=
82g<br>
=C2=A0 swap_1 =C2=A0 =C2=A0 =C2=A0Disk1 =C2=A0 =C2=A0 =C2=A0 -wi-ao 956.00m=
<br>
=C2=A0 vol_indexes IndexesDisk -wi-d- 49.98g<br>
=C2=A0 vol_users =C2=A0 UsersDisk =C2=A0 -wi-d- 3.01t<br>
<br>
=C2=A0 =C2=A0 but I can&#39;t activate LVs:<br>
<br>
amateo_adm@myotis52fa:~$ sudo lvchange -a y UsersDisk/vol_users<br>
=C2=A0 device-mapper: reload ioctl failed: Invalid argument<br>
<br>
=C2=A0 =C2=A0 and in the logs I get:<br>
<br>
Jan 28 13:32:41 myotis52fa kernel: [ 1789.845945] device-mapper: table: 252=
:0: linear: dm-linear: Device lookup failed<br>
Jan 28 13:32:41 myotis52fa kernel: [ 1789.846047] device-mapper: ioctl: err=
or adding target to table<br>
<br>
=C2=A0 =C2=A0 the original system and the one trying to mount the snapshot =
are both ubuntu 12.04 with same kernel (3.4.0-030400-generic) and version o=
f lvm2 (2.02.66-4ubuntu7.4, the packaged by ubuntu).<br>
<br>
=C2=A0 =C2=A0 Any help?<br>
<br>
-- <br>
Angel L. Mateo Mart=C3=ADnez <br>
Secci=C3=B3n de Telem=C3=A1tica<br>
=C3=81rea de Tecnolog=C3=ADas de la Informaci=C3=B3n<br>
y las Comunicaciones Aplicadas (ATICA)<br>
<a href=3D"http://www.um.es/atica" target=3D"_blank">http://www.um.es/atica=
</a><br>
Tfo: 868887590<br>
Fax: 868888337<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div><br></div></div></div></div></div>

--001a11c3505cf07b6404f1096668--
