Message-ID: <D4B8B90F5DE4D511ADC40002A5097AA2109297@SPAWN>
From: "Machon, Anthony" <amachon@cereva.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Looks like I have a problem with the dynamic linking with "lvcrea
 te"
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
Date: Fri Nov  9 08:45:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "'Linux-LVM@sistina.com'" <Linux-LVM@sistina.com>

Stock RH 7.1 system, with GFS,LVM from sistina.=20

When I move the lv_create function into lvcreate.c there is no problem =
with
parameter passing,
when it is in its true place in the library, the parameters get mangled

I'm assuming I have a configuration problem any idea what.=20


[root@GFSserver2 amachon]# cat /proc/modules
lvm-mod                47104   1
gfs                   191936   1
memexp                 68016   1
lock_harness            3472   0 [gfs memexp]
stomith                 3776   1 [memexp]
pool                   37440   4 [memexp]
lpfcdd                182960   2
[root@GFSserver2 amachon]#=20

[root@GFSserver2 amachon]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda8" of VG "vgatest" [3.51 GB / 3.51 GB =
free]
pvscan -- ACTIVE   PV "/dev/hda9" of VG "vgatest" [4.56 GB / 4.56 GB =
free]
pvscan -- total: 2 [8.08 GB] / in use: 2 [8.08 GB] / in no VG: 0 [0]


[root@GFSserver2 amachon]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vgatest"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your =
volume
group

[root@GFSserver2 amachon]# lvcreate -L1500 -n testlv vgatest
Segmentation fault (core dumped)



Tony Machon=20
+1 508 787 5687=20

------------------------------------------------------------------------=
----
----------------------/
[root@GFSserver2 tools]# gdb /gfs/LVM/1.0.1-rc4/tools/lvcreate
GNU gdb 5.0rh-5 Red Hat Linux 7.1
Copyright 2001 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and =
you are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for =
details.
This GDB was configured as "i386-redhat-linux"...
(gBreakpoint 1, lv_create (vg=3D0x5, lv=3D0xbffffad4,=20
    lv_name=3D0xbffffaec
"\020=FC=FF=BF-=FC=FF=BF?=FC=FF=BFX=FC=FF=BFl=FC=FF=BF\216=FC=FF=BF\233=FC=
=FF=BF^=FE=FF=BF}=FE=FF=BF\232=FE=FF=BF=AF=FE=FF=BF=CE=FE=FF=BF=D9=FE=FF=
=BF=F3=FE=FF=BF\003=FF=FF=BF
\013=FF=FF=BF\e=FF=FF=BF)=FF=FF=BF:=FF=FF=BFH=FF=FF=BFS=FF=FF=BF^=FF=FF=BF=
\221=FF=FF=BF")
    at lv_create_remove.c:42
42      int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
(gdb) up
#1  0x0804b03d in main (argc=3D5, argv=3D0xbffffad4) at lvcreate.c:791

791        if ( ( ret =3D lv_create ( vg, vg->lv[l], =
vg->lv[l]->lv_name)) < 0)
{
(gdb) p vg
$1 =3D (vg_t *) 0x4004eae0
(gdb) p vg->lv[l]
$2 =3D (lv_t *) 0x8055a88
(gdb) p vg->lv[l]->lv_name
$3 =3D "/dev/vgatest/testlv", '\000' <repeats 33 times>, =
"=E0\233\027@=FF=FF=FF=FF",
'\000' <repeats 12 times>, " =
[\005\b=FF=FF=FF=FF=FF=FF=FF=FF\000\000\000\0008[\005\b=FF=FF=FF=FF",
'\000' <repeats 31 times>
(gdb)




(gdb) si
0x08048ea6 in _init ()
(gdb) si
0x4000d9a0      203     dl-runtime.c: No such file or directory.
        in dl-runtime.c
(gdb) n

Program received signal SIGSEGV, Segmentation fault.
lv_create (vg=3D0x6, lv=3D0xbffffad4,=20
    lv_name=3D0xbffffaf0
"\026=FC=FF=BF-=FC=FF=BF?=FC=FF=BFX=FC=FF=BFl=FC=FF=BF\216=FC=FF=BF\233=FC=
=FF=BF^=FE=FF=BF}=FE=FF=BF\232=FE=FF=BF=AF=FE=FF=BF=CE=FE=FF=BF=D9=FE=FF=
=BF=F3=FE=FF=BF\003=FF=FF=BF
\013=FF=FF=BF\e=FF=FF=BF)=FF=FF=BF:=FF=FF=BFH=FF=FF=BFS=FF=FF=BF^=FF=FF=BF=
\221=FF=FF=BF")
    at lv_create_remove.c:42
42      int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
\
(gdb)=20
