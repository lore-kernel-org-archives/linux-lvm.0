Message-ID: <002301c1755e$964da0d0$1a00000a@isdesign.com>
From: "Tim Nichols" <tnichols@Is-design.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C1751B.87F1C4A0"
Subject: [linux-lvm] lvcreate seg faults in 1.0.1-r4
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
Date: Sat Nov 24 21:08:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0020_01C1751B.87F1C4A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am having trouble getting lvcreate to work.  I've been able to create =
the PV and VG, but lvcreate always core dumps with a seg fault.   I've =
confirmed that I have the same code level in the kernel and tools =
(1.0.1-rc4).  I've tried compiling the tools with gcc (v2.96) and egcs =
(v2.91.66), but both fail.  I'm running a 2.4.14 kernel, lvm as a =
module, and glibc-2.2.4-19. =20
  The problem seems to be with a corrupt lvol name from what I see in =
the gdb output I've attached.

 Any help would be great.

 Tim

[root@monolith /root]# gcc -v
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/2.96/specs
gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-85)

[root@monolith /root]# egcs -v
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/specs
gcc version egcs-2.91.66 19990314/Linux (egcs-1.1.2 release)

[root@monolith /root]# cat /proc/lvm/global
LVM module LVM version 1.0.1-rc4(03/10/2001)

Total:  1 VG  1 PV  0 LVs (0 LVs open)
Global: 3175 bytes malloced   IOP version: 10   2:05:33 active

VG:  vg00  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 6635520 /1620 total  0 /0 used  6635520 /1620 free
  PV:  [AA] hdf1                   6635520 /1620           0 /0        =
6635520 /
1620
    LVs: none

[root@monolith /root]# lvcreate -L 1500 -n lvol1 vg00
Segmentation fault (core dumped)

[root@monolith /root]# lvcreate -L1500 -nlvol1 vg00
Segmentation fault (core dumped)

[root@monolith /root]# gdb lvcreate
GNU gdb 5.0rh-5 Red Hat Linux 7.1
Copyright 2001 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you =
are
welcome to change it and/or distribute copies of it under certain =
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for =
details.
This GDB was configured as "i386-redhat-linux"...
(no debugging symbols found)...
(gdb) run -L1500 -nlvol1 vg00
Starting program: /sbin/lvcreate -L1500 -nlvol1 vg00

Program received signal SIGSEGV, Segmentation fault.
lv_create (vg=3D0x4, lv=3D0xbffff9f4,
    lv_name=3D0xbffffa08 =
"6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=B5=FB=FF=BF=D4=FB=FF=
=BF=E0=FB=FF=BF=EA=FB=FF=BF=AD=FD=FF=BF=CC=FD=FF=BF=E6=FD=FF=BF=FB=FD=FF=BF=
\
022=FE=FF=BF\035=FE=FF=BFG=FE=FF=BFT=FE=FF=BF\\=FE=FF=BFl=FE=FF=BFz=FE=FF=
=BF\210=FE=FF=BF\231=FE=FF=BF=A7=FE=FF=BF=C9=FE=FF=BF=E2=FE=FF=BF=ED=FE=FF=
=BF=F8=FE=FF=BF+=FF=FF=BF=DA=FF=FF=BF")
    at lv_create_remove.c:42
42      int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
(gdb) where
#0  lv_create (vg=3D0x4, lv=3D0xbffff9f4,
    lv_name=3D0xbffffa08 =
"6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=B5=FB=FF=BF=D4=FB=FF=
=BF=E0=FB=FF=BF=EA=FB=FF=BF=AD=FD=FF=BF=CC=FD=FF=BF=E6=FD=FF=BF=FB=FD=FF=BF=
\
022=FE=FF=BF\035=FE=FF=BFG=FE=FF=BFT=FE=FF=BF\\=FE=FF=BFl=FE=FF=BFz=FE=FF=
=BF\210=FE=FF=BF\231=FE=FF=BF=A7=FE=FF=BF=C9=FE=FF=BF=E2=FE=FF=BF=ED=FE=FF=
=BF=F8=FE=FF=BF+=FF=FF=BF=DA=FF=FF=BF")
    at lv_create_remove.c:42
#1  0x0804b03d in strcpy ()
#2  0x40074627 in __libc_start_main (main=3D0x8049390 <strcpy+384>, =
argc=3D4,
    ubp_av=3D0xbffff9f4, init=3D0x8048e88 <_init>, fini=3D0x804b4d0 =
<_fini>,
    rtld_fini=3D0x4000dcd4 <_dl_fini>, stack_end=3D0xbffff9ec)
    at ../sysdeps/generic/libc-start.c:129
