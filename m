Message-ID: <002701c38c15$b72cbc30$0201a8c0@ray1>
From: "Reidar Westvik" <brad.p@frisurf.no>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0024_01C38C26.7A9B4D70"
Subject: [linux-lvm] LVM and resize
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
Date: Tue Oct  7 07:34:09 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0024_01C38C26.7A9B4D70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I don't know if my question in something that Sistina supports, but i =
need some pointers to make this work.

We're running a Slackware 9.0 server with kernel 2.5.64 (gcc ver. 2.95.3 =
20010315) also on this server we have a LVM volume of 1TB spread over =
120GB IDE disks. Now, it seems like one of the harddrives has failed in =
some way. Filesystem on the volume is EXT3.

When i mount the volume syslog says: "kernel: EXT3-fs warning: mounting =
fs with errors, running e3fschk is recommended" So i've unmounted the =
volume and run e2fschk on the LVM volume. After a long wait (2 days in =
fact) the server hangs, when its checking the part of the volume that is =
on hdf. The box just dies, and only a powercycle will bring it back up =
again. The syslogs displays the following info:
"kernel: hdf: dma_timer_expiry: dma status =3D=3D 0x61"
"kernel: hdf: (__ide_dma_test_irq) called while not waiting""

These are the last events of syslog before it's starts to reboot.

Now, after what i've read the way to deal with this issue without loss =
of data is to shrink the volume with aprox. 120gb (there is enough free =
space) and then exclude the defective drive from the logical volume and =
its physical groups, and then add a healthy disk for so to increase the =
volume back to its original size.

However LVM resize tools will not allow resizing of a volume that has a =
filsystem marked with errors. And if i try to force the resize the =
server hangs. I have tryed to resize with both "e2fsadm" and "resize2fs" =
but they both have problem resizing since it has errors.

So this kinda puts me back to basics, is there a way for me to remove =
this disk without loosing data on the volume ?

All awnsers are very much apriciated! :)

Best Regards
Reidar
------=_NextPart_000_0024_01C38C26.7A9B4D70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I don't know if my question in =
something that=20
Sistina supports, but i need some pointers to make this =
work.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We're running a Slackware 9.0 server =
with kernel=20
2.5.64 (gcc ver. 2.95.3 20010315) also on this server we have a LVM =
volume of=20
1TB spread over 120GB IDE disks. Now, it seems like one of the =
harddrives has=20
failed in some way. Filesystem on the volume is EXT3.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When i mount the volume syslog says: =
"kernel:=20
EXT3-fs warning: mounting fs with errors, running e3fschk is =
recommended" So=20
i've unmounted the volume and run e2fschk on the LVM volume. After a =
long wait=20
(2 days in fact) the server hangs, when its checking the part of the =
volume that=20
is on hdf. The box just dies, and only a powercycle will bring it back =
up again.=20
The syslogs displays the following info:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>"kernel: hdf: dma_timer_expiry: dma =
status =3D=3D=20
0x61"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>"kernel: hdf: (__ide_dma_test_irq) =
called while not=20
waiting""</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>These are the last events of syslog =
before it's=20
starts to reboot.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now, after what i've read the way to =
deal with this=20
issue without loss of data is to shrink the volume with aprox. 120gb =
(there is=20
enough free space) and then exclude the defective drive from the logical =
volume=20
and its physical groups, and then add a healthy disk for so to increase =
the=20
volume back to its original size.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>However LVM resize tools will not allow =
resizing of=20
a volume that has a filsystem marked with errors. And if i try to force =
the=20
resize the server hangs. I have tryed to resize with both "e2fsadm" and=20
"resize2fs" but they both have problem resizing since it has=20
errors.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So this kinda puts me back to basics, =
is there a=20
way for me to remove this disk without loosing data on the volume =
?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>All awnsers are very much apriciated!=20
:)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Best Regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Reidar</FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_0024_01C38C26.7A9B4D70--
