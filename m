From: Tracy R Reed <treed@copilotconsulting.com>
Message-ID: <20030915030139.A11888@copilotconsulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
Subject: [linux-lvm] Kernel oops
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
Date: Mon Sep 15 06:49:03 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linux home 2.4.20 #18 SMP Fri Sep 12 22:49:21 PDT 2003 i686 GNU/Linux
home:~# lvcreate --version
  LVM version:     1.95.15 (2003-01-10)
  Library version: 0.96.07-ioctl-cvs (2002-11-21)
  Driver version:  1.0.8

I created a script to take daily snapshots of my four logical volumes for
backup purposes. Approximately every other time I run it the whole lvm
system seems to freeze up. The first time it did this it crashed the whole
computer by not allowing any writes to disk. The second two times the
system didn't crash but I now have hung lvremove and lvcreate processes
which appear to require a reboot to clear. strace on the processes shows
nothing happening and kill -9 has no effect. In the dmesg I have lots of
"invalidate: busy buffer" and then a kernel oops:

Unable to handle kernel NULL pointer dereference at virtual address
00000001
 printing eip:
ce6a16d0
*pde =3D 00000000
Oops: 0002
CPU:    1
EIP:    0010:[<ce6a16d0>]    Tainted: P
EFLAGS: 00010202
eax: ce6a16d0   ebx: ce6a16a0   ecx: 00000010   edx: ce6a16d0
esi: 00000001   edi: 00000000   ebp: c023c230   esp: df6c3f3c
ds: 0018   es: 0018   ss: 0018
Process kcopyd (pid: 69, stackpage=3Ddf6c3000)
Stack: c023b83a ce6a16d0 00000001 00000001 00000b76 00000000 0000001b
00000000
       c7cc3c10 cda29004 00000010 c023a52f d41f3e8c c7c7b218 c023a4e0
c7c7b218
       c023c891 00000000 c7c7b218 cda29004 c031f858 c023c240 cda29004
c023c394
Call Trace:    [<c023b83a>] [<c023a52f>] [<c023a4e0>] [<c023c891>]
[<c023c240>]
  [<c023c394>] [<c023c424>] [<c023c230>] [<c023c535>] [<c01075ee>]
[<c023c480>]
=20
Code: d0 16 6a ce d0 16 6a ce 00 00 00 00 69 dd 63 00 8c ff 7c f9

This seems to be a reproduceable problem. I was under the impression that
LVM was fairly stable by this point. The first crash happened in the
middle of a backup that had been running for 48 hours which I will now
have to restart. Not too happy. :( Uh oh...now the system can't write to
disk again and I will have to reboot.=20

--=20
Tracy Reed
http://copilotconsulting.com

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj9ljgMACgkQ9PIYKZYVAq0dygCfWRuYGllsezgyuOh19L/3dbeI
IycAn0kBGtYIUmDDDy7e3MnX3qLEXDDt
=ttiV
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
