Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1192A9E5E
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 15:20:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F2A8906392
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 15:20:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id i26so462124ejb.12
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 08:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAJHv+s7m=Ad=mK-QpuSDKVsa8fOyGV4Ex9LnaiDkhsStud35mQ@mail.gmail.com>
	<CAAMCDefd+ugu-Myx0wAfmfRs+1TnTjX-yQSMjLkjtLPNx2tnyw@mail.gmail.com>
In-Reply-To: <CAAMCDefd+ugu-Myx0wAfmfRs+1TnTjX-yQSMjLkjtLPNx2tnyw@mail.gmail.com>
From: KrishnaMurali Chennuboina <krishchennu414@gmail.com>
Date: Mon, 14 Sep 2020 20:49:59 +0530
Message-ID: <CAJHv+s6TmtZFxRTZW1Yo-2gFee4x5XPa1dpFnP_+EMxtr80DAw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000005259105af479243"
Subject: Re: [linux-lvm] Issue after upgrading the LVM2 package from
 2.02.176 to 2.02.180
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

--00000000000005259105af479243
Content-Type: text/plain; charset="UTF-8"

Hi Roger,

I have tried this with the older LVM package(.176) and this issue was not
seen. Issue was seen with .180 version every time.
# executing command: vgchange -ay
(status, output): (0,   WARNING: Failed to connect to lvmetad. Falling back
to device scanning.)
  WARNING: Failed to connect to lvmetad. Falling back to device scanning.
# executing command: pvcreate -ffy /dev/sda3
(status, output): (5,   WARNING: Failed to connect to lvmetad. Falling back
to device scanning.
  Error reading device /dev/sda3 at 0 length 4096.
  Error reading device /dev/ram0 at 0 length 4096.
  Error reading device /dev/loop0 at 0 length 4096.
  Error reading device /dev/sda at 0 length 512.
  Error reading device /dev/sda at 0 length 4096.
  Error reading device /dev/ram1 at 0 length 4096.
  Error reading device /dev/sda1 at 0 length 4096.
  Error reading device /dev/ram2 at 0 length 4096.
  Error reading device /dev/sda2 at 0 length 4096.
  Error reading device /dev/ram3 at 0 length 4096.
  Error reading device /dev/ram4 at 0 length 4096.
  Error reading device /dev/ram5 at 0 length 4096.
  Error reading device /dev/ram6 at 0 length 4096.
  Error reading device /dev/ram7 at 0 length 4096.
  Error reading device /dev/ram8 at 0 length 4096.
  Error reading device /dev/ram9 at 0 length 4096.
  Error reading device /dev/ram10 at 0 length 4096.
  Error reading device /dev/ram11 at 0 length 4096.
  Error reading device /dev/ram12 at 0 length 4096.
  Error reading device /dev/ram13 at 0 length 4096.
  Error reading device /dev/ram14 at 0 length 4096.
  Error reading device /dev/ram15 at 0 length 4096.
  Device /dev/sda3 excluded by a filter.)
Failed to execute command: pvcreate -ffy /dev/sda3
ec=0

I have tried with different options of pvcreate but didnt helped much.
After the system got halted with the above error, i tried to executing pvs
command but got the below error.
bash-4.4# pvs
  Error reading device /dev/ram0 at 0 length 4096.
  Error reading device /dev/loop0 at 0 length 4096.
  Error reading device /dev/sda at 0 length 512.
  Error reading device /dev/sda at 0 length 4096.
  Error reading device /dev/ram1 at 0 length 4096.
  Error reading device /dev/sda1 at 0 length 4096.
  Error reading device /dev/ram2 at 0 length 4096.
  Error reading device /dev/sda2 at 0 length 4096.
  Error reading device /dev/ram3 at 0 length 4096.
  Error reading device /dev/sda3 at 0 length 4096.
  Error reading device /dev/ram4 at 0 length 4096.
  Error reading device /dev/sda4 at 0 length 4096.
  Error reading device /dev/ram5 at 0 length 4096.
  Error reading device /dev/ram6 at 0 length 4096.
  Error reading device /dev/ram7 at 0 length 4096.
  Error reading device /dev/ram8 at 0 length 4096.
  Error reading device /dev/ram9 at 0 length 4096.
  Error reading device /dev/ram10 at 0 length 4096.
  Error reading device /dev/ram11 at 0 length 4096.
  Error reading device /dev/ram12 at 0 length 4096.
  Error reading device /dev/ram13 at 0 length 4096.
  Error reading device /dev/ram14 at 0 length 4096.
  Error reading device /dev/ram15 at 0 length 4096.
  Error reading device /dev/sdb at 0 length 512.
  Error reading device /dev/sdb at 0 length 4096.
  Error reading device /dev/sdb1 at 0 length 4096.
  Error reading device /dev/sdb2 at 0 length 4096.
  Error reading device /dev/sdb3 at 0 length 4096.
  Read-only locking type set. Write locks are prohibited.
  Recovery of standalone physical volumes failed.
  Cannot process standalone physical volumes
