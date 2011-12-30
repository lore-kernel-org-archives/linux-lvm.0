Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBU8KMRT027046
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2011 03:20:22 -0500
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBU8KL9n011853
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2011 03:20:21 -0500
Received: by ghbg21 with SMTP id g21so2704206ghb.33
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2011 00:20:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8a9cc4935a6213d287ddbb04ccd4a51b.squirrel@ssl.verfeiert.org>
References: <CABYYHWFYi0hzVc6Z8BYVYwhZmyFAFroMTi7aQetc72doQw08cw@mail.gmail.com>
	<8a9cc4935a6213d287ddbb04ccd4a51b.squirrel@ssl.verfeiert.org>
Date: Fri, 30 Dec 2011 09:20:18 +0100
Message-ID: <CABYYHWGYuN_K5nus6XP5AAxmtb=cMx8UrY-HXw=fWA3Ec+qMSg@mail.gmail.com>
From: peter.bieshaar@gmail.com
Content-Type: multipart/alternative; boundary=20cf303b3a5b42124804b54ae7b0
Subject: Re: [linux-lvm] How to find out the location of PE's
Reply-To: peter@bieshaar.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: sven@whgl.uni-frankfurt.de, LVM general discussion and development <linux-lvm@redhat.com>

--20cf303b3a5b42124804b54ae7b0
Content-Type: text/plain; charset=ISO-8859-1

Sven,

thanks for this information. I will investigate the MetaData, on the second
sector, as you mentioned. Now I also can more easily search the code (using
the LVM2 and LABELONE strings). I tried but, it's a lot

Peter

2011/12/29 Sven Eschenberg <sven@whgl.uni-frankfurt.de>

> Assuming you used standard config when creating the LVM, you'll find PV
> metadata at the very beginning of the disk (an probably nowhere else).
>
> There is no such thing like per PE markers, all information is stored in
> the LVM header. Usually though there should be files in /etc holding the
> information of the PVs/VGs/LVs as backup - assuming the rest of the disk
> layout is still valid (i.e. PV on partition -> partition still exists)
>
> The LVM Metadata is in the second sector (usually) and you should see
> something like the string LVM2 and LABELONE (for LVM 2 metadata)
>
> I don't know of any detailed on disk format description (except the source
> probably).
>
> Regards
>
> -Sven
>
>
> On Wed, December 28, 2011 11:03, peter.bieshaar@gmail.com wrote:
> > Due to a hardware mistake (dvd and hdu as IDE-master ??) I lost complete
> > disk- and therefor lvm administration on SATA disks.
> > - In other words I cannot see the partition- or PV/VG and LV
> > administration.
> > - So, fdisk or (pv|vg|lv)display can't give information.
> >
> > lvm was initiated under ubuntu 11.04 or 10.10, a recent lvm2 version was
> > installed.
> >
> > On one disk I tried to create a partition (without creating a filesystem
> > of-course :) ) but no pv-information was shown, using pvdisplay. I didn't
> > dare to do this on my RAID1 (md) disks.
> > I can read the disks with strings and dd, and saw content of scripts and
> > documents. So the content/data is still on the disks.
> >
> > My chosen strategy to recover the LV's, is finding the PE's, pickthem
> > up and place them in a blob on another filesystem. So I can mount -o loop
> > that blob and restructure the disks.
> >
> > My problem now is how to find these information. The web gives a lot of
> > information how to setup, but almost none on technical issues like this.
> >
> > Can someone give me a hint on how this (the PE's) technically is being
> > organized (pointer -> pointer structures??) and where and how to search
> > these on the disk. So I can write a C-thingy to accomplish my strategy.
> If
> > someone already has something like this, or examples,
> >
> > --
> > Regards,
> >
> > Peter Bieshaar
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Regards/Met vriendelijke groet,

Peter Bieshaar
------------------------------------------
"FATAL ERROR" in large friendly letters

--20cf303b3a5b42124804b54ae7b0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Sven,</div>
<div>=A0</div>
<div>thanks for this information. I will investigate the MetaData, on the s=
econd sector, as=A0you mentioned. Now I also can more easily search the cod=
e (using the LVM2 and LABELONE strings). I tried but, it&#39;s a lot</div>

<div>=A0</div>
<div>Peter</div>
<div>=A0</div>
<div>2011/12/29 Sven Eschenberg <span dir=3D"ltr">&lt;<a href=3D"mailto:sve=
n@whgl.uni-frankfurt.de">sven@whgl.uni-frankfurt.de</a>&gt;</span><br></div=
>
<div class=3D"gmail_quote">
<blockquote style=3D"BORDER-LEFT:#ccc 1px solid;MARGIN:0px 0px 0px 0.8ex;PA=
DDING-LEFT:1ex" class=3D"gmail_quote">Assuming you used standard config whe=
n creating the LVM, you&#39;ll find PV<br>metadata at the very beginning of=
 the disk (an probably nowhere else).<br>
<br>There is no such thing like per PE markers, all information is stored i=
n<br>the LVM header. Usually though there should be files in /etc holding t=
he<br>information of the PVs/VGs/LVs as backup - assuming the rest of the d=
isk<br>
layout is still valid (i.e. PV on partition -&gt; partition still exists)<b=
r><br>The LVM Metadata is in the second sector (usually) and you should see=
<br>something like the string LVM2 and LABELONE (for LVM 2 metadata)<br>
<br>I don&#39;t know of any detailed on disk format description (except the=
 source<br>probably).<br><br>Regards<br><br>-Sven<br>
