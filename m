From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Segmentation fault in vgscan
Message-ID: <20030822122658.H8426@sistina.com>
References: <E19pvj8-0007t3-1V@server2.hostpoint.ch>
Mime-Version: 1.0
In-Reply-To: <E19pvj8-0007t3-1V@server2.hostpoint.ch>; from markus@markus.org on Thu, Aug 21, 2003 at 10:07:57PM +0200
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
Date: Fri Aug 22 05:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Markus,

LVM 0.9 had the strncmp() call in line 148, 1.0.7 has it in line 155
which makes me believe that the output below belongs to a 0.9 run.

Please retest with 1.0.7 which avoids hitting the NULL pointer bug.

Regards,
Heinz    -- The LVM Guy --


On Thu, Aug 21, 2003 at 10:07:57PM +0200, Markus Baertschi wrote:
>=20
> I've got a strange problem with LVM. My environment is four
> IBM x440 servers (2 CPU, 2G memory) interconnected with two
> fcs adapters and two switches to a FastT700 SAN storage array.
>=20
> Due to circumstances we are trying to understand the FCS drivers
> did show our disk devices twice (once per adapter). This is a problem
> on our part, but vgscan should terminate with an error message
> instead of a segfault.
>=20
> We've started out with 0.98beta2 (what came with out SuSE 7). The
> problem is the same with the latest tarball (1.0.7) from sistina.
>=20
> Markus
>=20
> Some output from vgscan:
> <1> vg_check_exist_all_vg -- before vg_check_exist ( sapqvg)
> <22> vg_check_exist -- CALLED with VG: sapqvg
> <333> vg_check_name -- CALLED with VG: sapqvg
> <4444> lvm_check_chars -- CALLED with name: "sapqvg"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_check_exist -- before pv_read_all_pv_of_vg
> <333> pv_read_all_pv_of_vg -- CALLED with vg_name: "sapqvg"
> <4444> vg_check_name -- CALLED with VG: sapqvg
> <55555> lvm_check_chars -- CALLED with name: "sapqvg"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> pv_read_all_pv -- CALLED
> <4444> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
> <4444> pv_read_all_pv -- LEAVING with ret: 0
> <4444> pv_check_consistency -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdb1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <7777777> lvm_check_partitioned_dev -- CALLED
> <88888888> lvm_get_device_type called
> <88888888> lvm_get_device_type leaving with 1
> <7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED with VG: sapqvg
> <666666> lvm_check_chars -- CALLED with name: "sapqvg"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <666666> lvm_check_partitioned_dev -- CALLED
> <7777777> lvm_get_device_type called
> <7777777> lvm_get_device_type leaving with 1
> <666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_new -- CALLED
> <55555> pv_check_new -- LEAVING with ret: 0
> <4444> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_read_uuidlist -- CALLED with /dev/sdb1
> <4444> lvm_check_uuid -- LEAVING with ret: 0
> <333> lvm_check_uuid -- LEAVING with ret: 0
> <22> lvm_check_uuid -- LEAVING with ret: -1
> <1> lvm_check_uuid -- LEAVING with ret: -1
> <> lvm_check_uuid -- LEAVING with ret: -1
>  ... (repeats 250 times) ...
> <> lvm_check_uuid -- LEAVING with ret: -1
> <> pv_read_uuidlist -- LEAVING with ret: 2
> Segmentation fault
>=20
> lblsapq00:~ # gdb ./LVM/1.0.7/tools/vgscan
> GNU gdb 5.0
> Copyright 2000 Free Software Foundation, Inc.
> GDB is free software, covered by the GNU General Public License, and yo=
u are
> welcome to change it and/or distribute copies of it under certain condi=
tions.
> Type "show copying" to see the conditions.
> There is absolutely no warranty for GDB.  Type "show warranty" for deta=
ils.
> This GDB was configured as "i386-suse-linux"...
> (gdb) run
> Starting program: /root/./LVM/1.0.7/tools/vgscan
> vgscan -- reading all physical volumes (this may take a while...)
>=20
> Program received signal SIGSEGV, Segmentation fault.
> 0x400c97a3 in strncmp () from /lib/libc.so.6
> (gdb) bt
> #0  0x400c97a3 in strncmp () from /lib/libc.so.6
> #1  0x400337f0 in pv_read_all_pv_of_vg (vg_name=3D0x804dc34 "sapqvg", p=
v=3D
> 0xbfffe948, reread=3D1)
>     at pv_read_all_pv_of_vg.c:148
> #2  0x40038ac1 in vg_check_exist (vg_name=3D0x804dc34 "sapqvg") at=20
> vg_check_exist.c:59
> #3  0x40038da2 in vg_check_exist_all_vg () at vg_check_exist.c:128
> #4  0x8049351 in main (argc=3D1, argv=3D0xbfffeb64) at vgscan.c:188
> #5  0x4006cc5f in __libc_start_main () from /lib/libc.so.6
> (gdb) quit
>=20
>=20
>=20
>=20
>=20
>=20
> --
>   Markus Baertschi             Phone: ++41 (21) 807 1677
>   Bas du Ross=E9 14b             Fax  : ++41 (21) 807 1678
>   CH-1163, Etoy                Email: markus@markus.org
>   Switzerland                  Homepage: www.markus.org
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
