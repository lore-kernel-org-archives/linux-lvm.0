From: Stefan Fent <sf@suse.de>
Message-ID: <Pine.LNX.4.32.0110221243510.27769-100000@omega.suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Subject: [linux-lvm] LVM on IA64
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
Date: Mon Oct 22 06:00:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Linux-LVM@Sistina.com

Hi,

On IA64 lvcreate segfaults when 'lv_allocated_le'
is bigger than 1 (mostly 125).
I need information about where this value is created, and what it is good
for, as this seem to happen randomly.

It segfaults in vg_cfgrestore() at:

if ( ( vg->lv[l]->lv_current_pe =3D
                   malloc ( vg->lv[l]->lv_allocated_le * \
                            sizeof ( pe_t))) =3D=3D NULL) {


where vg->lv[l]->lv_allocated_le=3D=3D125
gdb backtrace:

Program received signal SIGSEGV, Segmentation fault.
0x20000000001a0fd1 in chunk_alloc () from /lib/libc.so.6.1
(gdb) bt
#0  0x20000000001a0fd1 in chunk_alloc () from /lib/libc.so.6.1
#1  0x200000000019f720 in malloc () from /lib/libc.so.6.1
#2  0x200000000007af10 in vg_cfgrestore (vg_name=3D0x80000fffffffb9d4
"volg02",
    vg_backup_path=3D0x80000fffffffa870 "/etc/lvmtab.d/volg02", opt_v=3D0,
vg=3D0x20000000000aab30)
    at vg_cfgrestore.c:177
#3  0x2000000000067540 in lvm_tab_vg_read_with_pv_and_lv
(vg_name=3D0x80000fffffffb9d4 "volg02",
    vg=3D0x80000fffffffae38) at lvm_tab_vg_read_with_pv_and_lv.c:60
#4  0x4000000000008420 in main (argc=3D3, argv=3D0x80000fffffffb728) at
libio.h:633
(gdb)

any help appreciated.

Kernel is 2.4.7 with LVM-drivers 0.9.1_beta7
lvm is 1.0.1-rc2

Mit freundlichen Gr=FCssen / With kind regards,

        Stefan Fent

--=20
SuSE GmbH,             Tel:   +49-911-7405331
Schanzaeckerstr. 10,   Fax:   +49-911-3206727
90443 Nuernberg,       Email: sf@suse.de
Germany                WWW:   http://www.suse.de

 warning: declaration does not declare anything