(gdb) quit
The program is running.  Exit anyway? (y or n) y

[root@monolith /root]# uname -a
Linux monolith 2.4.14 #49 Sat Nov 24 00:27:41 PST 2001 i686 unknown

------=_NextPart_000_0020_01C1751B.87F1C4A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I am having trouble getting lvcreate to =
work.&nbsp;=20
I've been able to create the PV and VG, but lvcreate always core dumps =
with a=20
seg fault.&nbsp;&nbsp; I've confirmed that I have the same code level in =
the=20
kernel and tools (1.0.1-rc4).&nbsp; I've tried compiling the tools with =
gcc=20
(v2.96) and egcs (v2.91.66), but both fail.&nbsp; I'm running a 2.4.14 =
kernel,=20
lvm as a module, and glibc-2.2.4-19.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp; The problem seems to be with a =
corrupt lvol=20
name from what I see in the gdb output I've attached.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;Any help would be =
great.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;Tim</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@monolith /root]# gcc =
-v<BR>Reading specs from=20
/usr/lib/gcc-lib/i386-redhat-linux/2.96/specs<BR>gcc version 2.96 =
20000731 (Red=20
Hat Linux 7.1 2.96-85)<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@monolith /root]# egcs =
-v<BR>Reading specs=20
from /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/specs<BR>gcc =
version=20
egcs-2.91.66 19990314/Linux (egcs-1.1.2 release)<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>[root@monolith /root]# cat =
/proc/lvm/global<BR>LVM=20
module LVM version 1.0.1-rc4(03/10/2001)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Total:&nbsp; 1 VG&nbsp; 1 PV&nbsp; 0 =
LVs (0 LVs=20
open)<BR>Global: 3175 bytes malloced&nbsp;&nbsp; IOP version: =
10&nbsp;&nbsp;=20
2:05:33 active</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>VG:&nbsp; vg00&nbsp; [1 PV, 0 LV/0 =
open]&nbsp; PE=20
Size: 4096 KB<BR>&nbsp; Usage [KB/PE]: 6635520 /1620 total&nbsp; 0 /0 =
used&nbsp;=20
6635520 /1620 free<BR>&nbsp; PV:&nbsp; [AA]=20
hdf1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
6635520 =
/1620&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6635520=20
/<BR>1620<BR>&nbsp;&nbsp;&nbsp; LVs: none<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@monolith /root]# lvcreate -L 1500 =
-n lvol1=20
vg00<BR>Segmentation fault (core dumped)<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>[root@monolith /root]# lvcreate -L1500 =
-nlvol1=20
vg00<BR>Segmentation fault (core dumped)<BR></DIV></FONT><FONT =
face=3DArial=20
size=3D2></FONT>
<DIV><FONT face=3DArial size=3D2>[root@monolith /root]# gdb =
lvcreate<BR>GNU gdb=20
5.0rh-5 Red Hat Linux 7.1<BR>Copyright 2001 Free Software Foundation,=20
Inc.<BR>GDB is free software, covered by the GNU General Public License, =
and you=20
are<BR>welcome to change it and/or distribute copies of it under certain =

