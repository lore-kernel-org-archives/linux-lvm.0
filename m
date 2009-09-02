Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n82DRDiE021250
	for <linux-lvm@redhat.com>; Wed, 2 Sep 2009 09:27:13 -0400
Received: from mail-ew0-f211.google.com (mail-ew0-f211.google.com
	[209.85.219.211])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n82DQsYf004853
	for <linux-lvm@redhat.com>; Wed, 2 Sep 2009 09:26:54 -0400
Received: by ewy7 with SMTP id 7so736839ewy.7
	for <linux-lvm@redhat.com>; Wed, 02 Sep 2009 06:26:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1251848067.9444.8.camel@chandra-ubuntu>
References: <f3177b9e0909011627kfc0b7c1t2a1ab35d217b522e@mail.gmail.com>
	<1251848067.9444.8.camel@chandra-ubuntu>
Date: Wed, 2 Sep 2009 15:26:52 +0200
Message-ID: <29ae894c0909020626g738c5530l19ac0453df868682@mail.gmail.com>
Subject: Re: [linux-lvm] Does LVM have any multipath failover capabilities?
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6de04c453f85a0472983848
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
To: sekharan@linux.vnet.ibm.com, LVM general discussion and development <linux-lvm@redhat.com>

--0016e6de04c453f85a0472983848
Content-Type: text/plain; charset=ISO-8859-1

Or you could simply use dm-multipath in round-robin fashion without having
to manage priorities etc...

This would bring you :

      - More performance if the device at the other side can take the load
      - Native failover, if on path dies you'll still have the second path
active.

On LVM point of view, you just have to pvcreate the mutilpath device
(/dev/mapper/mpathX if friendly_user_name true or /dev/mapper/<your disk
UUID>)

Brem


2009/9/2, Chandra Seetharaman <sekharan@us.ibm.com>:
>
>
> On Tue, 2009-09-01 at 17:27 -0600, Chris Worley wrote:
> > For example, two iSCSI drives are actually the same drive provided via
> > two different subnets: if one of the drives becomes unresponsive, I
> > need LVM to seamlessly failover to the other one.
> >
> > Otherwise, what's the right way to handle this?
>
> Build lvm on top of a multipathed device (which comprises of the two
> paths), with a priority callout that gives higher priority to one path
> than the other.
> >
> > Thanks,
> >
> > Chris
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

--0016e6de04c453f85a0472983848
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Or you could simply use dm-multipath in round-robin fashion without ha=
ving to manage priorities etc...</div>
<div>=A0</div>
<div>This would bring you :</div>
<div>=A0</div>
<div>=A0=A0=A0=A0=A0 - More performance if the device at the other=A0side c=
an take=A0the load</div>
<div>=A0=A0=A0=A0=A0 - Native failover, if on path dies you&#39;ll still ha=
ve the second path active.</div>
<div>=A0</div>
<div>On LVM point of view, you just have to pvcreate the mutilpath device=
=A0 (/dev/mapper/mpathX if friendly_user_name true or /dev/mapper/&lt;your =
disk UUID&gt;)</div>
<div>=A0</div>
<div>Brem<br><br>=A0</div>
<div><span class=3D"gmail_quote">2009/9/2, Chandra Seetharaman &lt;<a href=
=3D"mailto:sekharan@us.ibm.com">sekharan@us.ibm.com</a>&gt;:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>On Tue, 2009-09-01 at 17:27 =
-0600, Chris Worley wrote:<br>&gt; For example, two iSCSI drives are actual=
ly the same drive provided via<br>
&gt; two different subnets: if one of the drives becomes unresponsive, I<br=
>&gt; need LVM to seamlessly failover to the other one.<br>&gt;<br>&gt; Oth=
erwise, what&#39;s the right way to handle this?<br><br>Build lvm on top of=
 a multipathed device (which comprises of the two<br>
paths), with a priority callout that gives higher priority to one path<br>t=
han the other.<br>&gt;<br>&gt; Thanks,<br>&gt;<br>&gt; Chris<br>&gt;<br>&gt=
; _______________________________________________<br>&gt; linux-lvm mailing=
 list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>&g=
t; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://ww=
w.redhat.com/mailman/listinfo/linux-lvm</a><br>&gt; read the LVM HOW-TO at =
<a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWT=
O/</a><br>
<br>_______________________________________________<br>linux-lvm mailing li=
st<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><=
a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.re=
dhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://=
tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--0016e6de04c453f85a0472983848--
