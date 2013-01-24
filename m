Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0O5oaLq010653
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 00:50:37 -0500
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0O5oTd2014558
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 00:50:33 -0500
Received: by mail-qc0-f180.google.com with SMTP id v28so1121404qcm.25
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2013 21:50:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <51004E73.9080902@tum.de>
References: <51004E73.9080902@tum.de>
Date: Thu, 24 Jan 2013 16:50:28 +1100
Message-ID: <CABYJTakyfndceju9ecAk3L=XKcGuOO_68MeGagYbKzaUN0cPWQ@mail.gmail.com>
From: mohammad azimi <mohammad.reza.azimi@gmail.com>
Content-Type: multipart/alternative; boundary=20cf303b42195f85ca04d4026303
Subject: Re: [linux-lvm] vgremove fails to remove empty VG (v2.02.98)
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

--20cf303b42195f85ca04d4026303
Content-Type: text/plain; charset=ISO-8859-1

Hi

Did you used vgreduce to release free the disk?
 On Jan 24, 2013 8:02 AM, "Joschi Brauchle" <joschi.brauchle@tum.de> wrote:

> Hello,
>
> I get the following error with lvm2.02.98:
> -----------
> #/sbin/vgdisplay --units k -v 'system'
>
>   --- Volume group ---
>   VG Name               system
>   System ID
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  13
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                0
>   Open LV               0
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               104669184.00 KiB
>   PE Size               4096.00 KiB
>   Total PE              25554
>   Alloc PE / Size       0 / 0 KiB
>   Free  PE / Size       25554 / 104669184.00 KiB
>   VG UUID               Qs0uaZ-L88n-tC7T-fZQj-sgJY-**2yRX-Dlt2Cr
>
>   --- Physical volumes ---
>   PV Name               /dev/sda3
>   PV UUID               wzGjXi-F2lT-d2d4-l5a6-EmfM-**W838-YxaFIh
>   PV Status             allocatable
>   Total PE / Free PE    25554 / 25554
> -----------
>
> VG system is empty, but still:
> -----------
> # /sbin/vgremove 'system'
> -----------
> failes with status code 5, which means 'can't remove volume group
> containing logical volumes' (from man page).
>
> Looks like a bug in vgremove?
>
> Best regards,
> J Brauchle
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--20cf303b42195f85ca04d4026303
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Hi</p>
<p>Did you used vgreduce to release free the disk? <br>
</p>
<div class=3D"gmail_quote">On Jan 24, 2013 8:02 AM, &quot;Joschi Brauchle&q=
uot; &lt;<a href=3D"mailto:joschi.brauchle@tum.de">joschi.brauchle@tum.de</=
a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hello,<br>
<br>
I get the following error with lvm2.02.98:<br>
-----------<br>
#/sbin/vgdisplay --units k -v &#39;system&#39;<br>
<br>
=A0 --- Volume group ---<br>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 system<br>
=A0 System ID<br>
=A0 Format =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvm2<br>
=A0 Metadata Areas =A0 =A0 =A0 =A01<br>
=A0 Metadata Sequence No =A013<br>
=A0 VG Access =A0 =A0 =A0 =A0 =A0 =A0 read/write<br>
=A0 VG Status =A0 =A0 =A0 =A0 =A0 =A0 resizable<br>
=A0 MAX LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00<br>
=A0 Cur LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00<br>
=A0 Open LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 0<br>
=A0 Max PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00<br>
=A0 Cur PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01<br>
=A0 Act PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01<br>
=A0 VG Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 104669184.00 KiB<br>
=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 4096.00 KiB<br>
=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A025554<br>
=A0 Alloc PE / Size =A0 =A0 =A0 0 / 0 KiB<br>
=A0 Free =A0PE / Size =A0 =A0 =A0 25554 / 104669184.00 KiB<br>
=A0 VG UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 Qs0uaZ-L88n-tC7T-fZQj-sgJY-<u></u>2=
yRX-Dlt2Cr<br>
<br>
=A0 --- Physical volumes ---<br>
=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sda3<br>
=A0 PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 wzGjXi-F2lT-d2d4-l5a6-EmfM-<u></u>W=
838-YxaFIh<br>
=A0 PV Status =A0 =A0 =A0 =A0 =A0 =A0 allocatable<br>
=A0 Total PE / Free PE =A0 =A025554 / 25554<br>
-----------<br>
<br>
VG system is empty, but still:<br>
-----------<br>
# /sbin/vgremove &#39;system&#39;<br>
-----------<br>
failes with status code 5, which means &#39;can&#39;t remove volume group c=
ontaining logical volumes&#39; (from man page).<br>
<br>
Looks like a bug in vgremove?<br>
<br>
Best regards,<br>
J Brauchle<br>
<br>
<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div>

--20cf303b42195f85ca04d4026303--