conditions.<BR>Type "show copying" to see the conditions.<BR>There is =
absolutely=20
no warranty for GDB.&nbsp; Type "show warranty" for details.<BR>This GDB =
was=20
configured as "i386-redhat-linux"...<BR>(no debugging symbols =
found)...<BR>(gdb)=20
run -L1500 -nlvol1 vg00<BR>Starting program: /sbin/lvcreate -L1500 =
-nlvol1=20
vg00</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Program received signal SIGSEGV, =
Segmentation=20
fault.<BR>lv_create (vg=3D0x4, lv=3D0xbffff9f4,<BR>&nbsp;&nbsp;&nbsp;=20
lv_name=3D0xbffffa08 "<A=20
href=3D"mailto:6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=B5=FB=
=FF=BF=D4=FB=FF=BF=E0=FB=FF=BF=EA=FB=FF=BF&shy;=FD=FF=BF=CC=FD=FF=BF=E6=FD=
=FF=BF=FB=FD=FF=BF\">6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=
=B5=FB=FF=BF=D4=FB=FF=BF=E0=FB=FF=BF=EA=FB=FF=BF&shy;=FD=FF=BF=CC=FD=FF=BF=
=E6=FD=FF=BF=FB=FD=FF=BF\</A><BR>022=FE=FF=BF\035=FE=FF=BFG=FE=FF=BFT=FE=FF=
=BF\\=FE=FF=BFl=FE=FF=BFz=FE=FF=BF\210=FE=FF=BF\231=FE=FF=BF=A7=FE=FF=BF=C9=
=FE=FF=BF=E2=FE=FF=BF=ED=FE=FF=BF=F8=FE=FF=BF+=FF=FF=BF=DA=FF=FF=BF")<BR>=
&nbsp;&nbsp;&nbsp;=20
at lv_create_remove.c:42<BR>42&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int =
lv_create (=20
vg_t *vg, lv_t *lv, char *lv_name) {<BR>(gdb) where<BR>#0&nbsp; =
lv_create=20
(vg=3D0x4, lv=3D0xbffff9f4,<BR>&nbsp;&nbsp;&nbsp; lv_name=3D0xbffffa08 =
"<A=20
href=3D"mailto:6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=B5=FB=
=FF=BF=D4=FB=FF=BF=E0=FB=FF=BF=EA=FB=FF=BF&shy;=FD=FF=BF=CC=FD=FF=BF=E6=FD=
=FF=BF=FB=FD=FF=BF\">6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=
=B5=FB=FF=BF=D4=FB=FF=BF=E0=FB=FF=BF=EA=FB=FF=BF&shy;=FD=FF=BF=CC=FD=FF=BF=
=E6=FD=FF=BF=FB=FD=FF=BF\</A><BR>022=FE=FF=BF\035=FE=FF=BFG=FE=FF=BFT=FE=FF=
=BF\\=FE=FF=BFl=FE=FF=BFz=FE=FF=BF\210=FE=FF=BF\231=FE=FF=BF=A7=FE=FF=BF=C9=
=FE=FF=BF=E2=FE=FF=BF=ED=FE=FF=BF=F8=FE=FF=BF+=FF=FF=BF=DA=FF=FF=BF")<BR>=
&nbsp;&nbsp;&nbsp;=20
at lv_create_remove.c:42<BR>#1&nbsp; 0x0804b03d in strcpy ()<BR>#2&nbsp; =

0x40074627 in __libc_start_main (main=3D0x8049390 &lt;strcpy+384&gt;,=20
argc=3D4,<BR>&nbsp;&nbsp;&nbsp; ubp_av=3D0xbffff9f4, init=3D0x8048e88 =
&lt;_init&gt;,=20
fini=3D0x804b4d0 &lt;_fini&gt;,<BR>&nbsp;&nbsp;&nbsp; =
rtld_fini=3D0x4000dcd4=20
&lt;_dl_fini&gt;, stack_end=3D0xbffff9ec)<BR>&nbsp;&nbsp;&nbsp; at=20
../sysdeps/generic/libc-start.c:129<BR>(gdb) quit<BR>The program is=20
running.&nbsp; Exit anyway? (y or n) y<BR><BR>[root@monolith /root]# =
uname=20
-a<BR>Linux monolith 2.4.14 #49 Sat Nov 24 00:27:41 PST 2001 i686=20
unknown</FONT></DIV></BODY></HTML>

------=_NextPart_000_0020_01C1751B.87F1C4A0--
