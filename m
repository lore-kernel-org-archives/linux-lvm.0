From: "Markus Baertschi" <markus@markus.org>
In-Reply-To: <20030822122658.H8426@sistina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Segmentation fault in vgscan
Message-Id: <E19q9VM-0002wU-GF@server2.hostpoint.ch>
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
Date: Fri Aug 22 05:52:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Heinz,

I'm=20pretty=20sure=20I've=20tested=20with=201.0.7.=20Look=20at=20the=20li=
nes

>>=20lblsapq00:~=20#=20gdb=20./LVM/1.0.7/tools/vgscan
=20=20...
>>=20(gdb)=20run
>>=20Starting=20program:=20/root/./LVM/1.0.7/tools/vgscan

The=20other=20problem=20is=20that=20this=20is=20at=20a=20customer=20site=20=
on
production=20machines.=20I=20can=20test=20the=20next=20time=20I'm=20there
and=20got=20machine=20time=20to=20do=20some=20testing.=20This=20will=20hap=
pen
as=20soon=20as=20the=20SAN=20support=20guys=20come=20back=20to=20me=20to=20=
solve
the=20undelying=20problem=20(disks=20visible=20twice).

Markus


On=20Fri,=2022=20Aug=202003=2012:26:58=20+0200,=20Heinz=20J=20.=20Mauelsha=
gen=20wrote:

>Markus,

>LVM=200.9=20had=20the=20strncmp()=20call=20in=20line=20148,=201.0.7=20has=
=20it=20in=20line=20155
>which=20makes=20me=20believe=20that=20the=20output=20below=20belongs=20to=
=20a=200.9=20run.

>Please=20retest=20with=201.0.7=20which=20avoids=20hitting=20the=20NULL=20=
pointer=20bug.

>Regards,
>Heinz=20=20=20=20--=20The=20LVM=20Guy=20--


>On=20Thu,=20Aug=2021,=202003=20at=2010:07:57PM=20+0200,=20Markus=20Baerts=
chi=20wrote:
>>=20
>>=20I've=20got=20a=20strange=20problem=20with=20LVM.=20My=20environment=20=
is=20four
>>=20IBM=20x440=20servers=20(2=20CPU,=202G=20memory)=20interconnected=20wi=
th=20two
>>=20fcs=20adapters=20and=20two=20switches=20to=20a=20FastT700=20SAN=20sto=
rage=20array.
>>=20
>>=20Due=20to=20circumstances=20we=20are=20trying=20to=20understand=20the=20=
FCS=20drivers
>>=20did=20show=20our=20disk=20devices=20twice=20(once=20per=20adapter).=20=
This=20is=20a=20problem
>>=20on=20our=20part,=20but=20vgscan=20should=20terminate=20with=20an=20er=
ror=20message
>>=20instead=20of=20a=20segfault.
>>=20
>>=20We've=20started=20out=20with=200.98beta2=20(what=20came=20with=20out=20=
SuSE=207).=20The
>>=20problem=20is=20the=20same=20with=20the=20latest=20tarball=20(1.0.7)=20=
from=20sistina.
>>=20
>>=20Markus
>>=20
>>=20Some=20output=20from=20vgscan:
>>=20<1>=20vg_check_exist_all_vg=20--=20before=20vg_check_exist=20(=20sapq=
vg)
>>=20<22>=20vg_check_exist=20--=20CALLED=20with=20VG:=20sapqvg
>>=20<333>=20vg_check_name=20--=20CALLED=20with=20VG:=20sapqvg
>>=20<4444>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"sapqvg"
>>=20<4444>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
>>=20<333>=20vg_check_name=20--=20LEAVING=20with=20ret:=200
>>=20<22>=20vg_check_exist=20--=20before=20pv_read_all_pv_of_vg
>>=20<333>=20pv_read_all_pv_of_vg=20--=20CALLED=20with=20vg_name:=20"sapqv=
g"
>>=20<4444>=20vg_check_name=20--=20CALLED=20with=20VG:=20sapqvg
>>=20<55555>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"sapqvg"
>>=20<55555>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
>>=20<4444>=20vg_check_name=20--=20LEAVING=20with=20ret:=200
>>=20<4444>=20pv_read_all_pv=20--=20CALLED
>>=20<4444>=20pv_read_all_pv=20--=20avoiding=20multiple=20entries=20in=20c=
ase=20of=20MD;=20np:=200
>>=20<4444>=20pv_read_all_pv=20--=20LEAVING=20with=20ret:=200
>>=20<4444>=20pv_check_consistency=20--=20CALLED
>>=20<55555>=20pv_check_name=20--=20CALLED=20with=20"/dev/sdb1"
>>=20<666666>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"/dev/sdb1"=

