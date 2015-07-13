Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6D7qj42013873
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2015 03:52:45 -0400
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (Postfix) with ESMTPS id CA47A4F639
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2015 07:52:43 +0000 (UTC)
Received: by lahh5 with SMTP id h5so11529268lah.2
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2015 00:52:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK9_OPrqjkfNhxtRUT8V6nuqxfB0jrLtRmipB0Q8LpNbxguAuw@mail.gmail.com>
References: <CAK9_OPrqjkfNhxtRUT8V6nuqxfB0jrLtRmipB0Q8LpNbxguAuw@mail.gmail.com>
Date: Mon, 13 Jul 2015 03:52:42 -0400
Message-ID: <CAHEKYV7xw_pK2rLFF8idTfPzgg5dok=oROdGYK3ZFmUiA47_Pw@mail.gmail.com>
From: Mauricio Tavares <raubvogel@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c383bca519b7051abd016d
Subject: Re: [linux-lvm] what is free space in LVM
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

--001a11c383bca519b7051abd016d
Content-Type: text/plain; charset=UTF-8

On Jul 13, 2015 9:24 AM, "Angelo Moreschini" <mrangelo.fedora@gmail.com>
wrote:
>
> Hi,
>
> I am new to LVM and I would like to have an exact answer to the question :
>
> what is the criteria that allows to distinguishes the "free space" on the
all the space in a Volume Group?
>
> or (if you prefer)...
>
> how the command pvscan does  to obtain information about the free space
in LVM ?
>
      This may sound like a naive reply but I always thought free space in
a VG is space not allocated to its LVs.

> ------------
> According to my current knowledge, I know that the definition of "free
space" concerns with with the set of blocks for which, in the FAT, is not
registered a significant link to access a file.
>
> But I think that in the context of LVM there should be a different
criterion to define the "free space" inside a Volume Group.
> ----------
>
> Thank you
>
> Regards
>
> Angelo
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--001a11c383bca519b7051abd016d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 13, 2015 9:24 AM, &quot;Angelo Moreschini&quot; &lt;<a href=3D"mailt=
o:mrangelo.fedora@gmail.com">mrangelo.fedora@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am new to LVM and I would like to have an exact answer to the questi=
on :<br>
&gt;<br>
&gt; what is the criteria that allows to distinguishes the &quot;free space=
&quot; on the all the space in a Volume Group?<br>
&gt;<br>
&gt; or (if you prefer)...<br>
&gt;<br>
&gt; how the command pvscan does=C2=A0 to obtain information about the free=
 space in LVM ?<br>
&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This may sound like a naive reply but I alwa=
ys thought free space in a VG is space not allocated to its LVs.</p>
<p dir=3D"ltr">&gt; ------------<br>
&gt; According to my current knowledge, I know that the definition of &quot=
;free space&quot; concerns with with the set of blocks for which, in the FA=
T, is not=C2=A0 registered a significant link to access a file.<br>
&gt;<br>
&gt; But I think that in the context of LVM there should be a different cri=
terion to define the &quot;free space&quot; inside a Volume Group.<br>
&gt; ----------<br>
&gt;<br>
&gt; Thank you<br>
&gt;<br>
&gt; Regards<br>
&gt;<br>
&gt; Angelo<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://=
www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">ht=
tp://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</p>

--001a11c383bca519b7051abd016d--
