Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m85DteFc019734
	for <linux-lvm@redhat.com>; Fri, 5 Sep 2008 09:55:41 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.176])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m85DtTAb008331
	for <linux-lvm@redhat.com>; Fri, 5 Sep 2008 09:55:30 -0400
Received: by wa-out-1112.google.com with SMTP id j32so363500waf.7
	for <linux-lvm@redhat.com>; Fri, 05 Sep 2008 06:55:29 -0700 (PDT)
Message-ID: <ab53550809050655scab46a9lbea2abbe6c400681@mail.gmail.com>
Date: Fri, 5 Sep 2008 09:55:29 -0400
From: "Bernard Fay" <bernard.fay@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_43333_9898884.1220622929135"
Subject: [linux-lvm] swap tagged as lvm2
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

------=_Part_43333_9898884.1220622929135
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

We have installed RHEL 4.7 on a single disk (actually two disk in hardware
RAID).  Part of it use regular partions and others LVM2 logical volumes.  T=
o
my surprise, when running pvs or pvscan, the swap partition is shown has
LVM2:

# pvscan
  PV /dev/sda5   VG vgsys            lvm2 [53,19 GB / 32,19 GB free]
  PV /dev/sda3                       lvm2 [65,21 GB]
  Total: 2 [118,39 GB] / in use : 1 [53,19 GB] / in no VG: 1 [65,21 GB]

But if I type fdisk -l /dev/sda, sda3 is a good old swap partition:

# fdisk -l /dev/sda

Disque /dev/sda: 72.7Go, 72746008576 octets
255 t=EAtes, 63 secteurs/piste, 8844 cylindres
Unit=E9s =3D cylindres de 16065 * 512 =3D 8225280 octets

P=E9riph=E9rique Boot    Start     End      Blocks   Id    System
/dev/sda1   *         1      13      104391   83  Linux
 /dev/sda2   *        14     332     2562367+  83  Linux
 /dev/sda3   *       333    1899    12586927+  82  Linux swap
 /dev/sda4   *      1900    8844    55785712+   5  Extended
 /dev/sda5   *      1900    8844    55785681+  8e  Linux LVM

I do not think this is a big problem but I am curious of why and could it b=
e
a problem?

Thanks for your help,
Bernard

------=_Part_43333_9898884.1220622929135
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi,</div>
<div>&nbsp;</div>
<div>We have installed RHEL 4.7 on a single disk (actually two disk in hard=
ware RAID).&nbsp; Part of it use regular partions and others LVM2 logical v=
olumes.&nbsp; To my surprise, when running pvs or pvscan, the swap partitio=
n is shown has LVM2:</div>

<div>&nbsp;</div>
<div><font face=3D"courier new,monospace"># pvscan</font></div>
<div><font face=3D"courier new,monospace">&nbsp; PV /dev/sda5&nbsp;&nbsp; V=
G vgsys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;lvm2 [53,19 GB / 32,19 GB free]</font></div>
<div><font face=3D"courier new,monospace">&nbsp; PV /dev/sda3&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lvm2 [65,21 GB]</font></di=
v>
<div><font face=3D"courier new,monospace">&nbsp; Total: 2 [118,39 GB] / in =
use : 1 [53,19 GB] / in no VG: 1 [65,21 GB]</font></div>
<div>&nbsp;</div>
<div>But if I type fdisk -l /dev/sda, sda3 is a good old swap partition:</d=
iv>
<div>&nbsp;</div>
<div><font face=3D"courier new,monospace"># fdisk -l /dev/sda</font></div>
<div><font face=3D"Courier New"></font>&nbsp;</div>
<div><font face=3D"Courier New">Disque /dev/sda: 72.7Go, 72746008576 octets=
</font></div>
<div><font face=3D"Courier New">255 t=EAtes, 63 secteurs/piste, 8844 cylind=
res</font></div>
<div><font face=3D"Courier New">Unit=E9s =3D cylindres de 16065 * 512 =3D 8=
225280 octets</font></div>
<div><font face=3D"Courier New"></font>&nbsp;</div>
<div><font face=3D"Courier New">P=E9riph=E9rique Boot&nbsp;&nbsp;&nbsp;&nbs=
p;Start&nbsp;&nbsp; &nbsp; End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&n=
bsp; Id&nbsp;&nbsp;&nbsp; System</font></div>
<div><font face=3D"Courier New">/dev/sda1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 104391&nbsp;&nbsp;&nbsp;83&nbsp; Linux</font></div>
<div><font face=3D"Courier New">
<div><font face=3D"Courier New">/dev/sda2&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;14 &nbsp;&nbsp;&nbsp;&nbsp;332&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;2562367+&nbsp;&nbsp;83&nbsp; Linux</font></div>
<div>
<div><font face=3D"Courier New">/dev/sda3 &nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;333 &nbsp;&nbsp;&nbsp;1899&nbsp;&nbsp;&nbsp;&nbsp;12586927=
+&nbsp;&nbsp;82&nbsp; Linux swap</font></div>
<div>
<div><font face=3D"Courier New">/dev/sda4&nbsp; &nbsp;*&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;1900 &nbsp;&nbsp;&nbsp;8844&nbsp;&nbsp;&nbsp;&nbsp;55785712=
+&nbsp;&nbsp; 5&nbsp; Extended</font></div>
<div>
<div><font face=3D"Courier New">/dev/sda5&nbsp; &nbsp;*&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;1900 &nbsp;&nbsp;&nbsp;8844&nbsp;&nbsp;&nbsp;&nbsp;55785681=
+ &nbsp;8e&nbsp; Linux LVM</font></div>
<div>&nbsp;</div>
<div>I do not think this is a big problem but I am curious of why and could=
 it be a problem?</div>
<div>&nbsp;</div>
<div>Thanks for your help,</div>
<div>Bernard</div>
<div>&nbsp;</div></div></div></div></font></div>

------=_Part_43333_9898884.1220622929135--
