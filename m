From: "=?iso-8859-1?Q?J=FCrgen?= Vollmer" <juergen@informatik-vollmer.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
    boundary="==_Exmh_-380620018P";
    micalg=pgp-sha1;
    protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Message-Id: <22543.1010745017@joergli.cocolab.de>
Subject: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
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
Date: Fri Jan 11 04:31:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--==_Exmh_-380620018P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Hi everybody,

I use kernel-source-2.4.16.SuSE-24.i386.rpm together with reiserfs and
made a snapshot which I then tar'ed.
Writing the tape seems to be ok. After that I did:

	tar --directory=3D/ --file=3D/dev/tape --compare

and got the message (while working i.e. modifying the  original filesyste=
m)

Message from syslogd@joergli at Fri Jan 11 10:57:19 2002 ...
joergli kernel: zam-7001: io error in reiserfs_find_entry


The entire message in /var/log/message is:
--------------
Jan 11 10:57:19 joergli kernel: lvm -- giving up to snapshot /dev/LVMhome=
_vg/home on /dev/LVMhome_vg/lvm-snapshot: out of space
Jan 11 10:57:19 joergli kernel: lvm - lvm_map: ll_rw_blk for inactive LV =
/dev/LVMhome_vg/lvm-snapshot
Jan 11 10:57:19 joergli kernel: zam-7001: io error in reiserfs_find_entry=

Jan 11 10:57:19 joergli kernel: invalid operand: 0000
Jan 11 10:57:19 joergli kernel: CPU:    1
Jan 11 10:57:19 joergli kernel: EIP:    0010:[ipv6:__insmod_ipv6_O/lib/mo=
dules/2.4.16-SMP/kernel/net/ipv6/ipv6+-21171255/96]    Tainted: PF
Jan 11 10:57:19 joergli kernel: EFLAGS: 00010286
Jan 11 10:57:19 joergli kernel: eax: 0000002d   ebx: c1fdea40   ecx: 0000=
0001   edx: 00000001
Jan 11 10:57:19 joergli kernel: esi: c3170800   edi: cde2dee0   ebp: cde2=
de74   esp: cde2de2c
Jan 11 10:57:19 joergli kernel: ds: 0018   es: 0018   ss: 0018
Jan 11 10:57:19 joergli kernel: Process tar (pid: 19852, stackpage=3Dcde2=
d000)
Jan 11 10:57:19 joergli kernel: Stack: c1fe031a c1fe3aa0 c1fdea40 cde2de5=
0 cde2de5c c1fdeaac c1fc3f36 c3170800
Jan 11 10:57:19 joergli kernel:        c1fdea40 00000000 c1fdeaac cde2dea=
0 0001e7e7 0001e7e8 05c75bff 000001f4
Jan 11 10:57:19 joergli kernel:        00000000 00000003 d7bace60 c1fc405=
0 c77b8520 d7bacec0 00000008 cde2dea0
Jan 11 10:57:19 joergli kernel: Call Trace: [ipv6:__insmod_ipv6_O/lib/mod=
ules/2.4.16-SMP/kernel/net/ipv6/ipv6+-21101798/96] [ipv6:__insmod_ipv6_O/=
lib/modules/2.4.16-SMP/kernel/net/ipv6/ipv6+-21087584/96] [ipv6:__insmod_=
ipv6_O/lib/modules/2.4.16-SMP/kernel/net/ipv6/ipv6+-21108160/96] [ipv6:__=
insmod_ipv6_O/lib/modules/2.4.16-SMP/kernel/net/ipv6/ipv6+-21108052/96] [=
ipv6:__insmod_ipv6_O/lib/modules/2.4.16-SMP/kernel/net/ipv6/ipv6+-2121748=
2/96]
Jan 11 10:57:19 joergli kernel:    [ipv6:__insmod_ipv6_O/lib/modules/2.4.=
16-SMP/kernel/net/ipv6/ipv6+-21108160/96] [ipv6:__insmod_ipv6_O/lib/modul=
es/2.4.16-SMP/kernel/net/ipv6/ipv6+-21108052/96] [ipv6:__insmod_ipv6_O/li=
b/modules/2.4.16-SMP/kernel/net/ipv6/ipv6+-21217200/96] [d_alloc+27/376] =
[real_lookup+122/264] [link_path_walk+1479/2080]
Jan 11 10:57:19 joergli kernel:    [path_walk+26/28] [__user_walk+53/80] =
[sys_lstat64+25/112] [sys_close+95/116] [system_call+51/56]
Jan 11 10:57:19 joergli kernel:
Jan 11 10:57:19 joergli kernel: Code: 0f 0b 68 a0 3a fe c1 85 f6 74 0f 0f=
 b7 46 08 50 e8 32 77 16
--------------

So it seems that the snapshot is full. Is that correct, or do I have a se=
rious
problem? Note: I'm doing my backups, so a dead backup is not a very good
one :-)

With best regards

J=FCrgen


-- =

Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
juergen@informatik-vollmer.de,vollmer@cocolab.de,Juergen.Vollmer@acm.org
www.informatik-vollmer.de



--==_Exmh_-380620018P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.3.1 01/18/2001

iD8DBQE8Pr65n1Xi7IT+kG0RAswEAJwLFfNQprxgorUXIcDAsQzjH+Ax7gCgsR0M
+exQBbG/+CYF/yE9max4Si4=
=SP/c
-----END PGP SIGNATURE-----

--==_Exmh_-380620018P--
