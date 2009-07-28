Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6SDpHHt005819
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 09:51:17 -0400
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.27])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6SDotAK025103
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 09:50:55 -0400
Received: by ey-out-2122.google.com with SMTP id 9so11410eyd.39
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 06:50:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52F0ADF3-B499-4EE4-BDA1-B8DED2C9BD42@karlsbakk.net>
References: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
	<20090727135628.GA3782@us.ibm.com>
	<52F0ADF3-B499-4EE4-BDA1-B8DED2C9BD42@karlsbakk.net>
Date: Tue, 28 Jul 2009 15:50:54 +0200
Message-ID: <29ae894c0907280650h4dc525bbn4a808366ae8935cb@mail.gmail.com>
Subject: Re: [linux-lvm] Mirroring implementation
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016e64be264063df0046fc45c1a
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

--0016e64be264063df0046fc45c1a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Roy,

I would be better indeed, but practically, even if it is supposed to reques=
t
both disks (san arrays) in //, the closest array  will almost always be the
first to answer unless it is overloaded.

What I'm looking for is the behaviour for writes, as I don't want to deal
with failure scenarios in which I could find outdated data on my last
remaining mirror leg.




2009/7/28, Roy Sigurd Karlsbakk <roy@karlsbakk.net>:
>
> On 27. juli. 2009, at 15.56, malahal@us.ibm.com wrote:
>
> It writes in parallel. Reads from a single device (switches on a device
>> failure only).
>>
>
>
> Wouldn't it be better to read in parallel, from different places? I've
> heard some controllers can do this, so that the reading will be somehow l=
ike
> reading from a RAID-0 stripe.
>
> roy
> --
> Roy Sigurd Karlsbakk
> (+47) 97542685
> roy@karlsbakk.net
> http://blogg.karlsbakk.net/
> --
> I all pedagogikk er det essensielt at pensum presenteres intelligibelt. D=
et
> er et element=E6rt imperativ for alle pedagoger =E5 unng=E5 eksessiv anve=
ndelse av
> idiomer med fremmed opprinnelse. I de fleste tilfeller eksisterer adekvat=
e
> og relevante synonymer p=E5 norsk.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e64be264063df0046fc45c1a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Roy,</div>
<div>=A0</div>
<div>I would be better indeed, but practically, even if it is supposed to r=
equest both disks (san arrays) in //, the closest array=A0 will almost alwa=
ys be the first to answer unless it is overloaded.</div>
<div>=A0</div>
<div>What=A0I&#39;m looking for is the behaviour=A0for writes, as I don&#39=
;t want=A0to deal with failure scenarios in which I could find outdated dat=
a on=A0my last remaining mirror leg.</div>
<div>=A0</div>
<div>=A0<br><br>=A0</div>
<div><span class=3D"gmail_quote">2009/7/28, Roy Sigurd Karlsbakk &lt;<a hre=
f=3D"mailto:roy@karlsbakk.net">roy@karlsbakk.net</a>&gt;:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class=3D"q">On 27. juli. 2=
009, at 15.56, <a onclick=3D"return top.js.OpenExtLink(window,event,this)" =
href=3D"mailto:malahal@us.ibm.com" target=3D"_blank">malahal@us.ibm.com</a>=
 wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">It writes in parallel. Reads fro=
m a single device (switches on a device<br>failure only).<br></blockquote>
<br><br></span>Wouldn&#39;t it be better to read in parallel, from differen=
t places? I&#39;ve heard some controllers can do this, so that the reading =
will be somehow like reading from a RAID-0 stripe.<br><br>roy<br>--<br>
Roy Sigurd Karlsbakk<br>(+47) 97542685<br><a onclick=3D"return top.js.OpenE=
xtLink(window,event,this)" href=3D"mailto:roy@karlsbakk.net" target=3D"_bla=
nk">roy@karlsbakk.net</a><br><a onclick=3D"return top.js.OpenExtLink(window=
,event,this)" href=3D"http://blogg.karlsbakk.net/" target=3D"_blank">http:/=
/blogg.karlsbakk.net/</a><br>
<span class=3D"sg">--<br>I all pedagogikk er det essensielt at pensum prese=
nteres intelligibelt. Det er et element=E6rt imperativ for alle pedagoger =
=E5 unng=E5 eksessiv anvendelse av idiomer med fremmed opprinnelse. I de fl=
este tilfeller eksisterer adekvate og relevante synonymer p=E5 norsk.</span=
>=20
<div><span class=3D"e" id=3D"q_122c15e813d1d959_3"><br><br><br>____________=
___________________________________<br>linux-lvm mailing list<br><a onclick=
=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-lvm@=
redhat.com" target=3D"_blank">linux-lvm@redhat.com</a><br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https:/=
/www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org=
/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><b=
r>
</span></div></blockquote></div><br>

--0016e64be264063df0046fc45c1a--