bash-4.4#

Attached the complete log in initial mail.

Thanks.

On Mon, 14 Sep 2020 at 20:29, Roger Heflin <rogerheflin@gmail.com> wrote:

> In general I would suggest fully disabling lvmetad from the config
> files and from being started up.
>
> Issues around it not answering (like above) and answering but somehow
> having stale/wrong info have burned me too many times to trust it.  It
> may be a lvmetad bug, or be udevd weirdness.
>
> The only significant improvement it makes is it reduces the lvm
> command time on installs with significant numbers of devices, but
> given that the info has been wrong often enough that is not worth the
> risk.
>
> On Mon, Sep 14, 2020 at 2:25 AM KrishnaMurali Chennuboina
> <krishchennu414@gmail.com> wrote:
> >
> > Hi Team,
> >
> > While trying to analyze one the issue, we felt that upgrading the
> current LVM2 package in our repository will be the best approach.
> > As part of that, we have updated the respective package from  2.02.176
> to 2.02.180. We have verified the same and booted x86_64 hardware without
> any issues.
> >
> > But while trying to boot mips64 hardware we have started observing the
> below issue.  Providing the snippet of the log,
> >
> > # executing command: vgchange -an
> > (status, output): (0,   WARNING: Failed to connect to lvmetad. Falling
> back to device scanning.)
> >   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
> >
> > Attached the detailed log for reference. There is no other change
> included other than the LVM2 update.
> >
> > LVM2 Version: 2.02.176
> > Updated LVM2 version: 2.02.180
> >
> > Please share inputs on why this issue is being observed with .180
> version?
> > Please let me know if i can share any other information.
> >
> > Thanks.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--00000000000005259105af479243
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Roger,<div><br></div><div>I have tried this with the ol=
der LVM package(.176) and this issue was not seen. Issue was seen with .180=
 version every time.</div><div># executing command: vgchange -ay <br>(statu=
s, output): (0, =C2=A0 WARNING: Failed to connect to lvmetad. Falling back =
to device scanning.)<br>=C2=A0 WARNING: Failed to connect to lvmetad. Falli=
ng back to device scanning.<br># executing command: pvcreate -ffy /dev/sda3=
<br>(status, output): (5, =C2=A0 WARNING: Failed to connect to lvmetad. Fal=
ling back to device scanning.<br>=C2=A0 Error reading device /dev/sda3 at 0=
 length 4096.<br>=C2=A0 Error reading device /dev/ram0 at 0 length 4096.<br=
>=C2=A0 Error reading device /dev/loop0 at 0 length 4096.<br>=C2=A0 Error r=
eading device /dev/sda at 0 length 512.<br>=C2=A0 Error reading device /dev=
/sda at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram1 at 0 length=
 4096.<br>=C2=A0 Error reading device /dev/sda1 at 0 length 4096.<br>=C2=A0=
 Error reading device /dev/ram2 at 0 length 4096.<br>=C2=A0 Error reading d=
evice /dev/sda2 at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram3 =
at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram4 at 0 length 4096=
.<br>=C2=A0 Error reading device /dev/ram5 at 0 length 4096.<br>=C2=A0 Erro=
r reading device /dev/ram6 at 0 length 4096.<br>=C2=A0 Error reading device=
 /dev/ram7 at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram8 at 0 =
length 4096.<br>=C2=A0 Error reading device /dev/ram9 at 0 length 4096.<br>=
=C2=A0 Error reading device /dev/ram10 at 0 length 4096.<br>=C2=A0 Error re=
ading device /dev/ram11 at 0 length 4096.<br>=C2=A0 Error reading device /d=
ev/ram12 at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram13 at 0 l=
ength 4096.<br>=C2=A0 Error reading device /dev/ram14 at 0 length 4096.<br>=
=C2=A0 Error reading device /dev/ram15 at 0 length 4096.<br>=C2=A0 Device /=
dev/sda3 excluded by a filter.)<br>Failed to execute command: pvcreate -ffy=
 /dev/sda3<br>ec=3D0<br></div><div><br></div><div>I have tried with differe=
