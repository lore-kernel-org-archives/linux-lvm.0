Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8EHGDOK005982
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 13:16:13 -0400
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8EHGC4q016188
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 13:16:12 -0400
Received: by qyk7 with SMTP id 7so1934661qyk.12
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2011 10:16:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E6FAC6C.9010207@gmail.com>
References: <4E6FAC6C.9010207@gmail.com>
From: Carlos Eduardo Tavares Terra <eduardo.terra@gmail.com>
Date: Wed, 14 Sep 2011 14:15:52 -0300
Message-ID: <CAEcYNt7duxpoeRTTA=+atmrNNcrcgMmX3h4JmRf++WMSJmxz1g@mail.gmail.com>
Content-Type: multipart/alternative; boundary=20cf300fb049b7084104ace9ea1c
Subject: Re: [linux-lvm] RHEL: special ownership for lv devices?
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

--20cf300fb049b7084104ace9ea1c
Content-Type: text/plain; charset=ISO-8859-1

Klaus,
Have you tried to use the package oracleasm?

This package installs some binaries to manipulate ASM Disks, creating new
devices (based on the originals /dev/sd*), into /dev/oracleasm/ and changing
the owner of the devices.

Oracle Database does not use raw devices in RHEL anymore, by default. They
recommend installing this package and administrate everything by it.

http://www.oracle.com/technetwork/topics/linux/asmlib/index-101839.html

I hope this helps.

Regards,

On Tue, Sep 13, 2011 at 4:18 PM, Klaus Lichtenwalder <
lichtenwalder@gmail.com> wrote:

> Hi,
>
> I just can't find any pointers. Problem is, our database guys want to
> use Oracle ASM (which is some kind of raw devices). To not mix things up
> between regular volumes and ASM devices, we decided to put them into a
> special vg (yes, oracle recommends against it, but you somehow has to
> administer the machines. And looking into their shell scripts, it seems
> to not being a thing of reason but more the lack of know how of handling
> arbitrary block devices).
> Anyway, we'd like the devices to end up with owner oracle:dba. There
> seems to be no way, as udev does not create the devices but vgchange, to
> change the ownership than by using a start script somewhere between
> vgchange time and oracle asm start up.
>
> Is there any other, more "canonical" way?
>
> Klaus
> --
> ------------------------------------------------------------------------
>  Klaus Lichtenwalder, Dipl. Inform.,  http://www.lichtenwalder.name
>  PGP Key fingerprint: BF52 72FA 1F5A 1E29 C0F8  498C C4C6 633C 2821 97DA
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Carlos Eduardo Tavares Terra
Red Hat Certified Engineer
Consultor em Infraestrutura de TI
GNU/Linux #413291 [http://counter.li.org]

--20cf300fb049b7084104ace9ea1c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Klaus,<br>Have you tried to use the package oracleasm?<br><br>This package =
installs some binaries to manipulate ASM Disks, creating new devices (based=
 on the originals /dev/sd*), into /dev/oracleasm/ and changing the owner of=
 the devices.<br>

<br>Oracle Database does not use raw devices in RHEL anymore, by default. T=
hey recommend installing this package and administrate everything by it.<br=
><br><a href=3D"http://www.oracle.com/technetwork/topics/linux/asmlib/index=
-101839.html">http://www.oracle.com/technetwork/topics/linux/asmlib/index-1=
01839.html</a><br>

<br>I hope this helps.<br><br>Regards,<br><br><div class=3D"gmail_quote">On=
 Tue, Sep 13, 2011 at 4:18 PM, Klaus Lichtenwalder <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:lichtenwalder@gmail.com">lichtenwalder@gmail.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Hi,<br>
<br>
I just can&#39;t find any pointers. Problem is, our database guys want to<b=
r>
use Oracle ASM (which is some kind of raw devices). To not mix things up<br=
>
between regular volumes and ASM devices, we decided to put them into a<br>
special vg (yes, oracle recommends against it, but you somehow has to<br>
administer the machines. And looking into their shell scripts, it seems<br>
to not being a thing of reason but more the lack of know how of handling<br=
>
arbitrary block devices).<br>
Anyway, we&#39;d like the devices to end up with owner oracle:dba. There<br=
>
seems to be no way, as udev does not create the devices but vgchange, to<br=
>
change the ownership than by using a start script somewhere between<br>
vgchange time and oracle asm start up.<br>
<br>
Is there any other, more &quot;canonical&quot; way?<br>
<br>
Klaus<br>
<font color=3D"#888888">--<br>
------------------------------------------------------------------------<br=
>
=A0Klaus Lichtenwalder, Dipl. Inform., =A0<a href=3D"http://www.lichtenwald=
er.name" target=3D"_blank">http://www.lichtenwalder.name</a><br>
=A0PGP Key fingerprint: BF52 72FA 1F5A 1E29 C0F8 =A0498C C4C6 633C 2821 97D=
A<br>
<br>
</font><br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
<br clear=3D"all"><br>-- <br>Carlos Eduardo Tavares Terra<br>Red Hat Certif=
ied Engineer<br>

Consultor em Infraestrutura de TI<br>GNU/Linux #413291 [<a href=3D"http://c=
ounter.li.org" target=3D"_blank">http://counter.li.org</a>]<br>

--20cf300fb049b7084104ace9ea1c--
