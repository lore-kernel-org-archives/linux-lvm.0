Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBAEXPkt029109
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2013 09:33:25 -0500
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBAEXNF9007314
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2013 09:33:24 -0500
Received: by mail-vc0-f180.google.com with SMTP id if17so4668173vcb.11
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2013 06:33:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52A722FF.5090903@redhat.com>
References: <CAAKRE70EMS2i43Em_LiX3P7zJ7hR1KW5pL4Jxvjk9VSdLvnr=A@mail.gmail.com>
	<52A722FF.5090903@redhat.com>
Date: Tue, 10 Dec 2013 15:33:23 +0100
Message-ID: <CAFrGbuWboS=2RoheSc7w0zLTnhvOQwq7N8UTfOe8TruLOFWecg@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=20cf30776473a8ecff04ed2efef0
Subject: Re: [linux-lvm] dev node change
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

--20cf30776473a8ecff04ed2efef0
Content-Type: text/plain; charset=ISO-8859-1

2013/12/10 Peter Rajnoha <prajnoha@redhat.com>

> On 12/09/2013 04:13 PM, Umar Draz wrote:
> > Hi All
> >
> > I have a SCSI share which i am  using linux initiator on my ubuntu. Its
> > available for me in /dev/sdb
> >
> > No I have created lvm group using the /dev/sdb. Today I just logut and
> > login my scsi share but this time ubutnu gave me this as /dev/sdc
> > instead of /dev/sdb.
> >
> > due to this my lvm group is stuck, and its giving me the error
> >
> > Input/output error
> >
> > on pvdisplay or vgdisplay,
> >
> > Any body help me how I can reslove this issue.?
> >
>
> You should always deactivate your LVM volumes before
> disconnecting the underlying iSCSI volumes and then when
> you reconnect the iSCSI back, activate the LVM volumes
> (or if autoactivation is used - meaning use_lvmetad=1
> is set in lvm.conf, this activation happens automatically).
>
> Alternatively, you can call vgchange --refresh when the
> iSCSI is connected back.



Couldn't be used the identification of PV by UUID here? It should be better
imo.

Alex

--20cf30776473a8ecff04ed2efef0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>2013/12/10 Peter Rajnoha <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:prajnoha@redhat.com" target=3D"_blank">prajnoha@redhat.com</a>&=
gt;</span><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex">
<div class=3D""><div class=3D"h5">On 12/09/2013 04:13 PM, Umar Draz wrote:<=
br>
&gt; Hi All<br>
&gt;<br>
&gt; I have a SCSI share which i am =A0using linux initiator on my ubuntu. =
Its<br>
&gt; available for me in /dev/sdb<br>
&gt;<br>
&gt; No I have created lvm group using the /dev/sdb. Today I just logut and=
<br>
&gt; login my scsi share but this time ubutnu gave me this as /dev/sdc<br>
&gt; instead of /dev/sdb.<br>
&gt;<br>
&gt; due to this my lvm group is stuck, and its giving me the error<br>
&gt;<br>
&gt; Input/output error<br>
&gt;<br>
&gt; on pvdisplay or vgdisplay,<br>
&gt;<br>
&gt; Any body help me how I can reslove this issue.?<br>
&gt;<br>
<br>
</div></div>You should always deactivate your LVM volumes before<br>
disconnecting the underlying iSCSI volumes and then when<br>
you reconnect the iSCSI back, activate the LVM volumes<br>
(or if autoactivation is used - meaning use_lvmetad=3D1<br>
is set in lvm.conf, this activation happens automatically).<br>
<br>
Alternatively, you can call vgchange --refresh when the<br>
iSCSI is connected back.</blockquote><div><br></div><div><br></div>Couldn&#=
39;t be used the identification of PV by UUID here? It should be better imo=
.<div><br></div><div>Alex</div></div></div></div>

--20cf30776473a8ecff04ed2efef0--
