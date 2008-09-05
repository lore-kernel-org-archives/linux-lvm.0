Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m85EQs71001913
	for <linux-lvm@redhat.com>; Fri, 5 Sep 2008 10:26:54 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m85EQb1g031862
	for <linux-lvm@redhat.com>; Fri, 5 Sep 2008 10:26:38 -0400
Received: by wa-out-1112.google.com with SMTP id j32so371721waf.7
	for <linux-lvm@redhat.com>; Fri, 05 Sep 2008 07:26:36 -0700 (PDT)
Message-ID: <ab53550809050726t1c65d14cwe7bd92d0cbaffb9@mail.gmail.com>
Date: Fri, 5 Sep 2008 10:26:35 -0400
From: "Bernard Fay" <bernard.fay@gmail.com>
Subject: Re: [linux-lvm] swap tagged as lvm2
In-Reply-To: <48C13BCB.9090109@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_43800_26661189.1220624795788"
References: <ab53550809050655scab46a9lbea2abbe6c400681@mail.gmail.com>
	<48C13BCB.9090109@redhat.com>
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

------=_Part_43800_26661189.1220624795788
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Right on target Bryn.  Your solution fixed it.

Thanks a lot,
Bernard


On 9/5/08, Bryn M. Reeves <breeves@redhat.com> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Bernard Fay wrote:
> > Hi,
> >
> > We have installed RHEL 4.7 on a single disk (actually two disk in
> hardware
> > RAID).  Part of it use regular partions and others LVM2 logical
> volumes.  To my
> > surprise, when running pvs or pvscan, the swap partition is shown has
> LVM2:
> >
> > # pvscan
> >   PV /dev/sda5   VG vgsys            lvm2 [53,19 GB / 32,19 GB free]
> >   PV /dev/sda3                       lvm2 [65,21 GB]
> >   Total: 2 [118,39 GB] / in use : 1 [53,19 GB] / in no VG: 1 [65,21 GB]
> >
> > But if I type fdisk -l /dev/sda, sda3 is a good old swap partition:
> >
> > # fdisk -l /dev/sda
> >
> > Disque /dev/sda: 72.7Go, 72746008576 octets
> > 255 t=EAtes, 63 secteurs/piste, 8844 cylindres
> > Unit=E9s =3D cylindres de 16065 * 512 =3D 8225280 octets
> >
> > P=E9riph=E9rique Boot    Start     End      Blocks   Id    System
> > /dev/sda1   *         1      13      104391   83  Linux
> > /dev/sda2   *        14     332     2562367+  83  Linux
> > /dev/sda3   *       333    1899    12586927+  82  Linux swap
> > /dev/sda4   *      1900    8844    55785712+   5  Extended
> > /dev/sda5   *      1900    8844    55785681+  8e  Linux LVM
> >
> > I do not think this is a big problem but I am curious of why and could =
it
> be a
> > problem?
>
> Looks like the partition was previously used as an LVM PV. Just wipe out
> the first 1M or so and run mkswap again.
>
> Regards,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iEYEARECAAYFAkjBO8sACgkQ6YSQoMYUY9470QCg4Akby6y0KkN6D4lulftnCZJA
> QE4AnjV9i1GHDvXVRVfzeGW4BlMlsHDe
> =3DOEkz
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_43800_26661189.1220624795788
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Right on target Bryn.&nbsp; Your solution fixed it.</div>
<div>&nbsp;</div>
<div>Thanks a lot,</div>
<div>Bernard<br><br>&nbsp;</div>
<div><span class=3D"gmail_quote">On 9/5/08, <b class=3D"gmail_sendername">B=
ryn M. Reeves</b> &lt;<a href=3D"mailto:breeves@redhat.com">breeves@redhat.=
com</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">-----BEGIN PGP SIGNED MESSAGE---=
--<br>Hash: SHA1<br><br>Bernard Fay wrote:<br>&gt; Hi,<br>&gt;<br>&gt; We h=
ave installed RHEL 4.7 on a single disk (actually two disk in hardware<br>
&gt; RAID).&nbsp;&nbsp;Part of it use regular partions and others LVM2 logi=
cal volumes.&nbsp;&nbsp;To my<br>&gt; surprise, when running pvs or pvscan,=
 the swap partition is shown has LVM2:<br>&gt;<br>&gt; # pvscan<br>&gt;&nbs=
