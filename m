Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0FDL4O13880
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 08:21:04 -0500
Received: from comm.hcsd.de (comm-ext2.hcsd.de [217.146.142.51])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0FDKvpI017942
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 08:20:58 -0500
Received: from hopper.hcsd.de (hopper.hcsd.de
	[IPv6:2001:8d0:1000:1000:230:48ff:fe31:231c])
	by comm.hcsd.de (8.13.2/8.13.2/Debian-1) with ESMTP id j0FDKt2O017774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 14:20:55 +0100
Received: from hopper.hcsd.de (localhost [127.0.0.1])
	by hopper.hcsd.de (8.13.2/8.13.2/Debian-1) with ESMTP id j0FDKtBP019054
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 14:20:55 +0100
Received: (from au@localhost)
	by hopper.hcsd.de (8.13.2/8.13.2/Submit) id j0FDKtFZ019053
	for linux-lvm@redhat.com; Sat, 15 Jan 2005 14:20:55 +0100
Date: Sat, 15 Jan 2005 14:20:55 +0100
From: Stephan =?iso-8859-1?Q?Austerm=FChle?= <au@hcsd.de>
Message-ID: <20050115132055.GA18967@hcsd.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
Subject: [linux-lvm] Kernel bug with snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

in the last days I played around with Kernel 2.6.9, LVM2, and multiple
snapshots of the Logical Volume leading to some system freezes. The
Volume Group is setup on top of a mirrored device (md). I decided to
switch to kernel 2.6.11-rc1 with Device Mapper patches 2.6.10-udm1
(without patch 29) and test again.

What I did was:

1. created a 2 GByte LV (lv_test) with XFS and mounted the filesystem.
2. Wrote some data to lv_test.
3. Created snapshot using

	lvcreate -L 200M -p r -n lv_snap_01 /dev/vg00/lv_test

4. Mounted lv_snap_01 (read only, no uuid)
5. Removed some files and wrote some data to lv_test
6. Created snapshot lv_snap_02 and mounted it (read only, no uuid)
7. Repeated step 5 and created snapshot lv_snap_03
8. Wrote some data (about 30 MByte) to lv_test
9. While kcopyd(?) was running I tried to remove lv_snap_01:

	lvremove -f /dev/vg00/lv_snap_01

The lvremove instruction terminated with

	Segmentation fault

