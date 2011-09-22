Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8MCkBn3007046
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 08:46:11 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8MCk97E021686
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 08:46:10 -0400
Received: by bkbzt4 with SMTP id zt4so3373537bkb.33
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 05:46:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8akko1QgMLPF66mE11bvZepV+0CqtfPfYoz9JjX6fk6Vy5-g@mail.gmail.com>
References: <CAA8akko1QgMLPF66mE11bvZepV+0CqtfPfYoz9JjX6fk6Vy5-g@mail.gmail.com>
Date: Thu, 22 Sep 2011 14:46:08 +0200
Message-ID: <CAA8akkrmfH0BnpX5s+4N5PBF19pXXVrzo5qYshvaBaZT9juO-A@mail.gmail.com>
From: =?ISO-8859-1?Q?Micha=EBl_Berger?= <miberger79@gmail.com>
Content-Type: multipart/alternative; boundary=001517448240aa823a04ad8713fb
Subject: Re: [linux-lvm] [LVM] Extending LV
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
To: linux-lvm@redhat.com

--001517448240aa823a04ad8713fb
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

aha: that is something:


Command (m for help): v
286690436 unallocated sectors

Command (m for help): n

Probably I need to add that the c0d0p2 with fdisk first

On Thu, Sep 22, 2011 at 2:32 PM, Micha=EBl Berger <miberger79@gmail.com>wro=
te:

> Hello,
>
> I am very new to LVM. Trying to extend a LV after I added a 4th disk in a
> HW RAID, but I don't have much luck. I am really hoping someone out there
> can help me.
>
> Here is my setup:
>
> [root@sk-nas ~]# fdisk /dev/cciss/c0d0
>
> The number of cylinders for this disk is set to 53535.
> There is nothing wrong with that, but this is larger than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., old versions of LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)
>
> Command (m for help): p
>
> Disk /dev/cciss/c0d0: 440.3 GB, 440345714688 bytes
> 255 heads, 63 sectors/track, 53535 cylinders
> Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>
>            Device Boot      Start         End      Blocks   Id  System
> /dev/cciss/c0d0p1   *           1          13      104391   83  Linux
> /dev/cciss/c0d0p2              14       35690   286575502+  8e  Linux LVM
>
> Command (m for help):
>
> As one can see /dev/cciss/c0d0 is now 440.3GB, which means that my 4th di=
sk
> is "physically" seen in the array. so far so good.
>
> First issue, looks like the 4th disk in not seen by pvscan?
>
> [root@sk-nas ~]# pvscan
>   PV /dev/cciss/c0d0p2   VG VolGroup00   lvm2 [273.28 GB / 0    free]
>   Total: 1 [273.28 GB] / in use: 1 [273.28 GB] / in no VG: 0 [0   ]
> [root@sk-nas ~]#
>
> [root@sk-nas ~]# pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/cciss/c0d0p2
>   VG Name               VolGroup00
>   PV Size               273.30 GB / not usable 18.89 MB
>   Allocatable           yes (but full)
>   PE Size (KByte)       32768
>   Total PE              8745
>   Free PE               0
>   Allocated PE          8745
>   PV UUID               07qmA3-5eD9-klBa-OzWp-XDz1-pUvX-KGXAji
>
> [root@sk-nas ~]#
>
> What should I do, looks like my first disk is not seen by lvm?
>
> Thanks!
>
> Michael
>

--001517448240aa823a04ad8713fb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

aha: that is something:<br><br><br>Command (m for help): v<br>286690436 una=
llocated sectors<br><br>Command (m for help): n<br><br>Probably I need to a=
dd that the c0d0p2 with fdisk first<br><br><div class=3D"gmail_quote">On Th=
u, Sep 22, 2011 at 2:32 PM, Micha=EBl Berger <span dir=3D"ltr">&lt;<a href=
=3D"mailto:miberger79@gmail.com">miberger79@gmail.com</a>&gt;</span> wrote:=
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">Hello,<br><br>I am very new to LVM. Trying =
to extend a LV after I added a 4th disk in a HW RAID, but I don&#39;t have =
much luck. I am really hoping someone out there can help me.<br>
<br>Here is my setup:<br><br>[root@sk-nas ~]# fdisk /dev/cciss/c0d0<br>
<br>The number of cylinders for this disk is set to 53535.<br>There is noth=
ing wrong with that, but this is larger than 1024,<br>and could in certain =
setups cause problems with:<br>1) software that runs at boot time (e.g., ol=
d versions of LILO)<br>

2) booting and partitioning software from other OSs<br>=A0=A0 (e.g., DOS FD=
ISK, OS/2 FDISK)<br><br>Command (m for help): p<br><br>Disk /dev/cciss/c0d0=
: 440.3 GB, 440345714688 bytes<br>255 heads, 63 sectors/track, 53535 cylind=
ers<br>

Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br><br>=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 Device Boot=A0=A0=A0=A0=A0 Start=A0=A0=A0=A0=A0=A0=A0=A0 En=
d=A0=A0=A0=A0=A0 Blocks=A0=A0 Id=A0 System<br>/dev/cciss/c0d0p1=A0=A0 *=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=A0 13=A0=A0=A0=A0=A0 =
104391=A0=A0 83=A0 Linux<br>/dev/cciss/c0d0p2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 14=A0=A0=A0=A0=A0=A0 35690=A0=A0 286575502+=A0 8e=A0 Linux LVM<br=
>

<br>Command (m for help): <br><br>As one can see /dev/cciss/c0d0 is now 440=
.3GB, which means that my 4th disk is &quot;physically&quot; seen in the ar=
ray. so far so good.<br><br>First issue, looks like the 4th disk in not see=
n by pvscan?<br>

<br>[root@sk-nas ~]# pvscan<br>=A0 PV /dev/cciss/c0d0p2=A0=A0 VG VolGroup00=
=A0=A0 lvm2 [273.28 GB / 0=A0=A0=A0 free]<br>=A0 Total: 1 [273.28 GB] / in =
use: 1 [273.28 GB] / in no VG: 0 [0=A0=A0 ]<br>[root@sk-nas ~]# <br><br>[ro=
ot@sk-nas ~]# pvdisplay <br>

=A0 --- Physical volume ---<br>=A0 PV Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 /dev/cciss/c0d0p2<br>=A0 VG Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 VolGroup00<br>=A0 PV Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 273.30 GB / not usable 18.89 MB<br>=A0 Allocatable=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 yes (but full)<br>=A0 PE Size (KByte)=A0=A0=A0=A0=A0=A0 32768<br>

=A0 Total PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8745<br>=A0 Free PE=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0<br>=A0 Allocated PE=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 8745<br>=A0 PV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 07qmA3-5eD9-klBa-OzWp-XDz1-pUvX-KGXAji<br>=A0=A0 <br>[root@sk-nas ~]# <=
br><br>What should I do, looks like my first disk is not seen by lvm?<br>

<br>Thanks!<br><br>Michael<br>
</blockquote></div><br>

--001517448240aa823a04ad8713fb--
