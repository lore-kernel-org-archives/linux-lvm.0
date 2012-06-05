Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q55DdpAF003764
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2012 09:39:51 -0400
Received: from mail-gg0-f174.google.com (mail-gg0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q55DdOId024172
	for <linux-lvm@redhat.com>; Tue, 5 Jun 2012 09:39:50 -0400
Received: by mail-gg0-f174.google.com with SMTP id u4so4585121ggl.33
	for <linux-lvm@redhat.com>; Tue, 05 Jun 2012 06:39:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7612@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7612@XCH11.scidom.de>
Date: Tue, 5 Jun 2012 15:39:49 +0200
Message-ID: <CAJrH5Gv2JZDhD7XX-bnv9zGO5J4ThR4FVFhMg5Kqysy553yn-w@mail.gmail.com>
From: Seb <mailing.sr@gmail.com>
Content-Type: multipart/alternative; boundary=e89a8f2357cddd6f8204c1b9c8f6
Subject: Re: [linux-lvm] some principal questions about cLVM
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

--e89a8f2357cddd6f8204c1b9c8f6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

with clvm you can have the same VG shared/activated on several nodes.
You'll then choose where you want the LVs activated in your cluster config.
You can activate some of the LVs on 1 node, and the other LVs on another
node.

Regards,
--Sebastien


2012/6/5 Lentes, Bernd <bernd.lentes@helmholtz-muenchen.de>

> Hi,
>
> i'm new to cLVM. I used "normal" LVM several times, and i like it.
> I want to establish a two node cluster. As resources i have VM's (using
> KVM). Furthermore i will have a FC SAN.
> I'd like to build PV, then VG and finally LV's on top of the SAN. Every V=
M
> will reside in one LV.
> Is that ok ?
> My question is now: When i create virtual disks in my SAN, do i have to
> create a Virtual Disk (or LUN) on my SAN, then PV, VG and finally LV for
> every VM ?
> Or can i create ONE Virtual Disk (LUN) in my SAN, on top of that create
> ONE PV and ONE VG and finally for every VM one LV ? This would be easier.
>
> I'd like to have the VM's distributed between the two nodes, as a kind of
> Load-Balancing.
> Is it possible that the VG is running on both nodes simultaneously, havin=
g
> some LV's (and thereby some VM's) running on node 1 and others on node 2 =
?
>
> Thanks for any answer.
>
>
> Bernd
>
>
> --
> Bernd Lentes
>
> Systemadministration
> Institut f=FCr Entwicklungsgenetik
> HelmholtzZentrum m=FCnchen
> bernd.lentes@helmholtz-muenchen.de
> phone: +49 89 3187 1241
> fax:   +49 89 3187 3826
> http://www.helmholtz-muenchen.de/idg
>
> Wer Visionen hat, soll zum Hausarzt gehen
> Helmut Schmidt
>
> Helmholtz Zentrum M=FCnchen
> Deutsches Forschungszentrum f=FCr Gesundheit und Umwelt (GmbH)
> Ingolst=E4dter Landstr. 1
> 85764 Neuherberg
> www.helmholtz-muenchen.de
> Aufsichtsratsvorsitzende: MinDir=B4in B=E4rbel Brumme-Bothe
> Gesch=E4ftsf=FChrer: Prof. Dr. G=FCnther Wess und Dr. Nikolaus Blum
> Registergericht: Amtsgericht M=FCnchen HRB 6466
> USt-IdNr: DE 129521671
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--e89a8f2357cddd6f8204c1b9c8f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>with clvm you can have the same VG shared/activated on severa=
l nodes.<br>You&#39;ll then choose where you want the LVs activated in your=
 cluster config.<br>You can activate some of the LVs on 1 node, and the oth=
er LVs on another node.<br>
<br>Regards,<br>--Sebastien<br><br><br><div class=3D"gmail_quote">2012/6/5 =
Lentes, Bernd <span dir=3D"ltr">&lt;<a href=3D"mailto:bernd.lentes@helmholt=
z-muenchen.de" target=3D"_blank">bernd.lentes@helmholtz-muenchen.de</a>&gt;=
</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi,<br>
<br>
i&#39;m new to cLVM. I used &quot;normal&quot; LVM several times, and i lik=
e it.<br>
I want to establish a two node cluster. As resources i have VM&#39;s (using=
 KVM). Furthermore i will have a FC SAN.<br>
I&#39;d like to build PV, then VG and finally LV&#39;s on top of the SAN. E=
very VM will reside in one LV.<br>
Is that ok ?<br>
My question is now: When i create virtual disks in my SAN, do i have to cre=
ate a Virtual Disk (or LUN) on my SAN, then PV, VG and finally LV for every=
 VM ?<br>
Or can i create ONE Virtual Disk (LUN) in my SAN, on top of that create ONE=
 PV and ONE VG and finally for every VM one LV ? This would be easier.<br>
<br>
I&#39;d like to have the VM&#39;s distributed between the two nodes, as a k=
ind of Load-Balancing.<br>
Is it possible that the VG is running on both nodes simultaneously, having =
some LV&#39;s (and thereby some VM&#39;s) running on node 1 and others on n=
ode 2 ?<br>
<br>
Thanks for any answer.<br>
<br>
<br>
Bernd<br>
<br>
<br>
--<br>
Bernd Lentes<br>
<br>
Systemadministration<br>
Institut f=FCr Entwicklungsgenetik<br>
HelmholtzZentrum m=FCnchen<br>
<a href=3D"mailto:bernd.lentes@helmholtz-muenchen.de">bernd.lentes@helmholt=
z-muenchen.de</a><br>
phone: <a href=3D"tel:%2B49%2089%203187%201241" value=3D"+498931871241">+49=
 89 3187 1241</a><br>
fax: =A0 <a href=3D"tel:%2B49%2089%203187%203826" value=3D"+498931873826">+=
49 89 3187 3826</a><br>
<a href=3D"http://www.helmholtz-muenchen.de/idg" target=3D"_blank">http://w=
ww.helmholtz-muenchen.de/idg</a><br>
<br>
Wer Visionen hat, soll zum Hausarzt gehen<br>
Helmut Schmidt<br>
<br>
Helmholtz Zentrum M=FCnchen<br>
Deutsches Forschungszentrum f=FCr Gesundheit und Umwelt (GmbH)<br>
Ingolst=E4dter Landstr. 1<br>
85764 Neuherberg<br>
<a href=3D"http://www.helmholtz-muenchen.de" target=3D"_blank">www.helmholt=
z-muenchen.de</a><br>
Aufsichtsratsvorsitzende: MinDir=B4in B=E4rbel Brumme-Bothe<br>
Gesch=E4ftsf=FChrer: Prof. Dr. G=FCnther Wess und Dr. Nikolaus Blum<br>
Registergericht: Amtsgericht M=FCnchen HRB 6466<br>
USt-IdNr: DE 129521671<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--e89a8f2357cddd6f8204c1b9c8f6--