and I received the following kernel messages on console:

	------------[ cut here ]------------
	kernel BUG at drivers/md/kcopyd.c:145!
	invalid operand: 0000 [#1]
	Modules linked in: nfs lockd sunrpc autofs4 8250 serial_core md5 ipv6 uhci=
_hcd usbcore 3c59x mii unix
	CPU:    0
	EIP:    0060:[<c0281989>]    Not tainted VLI
	EFLAGS: 00010287   (2.6.11-rc1-udm1)=20
	EIP is at client_free_pages+0x39/0x50
	eax: 00000100   ebx: d1b6eb20   ecx: d9ad1820   edx: 00000000
	esi: e19a4040   edi: 00000000   ebp: cec0defc   esp: cec0def4
	ds: 007b   es: 007b   ss: 0068
	Process lvremove (pid: 1926, threadinfo=3Dcec0c000 task=3Dd98e4060)
	Stack: d1b6eb20 d1b6eb20 cec0df0c c028237f d1b6eb20 da370b60 cec0df24 c028=
2db4=20
	       d1b6eb20 d1b6ed40 e19a4040 d98cac20 cec0df40 c027c846 e19a4040 0000=
0000=20
	       dd529940 e085b000 00000004 cec0df54 c027e81d d98cac20 00000000 c037=
3fa0=20
	Call Trace:
	 [<c010325f>] show_stack+0x7f/0xa0
	 [<c01033fa>] show_registers+0x15a/0x1c0
	 [<c01035ce>] die+0xce/0x150
	 [<c0103a69>] do_invalid_op+0xb9/0xd0
	 [<c0102eeb>] error_code+0x2b/0x30
	 [<c028237f>] kcopyd_client_destroy+0x1f/0x38
	 [<c0282db4>] snapshot_dtr+0x74/0x90
	 [<c027c846>] table_destroy+0xa6/0xc0
	 [<c027e81d>] __hash_remove+0x5d/0x80
	 [<c027f040>] dev_remove+0x50/0xd0
	 [<c028066e>] ctl_ioctl+0xde/0x140
	 [<c015ed05>] sys_ioctl+0xa5/0x220
	 [<c01024d7>] syscall_call+0x7/0xb
	Code: 0c 39 43 10 75 25 8b 43 08 89 04 24 e8 51 ff ff ff c7 43 08 00 00 00=
 00 c7 43 0c 00 00 00 00 c7 43 10 00 00 00 00 8b 5d fc c9 c3 <0f> 0b 91 00 =
6c f4 2f c0 eb d1 8d b6 00 00 00 00 8d bc 27 00 00=20
	 <1>Unable to handle kernel paging request at virtual address e19a74b0
	 printing eip:
	c0283fae
	*pde =3D 0152e067
	*pte =3D 00000000
	Oops: 0002 [#2]
	Modules linked in: nfs lockd sunrpc autofs4 8250 serial_core md5 ipv6 uhci=
_hcd usbcore 3c59x mii unix
	CPU:    0
	EIP:    0060:[<c0283fae>]    Not tainted VLI
	EFLAGS: 00010282   (2.6.11-rc1-udm1)=20
	EIP is at write_exception+0x2e/0x50
	eax: 000064a6   ebx: d94e9ebc   ecx: e19a74b0   edx: 00000000
	esi: 00000000   edi: cedb73bc   ebp: d94e9ea8   esp: d94e9e9c
	ds: 007b   es: 007b   ss: 0068
	Process kcopyd (pid: 1749, threadinfo=3Dd94e8000 task=3Dda066590)
	Stack: d4360da0 0000014b d4360da0 d94e9ed8 c02842c5 d4360da0 0000014b d94e=
9ebc=20
	       000064a6 00000000 0000505b 00000000 cedba944 00000000 cedb73bc d94e=
9ef0=20
	       c0283122 da370bac cedb73bc c02830d0 cedb73bc d94e9f18 c0281b10 0000=
0000=20
	Call Trace:
	 [<c010325f>] show_stack+0x7f/0xa0
	 [<c01033fa>] show_registers+0x15a/0x1c0
	 [<c01035ce>] die+0xce/0x150
	 [<c0111fdb>] do_page_fault+0x31b/0x66f
	 [<c0102eeb>] error_code+0x2b/0x30
	 [<c02842c5>] persistent_commit+0x45/0x100
	 [<c0283122>] copy_callback+0x42/0x50
	 [<c0281b10>] run_complete_job+0x60/0x70
	 [<c0281d14>] process_jobs+0x44/0xb0
	 [<c0281d9a>] do_work+0x1a/0x50
	 [<c0125513>] worker_thread+0x183/0x220
	 [<c0128f5a>] kthread+0xaa/0xb0
	 [<c0100881>] kernel_thread_helper+0x5/0x14
	Code: 83 ec 0c 8b 45 0c 89 5d fc 8b 5d 10 89 44 24 04 8b 45 08 89 04 24 e8=
 72 ff ff ff 89 c1 b8 ea ff ff ff 85 c9 74 18 8b 03 8b 53 04 <89> 01 89 51 =
04 8b 43 08 8b 53 0c 89 41 08 31 c0 89 51 0c 8b 5d=20

Looks likes a bug...

Kind regards,

Stephan

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFB6Ri3+QMu5be4tHkRAqV5AJ9HkXAzjkmGFWphIibinzvebzXyOQCfbJUa
Ztg+vD82kZG1ZxlwT5LS2tw=
=uD00
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
