Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q94IE9T7031108
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2012 14:14:10 -0400
Received: from nm8-vm0.bullet.mail.ne1.yahoo.com
	(nm8-vm0.bullet.mail.ne1.yahoo.com [98.138.91.23])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q94IE7wC006989
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2012 14:14:07 -0400
Message-ID: <1349374344.82044.YahooMailNeo@web124503.mail.ne1.yahoo.com>
Date: Thu, 4 Oct 2012 11:12:24 -0700 (PDT)
From: rodrigo tavares <rodrigofariat@yahoo.com.br>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-1103591728-624496263-1349374344=:82044"
Subject: [linux-lvm] Post-install LVM
Reply-To: rodrigo tavares <rodrigofariat@yahoo.com.br>,
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

---1103591728-624496263-1349374344=:82044
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,=0A=0AI have a Installed my Linux, with support LVM.=0AWhen I run com=
mand gvdisplay. =0ALook Free Pe equal 0.=0AWhen i try run command:=0A=0Alve=
xtend -L+99G /dev/mailx/mailx=0AExtending logical volume mailx to 185,24 Gi=
B=0AInsufficient free space: 25344 extents needed, but only 0 available=0AI=
 think the value in "Free=A0 PE / Size" may be not 0. =0A=0AHow I can to se=
t any value in "Pe / size" ?=0ASo getting add new volumes.=0A=0A=0Aroot@deb=
ian-lvm:~# vgdisplay=0A=A0 --- Volume group ---=0A=A0 VG Name=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mailx=0A=A0 System ID=0A=A0 Format=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lvm2=0A=A0 Metadata Areas=A0=A0=A0=A0=
=A0=A0=A0 1=0A=A0 Metadata Sequence No=A0 2=0A=A0 VG Access=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 read/write=0A=A0 VG Status=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 resizable=0A=A0 MAX LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0=0A=A0 Cur LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=A0 Ope=
n LV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=A0 Max PV=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=0A=A0 Cur PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 1=0A=A0 Act PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 1=0A=A0 VG Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 86,24 GiB=0A=
=A0 PE Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4,00 MiB=0A=A0 Total =
PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 22078=0A=A0 Alloc PE / Size=A0=A0=
=A0=A0=A0=A0 22078 / 86,24 GiB=0A=A0 Free=A0 PE / Size=A0=A0=A0=A0=A0=A0 0 =
/ 0=0A=A0 VG UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mIhg7K-UnnY-zw0=
G-xrYh-9PEV-ZTgk-BOq2i5=0A=0A=0ADisk /dev/sda: 96.6 GB, 96636764160 bytes=
=0A255 heads, 63 sectors/track, 11748 cylinders=0AUnits =3D cilindros of 16=
065 * 512 =3D 8225280 bytes=0ASector size (logical/physical): 512 bytes / 5=
12 bytes=0AI/O size (minimum/optimal): 512 bytes / 512 bytes=0ADisk identif=
ier: 0x0003ad46=0A=0ADispositivo Boot=A0=A0=A0=A0=A0 Start=A0=A0=A0=A0=A0=
=A0=A0=A0 End=A0=A0=A0=A0=A0 Blocks=A0=A0 Id=A0 System=0A/dev/sda1=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=A0=A0=
=A0=A0=A0=A0 28672=A0=A0 83=A0 Linux=0APartition 1 does not end on cylinder=
 boundary.=0A/dev/sda2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=A0=A0=A0=
=A0=A0=A0=A0=A0 491=A0=A0=A0=A0 3905537=A0=A0=A0 5=A0 Estendida=0APartition=
 2 does not end on cylinder boundary.=0A/dev/sda3=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 491=A0=A0=A0=A0=A0=A0 11749=A0=A0=A0 90434560=A0=A0 8e=A0 Linu=
x LVM=0A/dev/sda5=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=A0=A0=A0=A0=
=A0=A0=A0=A0 491=A0=A0=A0=A0 3905536=A0=A0 82=A0 Linux swap / Solaris=0A=0A=
Disk /dev/dm-0: 92.6 GB, 92601843712 bytes=0A255 heads, 63 sectors/track, 1=
1258 cylinders=0AUnits =3D cilindros of 16065 * 512 =3D 8225280 bytes=0ASec=
tor size (logical/physical): 512 bytes / 512 bytes=0AI/O size (minimum/opti=
mal): 512 bytes / 512 bytes=0ADisk identifier: 0x00000000=0A=0A=0ARodrigo F=
aria Tavares
---1103591728-624496263-1349374344=:82044
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:Co=
urier New, courier, monaco, monospace, sans-serif;font-size:10pt">Hello,<br=
><br>I have a Installed my Linux, with support LVM.<br>When I run command g=
vdisplay. <br>Look Free Pe equal 0.<br>When i try run command:<br><br>lvext=
end -L+99G /dev/mailx/mailx<br>Extending logical volume mailx to 185,24 GiB=
<br>Insufficient free space: 25344 extents needed, but only 0 available<br>=
I think the value in "Free&nbsp; PE / Size" may be not 0. <br><br>How I can=
 to set any value in "Pe / size" ?<br>So getting add new volumes.<br><br><b=
r>root@debian-lvm:~# vgdisplay<br>&nbsp; --- Volume group ---<br>&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; mailx<br>&nbsp; System ID<br>&nbsp; Format&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm=
2<br>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 1<br>&nbsp; Metadata Sequence No&nbsp; 2<br>&nbsp; VG Access&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&n=
bsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; resizable<br>&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 1<br>&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Max PV&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0<br>&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&=
nbsp; VG
 Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 86,24 GiB<br>&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,00 MiB<br>&nbsp; Tota=
l PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 22078<br>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 22078 / 86,24 GiB<br>&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0 / 0<br>&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mIhg7K-UnnY-zw0G-xrYh-9PEV-ZTgk=
-BOq2i5<br><br><br>Disk /dev/sda: 96.6 GB, 96636764160 bytes<br>255 heads, =
63 sectors/track, 11748 cylinders<br>Units =3D cilindros of 16065 * 512 =3D=
 8225280 bytes<br>Sector size (logical/physical): 512 bytes / 512 bytes<br>=
I/O size (minimum/optimal): 512 bytes / 512 bytes<br>Disk identifier: 0x000=
3ad46<br><br>Dispositivo Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<br>/dev/sda1&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 28672&nbsp;&nbsp; 83&nbsp; Linux<br>Partition 1 does n=
ot end on cylinder boundary.<br>/dev/sda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 491&nbsp;&nbsp;&nbsp;&nbsp; 3905537&nbsp;&nbsp;&n=
bsp; 5&nbsp; Estendida<br>Partition 2 does not end on cylinder boundary.<br=
>/dev/sda3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 491&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11749&nbsp;&nbsp;&nbsp; 904=
34560&nbsp;&nbsp; 8e&nbsp; Linux LVM<br>/dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 491&nbsp;&nbsp;&nbsp;&nb=
sp; 3905536&nbsp;&nbsp; 82&nbsp; Linux swap / Solaris<br><br>Disk /dev/dm-0=
: 92.6 GB, 92601843712 bytes<br>255 heads, 63 sectors/track, 11258 cylinder=
s<br>Units =3D cilindros of 16065 * 512 =3D 8225280 bytes<br>Sector size (l=
ogical/physical): 512 bytes / 512 bytes<br>I/O size (minimum/optimal): 512 =
bytes / 512 bytes<br>Disk identifier: 0x00000000<br><br><br>Rodrigo Faria T=
avares<br><br><br></div></body></html>
---1103591728-624496263-1349374344=:82044--
