From: "Markus Baertschi" <markus@markus.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <E19pvj8-0007t3-1V@server2.hostpoint.ch>
Subject: [linux-lvm] Segmentation fault in vgscan
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
Date: Thu Aug 21 15:09:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

I've=20got=20a=20strange=20problem=20with=20LVM.=20My=20environment=20is=20=
four
IBM=20x440=20servers=20(2=20CPU,=202G=20memory)=20interconnected=20with=20=
two
fcs=20adapters=20and=20two=20switches=20to=20a=20FastT700=20SAN=20storage=20=
array.

Due=20to=20circumstances=20we=20are=20trying=20to=20understand=20the=20FCS=
=20drivers
did=20show=20our=20disk=20devices=20twice=20(once=20per=20adapter).=20This=
=20is=20a=20problem
on=20our=20part,=20but=20vgscan=20should=20terminate=20with=20an=20error=20=
message
instead=20of=20a=20segfault.

We've=20started=20out=20with=200.98beta2=20(what=20came=20with=20out=20SuS=
E=207).=20The
problem=20is=20the=20same=20with=20the=20latest=20tarball=20(1.0.7)=20from=
=20sistina.

Markus

Some=20output=20from=20vgscan:
<1>=20vg_check_exist_all_vg=20--=20before=20vg_check_exist=20(=20sapqvg)
<22>=20vg_check_exist=20--=20CALLED=20with=20VG:=20sapqvg
<333>=20vg_check_name=20--=20CALLED=20with=20VG:=20sapqvg
<4444>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"sapqvg"
<4444>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
<333>=20vg_check_name=20--=20LEAVING=20with=20ret:=200
<22>=20vg_check_exist=20--=20before=20pv_read_all_pv_of_vg
<333>=20pv_read_all_pv_of_vg=20--=20CALLED=20with=20vg_name:=20"sapqvg"
<4444>=20vg_check_name=20--=20CALLED=20with=20VG:=20sapqvg
<55555>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"sapqvg"
<55555>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
<4444>=20vg_check_name=20--=20LEAVING=20with=20ret:=200
<4444>=20pv_read_all_pv=20--=20CALLED
<4444>=20pv_read_all_pv=20--=20avoiding=20multiple=20entries=20in=20case=20=
of=20MD;=20np:=200
<4444>=20pv_read_all_pv=20--=20LEAVING=20with=20ret:=200
<4444>=20pv_check_consistency=20--=20CALLED
<55555>=20pv_check_name=20--=20CALLED=20with=20"/dev/sdb1"
<666666>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"/dev/sdb1"
<666666>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
<666666>=20lvm_check_dev=20--=20CALLED
<7777777>=20lvm_check_partitioned_dev=20--=20CALLED
<88888888>=20lvm_get_device_type=20called
<88888888>=20lvm_get_device_type=20leaving=20with=201
<7777777>=20lvm_check_partitioned_dev=20--=20LEAVING=20with=20ret:=20TRUE
<666666>=20lvm_check_dev=20--=20LEAVING=20with=20ret:=201
<55555>=20pv_check_name=20--=20LEAVING=20with=20ret:=200
<55555>=20vg_check_name=20--=20CALLED=20with=20VG:=20sapqvg
<666666>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"sapqvg"
<666666>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
<55555>=20vg_check_name=20--=20LEAVING=20with=20ret:=200
<55555>=20lvm_check_dev=20--=20CALLED
<666666>=20lvm_check_partitioned_dev=20--=20CALLED
<7777777>=20lvm_get_device_type=20called
<7777777>=20lvm_get_device_type=20leaving=20with=201
<666666>=20lvm_check_partitioned_dev=20--=20LEAVING=20with=20ret:=20TRUE
<55555>=20lvm_check_dev=20--=20LEAVING=20with=20ret:=201
<55555>=20pv_check_new=20--=20CALLED
<55555>=20pv_check_new=20--=20LEAVING=20with=20ret:=200
<4444>=20pv_check_consistency=20--=20LEAVING=20with=20ret:=200
<4444>=20pv_read_uuidlist=20--=20CALLED=20with=20/dev/sdb1
<4444>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=200
<333>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=200
<22>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
<1>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
<>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
=20...=20(repeats=20250=20times)=20...
<>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
<>=20pv_read_uuidlist=20--=20LEAVING=20with=20ret:=202
Segmentation=20fault

lblsapq00:~=20#=20gdb=20./LVM/1.0.7/tools/vgscan
GNU=20gdb=205.0
Copyright=202000=20Free=20Software=20Foundation,=20Inc.
GDB=20is=20free=20software,=20covered=20by=20the=20GNU=20General=20Public=20=
License,=20and=20you=20are
welcome=20to=20change=20it=20and/or=20distribute=20copies=20of=20it=20unde=
r=20certain=20conditions.
Type=20"show=20copying"=20to=20see=20the=20conditions.
There=20is=20absolutely=20no=20warranty=20for=20GDB.=20=20Type=20"show=20w=
arranty"=20for=20details.
This=20GDB=20was=20configured=20as=20"i386-suse-linux"...
(gdb)=20run
Starting=20program:=20/root/./LVM/1.0.7/tools/vgscan
vgscan=20--=20reading=20all=20physical=20volumes=20(this=20may=20take=20a=20=
while...)

Program=20received=20signal=20SIGSEGV,=20Segmentation=20fault.
0x400c97a3=20in=20strncmp=20()=20from=20/lib/libc.so.6
(gdb)=20bt
#0=20=200x400c97a3=20in=20strncmp=20()=20from=20/lib/libc.so.6
#1=20=200x400337f0=20in=20pv_read_all_pv_of_vg=20(vg_name=3D0x804dc34=20"s=
apqvg",=20pv=3D
0xbfffe948,=20reread=3D1)
=20=20=20=20at=20pv_read_all_pv_of_vg.c:148
#2=20=200x40038ac1=20in=20vg_check_exist=20(vg_name=3D0x804dc34=20"sapqvg"=
)=20at=20
vg_check_exist.c:59
#3=20=200x40038da2=20in=20vg_check_exist_all_vg=20()=20at=20vg_check_exist=
.c:128
#4=20=200x8049351=20in=20main=20(argc=3D1,=20argv=3D0xbfffeb64)=20at=20vgs=
can.c:188
#5=20=200x4006cc5f=20in=20__libc_start_main=20()=20from=20/lib/libc.so.6
(gdb)=20quit






--
=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=20++=
41=20(21)=20807=201677
=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20Fax=20=
=20:=20++41=20(21)=20807=201678
=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Email=
:=20markus@markus.org
=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Hom=
epage:=20www.markus.org
