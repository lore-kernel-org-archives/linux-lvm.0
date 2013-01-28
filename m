Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0SG99D4011496
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 11:09:09 -0500
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0SG98Bt005086
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 11:09:08 -0500
Received: by mail-ob0-f177.google.com with SMTP id wc18so1592516obb.8
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2013 08:09:08 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 28 Jan 2013 11:00:47 -0500
Message-ID: <CAEN3XerNv=+vSBQfR+nywmR6hETAA=4_AF7fCde9Megs_eCG6w@mail.gmail.com>
From: Andrew Walsh <awalsh@e-walsh.net>
Content-Type: multipart/alternative; boundary=f46d04446a4b5d757d04d45b61dc
Subject: Re: [linux-lvm] Help with a confused lv
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

--f46d04446a4b5d757d04d45b61dc
Content-Type: text/plain; charset=ISO-8859-1

I've seen this kind of behavior when you get multiple VG's (and LV's in my
case) with the same name many times over.

The issue that I witnessed was due to the host vgscan picking up the lvm
information on the Virtual Machine disks and adding them to the host's
running config.

PV
  \_VG
    \_LV_VM1
    | \_PV_VM
    |   \_VG_VM
    |    \_LV_VM
    \_LV_VM2
    | \_PV_VM
    |   \_VG_VM
    |    \_LV_VM
    \_LV_VM3
      \_PV_VM
        \_VG_VM
         \_LV_VM

In this case, the host was picking up VG_VM (and LV_VM) three times and
adding it to the running config.  I was seeing the same type of warnings
you 'read failed after ....' for each duplicate that was found.

The method I used to fix this was to adjust the "filter = " line in
/etc/lvm/lvm.conf (on a ubuntu 12.04 LTS system) under the devices section
to explicitly prevent any of the virtual machine LV's from being added to
the config.

--f46d04446a4b5d757d04d45b61dc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote">I&#39;ve seen this kind of =
behavior when you get multiple VG&#39;s (and LV&#39;s in my<br>
case) with the same name many times over.<br>
<br>
The issue that I witnessed was due to the host vgscan picking up the lvm<br=
>
information on the Virtual Machine disks and adding them to the host&#39;s<=
br>
running config.<br>
<br>
PV<br>
=A0 \_VG<br>
=A0 =A0 \_LV_VM1<br>
=A0 =A0 | \_PV_VM<br>
=A0 =A0 | =A0 \_VG_VM<br>
=A0 =A0 | =A0 =A0\_LV_VM<br>
=A0 =A0 \_LV_VM2<br>
=A0 =A0 | \_PV_VM<br>
=A0 =A0 | =A0 \_VG_VM<br>
=A0 =A0 | =A0 =A0\_LV_VM<br>
=A0 =A0 \_LV_VM3<br>
=A0 =A0 =A0 \_PV_VM<br>
=A0 =A0 =A0 =A0 \_VG_VM<br>
=A0 =A0 =A0 =A0 =A0\_LV_VM<br>
<br>
In this case, the host was picking up VG_VM (and LV_VM) three times and<br>
adding it to the running config. =A0I was seeing the same type of warnings<=
br>
you &#39;read failed after ....&#39; for each duplicate that was found.<br>
<br>
The method I used to fix this was to adjust the &quot;filter =3D &quot; lin=
e in<br>
/etc/lvm/lvm.conf (on a ubuntu 12.04 LTS system) under the devices section<=
br>
to explicitly prevent any of the virtual machine LV&#39;s from being added =
to<br>
the config.<br>
</div></div>

--f46d04446a4b5d757d04d45b61dc--
