Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6V5Ah43021872
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 01:10:43 -0400
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6V5Aecf005040
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 01:10:41 -0400
Received: by lahd3 with SMTP id d3so4213899lah.33
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 22:10:40 -0700 (PDT)
MIME-Version: 1.0
Sender: fvzwieten@gmail.com
In-Reply-To: <5016F258.9060206@profihost.ag>
References: <5016DD33.3050000@profihost.ag>
	<alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
	<5016F258.9060206@profihost.ag>
Date: Tue, 31 Jul 2012 07:10:40 +0200
Message-ID: <CALVifsbTjYzyAs1x10Y-cFq4qqssVwqXZV_dYUfvmeb1uE5kxQ@mail.gmail.com>
From: Fred van Zwieten <fvzwieten@vxcompany.com>
Content-Type: multipart/alternative; boundary=f46d04016a9f131ec604c61933d9
Subject: Re: [linux-lvm] how to online resize pv?
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

--f46d04016a9f131ec604c61933d9
Content-Type: text/plain; charset=UTF-8

Try this<http://epsilon.eridani.nl/2012/06/11/hot-resize-lvm2-lv-in-vmware-linux-gues/>

Fred


On Mon, Jul 30, 2012 at 10:45 PM, Stefan Priebe <s.priebe@profihost.ag>wrote:

> Am 30.07.2012 22:25, schrieb Stuart D Gathman:
> > On Jul 30, Stefan Priebe transmitted in part:
> >
> >> Number  Start   End     Size    File system  Name       Flags
> >> 1      1049kB  2097kB  1049kB               GRUB_BOOT  bios_grub
> >> 2      2097kB  32,2GB  32,2GB               Linux LVM  lvm
> >>
> >> If i delete 2 and recreate it starting at the same sector i can't
> >> reread the part. table.
> >>
> >> Is there a way todo online resizing?
> >
> > Only when no partition is open.  That is one reason why LVM is an
> > improvement over partition tables.  You don't have to use a partition
> > table, just use the entire device as a PV.
>
> that was my idea too but grub2 then refuses to install onto /dev/vda. It
> says it cannot find a filesystem on hd0 which is /dev/vda.
>
> Stefan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--f46d04016a9f131ec604c61933d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Try <a href=3D"http://epsilon.eridani.nl/2012/06/11/hot-resize-lvm2-lv-in-v=
mware-linux-gues/">this</a><br clear=3D"all"><br>Fred<br>
<br><br><div class=3D"gmail_quote">On Mon, Jul 30, 2012 at 10:45 PM, Stefan=
 Priebe <span dir=3D"ltr">&lt;<a href=3D"mailto:s.priebe@profihost.ag" targ=
et=3D"_blank">s.priebe@profihost.ag</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
Am 30.07.2012 22:25, schrieb Stuart D Gathman:<br>
<div class=3D"im">&gt; On Jul 30, Stefan Priebe transmitted in part:<br>
&gt;<br>
&gt;&gt; Number =C2=A0Start =C2=A0 End =C2=A0 =C2=A0 Size =C2=A0 =C2=A0File=
 system =C2=A0Name =C2=A0 =C2=A0 =C2=A0 Flags<br>
&gt;&gt; 1 =C2=A0 =C2=A0 =C2=A01049kB =C2=A02097kB =C2=A01049kB =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GRUB_BOOT =C2=A0bios_grub<br>
&gt;&gt; 2 =C2=A0 =C2=A0 =C2=A02097kB =C2=A032,2GB =C2=A032,2GB =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linux LVM =C2=A0lvm<br>
&gt;&gt;<br>
&gt;&gt; If i delete 2 and recreate it starting at the same sector i can&#3=
9;t<br>
&gt;&gt; reread the part. table.<br>
&gt;&gt;<br>
&gt;&gt; Is there a way todo online resizing?<br>
&gt;<br>
&gt; Only when no partition is open. =C2=A0That is one reason why LVM is an=
<br>
&gt; improvement over partition tables. =C2=A0You don&#39;t have to use a p=
artition<br>
&gt; table, just use the entire device as a PV.<br>
<br>
</div>that was my idea too but grub2 then refuses to install onto /dev/vda.=
 It<br>
says it cannot find a filesystem on hd0 which is /dev/vda.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Stefan<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--f46d04016a9f131ec604c61933d9--
