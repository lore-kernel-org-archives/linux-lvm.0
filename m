Date: Sun, 12 Mar 2000 13:58:31 -0800
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: [linux-lvm] OOPS
Message-ID: <20000312135831.A2509@cyberhqz.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Kernel is 2.2.14 with 0.8i LVM patch, and Solar Designer's security
patch.  No module support is in the kernel, so the warnings/errors from
ksymoops can be safely ignored.

When the oops occurs, the machine stays alive, but new processes don't
run.  You can ping it, you can *connect* to a tcp port, but no TCP port
will actually do anything if it tries to fork/exec.

This happened several times in one day with 2.2.13.  Almost every time
it is an rsync of ftp.debian.org that tickles the bug.  I don't have
data from the earlier OOPSes.  This one was copied down from a digital
camera snapshot of the console screen, so if something looks wildly
incorrect, I can double check from the picture.

The system is otherwise a normal Debian GNU/Linux 2.2 (potato) system.

ksymoops 2.3.3 on i686 2.2.14.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.2.14/ (default)
     -m /boot/System.map-2.2.14 (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Error (regular_file): read_ksyms stat /proc/ksyms failed
No modules in ksyms, skipping objects
No ksyms, skipping lsmod
Unable to handle kernel paging request at virtual address 0fcfb018
current->tss.cr3 =3D 0258d000, %cr3 =3D 0258d000
*pde =3D 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c012f754>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010206
eax: 0fcfb000   ebx: 00000000   ecx: c8030ef0   edx: c5967a78
esi: c8030ee0   edi: c5967a40   ebp: 00000001   esp: c1ab7e80
ds: 0018   es: 0018   ss: 0018
Process rsync (pid: 5745, process nr: 107, stackpage=3Dc1ab7000)
Stack: c5967a40 c012e1fa c8030ee0 c1ab7ec4 c1ab7ebc 00001006 00000246 00001=
006
       c012f1bc fffffd56 00000d5e c01d95b0 00135927 c01fc370 cfcfb000 c1ab6=
000
       c01fbb70 c1ab7ec4 c1ab7ec4 c012f224 00001006 c01d95b0 00135927 c01fc=
370
Call Trace: [<c012e1fa>] [<c012f1bc>] [<c012f224>] [<c012f581>] [<c012f6e0>=
] [<c0139e30>] [<c012999f>]
       [<c0129b88>] [<c0129c51>] [<c0127b27>] [<c0109018>]
Code: 8b 40 18 85 c0 74 02 89 c3 85 db 74 0d 8b 43 08 85 c0 74 06

>>EIP; c012f754 <iput+18/1f0>   <=3D=3D=3D=3D=3D
Trace; c012e1fa <prune_dcache+a2/110>
Trace; c012f1bc <try_to_free_inodes+bc/fc>
Trace; c012f224 <grow_inodes+20/198>
Trace; c012f581 <get_new_inode+b9/11c>
Trace; c012f6e0 <iget+60/6c>
Trace; c0139e30 <ext2_lookup+5c/90>
Trace; c012999f <real_lookup+4f/a4>
Trace; c0129b88 <lookup_dentry+10c/1ac>
Trace; c0129c51 <__namei+29/5c>
Trace; c0127b27 <sys_newlstat+13/64>
Trace; c0109018 <system_call+34/38>
Code;  c012f754 <iput+18/1f0>
00000000 <_EIP>:
Code;  c012f754 <iput+18/1f0>   <=3D=3D=3D=3D=3D
   0:   8b 40 18                  mov    0x18(%eax),%eax   <=3D=3D=3D=3D=3D
Code;  c012f757 <iput+1b/1f0>
   3:   85 c0                     test   %eax,%eax
Code;  c012f759 <iput+1d/1f0>
   5:   74 02                     je     9 <_EIP+0x9> c012f75d <iput+21/1f0>
Code;  c012f75b <iput+1f/1f0>
   7:   89 c3                     mov    %eax,%ebx
Code;  c012f75d <iput+21/1f0>
   9:   85 db                     test   %ebx,%ebx
Code;  c012f75f <iput+23/1f0>
   b:   74 0d                     je     1a <_EIP+0x1a> c012f76e <iput+32/1=
f0>
Code;  c012f761 <iput+25/1f0>
   d:   8b 43 08                  mov    0x8(%ebx),%eax
Code;  c012f764 <iput+28/1f0>
  10:   85 c0                     test   %eax,%eax
Code;  c012f766 <iput+2a/1f0>
  12:   74 06                     je     1a <_EIP+0x1a> c012f76e <iput+32/1=
f0>


1 warning and 1 error issued.  Results may not be reliable.


--=20
Ryan Murray, (rmurray@cyberhqz.com, rmurray@stormix.com)
Programmer, Stormix Technologies Inc.
The opinions expressed here are my own.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE4zBMHN2Dbz/1mRasRArkEAJ9kSpuwqZZu0G6sjVfN+Wz+0LtN5wCfb0bS
XEIpQv6nXDxyt9lHmiYn5JI=
=r2IY
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
