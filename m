Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q3BA55Br009604
	for <linux-lvm@redhat.com>; Wed, 11 Apr 2012 06:05:05 -0400
Received: from nelson.canoo.com (gate0.canoo.com [195.141.68.118])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3BA51eJ018576
	for <linux-lvm@redhat.com>; Wed, 11 Apr 2012 06:05:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by nelson.canoo.com (Postfix) with ESMTP id 4A1176FC093
	for <linux-lvm@redhat.com>; Wed, 11 Apr 2012 12:05:00 +0200 (CEST)
Received: from nelson.canoo.com ([127.0.0.1])
	by localhost (nelson.canoo.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYe-1HfoY6uq for <linux-lvm@redhat.com>;
	Wed, 11 Apr 2012 12:04:59 +0200 (CEST)
Received: from nelson.canoo.com (nelson.canoo.com [192.168.0.9])
	by nelson.canoo.com (Postfix) with ESMTP id 8B2446FC031
	for <linux-lvm@redhat.com>; Wed, 11 Apr 2012 12:04:59 +0200 (CEST)
Date: Wed, 11 Apr 2012 12:04:59 +0200 (CEST)
From: Erik Schwalbe <erik.schwalbe@canoo.com>
Message-ID: <1968283131.298650.1334138699493.JavaMail.root@nelson.canoo.com>
In-Reply-To: <2049162317.298117.1334137791059.JavaMail.root@nelson.canoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_298649_313672467.1334138699492"
Subject: [linux-lvm] Hide volume group during startup
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

------=_Part_298649_313672467.1334138699492
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi, 

we have a problem with hiding/deactivating a stacked volume group during startup. 

System is a Ubuntu 10.4.4 LTS (NAS). 
lvm2: 2.02.54-1ubuntu4.1ppa5 

lvs: 
backup-all data -wi-ao 3.00t 
fileserver-forBackup data -wi-ao 50.00g 
.... 
kvm_disk0 data -wi-ao 400.00g 
vm-203-disk-1 kvm_disk0 -wi-ao- 28.01g 
.... 

kvm_disk0 is used as device for iscsitarget. 

The iscsiinitiator created a new volume group (kvm_disk0) on the blockdevice and new virtual disks (vm-203-disk-1) . 

Our problem is, that the iscsitarget host found not only the VG "data" during system startup but also the other VG (kvm_disk0) and activate it. 
So DRBD can't get exclusive access to the LV kvm_disk0. 

We try to filter in lvm.conf, but after startup, the VG kvm_disk0 is allways activated. 

Thank you for help. 

Regards, 
Erik 








------=_Part_298649_313672467.1334138699492
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D'text/css'>p { margin: 0; }</style></head><body><=
div style=3D'font-family: arial,helvetica,sans-serif; font-size: 10pt; colo=
r: #000000'>Hi,<br><br>we have a problem with hiding/deactivating a stacked=
 volume group during startup.<br><br>System is a Ubuntu 10.4.4 LTS (NAS).<b=
r>lvm2: 2.02.54-1ubuntu4.1ppa5<br><br>lvs:<br>backup-all&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; data&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi-ao&nbsp;&nbsp; 3.00t&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>files=
erver-forBackup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; -wi-ao&nbsp; 50.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; <br>....<br>kvm_disk0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; -wi-ao 400.00g&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>vm-203-disk-1&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kvm_dis=
k0 -wi-ao-&nbsp; 28.01g&nbsp; <br>....<br><br>kvm_disk0 is used as device f=
or iscsitarget.<br><br>The iscsiinitiator created a new volume group (kvm_d=
isk0) on the blockdevice and new virtual disks (vm-203-disk-1).<br><br>Our =
problem is, that the iscsitarget host found not only the VG "data" during s=
ystem startup but also the other VG (kvm_disk0) and activate it.<br>So DRBD=
 can't get <span id=3D"result_box" class=3D"short_text" lang=3D"en"><span c=
lass=3D"hps">exclusive</span> <span class=3D"hps">access to the LV kvm_disk=
0.<br><br>We try to filter in lvm.conf, but after startup, the VG kvm_disk0=
 is allways activated.<br><br>Thank you for help.<br><br>Regards,<br>Erik<b=
r></span></span>&nbsp;<br><br><br><br><div><br></div></div>
<br>=
<html><body><img src=3D"http://www.canoo.com/images/logos/JAX/jax2012_80px.png" alt=3D"JAX 2012" style=3D"color: #000000; font: 16px Arial, sans-serif;"><br /><br /><p style=3D"font: 12px Arial, sans-serif; color: #000000;">Erleben Sie Canoo an der JAX! Hochkar&auml;tige Talks, unser neuer HTML5 Day und geballte Software-Expertise warten auf Sie. Wir freuen uns auf Ihren Besuch!</p><p style=3D"font: 12px Arial, sans-serif; color: #000000;"> Rheingoldhalle Mainz | &nbsp;16. &minus; 20. April 2012&nbsp; | &nbsp;<a style=3D"text-decoration: none;" href=3D"http://jax.de/2012/" target=3D"_blank">www.jax.de/2012</a></p><br /></body></html>
<br>=
</body></html>
------=_Part_298649_313672467.1334138699492--
