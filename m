Message-ID: <3BB1FD5E.4C355E70@divsol.com>
Date: Wed, 26 Sep 2001 10:07:58 -0600
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
References: <3BB14C7D.CDCD9F14@bellatlantic.net> <20010926102702.B25755@tiger.bigcats.invalid>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] 1.0.1-rc2 lvcreate segfaults, pvcreate, vgcreate ok
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I recently pulled 2.4.10, built, installed, and tested ok on a Redhat 7.1=

machine.

then I activated LVM module config, applied 1.0.1-rc2 LVM patches,
rebuilt,
manually corrected 3-ary max(), min() s to 2 arg version, as per

http://lists.sistina.com/pipermail/lvm-devel/2001-September/000657.html


reboot works, insmod lvm-mod installs module as expected,
pvcreate, vgcreate both worked..

lvcreate segfaults however, apparently after nearly completing the LV
setup.

# gdb /sbin/lvcreate
(gdb) r -d -L1000 -nVL_test VG_test
=2E...
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_on_pv -- LEAVING with ret: 1
<22> pv_reserve_pe -- LEAVING with ret: 0
<1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 250  pe:
0
<1> lv_setup_for_create -- pe: 0
<1> lv_setup_for_create -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING

Program received signal SIGSEGV, Segmentation fault.
lv_create (vg=3D0x5, lv=3D0xbffff9f4,
    lv_name=3D0xbffffa0c
":=FB=FF=BFR=FB=FF=BFn=FB=FF=BF\203=FB=FF=BF\233=FB=FF=BF=BD=FB=FF=BF=DC=FB=
=FF=BF=E8=FB=FF=BF=F2=FB=FF=BF=B5=FD=FF=BF=D4=FD=FF=BF=EE=FD=FF=BF\003=FE=
=FF=BF\032=FE=FF=BF%=FE=FF=BF0=FE=FF=BF=3D=FE=FF=BFE=FE=FF=BFU=FE=FF=BFc=FE=
=FF=BFq=FE=FF=BF\202=FE=FF=BF\220=FE=FF=BF=B2=FE=FF=BF=CB=FE=FF=BF=D6=FE=FF=
=BF=E1=FE=FF=BF\024=FF=FF=BF")
at lv_create_remove.c:42
42 int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
(gdb) bt
#0  lv_create (vg=3D0x5, lv=3D0xbffff9f4,
    lv_name=3D0xbffffa0c
":=FB=FF=BFR=FB=FF=BFn=FB=FF=BF\203=FB=FF=BF\233=FB=FF=BF=BD=FB=FF=BF=DC=FB=
=FF=BF=E8=FB=FF=BF=F2=FB=FF=BF=B5=FD=FF=BF=D4=FD=FF=BF=EE=FD=FF=BF\003=FE=
=FF=BF\032=FE=FF=BF%=FE=FF=BF0=FE=FF=BF=3D=FE=FF=BFE=FE=FF=BFU=FE=FF=BFc=FE=
=FF=BFq=FE=FF=BF\202=FE=FF=BF\220=FE=FF=BF=B2=FE=FF=BF=CB=FE=FF=BF=D6=FE=FF=
=BF=E1=FE=FF=BF\024=FF=FF=BF")
at lv_create_remove.c:42
#1  0x0804b03d in strcpy () at ../sysdeps/generic/strcpy.c:31
#2  0x40079177 in __libc_start_main (main=3D0x8049390 <strcpy+384>, argc=3D=
5,
ubp_av=3D0xbffff9f4, init=3D0x8048e88 <_init>,
    fini=3D0x804b4d0 <_fini>, rtld_fini=3D0x4000e184 <_dl_fini>,
stack_end=3D0xbffff9ec) at ../sysdeps/generic/libc-start.c:129
(gdb)
(gdb) list
37
38 /* internal function */
39 int lv_create_remove ( vg_t *, lv_t *, char *, int);
40
41
42 int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {
43    return lv_create_remove ( vg, lv, lv_name, LV_CREATE);
44 }
45
46
(gdb)

(gdb) up
#1  0x0804b03d in strcpy () at ../sysdeps/generic/strcpy.c:31
31 ../sysdeps/generic/strcpy.c: No such file or directory.
 in ../sysdeps/generic/strcpy.c


Apriori, it looks like lv_name is uninitialized.  But it runs pretty far
before choking.

looking deeper;

(gdb) b lv_create
(gdb) b strcpy
(gdb) r
=2E...
<4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
<333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<22> vg_cfgrestore -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- before vg.pv_cur check with vg.pv_cur: 1
pv_count: 1
<22> vg_free -- CALLED
<22> vg_free -- entering PV loop
<22> vg_free -- entering LV loop
<22> vg_free -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 1
<1> vg_check_active -- CALLED with VG: VG_test
<22> vg_check_name -- CALLED with VG: VG_test
<333> lvm_check_chars -- CALLED with name: "VG_test"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: VG_test
<333> vg_check_name -- CALLED with VG: VG_test
<4444> lvm_check_chars -- CALLED with name: "VG_test"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: 0
<1> vg_check_active -- LEAVING with ret: 1
<1> lv_check_name -- CALLED with lv_name: "/dev/VG_test/VL_test"
<22> lvm_check_chars -- CALLED with name: "/dev/VG_test/VL_test"
<22> lvm_check_chars -- LEAVING with ret: 0

Breakpoint 1, strcpy (dest=3D0xbfffecc0
"dm\001@=F5=DA=D1\013\2137\001@0=ED=FF=BF\020l\001@=D1\210\004\b=ECq\001@=
=FF=FF=FF=FF",
    src=3D0xbffff650 "/dev/VG_test/VL_test") at
=2E./sysdeps/generic/strcpy.c:34
34 ../sysdeps/generic/strcpy.c: No such file or directory.
 in ../sysdeps/generic/strcpy.c
(gdb)
(gdb) frame
#0  strcpy (dest=3D0xbfffecc0
"dm\001@=F5=DA=D1\013\2137\001@0=ED=FF=BF\020l\001@=D1\210\004\b=ECq\001@=
=FF=FF=FF=FF",
src=3D0xbffff650 "/dev/VG_test/VL_test")
    at ../sysdeps/generic/strcpy.c:34
34 in ../sysdeps/generic/strcpy.c
(gdb)

so - string is initialized, at least to start


I cant get any more insight at this time, HTH