nt options of pvcreate but didnt helped much. After the system got halted w=
ith the above error, i tried to executing pvs command but got the below err=
or.</div><div>bash-4.4# pvs<br>=C2=A0 Error reading device /dev/ram0 at 0 l=
ength 4096.<br>=C2=A0 Error reading device /dev/loop0 at 0 length 4096.<br>=
=C2=A0 Error reading device /dev/sda at 0 length 512.<br>=C2=A0 Error readi=
ng device /dev/sda at 0 length 4096.<br>=C2=A0 Error reading device /dev/ra=
m1 at 0 length 4096.<br>=C2=A0 Error reading device /dev/sda1 at 0 length 4=
096.<br>=C2=A0 Error reading device /dev/ram2 at 0 length 4096.<br>=C2=A0 E=
rror reading device /dev/sda2 at 0 length 4096.<br>=C2=A0 Error reading dev=
ice /dev/ram3 at 0 length 4096.<br>=C2=A0 Error reading device /dev/sda3 at=
 0 length 4096.<br>=C2=A0 Error reading device /dev/ram4 at 0 length 4096.<=
br>=C2=A0 Error reading device /dev/sda4 at 0 length 4096.<br>=C2=A0 Error =
reading device /dev/ram5 at 0 length 4096.<br>=C2=A0 Error reading device /=
dev/ram6 at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram7 at 0 le=
ngth 4096.<br>=C2=A0 Error reading device /dev/ram8 at 0 length 4096.<br>=
=C2=A0 Error reading device /dev/ram9 at 0 length 4096.<br>=C2=A0 Error rea=
ding device /dev/ram10 at 0 length 4096.<br>=C2=A0 Error reading device /de=
v/ram11 at 0 length 4096.<br>=C2=A0 Error reading device /dev/ram12 at 0 le=
ngth 4096.<br>=C2=A0 Error reading device /dev/ram13 at 0 length 4096.<br>=
=C2=A0 Error reading device /dev/ram14 at 0 length 4096.<br>=C2=A0 Error re=
ading device /dev/ram15 at 0 length 4096.<br>=C2=A0 Error reading device /d=
ev/sdb at 0 length 512.<br>=C2=A0 Error reading device /dev/sdb at 0 length=
 4096.<br>=C2=A0 Error reading device /dev/sdb1 at 0 length 4096.<br>=C2=A0=
 Error reading device /dev/sdb2 at 0 length 4096.<br>=C2=A0 Error reading d=
evice /dev/sdb3 at 0 length 4096.<br>=C2=A0 Read-only locking type set. Wri=
te locks are prohibited.<br>=C2=A0 Recovery of standalone physical volumes =
failed.<br>=C2=A0 Cannot process standalone physical volumes<br>bash-4.4#<b=
r></div><div><br></div><div>Attached the complete log in initial mail.</div=
><div><br></div><div>Thanks.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 14 Sep 2020 at 20:29, Roger Hefli=
n &lt;<a href=3D"mailto:rogerheflin@gmail.com">rogerheflin@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In gene=
ral I would suggest fully disabling lvmetad from the config<br>
files and from being started up.<br>
<br>
Issues around it not answering (like above) and answering but somehow<br>
having stale/wrong info have burned me too many times to trust it.=C2=A0 It=
<br>
may be a lvmetad bug, or be udevd weirdness.<br>
<br>
The only significant improvement it makes is it reduces the lvm<br>
command time on installs with significant numbers of devices, but<br>
given that the info has been wrong often enough that is not worth the<br>
risk.<br>
<br>
On Mon, Sep 14, 2020 at 2:25 AM KrishnaMurali Chennuboina<br>
&lt;<a href=3D"mailto:krishchennu414@gmail.com" target=3D"_blank">krishchen=
nu414@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; While trying to analyze one the issue, we felt that upgrading the curr=
ent LVM2 package in our repository will be the best approach.<br>
&gt; As part of that, we have updated the respective package from=C2=A0 2.0=
2.176 to 2.02.180. We have verified the same and booted x86_64 hardware wit=
hout any issues.<br>
&gt;<br>
&gt; But while trying to boot mips64 hardware we have started observing the=
 below issue.=C2=A0 Providing the snippet of the log,<br>
&gt;<br>
&gt; # executing command: vgchange -an<br>
&gt; (status, output): (0,=C2=A0 =C2=A0WARNING: Failed to connect to lvmeta=
d. Falling back to device scanning.)<br>
&gt;=C2=A0 =C2=A0WARNING: Failed to connect to lvmetad. Falling back to dev=
ice scanning.<br>
&gt;<br>
&gt; Attached the detailed log for reference. There is no other change incl=
uded other than the LVM2 update.<br>
&gt;<br>
&gt; LVM2 Version: 2.02.176<br>
&gt; Updated LVM2 version: 2.02.180<br>
&gt;<br>
&gt; Please share inputs on why this issue is being observed with .180 vers=
ion?<br>
&gt; Please let me know if i can share any other information.<br>
&gt;<br>
&gt; Thanks.<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@re=
dhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"n=
oreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-=
lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" re=
l=3D"noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote></div>

--00000000000005259105af479243--
