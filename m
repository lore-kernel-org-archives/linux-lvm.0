Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8ABVMkt028316
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 07:31:22 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8ABVBCi012688
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 07:31:21 -0400
Received: by mail-ey0-f174.google.com with SMTP id c11so811738eaa.33
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2012 04:31:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD+pdNckaWNCyeh+edEewiosxc1OO_NGDVLgv2KO+Y2MjUSwOg@mail.gmail.com>
References: <CAGQjrKa5_w0haG9YYDSxYF9XeFT0V4805bC2aLvnzDwkrr5kUg@mail.gmail.com>
	<CAD+pdNckaWNCyeh+edEewiosxc1OO_NGDVLgv2KO+Y2MjUSwOg@mail.gmail.com>
Date: Mon, 10 Sep 2012 16:59:45 +0530
Message-ID: <CAGQjrKaVE3_3R1mfA1=vHS5RvTKn-t24vjkRsQwODJABB-ABqA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b621e404e760e04c9574633
Subject: Re: [linux-lvm] merge two lvms on same VG
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

--047d7b621e404e760e04c9574633
Content-Type: text/plain; charset=ISO-8859-1

thanks for the reply , but wouldn't that merge LV's from two different
volume groups and for some weird requirement I wanted to merge LV's from
the same VG , say

merge /dev/vg0/data and /dev/vg0/data1 into a  merged volume without any
data loss .

On Mon, Sep 10, 2012 at 4:02 PM, Fran Garcia <franchu.garcia@gmail.com>wrote:

> On Wed, Sep 5, 2012 at 1:16 PM, tariq wali <ganaiwali@gmail.com> wrote:
> > Hi, I had a situation to combine two LVM's on the same VG , other than
> > wiping the existing ones and recreating a new one is there a way to merge
> > the two on same VG ?
>
> vgmerge.  You need to have the source VG with all your LVs inactive
> and the PE size must be the same in both VGs.
>
>
> Basically this would be:
>
> lvchange -a n /dev/vg02/lv01
> lvchange -a n /dev/vg02/lv02
> lvchange -a n /dev/vg02/lv03
> ...
> vgmerge vg01 vg02
> vgchange -ay
>
>
> this would put all the LVs from vg02 into the vg01 VG.
>
> HTH
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
*Tariq Wali.*

--047d7b621e404e760e04c9574633
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thanks for the reply , but wouldn&#39;t that merge LV&#39;=
s from two different volume groups and for some weird requirement I wanted =
to merge LV&#39;s from the same VG , say=A0<div><br></div><div>merge /dev/v=
g0/data and /dev/vg0/data1 into a =A0merged volume without any data loss .<=
br>
<br><div class=3D"gmail_quote">On Mon, Sep 10, 2012 at 4:02 PM, Fran Garcia=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:franchu.garcia@gmail.com" target=
=3D"_blank">franchu.garcia@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Wed, Sep 5, 2012 at 1:16 PM, tar=
iq wali &lt;<a href=3D"mailto:ganaiwali@gmail.com">ganaiwali@gmail.com</a>&=
gt; wrote:<br>
&gt; Hi, I had a situation to combine two LVM&#39;s on the same VG , other =
than<br>
&gt; wiping the existing ones and recreating a new one is there a way to me=
rge<br>
&gt; the two on same VG ?<br>
<br>
</div></div>vgmerge. =A0You need to have the source VG with all your LVs in=
active<br>
and the PE size must be the same in both VGs.<br>
<br>
<br>
Basically this would be:<br>
<br>
lvchange -a n /dev/vg02/lv01<br>
lvchange -a n /dev/vg02/lv02<br>
lvchange -a n /dev/vg02/lv03<br>
...<br>
vgmerge vg01 vg02<br>
vgchange -ay<br>
<br>
<br>
this would put all the LVs from vg02 into the vg01 VG.<br>
<br>
HTH<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wa=
li.</i><span><span style=3D"background-color:rgb(255,255,153)"></span></spa=
n><br>
</div><br>
</div></div>

--047d7b621e404e760e04c9574633--