>>=20<666666>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
>>=20<666666>=20lvm_check_dev=20--=20CALLED
>>=20<7777777>=20lvm_check_partitioned_dev=20--=20CALLED
>>=20<88888888>=20lvm_get_device_type=20called
>>=20<88888888>=20lvm_get_device_type=20leaving=20with=201
>>=20<7777777>=20lvm_check_partitioned_dev=20--=20LEAVING=20with=20ret:=20=
TRUE
>>=20<666666>=20lvm_check_dev=20--=20LEAVING=20with=20ret:=201
>>=20<55555>=20pv_check_name=20--=20LEAVING=20with=20ret:=200
>>=20<55555>=20vg_check_name=20--=20CALLED=20with=20VG:=20sapqvg
>>=20<666666>=20lvm_check_chars=20--=20CALLED=20with=20name:=20"sapqvg"
>>=20<666666>=20lvm_check_chars=20--=20LEAVING=20with=20ret:=200
>>=20<55555>=20vg_check_name=20--=20LEAVING=20with=20ret:=200
>>=20<55555>=20lvm_check_dev=20--=20CALLED
>>=20<666666>=20lvm_check_partitioned_dev=20--=20CALLED
>>=20<7777777>=20lvm_get_device_type=20called
>>=20<7777777>=20lvm_get_device_type=20leaving=20with=201
>>=20<666666>=20lvm_check_partitioned_dev=20--=20LEAVING=20with=20ret:=20T=
RUE
>>=20<55555>=20lvm_check_dev=20--=20LEAVING=20with=20ret:=201
>>=20<55555>=20pv_check_new=20--=20CALLED
>>=20<55555>=20pv_check_new=20--=20LEAVING=20with=20ret:=200
>>=20<4444>=20pv_check_consistency=20--=20LEAVING=20with=20ret:=200
>>=20<4444>=20pv_read_uuidlist=20--=20CALLED=20with=20/dev/sdb1
>>=20<4444>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=200
>>=20<333>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=200
>>=20<22>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
>>=20<1>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
>>=20<>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
>>=20=20...=20(repeats=20250=20times)=20...
>>=20<>=20lvm_check_uuid=20--=20LEAVING=20with=20ret:=20-1
>>=20<>=20pv_read_uuidlist=20--=20LEAVING=20with=20ret:=202
>>=20Segmentation=20fault
>>=20
>>=20lblsapq00:~=20#=20gdb=20./LVM/1.0.7/tools/vgscan
>>=20GNU=20gdb=205.0
>>=20Copyright=202000=20Free=20Software=20Foundation,=20Inc.
>>=20GDB=20is=20free=20software,=20covered=20by=20the=20GNU=20General=20Pu=
blic=20License,=20and=20you=20are
>>=20welcome=20to=20change=20it=20and/or=20distribute=20copies=20of=20it=20=
under=20certain=20conditions.
>>=20Type=20"show=20copying"=20to=20see=20the=20conditions.
>>=20There=20is=20absolutely=20no=20warranty=20for=20GDB.=20=20Type=20"sho=
w=20warranty"=20for=20details.
>>=20This=20GDB=20was=20configured=20as=20"i386-suse-linux"...
>>=20(gdb)=20run
>>=20Starting=20program:=20/root/./LVM/1.0.7/tools/vgscan
>>=20vgscan=20--=20reading=20all=20physical=20volumes=20(this=20may=20take=
=20a=20while...)
>>=20
>>=20Program=20received=20signal=20SIGSEGV,=20Segmentation=20fault.
>>=200x400c97a3=20in=20strncmp=20()=20from=20/lib/libc.so.6
>>=20(gdb)=20bt
>>=20#0=20=200x400c97a3=20in=20strncmp=20()=20from=20/lib/libc.so.6
>>=20#1=20=200x400337f0=20in=20pv_read_all_pv_of_vg=20(vg_name=3D0x804dc34=
=20"sapqvg",=20pv=3D
>>=200xbfffe948,=20reread=3D1)
>>=20=20=20=20=20at=20pv_read_all_pv_of_vg.c:148
>>=20#2=20=200x40038ac1=20in=20vg_check_exist=20(vg_name=3D0x804dc34=20"sa=
pqvg")=20at=20
>>=20vg_check_exist.c:59
>>=20#3=20=200x40038da2=20in=20vg_check_exist_all_vg=20()=20at=20vg_check_=
exist.c:128
>>=20#4=20=200x8049351=20in=20main=20(argc=3D1,=20argv=3D0xbfffeb64)=20at=20=
vgscan.c:188
>>=20#5=20=200x4006cc5f=20in=20__libc_start_main=20()=20from=20/lib/libc.s=
o.6
>>=20(gdb)=20quit
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20--
>>=20=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=
=20++41=20(21)=20807=201677
>>=20=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20=
Fax=20=20:=20++41=20(21)=20807=201678
>>=20=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
Email:=20markus@markus.org
>>=20=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
Homepage:=20www.markus.org
>>=20
>>=20
>>=20
>>=20_______________________________________________
>>=20linux-lvm=20mailing=20list
>>=20linux-lvm@sistina.com
>>=20http://lists.sistina.com/mailman/listinfo/linux-lvm
>>=20read=20the=20LVM=20HOW-TO=20at=20http://tldp.org/HOWTO/LVM-HOWTO/

>***=20Software=20bugs=20are=20stupid.
>=20=20=20=20Nevertheless=20it=20needs=20not=20so=20stupid=20people=20to=20=
solve=20them=20***

>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-

>Heinz=20Mauelshagen=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Sistina=20Software=20Inc.
>Senior=20Consultant/Developer=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20Am=20Sonnenhang=2011
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
56242=20Marienrachdorf
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
Germany
>Mauelshagen@Sistina.com=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20+49=202626=20141200
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20FAX=20924446
>=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-

>_______________________________________________
>linux-lvm=20mailing=20list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read=20the=20LVM=20HOW-TO=20at=20http://tldp.org/HOWTO/LVM-HOWTO/


--
=20=20Markus=20Baertschi=20=20=20=20=20=20=20=20=20=20=20=20=20Phone:=20++=
41=20(21)=20807=201677
=20=20Bas=20du=20Ross=E9=2014b=20=20=20=20=20=20=20=20=20=20=20=20=20Fax=20=
=20:=20++41=20(21)=20807=201678
=20=20CH-1163,=20Etoy=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Email=
:=20markus@markus.org
=20=20Switzerland=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Hom=
epage:=20www.markus.org
