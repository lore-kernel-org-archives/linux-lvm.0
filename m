Message-ID: <3C028C24.40307@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate seg faults in 1.0.1-r4
References: <002301c1755e$964da0d0$1a00000a@isdesign.com>
Content-Transfer-Encoding: quoted-printable
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
Date: Mon Nov 26 12:37:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

  Hello Tim,

    You have a problem with gcc 2.96 (I have the same problem with a=20
RedHat 7.2 gcc 2.96), Change in the file "<lvm_path_source>/make.tmpl"=20
the line "CFLAGS+=3D -g -O2 -Wall -pg" by "CFLAGS+=3D -g -O0 -Wall -pg" a=
nd=20
recompile the lvm utilities.

Best regards

Francis

Tim Nichols wrote:

> I am having trouble getting lvcreate to work.  I've been able to=20
> create the PV and VG, but lvcreate always core dumps with a seg=20
> fault.   I've confirmed that I have the same code level in the kernel=20
> and tools (1.0.1-rc4).  I've tried compiling the tools with gcc=20
> (v2.96) and egcs (v2.91.66), but both fail.  I'm running a 2.4.14=20
> kernel, lvm as a module, and glibc-2.2.4-19.=20
>
>   The problem seems to be with a corrupt lvol name from what I see in=20
> the gdb output I've attached.
>
> =20
>
>  Any help would be great.
>
> =20
>
>  Tim
>
> =20
>
> [root@monolith /root]# gcc -v
> Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/2.96/specs
> gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-85)
>
> [root@monolith /root]# egcs -v
> Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/spec=
s
> gcc version egcs-2.91.66 19990314/Linux (egcs-1.1.2 release)
>
> [root@monolith /root]# cat /proc/lvm/global
> LVM module LVM version 1.0.1-rc4(03/10/2001)
>
> =20
>
> Total:  1 VG  1 PV  0 LVs (0 LVs open)
> Global: 3175 bytes malloced   IOP version: 10   2:05:33 active
>
> =20
>
> VG:  vg00  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 6635520 /1620 total  0 /0 used  6635520 /1620 free
>   PV:  [AA] hdf1                   6635520 /1620           0 /0       =20
> 6635520 /
> 1620
>     LVs: none
>
> [root@monolith /root]# lvcreate -L 1500 -n lvol1 vg00
> Segmentation fault (core dumped)
>
> [root@monolith /root]# lvcreate -L1500 -nlvol1 vg00
> Segmentation fault (core dumped)
>
> [root@monolith /root]# gdb lvcreate
> GNU gdb 5.0rh-5 Red Hat Linux 7.1
> Copyright 2001 Free Software Foundation, Inc.
> GDB is free software, covered by the GNU General Public License, and=20
> you are
> welcome to change it and/or distribute copies of it under certain=20
> conditions.
> Type "show copying" to see the conditions.
> There is absolutely no warranty for GDB.  Type "show warranty" for=20
> details.
> This GDB was configured as "i386-redhat-linux"...
> (no debugging symbols found)...
> (gdb) run -L1500 -nlvol1 vg00
> Starting program: /sbin/lvcreate -L1500 -nlvol1 vg00
>
> =20
>
> Program received signal SIGSEGV, Segmentation fault.
> lv_create (vg=3D0x4, lv=3D0xbffff9f4,
>     lv_name=3D0xbffffa08 "=20
> 6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=B5=FB=FF=BF=D4=FB=
=FF=BF=E0=FB=FF=BF=EA=FB=FF=BF=AD=FD=FF=BF=CC=FD=FF=BF=E6=FD=FF=BF=FB=FD=FF=
=BF\=20
> <mailto:6%FB%FF%BF@%FB%FF%BFf%FB%FF%BF%7B%FB%FF%BF%5C223%FB%FF%BF%B5%FB=
%FF%BF%D4%FB%FF%BF%E0%FB%FF%BF%EA%FB%FF%BF%AD%FD%FF%BF%CC%FD%FF%BF%E6%FD%=
FF%BF%FB%FD%FF%BF%5C>
> 022=FE=FF=BF\035=FE=FF=BFG=FE=FF=BFT=FE=FF=BF\\=FE=FF=BFl=FE=FF=BFz=FE=FF=
=BF\210=FE=FF=BF\231=FE=FF=BF=A7=FE=FF=BF=C9=FE=FF=BF=E2=FE=FF=BF=ED=FE=FF=
=BF=F8=FE=FF=BF+=FF=FF=BF=DA=FF=FF=BF")
>     at lv_create_remove.c:42
> 42      int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
> (gdb) where
> #0  lv_create (vg=3D0x4, lv=3D0xbffff9f4,
>     lv_name=3D0xbffffa08 "=20
> 6=FB=FF=BF@=FB=FF=BFf=FB=FF=BF{=FB=FF=BF\223=FB=FF=BF=B5=FB=FF=BF=D4=FB=
=FF=BF=E0=FB=FF=BF=EA=FB=FF=BF=AD=FD=FF=BF=CC=FD=FF=BF=E6=FD=FF=BF=FB=FD=FF=
=BF\=20
> <mailto:6%FB%FF%BF@%FB%FF%BFf%FB%FF%BF%7B%FB%FF%BF%5C223%FB%FF%BF%B5%FB=
%FF%BF%D4%FB%FF%BF%E0%FB%FF%BF%EA%FB%FF%BF%AD%FD%FF%BF%CC%FD%FF%BF%E6%FD%=
FF%BF%FB%FD%FF%BF%5C>
> 022=FE=FF=BF\035=FE=FF=BFG=FE=FF=BFT=FE=FF=BF\\=FE=FF=BFl=FE=FF=BFz=FE=FF=
=BF\210=FE=FF=BF\231=FE=FF=BF=A7=FE=FF=BF=C9=FE=FF=BF=E2=FE=FF=BF=ED=FE=FF=
=BF=F8=FE=FF=BF+=FF=FF=BF=DA=FF=FF=BF")
>     at lv_create_remove.c:42
> #1  0x0804b03d in strcpy ()
> #2  0x40074627 in __libc_start_main (main=3D0x8049390 <strcpy+384>, arg=
c=3D4,
>     ubp_av=3D0xbffff9f4, init=3D0x8048e88 <_init>, fini=3D0x804b4d0 <_f=
ini>,
>     rtld_fini=3D0x4000dcd4 <_dl_fini>, stack_end=3D0xbffff9ec)
>     at ../sysdeps/generic/libc-start.c:129
> (gdb) quit
> The program is running.  Exit anyway? (y or n) y
>
> [root@monolith /root]# uname -a
> Linux monolith 2.4.14 #49 Sat Nov 24 00:27:41 PST 2001 i686 unknown
>