<div>
<div></div>
<div class=3D"h5"><br><br>On Wed, December 28, 2011 11:03, <a href=3D"mailt=
o:peter.bieshaar@gmail.com">peter.bieshaar@gmail.com</a> wrote:<br>&gt; Due=
 to a hardware mistake (dvd and hdu as IDE-master ??) I lost complete<br>&g=
t; disk- and therefor lvm administration on SATA disks.<br>
&gt; - In other words I cannot see the partition- or PV/VG and LV<br>&gt; a=
dministration.<br>&gt; - So, fdisk or (pv|vg|lv)display can&#39;t give info=
rmation.<br>&gt;<br>&gt; lvm was initiated under ubuntu 11.04 or 10.10, a r=
ecent lvm2 version was<br>
&gt; installed.<br>&gt;<br>&gt; On one disk I tried to create a partition (=
without creating a filesystem<br>&gt; of-course :) ) but no pv-information =
was shown, using pvdisplay. I didn&#39;t<br>&gt; dare to do this on my RAID=
1 (md) disks.<br>
&gt; I can read the disks with strings and dd, and saw content of scripts a=
nd<br>&gt; documents. So the content/data is still on the disks.<br>&gt;<br=
>&gt; My chosen strategy to recover the LV&#39;s, is finding the PE&#39;s, =
pickthem<br>
&gt; up and place them in a blob on another filesystem. So I can mount -o l=
oop<br>&gt; that blob and restructure the disks.<br>&gt;<br>&gt; My problem=
 now is how to find these information. The web gives a lot of<br>&gt; infor=
mation how to setup, but almost none on technical issues like this.<br>
&gt;<br>&gt; Can someone give me a hint on how this (the PE&#39;s) technica=
lly is being<br>&gt; organized (pointer -&gt; pointer structures??) and whe=
re and how to search<br>&gt; these on the disk. So I can write a C-thingy t=
o accomplish my strategy. If<br>
&gt; someone already has something like this, or examples,<br>&gt;<br>&gt; =
--<br>&gt; Regards,<br>&gt;<br>&gt; Peter Bieshaar<br></div></div>&gt; ____=
___________________________________________<br>&gt; linux-lvm mailing list<=
br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>&g=
t; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"=
_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>&gt; read =
the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_b=
lank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br><br>_______________________________________________<br>linux-lvm mailin=
g list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><=
br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"=
_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
<br clear=3D"all"><br>-- <br>
<div>Regards/Met vriendelijke groet,<br><br>Peter Bieshaar</div>
<div>------------------------------------------</div>
<div>&quot;FATAL ERROR&quot; in large friendly letters</div><br>

--20cf303b3a5b42124804b54ae7b0--
