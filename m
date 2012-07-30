Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6UJPka1031956
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 15:25:46 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6UJPikS026519
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 15:25:44 -0400
Received: by lbbgm6 with SMTP id gm6so4086842lbb.33
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 12:25:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5016DD33.3050000@profihost.ag>
References: <5016DD33.3050000@profihost.ag>
Date: Tue, 31 Jul 2012 05:25:43 +1000
Message-ID: <CANN7Ug1O7oJiqK8OZpT9uqZoDXoa6Q048ZtMWNn34CEWQgu-TQ@mail.gmail.com>
From: Scott Merrilees <scott.merrilees@gmail.com>
Content-Type: multipart/alternative; boundary=e89a8f22c4112a880904c6110760
Subject: Re: [linux-lvm] how to online resize pv?
Reply-To: scott@merrilees.net,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--e89a8f22c4112a880904c6110760
Content-Type: text/plain; charset=ISO-8859-1

partprobe ?
On Jul 31, 2012 5:23 AM, "Stefan Priebe" <s.priebe@profihost.ag> wrote:

> Hello list,
>
> i'm able to resize my block device online. The kernel also shows the
> correct new size in blockdev --getsize64.
>
> But then i got stuck to extend the pv as i'm unable to extend my partition
> table without reboot.
>
> Disk /dev/vda: 48,3GB
> Sector size (logical/physical): 512B/512B
> Partition Table: gpt
>
> Number  Start   End     Size    File system  Name       Flags
>  1      1049kB  2097kB  1049kB               GRUB_BOOT  bios_grub
>  2      2097kB  32,2GB  32,2GB               Linux LVM  lvm
>
> If i delete 2 and recreate it starting at the same sector i can't reread
> the part. table.
>
> Is there a way todo online resizing?
>
> Greets
> Stefan
>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>

--e89a8f22c4112a880904c6110760
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>partprobe ?</p>
<div class=3D"gmail_quote">On Jul 31, 2012 5:23 AM, &quot;Stefan Priebe&quo=
t; &lt;<a href=3D"mailto:s.priebe@profihost.ag">s.priebe@profihost.ag</a>&g=
t; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hello list,<br>
<br>
i&#39;m able to resize my block device online. The kernel also shows the co=
rrect new size in blockdev --getsize64.<br>
<br>
But then i got stuck to extend the pv as i&#39;m unable to extend my partit=
ion table without reboot.<br>
<br>
Disk /dev/vda: 48,3GB<br>
Sector size (logical/physical): 512B/512B<br>
Partition Table: gpt<br>
<br>
Number =A0Start =A0 End =A0 =A0 Size =A0 =A0File system =A0Name =A0 =A0 =A0=
 Flags<br>
=A01 =A0 =A0 =A01049kB =A02097kB =A01049kB =A0 =A0 =A0 =A0 =A0 =A0 =A0 GRUB=
_BOOT =A0bios_grub<br>
=A02 =A0 =A0 =A02097kB =A032,2GB =A032,2GB =A0 =A0 =A0 =A0 =A0 =A0 =A0 Linu=
x LVM =A0lvm<br>
<br>
If i delete 2 and recreate it starting at the same sector i can&#39;t rerea=
d the part. table.<br>
<br>
Is there a way todo online resizing?<br>
<br>
Greets<br>
Stefan<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div>

--e89a8f22c4112a880904c6110760--