p;&nbsp; PV /dev/sda5&nbsp;&nbsp; VG vgsys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lvm2 [53,19 GB / 32,19 GB free]<br>
&gt;&nbsp;&nbsp; PV /dev/sda3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; lvm2 [65,21 GB]<br>&gt;&nbsp;&nbsp; Total: 2 [118,39 GB] / in u=
se : 1 [53,19 GB] / in no VG: 1 [65,21 GB]<br>&gt;<br>&gt; But if I type fd=
isk -l /dev/sda, sda3 is a good old swap partition:<br>
&gt;<br>&gt; # fdisk -l /dev/sda<br>&gt;<br>&gt; Disque /dev/sda: 72.7Go, 7=
2746008576 octets<br>&gt; 255 t=EAtes, 63 secteurs/piste, 8844 cylindres<br=
>&gt; Unit=E9s =3D cylindres de 16065 * 512 =3D 8225280 octets<br>&gt;<br>&=
gt; P=E9riph=E9rique Boot&nbsp;&nbsp;&nbsp;&nbsp;Start&nbsp;&nbsp;&nbsp;&nb=
sp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blocks&nbsp;&nbsp; Id&nbsp;&nbsp=
;&nbsp;&nbsp;System<br>
&gt; /dev/sda1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;104391&nbsp;&nbsp; 83&nbsp;&nbsp;Linux<br>&gt; /dev/sda2&nbsp;&nbsp; *&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14&nbsp;&nbsp;&nbsp;&nbsp; 332=
&nbsp;&nbsp;&nbsp;&nbsp; 2562367+&nbsp;&nbsp;83&nbsp;&nbsp;Linux<br>&gt; /d=
ev/sda3&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 333&nbsp;&nbsp;&n=
bsp;&nbsp;1899&nbsp;&nbsp;&nbsp;&nbsp;12586927+&nbsp;&nbsp;82&nbsp;&nbsp;Li=
nux swap<br>&gt; /dev/sda4&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;1900&nbsp;&nbsp;&nbsp;&nbsp;8844&nbsp;&nbsp;&nbsp;&nbsp;55785712+&nbsp;&nb=
sp; 5&nbsp;&nbsp;Extended<br>
&gt; /dev/sda5&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1900&nbsp;&=
nbsp;&nbsp;&nbsp;8844&nbsp;&nbsp;&nbsp;&nbsp;55785681+&nbsp;&nbsp;8e&nbsp;&=
nbsp;Linux LVM<br>&gt;<br>&gt; I do not think this is a big problem but I a=
m curious of why and could it be a<br>&gt; problem?<br><br>Looks like the p=
artition was previously used as an LVM PV. Just wipe out<br>
the first 1M or so and run mkswap again.<br><br>Regards,<br>Bryn.<br><br>--=
---BEGIN PGP SIGNATURE-----<br>Version: GnuPG v1.4.9 (GNU/Linux)<br>Comment=
: Using GnuPG with Fedora - <a href=3D"http://enigmail.mozdev.org">http://e=
nigmail.mozdev.org</a><br>
<br>iEYEARECAAYFAkjBO8sACgkQ6YSQoMYUY9470QCg4Akby6y0KkN6D4lulftnCZJA<br>QE4=
AnjV9i1GHDvXVRVfzeGW4BlMlsHDe<br>=3DOEkz<br>-----END PGP SIGNATURE-----<br>=
<br>_______________________________________________<br>linux-lvm mailing li=
st<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.c=
om/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=3D"http=
://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_43800_26661189.1220624795788--
