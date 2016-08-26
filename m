Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7Q6ZANT023223
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 02:35:10 -0400
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5105C8E740
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 06:35:09 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l203so98483683oib.1
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 23:35:09 -0700 (PDT)
MIME-Version: 1.0
From: su liu <liusu8788@gmail.com>
Date: Fri, 26 Aug 2016 14:35:08 +0800
Message-ID: <CAN2gjWS4F4JOqJ-7D=EJ4+wucvciXLjha50T62Le5WQejtANLQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113dc22a364df1053af3b755
Subject: Re: [linux-lvm] lvm2 cluster aware
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
To: Digimer <lists@alteeve.ca>
Cc: linux-lvm <linux-lvm@redhat.com>

--001a113dc22a364df1053af3b755
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks your replay. I will join the Clusterlabs users list.

2016-08-26 13:04 GMT+08:00 Digimer <lists@alteeve.ca>:

> On 25/08/16 11:59 AM, David Teigland wrote:
> > On Thu, Aug 25, 2016 at 09:50:24AM +0800, su liu wrote:
> >> I have a question about lvm2 cluster, The scene is that I try to imita=
te
> >> FCSAN by mapping a rbd volume to two compute node, Then I using the rb=
d
> >> volume to  create a PV and VG.I stoped the lvmetad daemon on the compu=
te
> >> nodes. Then I find that when I operating the VG on one compute node, t=
he
> >> changes can also be aware on another compute nodes.
> >>
> >> But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html=
=EF=BC=89
> says
> >> that "*LVM is not cluster aware".*
> >>
> >> My question is that can I use the method to achieve the case that I
> create
> >> or delete lv on one node whlie other compute node can using the lvs?
> >>
> >> Can anybody explain this?
> >
> > It's not safe to use lvm on shared storage without some extra mechanism
> to
> > protect the data or coordinate access among hosts.  There are multiple
> > ways, depending on what sort of sharing/coordination you want to use:
> >
> > - use system ID to protect VGs from other hosts,
> >   http://man7.org/linux/man-pages/man7/lvmsystemid.7.html
> >
> > - use lvmlockd to coordinate sharing with sanlock or dlm (this is new),
> >   http://man7.org/linux/man-pages/man8/lvmlockd.8.html
> >
> > - use clvm to coordinate sharing with dlm (this is old)
> >   http://man7.org/linux/man-pages/man8/clvmd.8.html
>
> It's not at all old. Or rather, it's not "old" in the sense that it's
> not used or developed anymore. It's still an active part of the HA
> cluster tool kit. DLM was just broken out to be stand-alone when
> corosync went v2 as part of the merger of the old cman/rgmanager to
> pacemaker migration.
>
> --
> Digimer
> Papers and Projects: https://alteeve.ca/w/
> What if the cure for cancer is trapped in the mind of a person without
> access to education?
>

--001a113dc22a364df1053af3b755
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks your replay. I will join the=C2=A0<span style=3D"co=
lor:rgb(0,0,0)">Clusterlabs users list.</span><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">2016-08-26 13:04 GMT+08:00 Digimer <span dir=
=3D"ltr">&lt;<a href=3D"mailto:lists@alteeve.ca" target=3D"_blank">lists@al=
teeve.ca</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div class=3D""><div class=3D"h5">On 25/08/16 11:59 AM, David Teigland w=
rote:<br>
&gt; On Thu, Aug 25, 2016 at 09:50:24AM +0800, su liu wrote:<br>
&gt;&gt; I have a question about lvm2 cluster, The scene is that I try to i=
mitate<br>
&gt;&gt; FCSAN by mapping a rbd volume to two compute node, Then I using th=
e rbd<br>
&gt;&gt; volume to=C2=A0 create a PV and VG.I stoped the lvmetad daemon on =
the compute<br>
&gt;&gt; nodes. Then I find that when I operating the VG on one compute nod=
e, the<br>
&gt;&gt; changes can also be aware on another compute nodes.<br>
&gt;&gt;<br>
&gt;&gt; But this docment(<a href=3D"http://www.tldp.org/HOWTO/LVM-HOWTO/sh=
aringlvm1.html" rel=3D"noreferrer" target=3D"_blank">http://www.tldp.org/<w=
br>HOWTO/LVM-HOWTO/sharinglvm1.<wbr>html</a>=EF=BC=89 says<br>
&gt;&gt; that &quot;*LVM is not cluster aware&quot;.*<br>
&gt;&gt;<br>
&gt;&gt; My question is that can I use the method to achieve the case that =
I create<br>
&gt;&gt; or delete lv on one node whlie other compute node can using the lv=
s?<br>
&gt;&gt;<br>
&gt;&gt; Can anybody explain this?<br>
&gt;<br>
&gt; It&#39;s not safe to use lvm on shared storage without some extra mech=
anism to<br>
&gt; protect the data or coordinate access among hosts.=C2=A0 There are mul=
tiple<br>
&gt; ways, depending on what sort of sharing/coordination you want to use:<=
br>
&gt;<br>
&gt; - use system ID to protect VGs from other hosts,<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://man7.org/linux/man-pages/man7/lvmsystemi=
d.7.html" rel=3D"noreferrer" target=3D"_blank">http://man7.org/linux/man-<w=
br>pages/man7/lvmsystemid.7.html</a><br>
&gt;<br>
&gt; - use lvmlockd to coordinate sharing with sanlock or dlm (this is new)=
,<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://man7.org/linux/man-pages/man8/lvmlockd.8=
.html" rel=3D"noreferrer" target=3D"_blank">http://man7.org/linux/man-<wbr>=
pages/man8/lvmlockd.8.html</a><br>
&gt;<br>
&gt; - use clvm to coordinate sharing with dlm (this is old)<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://man7.org/linux/man-pages/man8/clvmd.8.ht=
ml" rel=3D"noreferrer" target=3D"_blank">http://man7.org/linux/man-<wbr>pag=
es/man8/clvmd.8.html</a><br>
<br>
</div></div>It&#39;s not at all old. Or rather, it&#39;s not &quot;old&quot=
; in the sense that it&#39;s<br>
not used or developed anymore. It&#39;s still an active part of the HA<br>
cluster tool kit. DLM was just broken out to be stand-alone when<br>
corosync went v2 as part of the merger of the old cman/rgmanager to<br>
pacemaker migration.<br>
<div class=3D""><div class=3D"h5"><br>
--<br>
Digimer<br>
Papers and Projects: <a href=3D"https://alteeve.ca/w/" rel=3D"noreferrer" t=
arget=3D"_blank">https://alteeve.ca/w/</a><br>
What if the cure for cancer is trapped in the mind of a person without<br>
access to education?<br>
</div></div></blockquote></div><br></div></div>

--001a113dc22a364df1053af3b755--
