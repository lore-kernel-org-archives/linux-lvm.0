Return-Path: <lewis@sistina.com>
Date: Thu, 26 Jul 2001 13:47:32 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <20010726134732.A27706@sistina.com>
References: <20010726131928.D1779@linux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20010726131928.D1779@linux.com>; from tack@linux.com on Thu, Jul 26, 2001 at 01:19:28PM -0400
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
To: linux-lvm@sistina.com

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2001 at 01:19:28PM -0400, Jason Tackaberry wrote:
> I have discovered one or more severe bugs in any or all of lvm, md, and
> reiserfs.  I'm not a kernel guy and I don't claim to know how these
> things are supposed to interact at that level, so I'm not going to point
> fingers.  Instead, here's what happened and I'll let you decide. :)
>=20
> The problem surfaces when you create a volume group with lvm and include
> a partition that happens to be mounted.  In my tests the cwd was this
> mounted filesystem.  This may or may not be a necessary condition to
> reproduce this problem.  (I didn't test otherwise.)
>=20
> In my tests I have /dev/sda7 and /dev/sdb7.  I created an md raid0
> device and assigned that to /dev/md3.  Then, here are the sequence of
> commands I issued:
>=20
>   mkreiserfs /dev/md3
>   mount /dev/md3 /space
>   cd /space
>   pvcreate /dev/md3
>   vgcreate vol01 /dev/md3

Umm...try this one:

  mkreiserfs /dev/md3
  mount /dev/md3 /space
  cd /space
  dd if=3D/dev/zero of=3D/dev/md3 bs=3D1024k count=3D500

is that a bug?

I'm not sayign we shouldn't check for this if possible...I'm just saying
there *are* other things that do this...

> Obviously it's not normal to create a vg on a device that's mounted.  I
> did this by accident, but the result was pretty ugly.  Immediately after
> doing 'vgcreate' this popped up in the console:
>=20
> --- snip ---------------------------------------------------------------
> is_tree_node: node level 19784 does not match to the expected one -1
> vs-5150: search_by_key: invalid format found in block 0. Fsck?
> kernel BUG at namei.c:343!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c017d965>]
> EFLAGS: 00010286
> eax: 0000001b   ebx: c2047e60   ecx: c2c0e000   edx: c02d88c4
> esi: c28795e0   edi: c2047ea0   ebp: c2047e04   esp: c2047df8
> ds: 0018   es: 0018   ss: 0018
> Process bash (pid: 834, stackpage=3Dc2047000)
> Stack: c028ac46 c028acda 00000157 00000001 00000002 7f84dbff 000001f4 000=
00000
>        00000003 c011ac84 00000001 c028ad8e c2047e60 c2047ea0 c23be0e0 c01=
7da8b
>        c28795e0 c23be13c 0000000a c2047e60 c2047ea0 00000000 00000001 c03=
275c0
> Call Trace: [<c011ac84>] [<c017da8b>] [<c0139b70>] [<c013a582>] [<c014199=
9>] [<c0139c2f>] [<c013a341>]
>        [<c013a94a>] [<c0137993>] [<c012fae3>] [<c0106ecb>]
>=20
> Code: 0f 0b 83 c4 0c 8b 54 24 3c 52 8b 44 24 3c 50 57 55 e8 25 fc
> --- snip ---------------------------------------------------------------
>=20
> After realising that I'd tried to vgcreate a partition that was mounted,
> I cd'ed out of /space and issued 'umount /space'.  Then I got this:
>=20
> --- snip ---------------------------------------------------------------
> journal-2332: Trying to log block 16, which is a log block
> kernel BUG at prints.c:332!
> invalid operand: 0000
> CPU:    0
> EIP:    0010:[<c01887a4>]
> EFLAGS: 00010286
> eax: 0000001c   ebx: c0335a80   ecx: cf41c000   edx: c02d88c4
> esi: cc3c1e68   edi: c0335ebd   ebp: c0335a80   esp: cc3c1e2c
> ds: 0018   es: 0018   ss: 0018
> Process umount (pid: 881, stackpage=3Dcc3c1000)
> Stack: c028c6c6 c028c9c0 0000014c cc3c1e44 cc3c1e48 00000000 000007e0 000=
00001
>        00000001 d0865024 00000000 d0865000 c0195e4e ce803800 c028fb80 000=
00010
>        00000560 00000000 00000001 00000001 00000807 00000000 00000000 ce6=
33ea0
> Call Trace: [<c0195e4e>] [<c0193546>] [<c018684a>] [<c01935d1>] [<c018685=
a>] [<c0135174>] [<c0139b88>]
>        [<c013559a>] [<c012fb83>] [<c0121ea2>] [<c01355dc>] [<c0106ecb>]
>=20
> Code: 0f 0b 83 c4 0c 8b 54 24 28 85 d2 74 08 8b 44 24 28 83 48 28
> Segmentation fault
> --- snip ---------------------------------------------------------------
>=20
> After umount segfaulted, I decided I ought to reboot.  ctrl-alt-del or
> halt(8) appeared to have no effect, so I hit the reset button.
>=20
> As my system was coming back up, the boot sequence continually said
> "Can't open /etc/mtab: input/output error."  The boot and root
> partitions are both md RAID1 devices with ext2.  The disks seemed to
> fsck okay, and when I logged in, I indeed could not read /etc/mtab.  'ls
> -l /etc/mtab' even yielded the same input/output error.  I rebooted with
> the stock RH 7.1 kernel that has no lvm support and this error
> persisted.  So this seems to be a problem with md?
>=20
> I managed to fix it by booting the RedHat rescue cd, mounting the root
> partition, and deleting /etc/mtab.  All seems okay.
>=20
> Just to see if this problem was linked to md beneath LVM, I repeated the
> above with /dev/sda7 instead of /dev/md3.  Same result.  Now, I also
> repeated the above using ext2 instead of reiserfs.  ext2 complained:
>=20
> EXT2-fs error (device sd(8,7)): ext2_write_inode: unable to read inode
> block - inode=3D2, block=3D1899261259
> attempt to access beyond end of device
>=20
> But it did not cause any kernel errors.  This process failed gracefully
> with ext2.
>=20
> Now, if I had to blame LVM for something, I'd say it should at least not
> let me vgcreate with a mounted partition, or one that has inodes in use.
> mkraid, for exaple, would not let me start a raid device with a mounted
> partition.  If vgcreate failed with an error saying "This partition is
> mounted or has inodes in use" I would have realized the problem and
> unmounted /space before vgcreate.  The kernel errors came from Reiserfs,
> so there seems to be a problem there.  But like I said, I'm not a kernel
> guy so I'll let you guys confirm this before I submit a bug report to
> the Reiserfs team (or maybe one of the LVM hackers would be a better
> candidate).  Finally, md did not handle this robustly at all.  The whole
> /etc/mtab issue makes me extremely nervous since md is handling my boot
> and root parition with RAID1.  I'm just in a testing stages,
> fortunately, but I'm thinking md/lvm aren't suitable for this system
> which will be in production in a month.
>=20
> I'd be happy to repeat and experiments or give further information if
> you need some.  This system is mine to beat on for a little while longer
> before it needs to go live.
>=20
> Cheers,
> Jason.
>=20
> --
> Academic Computing Support Specialist         Assistant Section Editor
> Algoma University College                     http://linux.com/develop
> Sault Ste. Marie, Ontario                =20
> 705-949-2301 x330                                   Personal Home Page
> http://www.auc.ca                                     http://sault.org
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
"We succeed because our competitors are idiots" - anonymous
-----End Obligatory Humorous Quote------------------------------------------

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YGXEpE6/iGtdjLERArFMAJ0T1kGZxhIx3IbpE+8tC1gYAtlapwCfWtwq
xSHIDpNouEVPmPskb6klkYo=
=1iZl
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
