Message-ID: <000a01c2d9f9$8eeaecc0$385545c0@loren2>
From: "Loren Flath" <loren@ndr.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C2D9CF.A5C87270"
Subject: [linux-lvm] AS 2.1 Latest Kernel and LVM
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
Date: Sat Feb 22 10:41:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0007_01C2D9CF.A5C87270
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Folks, it it possible to use the latest AS kernel (2.4.9-e.12) with =
lvm-1.0.6? I am having a problem with
the 1.0.6 patch. Here is the problem after the patch:

Thanks for any help you can give me..

Loren Flath
Ned Davis Research, Inc
Loren@ndr.com

drivers/md/mddev.o: In function `add_gendisk':
drivers/md/mddev.o(.text+0x5832): undefined reference to `gendisk_head'
drivers/md/mddev.o(.text+0x5879): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `del_gendisk':
drivers/md/mddev.o(.text+0x5892): undefined reference to `gendisk_head'
drivers/md/mddev.o: In function `lvm_init':
drivers/md/mddev.o(.text+0x5961): undefined reference to `lvm_init_fs'
drivers/md/mddev.o: In function `lvm_cleanup':
drivers/md/mddev.o(.text+0x5a2b): undefined reference to `lvm_fin_fs'
drivers/md/mddev.o: In function `lvm_do_vg_create':
drivers/md/mddev.o(.text+0x76c0): undefined reference to =
`lvm_fs_create_vg'
drivers/md/mddev.o: In function `lvm_do_vg_rename':
drivers/md/mddev.o(.text+0x7c80): undefined reference to =
`lvm_fs_remove_vg'
drivers/md/mddev.o(.text+0x7e84): undefined reference to =
`lvm_fs_create_vg'
drivers/md/mddev.o(.text+0x7ec0): undefined reference to =
`lvm_fs_create_pv'
drivers/md/mddev.o(.text+0x7f22): undefined reference to =
`lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_do_vg_remove':
drivers/md/mddev.o(.text+0x7fbb): undefined reference to =
`lvm_fs_remove_vg'
drivers/md/mddev.o: In function `lvm_do_pv_create':
drivers/md/mddev.o(.text+0x81de): undefined reference to =
`lvm_fs_create_pv'
drivers/md/mddev.o: In function `lvm_do_pv_remove':
drivers/md/mddev.o(.text+0x8218): undefined reference to =
`lvm_fs_remove_pv'
drivers/md/mddev.o: In function `lvm_do_lv_create':
drivers/md/mddev.o(.text+0x8ba8): undefined reference to =
`lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_do_lv_remove':
drivers/md/mddev.o(.text+0x8ce7): undefined reference to =
`lvm_fs_remove_lv'
drivers/md/mddev.o: In function `lvm_do_lv_rename':
drivers/md/mddev.o(.text+0x9d1c): undefined reference to =
`lvm_fs_remove_lv'
drivers/md/mddev.o(.text+0x9d3b): undefined reference to =
`lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_snapshot_alloc':
drivers/md/mddev.o(.text+0xaa31): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xaa64): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xaaa3): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xaaca): undefined reference to `free_kiovec'
drivers/md/mddev.o: In function `lvm_snapshot_release':
drivers/md/mddev.o(.text+0xab65): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xab9a): undefined reference to `free_kiovec'
make[1]: *** [kallsyms] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.9-e.12'
make: *** [vmlinux] Error 2
------=_NextPart_000_0007_01C2D9CF.A5C87270
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4916.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#c8e0d8>
<DIV><FONT face=3DArial size=3D2>Folks, it it possible to use the latest =
AS kernel=20
(2.4.9-e.12) with lvm-1.0.6? I am having a problem with</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the 1.0.6 patch. Here is the problem =
after the=20
patch:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for any help you can give =
me..</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Loren Flath</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Ned Davis Research, Inc</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Loren@ndr.com</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>drivers/md/mddev.o: In function=20
`add_gendisk':<BR>drivers/md/mddev.o(.text+0x5832): undefined reference =
to=20
`gendisk_head'<BR>drivers/md/mddev.o(.text+0x5879): undefined reference =
to=20
`gendisk_head'<BR>drivers/md/mddev.o: In function=20
`del_gendisk':<BR>drivers/md/mddev.o(.text+0x5892): undefined reference =
to=20
`gendisk_head'<BR>drivers/md/mddev.o: In function=20
`lvm_init':<BR>drivers/md/mddev.o(.text+0x5961): undefined reference to=20
`lvm_init_fs'<BR>drivers/md/mddev.o: In function=20
`lvm_cleanup':<BR>drivers/md/mddev.o(.text+0x5a2b): undefined reference =
to=20
`lvm_fin_fs'<BR>drivers/md/mddev.o: In function=20
`lvm_do_vg_create':<BR>drivers/md/mddev.o(.text+0x76c0): undefined =
reference to=20
`lvm_fs_create_vg'<BR>drivers/md/mddev.o: In function=20
`lvm_do_vg_rename':<BR>drivers/md/mddev.o(.text+0x7c80): undefined =
reference to=20
`lvm_fs_remove_vg'<BR>drivers/md/mddev.o(.text+0x7e84): undefined =
reference to=20
`lvm_fs_create_vg'<BR>drivers/md/mddev.o(.text+0x7ec0): undefined =
reference to=20
`lvm_fs_create_pv'<BR>drivers/md/mddev.o(.text+0x7f22): undefined =
reference to=20
`lvm_fs_create_lv'<BR>drivers/md/mddev.o: In function=20
`lvm_do_vg_remove':<BR>drivers/md/mddev.o(.text+0x7fbb): undefined =
reference to=20
`lvm_fs_remove_vg'<BR>drivers/md/mddev.o: In function=20
`lvm_do_pv_create':<BR>drivers/md/mddev.o(.text+0x81de): undefined =
reference to=20
`lvm_fs_create_pv'<BR>drivers/md/mddev.o: In function=20
`lvm_do_pv_remove':<BR>drivers/md/mddev.o(.text+0x8218): undefined =
reference to=20
`lvm_fs_remove_pv'<BR>drivers/md/mddev.o: In function=20
`lvm_do_lv_create':<BR>drivers/md/mddev.o(.text+0x8ba8): undefined =
reference to=20
`lvm_fs_create_lv'<BR>drivers/md/mddev.o: In function=20
`lvm_do_lv_remove':<BR>drivers/md/mddev.o(.text+0x8ce7): undefined =
reference to=20
`lvm_fs_remove_lv'<BR>drivers/md/mddev.o: In function=20
`lvm_do_lv_rename':<BR>drivers/md/mddev.o(.text+0x9d1c): undefined =
reference to=20
`lvm_fs_remove_lv'<BR>drivers/md/mddev.o(.text+0x9d3b): undefined =
reference to=20
`lvm_fs_create_lv'<BR>drivers/md/mddev.o: In function=20
`lvm_snapshot_alloc':<BR>drivers/md/mddev.o(.text+0xaa31): undefined =
reference=20
to `alloc_kiovec'<BR>drivers/md/mddev.o(.text+0xaa64): undefined =
reference to=20
`alloc_kiovec'<BR>drivers/md/mddev.o(.text+0xaaa3): undefined reference =
to=20
`free_kiovec'<BR>drivers/md/mddev.o(.text+0xaaca): undefined reference =
to=20
`free_kiovec'<BR>drivers/md/mddev.o: In function=20
`lvm_snapshot_release':<BR>drivers/md/mddev.o(.text+0xab65): undefined =
reference=20
to `free_kiovec'<BR>drivers/md/mddev.o(.text+0xab9a): undefined =
reference to=20
`free_kiovec'<BR>make[1]: *** [kallsyms] Error 1<BR>make[1]: Leaving =
directory=20
`/usr/src/linux-2.4.9-e.12'<BR>make: *** [vmlinux] Error=20
2</FONT></DIV></BODY></HTML>

------=_NextPart_000_0007_01C2D9CF.A5C87270--
