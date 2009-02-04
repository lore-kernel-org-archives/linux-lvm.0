Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n14FGwlq026095
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 10:16:58 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.172])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n14FEiZ2031950
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 10:14:44 -0500
Received: by wf-out-1314.google.com with SMTP id 25so2627982wfc.6
	for <linux-lvm@redhat.com>; Wed, 04 Feb 2009 07:14:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a5543b500902040533n5ccc396eyc3e0e02aaa3b30c5@mail.gmail.com>
References: <a5543b500902030451o160e8318u13e08c236f0ebec7@mail.gmail.com>
	<a5543b500902040533n5ccc396eyc3e0e02aaa3b30c5@mail.gmail.com>
Date: Wed, 4 Feb 2009 07:14:43 -0800
Message-ID: <1c748a490902040714l650f46a3wecc2a8d268456506@mail.gmail.com>
Subject: Re: [linux-lvm] Doubts on Snapshots
From: Larry Dickson <ldickson@cuttedge.com>
Content-Type: multipart/alternative; boundary=00163646d97f5838b80462193fbb
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

--00163646d97f5838b80462193fbb
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This is a misunderstanding of what snapshot does. To minimize copying, it
makes a special volume containing the OLD versions of only those sectors
CHANGED since the snap was made. Thus, when mated with the original,
continually-being-updated volume, it can reconstruct its state at the time
of the snap. Without the original, it cannot do much.

I think what you want is mirroring or rsync.

Larry Dickson
Cutting Edge Networked Storage

On 2/4/09, Rahul Baheti <rahulbaheti86@gmail.com> wrote:
>
>
>
>
> I have connected a pen drive and make a logical volume from it. then i take
> a snapshot of this logical volume and the snapshot logical volume lies in
> hard disk. After that i plugged out the pen drive. Without pen drive being
> plugged into the system can i recover the data of pen drive using the
> snapshot volume.
>
>
> Waiting for reply
>
> Thanks and Regards
>
> Rahul Baheti
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--00163646d97f5838b80462193fbb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>This is a misunderstanding of what snapshot does. To minimize copying,=
 it makes a special volume containing the OLD versions of only those sector=
s CHANGED since the snap was made. Thus, when mated with the original, cont=
inually-being-updated volume, it can reconstruct its state at the time of t=
he snap. Without the original, it cannot do much.</div>

<div>&nbsp;</div>
<div>I think what you want is mirroring or rsync.</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class=3D"gmail_quote">On 2/4/09, <b class=3D"gmail_sendername">R=
ahul Baheti</b> &lt;<a href=3D"mailto:rahulbaheti86@gmail.com">rahulbaheti8=
6@gmail.com</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>
<div class=3D"gmail_quote"><br><br>I have connected a pen drive and make a =
logical volume from it. then i take a snapshot of this logical volume and t=
he snapshot logical volume lies in hard disk. After that i plugged out the =
pen drive. Without pen drive being plugged into the system can i recover th=
e data of pen drive using the snapshot volume. <br>
<br><br>Waiting for reply<br><br>Thanks and Regards<br><font color=3D"#8888=
88"><br>Rahul Baheti<br><br></font></div><br><br>__________________________=
_____________________<br>linux-lvm mailing list<br><a onclick=3D"return top=
.js.OpenExtLink(window,event,this)" href=3D"mailto:linux-lvm@redhat.com">li=
nux-lvm@redhat.com</a><br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https:/=
/www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org=
/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><b=
r>
</blockquote></div><br>

--00163646d97f5838b80462193fbb--
