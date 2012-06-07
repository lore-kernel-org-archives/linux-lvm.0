Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q572TSMS015400
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2012 22:29:28 -0400
Received: from mail-gg0-f174.google.com (mail-gg0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q572TR1u009924
	for <linux-lvm@redhat.com>; Wed, 6 Jun 2012 22:29:27 -0400
Received: by gglu4 with SMTP id u4so98619ggl.33
	for <linux-lvm@redhat.com>; Wed, 06 Jun 2012 19:29:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7616@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5016A2B3C7612@XCH11.scidom.de>
	<CAJrH5Gv2JZDhD7XX-bnv9zGO5J4ThR4FVFhMg5Kqysy553yn-w@mail.gmail.com>
	<15785B7E063D464C86DD482FCAE4EBA5016A2B3C7616@XCH11.scidom.de>
Date: Thu, 7 Jun 2012 04:29:26 +0200
Message-ID: <CAJrH5GtUHRpCNwWbMTmQseqL+mAtjZRcTtn0MKoGGtgz0NSzXw@mail.gmail.com>
From: Seb <mailing.sr@gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba6147e2115fd004c1d8a756
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

--90e6ba6147e2115fd004c1d8a756
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/6/7 Lentes, Bernd <bernd.lentes@helmholtz-muenchen.de>

>
>
> Sebastian wrote:
>
> >       Hello,
> >
> >       with clvm you can have the same VG shared/activated on several
> nodes.
> >       You'll then choose where you want the LVs activated in your
> cluster config.
> >       You can activate some of the LVs on 1 node, and the other LVs on
> another node.
> >
> >       Regards,
> >       --Sebastien
>
> Hi,
>
> thanks for your answer. Can i use one VG for all LV's ? That would be
> easier than providing for every LV a seperate VG.
> Is it better to implement cLVM as a ressource, managed by pacemaker, or
> should i start cLVM using the normal way (Skript in /etc/init.d) ?
>
>
> Bernd
>

Hi,

Yes you can have only 1 VG holding all your LVs.
Let clvmd start normally at boot time, it will take care of the shared VG.
In your cluster config, you'll only manage LV and FS as resources.

--Sebastien


>
>        2012/6/5 Lentes, Bernd <bernd.lentes@helmholtz-muenchen.de>
>
>
> >>              Hi,
> >>
> >>              i'm new to cLVM. I used "normal" LVM several times, and i
> like it.
> >>              I want to establish a two node cluster. As resources i
> have VM's (using KVM). Furthermore i will have a FC SAN.
> >>              I'd like to build PV, then VG and finally LV's on top of
> the SAN. Every VM will reside in one LV.
> >>              Is that ok ?
> >>              My question is now: When i create virtual disks in my SAN=
,
> do i have to create a Virtual Disk (or LUN) on my SAN, then PV, VG and
> finally LV for every VM
> >>              Or can i create ONE Virtual Disk (LUN) in my SAN, on top
> of that create ONE PV and ONE VG and finally for every VM one LV ? This
> would be easier.
> >>
> >>              I'd like to have the VM's distributed between the two
> nodes, as a kind of Load-Balancing.
> >>              Is it possible that the VG is running on both nodes
> simultaneously, having some LV's (and thereby some VM's) running on node =
1
> and others on node 2 ?
> >>
> >>              Thanks for any answer.
> >>
> >>
> >>              Bernd
>
>
>                --
>                Bernd Lentes
>
>                Systemadministration
>                Institut f=FCr Entwicklungsgenetik
>                HelmholtzZentrum m=FCnchen
>                bernd.lentes@helmholtz-muenchen.de
>                 phone: +49 89 3187 1241 <tel:%2B49%2089%203187%201241>
>                fax:   +49 89 3187 3826 <tel:%2B49%2089%203187%203826>
>                 http://www.helmholtz-muenchen.de/idg
>
>                Wer Visionen hat, soll zum Hausarzt gehen
>                Helmut Schmidt
>
>                Helmholtz Zentrum M=FCnchen
>                Deutsches Forschungszentrum f=FCr Gesundheit und Umwelt (G=
mbH)
>                Ingolst=E4dter Landstr. 1
>                85764 Neuherberg
>                www.helmholtz-muenchen.de
>                Aufsichtsratsvorsitzende: MinDir=B4in B=E4rbel Brumme-Both=
e
>                Gesch=E4ftsf=FChrer: Prof. Dr. G=FCnther Wess und Dr. Niko=
laus
> Blum
>                Registergericht: Amtsgericht M=FCnchen HRB 6466
>                USt-IdNr: DE 129521671
>
>                _______________________________________________
>                linux-lvm mailing list
>                linux-lvm@redhat.com
>                https://www.redhat.com/mailman/listinfo/linux-lvm
>                read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
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

