From: "noname noname" <noantz@hotmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_00A1_01C1C1E9.CE824870"
Message-Id: <OE72ABifXNQAsPIUllI00010bae@hotmail.com>
Subject: [linux-lvm] Migrating root problems...
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat Mar  2 05:57:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_00A1_01C1C1E9.CE824870
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello!! =20
 =20
I am trying to install the LVM v1.0.3 in a RedHat 7.2 but I have some =
problems. I am following the HowTo =
(http://www.sistina.com/lvm_howtos/lvm_howto) and I have carried out the =
steps there suitable. I recompiled Kernel to be able to support LVM =
etc... At the moment I have the following hard disks: =20
 =20
/ dev/hda1 ext2  (Linux native) =20
/ dev/hdb1 swap  (Linux swap) =20
/ dev/hdc1 ext2  (LVM volume) =20
 =20
In the / dev/hda1 has installed the current RedHat, but what I attempt =
is migrate the / to a LVM volume (following the howto =
http://www.sistina.com/lvm_howtos/lvm_howto/Converting_a_root_filesys.htm=
l) but here it is where I have problems. The unit LVM is created and it =
is activated in the boot process. I have copied the whole content of the =
/ less /boot directory. The problem comes when wanting to pull up Linux =
having the / in the volume LVM (/dev/hdc1). The modifications of the one =
in the /etc/fstab of the /dev/hdc1 is carried out, as well as the =
creation of the initrd and in the grub I have added the correct option =
to be able to start up: =20
 =20
title Net Hat Linux (2.4.7-10) VLM Support =20
        root (hd0,0) =20
        kernel / boot/vmlinuz-2.4.7-10feb2002 mem=3D250M ramdisk=3D5038 =
ro root=3D/dev/q3xvol/ro =20
        initrd / boot/initrd-lvm-2.4.7-10feb2002.gz =20
 =20
When I start up and I select this option and the system it begins to =
start up.... but shortcomings take place: =20
 =20
. =20
. =20
. =20
hdb:<7> LDM:  DEBUG (ldm.c, 876): validate_partition_table: Found basic =
MS-DOS partition, not to dynamic disk. =20
hdb1 =20
hdc:<7> LDM:  DEBUG (ldm.c, 876): validate_partition_table: Found basic =
MS-DOS partition, not to dynamic disk.   =20
hdc1 =20
Floppy drive(s): fd0 is 1.44M =20
. =20
. =20
. =20
NET4 LinuxIPX 0.47 for NET4.0 =20
IPX Portions Copyright (c) 1995 Boiler, Inc =20
IPX Portions Copyright (c) 2000, 2001 Conectiva, Inc =20
Kernel panic: I have not root and I want to scream. =20
 =20
And the system stops having that reeboot. It seems that he doesn't find =
or it cannot mount the root. Does somebody know what it happens? Some =
idea? =20
 =20
Thank you for the help!

------=_NextPart_000_00A1_01C1C1E9.CE824870
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2713.1100" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello!!&nbsp; <BR>&nbsp; <BR>I am =
trying to install=20
the LVM v1.0.3 in a RedHat 7.2 but I have some problems. I am following =
the=20
HowTo (<A=20
href=3D"http://www.sistina.com/lvm_howtos/lvm_howto">http://www.sistina.c=
om/lvm_howtos/lvm_howto</A>)=20
and I have carried out the steps there suitable. I recompiled Kernel to =
be able=20
to support LVM etc... At the moment I have the following hard =
disks:&nbsp;=20
<BR>&nbsp; <BR>/ dev/hda1&nbsp;ext2&nbsp;&nbsp;(Linux native)&nbsp; =
<BR>/=20
dev/hdb1&nbsp;swap&nbsp;&nbsp;(Linux swap)&nbsp; <BR>/=20
dev/hdc1&nbsp;ext2&nbsp;&nbsp;(LVM volume)&nbsp; <BR>&nbsp; <BR>In the / =

dev/hda1 has installed the current RedHat, but what I attempt is migrate =
the /=20
to a LVM volume (following the howto <A=20
href=3D"http://www.sistina.com/lvm_howtos/lvm_howto/Converting_a_root_fil=
esys.html">http://www.sistina.com/lvm_howtos/lvm_howto/Converting_a_root_=
filesys.html</A>)=20
but here it is where I have problems. The unit LVM is created and it is=20
activated in the boot process. I have copied the whole content of the / =
less=20
/boot directory. The problem comes when wanting to pull up Linux having =
the / in=20
the volume LVM (/dev/hdc1). The modifications of the one in the =
/etc/fstab of=20
the /dev/hdc1 is carried out, as well as the creation of the initrd and =
in the=20
grub I have added the correct option to be able to start up:&nbsp; =
<BR>&nbsp;=20
<BR>title Net Hat Linux (2.4.7-10) VLM Support&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root (hd0,0)&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kernel /=20
boot/vmlinuz-2.4.7-10feb2002 mem=3D250M ramdisk=3D5038 ro =
root=3D/dev/q3xvol/ro&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initrd /=20
boot/initrd-lvm-2.4.7-10feb2002.gz&nbsp; <BR>&nbsp; <BR>When I start up =
and I=20
select this option and the system it begins to start up.... but =
shortcomings=20
take place:&nbsp; <BR>&nbsp; <BR>.&nbsp; <BR>.&nbsp; <BR>.&nbsp;=20
<BR>hdb:&lt;7&gt; LDM:&nbsp; DEBUG (ldm.c, 876): =
validate_partition_table: Found=20
basic MS-DOS partition, not to dynamic disk.&nbsp; <BR>hdb1&nbsp;=20
<BR>hdc:&lt;7&gt; LDM:&nbsp; DEBUG (ldm.c, 876): =
validate_partition_table: Found=20
basic MS-DOS partition, not to dynamic disk.&nbsp;&nbsp;&nbsp; =
<BR>hdc1&nbsp;=20
<BR>Floppy drive(s): fd0 is 1.44M&nbsp; <BR>.&nbsp; <BR>.&nbsp; =
<BR>.&nbsp;=20
<BR>NET4 LinuxIPX 0.47 for NET4.0&nbsp; <BR>IPX Portions Copyright (c) =
1995=20
Boiler, Inc&nbsp; <BR>IPX Portions Copyright (c) 2000, 2001 Conectiva, =
Inc&nbsp;=20
<BR>Kernel panic: I have not root and I want to scream.&nbsp; <BR>&nbsp; =
<BR>And=20
the system stops having that reeboot. It seems that he doesn't find or =
it cannot=20
mount the root. Does somebody know what it happens? Some idea?&nbsp; =
<BR>&nbsp;=20
<BR>Thank you for the help!</FONT></DIV></BODY></HTML>

------=_NextPart_000_00A1_01C1C1E9.CE824870--
