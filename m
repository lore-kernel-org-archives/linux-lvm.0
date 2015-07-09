Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t69BX0wJ028806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 9 Jul 2015 07:33:00 -0400
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mx1.redhat.com (Postfix) with ESMTPS id BB85733B34D
	for <linux-lvm@redhat.com>; Thu,  9 Jul 2015 11:32:59 +0000 (UTC)
Received: by vnbg129 with SMTP id g129so34408414vnb.3
	for <linux-lvm@redhat.com>; Thu, 09 Jul 2015 04:32:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150708123115.GA21941@app.citecs>
References: <20150707171904.GA24344@app.citecs>
	<20150708123115.GA21941@app.citecs>
Date: Thu, 9 Jul 2015 14:32:57 +0300
Message-ID: <CADxRZqxAFvwqy6yf1re8Ffft2kanEu9ZrsgWjQuEtXKsK6Xrww@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b5d5d32fb4c50051a6f9df2
Subject: Re: [linux-lvm] [solved] resize2fs results in "permission denied"
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
To: chris <lvm-contact@citecs.de>, LVM general discussion and development <linux-lvm@redhat.com>

--047d7b5d5d32fb4c50051a6f9df2
Content-Type: text/plain; charset=UTF-8

I wonder, no one should mess directly with /dev/mapper ! Better would be to
fill a bug report (reproducible/consistent), if it's not fixed in recent
lvm releases.

Thanks.

On Wed, Jul 8, 2015 at 3:31 PM, chris <lvm-contact@citecs.de> wrote:

> /dev/mapper contains device nodes, e.g.:
>     brw-rw---- 1 root disk 254, 73 Apr 11 23:15 vg_phoesrv2b-lvsnap
>
> those should be symlinks ( except for/dev/mapper/control ):
>     vg_phoesrv2b-lvsnap -> ../dm-31
>
> solution:
>     rm /dev/mapper/vg_phoesrv2b-lvsnap
>     udevadm trigger
>  <http://tldp.org/HOWTO/LVM-HOWTO/>
>

--047d7b5d5d32fb4c50051a6f9df2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wonder, no one should mess directly with /dev/mapper ! B=
etter would be to fill a bug report (reproducible/consistent), if it&#39;s =
not fixed in recent lvm releases. <br><br>Thanks.<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Wed, Jul 8, 2015 at 3:31 PM, chris <=
span dir=3D"ltr">&lt;<a href=3D"mailto:lvm-contact@citecs.de" target=3D"_bl=
ank">lvm-contact@citecs.de</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">/dev/mapper contains device nodes, e.g.:<br>
=C2=A0 =C2=A0 brw-rw---- 1 root disk 254, 73 Apr 11 23:15 vg_phoesrv2b-lvsn=
ap<br>
<br>
those should be symlinks ( except for/dev/mapper/control ):<br>
=C2=A0 =C2=A0 vg_phoesrv2b-lvsnap -&gt; ../dm-31<br>
<br>
solution:<br>
=C2=A0 =C2=A0 rm /dev/mapper/vg_phoesrv2b-lvsnap<br>
=C2=A0 =C2=A0 udevadm trigger<br>
<div class=3D""><div class=3D"h5"><a href=3D"http://tldp.org/HOWTO/LVM-HOWT=
O/" rel=3D"noreferrer" target=3D"_blank"></a><br>
</div></div></blockquote></div><br></div></div>

--047d7b5d5d32fb4c50051a6f9df2--