--90e6ba6147e2115fd004c1d8a756
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">2012/6/7 Lentes, Bernd <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bernd.lentes@helmholtz-muenchen.de" target=3D"_blank">bernd.=
lentes@helmholtz-muenchen.de</a>&gt;</span><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<div class=3D"im"><br>
<br>
Sebastian wrote:<br>
<br>
&gt; =A0 =A0 =A0 Hello,<br>
&gt;<br>
&gt; =A0 =A0 =A0 with clvm you can have the same VG shared/activated on sev=
eral nodes.<br>
&gt; =A0 =A0 =A0 You&#39;ll then choose where you want the LVs activated in=
 your cluster config.<br>
&gt; =A0 =A0 =A0 You can activate some of the LVs on 1 node, and the other =
LVs on another node.<br>
&gt;<br>
&gt; =A0 =A0 =A0 Regards,<br>
&gt; =A0 =A0 =A0 --Sebastien<br>
<br>
</div>Hi,<br>
<br>
thanks for your answer. Can i use one VG for all LV&#39;s ? That would be e=
asier than providing for every LV a seperate VG.<br>
Is it better to implement cLVM as a ressource, managed by pacemaker, or sho=
uld i start cLVM using the normal way (Skript in /etc/init.d) ?<br>
<br>
<br>
Bernd<br></blockquote><div><br>Hi,<br><br>Yes you can have only 1 VG holdin=
g all your LVs.<br>Let clvmd start normally at boot time, it will take care=
 of the shared VG.<br>In your cluster config, you&#39;ll only manage LV and=
 FS as resources.<br>
<br>--Sebastien<br>=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div class=3D"im">
<br>
 =A0 =A0 =A0 =A02012/6/5 Lentes, Bernd &lt;<a href=3D"mailto:bernd.lentes@h=
elmholtz-muenchen.de">bernd.lentes@helmholtz-muenchen.de</a>&gt;<br>
<br>
<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0Hi,<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0i&#39;m new to cLVM. I used &quot;norma=
l&quot; LVM several times, and i like it.<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0I want to establish a two node cluster.=
 As resources i have VM&#39;s (using KVM). Furthermore i will have a FC SAN=
.<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0I&#39;d like to build PV, then VG and f=
inally LV&#39;s on top of the SAN. Every VM will reside in one LV.<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0Is that ok ?<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0My question is now: When i create virtu=
al disks in my SAN, do i have to create a Virtual Disk (or LUN) on my SAN, =
then PV, VG and finally LV for every VM<br>
</div><div class=3D"im">&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0Or can i create=
 ONE Virtual Disk (LUN) in my SAN, on top of that create ONE PV and ONE VG =
and finally for every VM one LV ? This would be easier.<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0I&#39;d like to have the VM&#39;s distr=
ibuted between the two nodes, as a kind of Load-Balancing.<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0Is it possible that the VG is running o=
n both nodes simultaneously, having some LV&#39;s (and thereby some VM&#39;=
s) running on node 1 and others on node 2 ?<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanks for any answer.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0Bernd<br>
<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Bernd Lentes<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Systemadministration<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Institut f=FCr Entwicklungsgenetik<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HelmholtzZentrum m=FCnchen<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"mailto:bernd.lentes@helmholtz-mu=
enchen.de">bernd.lentes@helmholtz-muenchen.de</a><br>
</div> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0phone: <a href=3D"tel:%2B49%2089%2031=
87%201241" value=3D"+498931871241">+49 89 3187 1241</a> &lt;tel:%2B49%2089%=
203187%201241&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fax: =A0 <a href=3D"tel:%2B49%2089%203187%2=
03826" value=3D"+498931873826">+49 89 3187 3826</a> &lt;tel:%2B49%2089%2031=
87%203826&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5"> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a =
href=3D"http://www.helmholtz-muenchen.de/idg" target=3D"_blank">http://www.=
helmholtz-muenchen.de/idg</a><br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Wer Visionen hat, soll zum Hausarzt gehen<b=
r>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Helmut Schmidt<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Helmholtz Zentrum M=FCnchen<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Deutsches Forschungszentrum f=FCr Gesundhei=
t und Umwelt (GmbH)<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Ingolst=E4dter Landstr. 1<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A085764 Neuherberg<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://www.helmholtz-muenchen.de=
" target=3D"_blank">www.helmholtz-muenchen.de</a><br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Aufsichtsratsvorsitzende: MinDir=B4in B=E4r=
bel Brumme-Bothe<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Gesch=E4ftsf=FChrer: Prof. Dr. G=FCnther We=
ss und Dr. Nikolaus Blum<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Registergericht: Amtsgericht M=FCnchen HRB =
6466<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0USt-IdNr: DE 129521671<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0___________________________________________=
____<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux-lvm mailing list<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"mailto:linux-lvm@redhat.com">lin=
ux-lvm@redhat.com</a><br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"https://www.redhat.com/mailman/l=
istinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/mailman/listinf=
o/linux-lvm</a><br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0read the LVM HOW-TO at <a href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/=
</a><br>
<br>
<br>
<br>
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
</div></div></blockquote></div><br>

--90e6ba6147e2115fd004c1d8a756--
