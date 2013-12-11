Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBB9NSbs028048
	for <linux-lvm@redhat.com>; Wed, 11 Dec 2013 04:23:28 -0500
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBB9NRd1021715
	for <linux-lvm@redhat.com>; Wed, 11 Dec 2013 04:23:27 -0500
Received: by mail-ie0-f179.google.com with SMTP id x13so10589451ief.38
	for <linux-lvm@redhat.com>; Wed, 11 Dec 2013 01:23:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFrGbuWboS=2RoheSc7w0zLTnhvOQwq7N8UTfOe8TruLOFWecg@mail.gmail.com>
References: <CAAKRE70EMS2i43Em_LiX3P7zJ7hR1KW5pL4Jxvjk9VSdLvnr=A@mail.gmail.com>
	<52A722FF.5090903@redhat.com>
	<CAFrGbuWboS=2RoheSc7w0zLTnhvOQwq7N8UTfOe8TruLOFWecg@mail.gmail.com>
Date: Wed, 11 Dec 2013 14:23:26 +0500
Message-ID: <CAAKRE72wL9-v3_j84XMBRfceqCb5B3hGWUfkwL5jPFENC6_bWQ@mail.gmail.com>
From: Umar Draz <unix.co@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec5186fce0eb06e04ed3ec8ca
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

--bcaec5186fce0eb06e04ed3ec8ca
Content-Type: text/plain; charset=ISO-8859-1

Hi Alex,

Thanks for this. :)

Br.

Umar


On Tue, Dec 10, 2013 at 7:33 PM, Alessandro MACUZ <
alessandro.macuz@gmail.com> wrote:

> 2013/12/10 Peter Rajnoha <prajnoha@redhat.com>
>
>> On 12/09/2013 04:13 PM, Umar Draz wrote:
>> > Hi All
>> >
>> > I have a SCSI share which i am  using linux initiator on my ubuntu. Its
>> > available for me in /dev/sdb
>> >
>> > No I have created lvm group using the /dev/sdb. Today I just logut and
>> > login my scsi share but this time ubutnu gave me this as /dev/sdc
>> > instead of /dev/sdb.
>> >
>> > due to this my lvm group is stuck, and its giving me the error
>> >
>> > Input/output error
>> >
>> > on pvdisplay or vgdisplay,
>> >
>> > Any body help me how I can reslove this issue.?
>> >
>>
>> You should always deactivate your LVM volumes before
>> disconnecting the underlying iSCSI volumes and then when
>> you reconnect the iSCSI back, activate the LVM volumes
>> (or if autoactivation is used - meaning use_lvmetad=1
>> is set in lvm.conf, this activation happens automatically).
>>
>> Alternatively, you can call vgchange --refresh when the
>> iSCSI is connected back.
>
>
>
> Couldn't be used the identification of PV by UUID here? It should be
> better imo.
>
> Alex
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Umar Draz
Network Architect

--bcaec5186fce0eb06e04ed3ec8ca
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>Thanks for this. :)</div><div>=
<br></div><div>Br.</div><div><br></div><div>Umar</div></div><div class=3D"g=
mail_extra"><br><br><div class=3D"gmail_quote">On Tue, Dec 10, 2013 at 7:33=
 PM, Alessandro MACUZ <span dir=3D"ltr">&lt;<a href=3D"mailto:alessandro.ma=
cuz@gmail.com" target=3D"_blank">alessandro.macuz@gmail.com</a>&gt;</span> =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>2013/12/10 Peter Rajno=
ha <span dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com" target=3D"_=
blank">prajnoha@redhat.com</a>&gt;</span><br>
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
">
<div><div>On 12/09/2013 04:13 PM, Umar Draz wrote:<br>
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
<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
<br clear=3D"all"><div><br></div>-- <br>Umar Draz<br>Network Architect
</div>

--bcaec5186fce0eb06e04ed3ec8ca--
