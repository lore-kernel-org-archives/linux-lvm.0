Return-Path: <marijn@sanity.dhs.org>
Date: Sat, 21 Jul 2001 04:06:58 -0400
From: Marijn Vriens <marijn@sanity.dhs.org>
Message-ID: <20010721040657.E17654@sanity.dhs.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline
Subject: [linux-lvm] snapshot creation bug?
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

--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello dear list members,

I have been using LVM on various computers with sucess, but i am
having a situation with one of them...

The problem is that once i tried to make a snapshot of one
of my LVs and ever since then i am having troubles with the
LVM (the snapshot didn't want to work). It seems that since then, many
LVM programs die with segfaults, what leads me to be leave that
somewhere the LVM data is corrupted.=20

When I tried to make the snapshot I was using LVM-0.9.0. It failed for
some reason (I don't remember what the error was), leaving me with
some semi finished operation. Since then when I try to add a new LV
it won't let me. I also upgraded to 0.9.1beta7, but it doesn't make a
difference.=20

The machine uses the 2.4.4 Linux kernel, with LVM as a module. All LVs
that are under LVM run on reiserfs.=20

One other thing is that this machine hasn't been rebooted since all of
this started. I don't know what kind of "refresh" effect this will
have. But I'd rather leave those solutions to certain commercial OS's :).=
=20

Could someone please enlighten me, as to what is going on with my LVM?
and how I can fix it? I really hope it doesn't involve "vgremove" (not
that i don't have backups.... :) )=20

Kind regards,=20
     Marijn.
-----
Okay, for now for the output of the various tools.
I tried to create a snapshot I called "snap" and later a new LV "log"
and "log2"

When I try to create a new LV:=20
icarus:~# lvcreate -L2G --name log host_vg
lvcreate -- ERROR "Permission denied" opening logical volume "/dev/host_vg/=
log"

but it DOES create a /dev/host_vg/log !

Then trying to remove it gives me:
icarus:~# lvremove /dev/host_vg/log=20
lvremove -- do you really want to remove "/dev/host_vg/log"? [y/n]: y
lvremove -- ERROR "lv_release(): LV number" releasing logical volume "/dev/=
host_vg/log"

but the /dev/host_vg/log stays :(
LVM thinks that the /dev/host_vg/log doesn't exist:

icarus:~# lvdisplay -v /dev/host_vg/log
lvdisplay -- logical volume "/dev/host_vg/log" doesn't exist

Okay, it doesn't exist.

icarus:~# lvscan -v
lvscan -- checking volume group name "host_vg"
lvscan -- checking volume group "host_vg" existence
lvscan -- checking volume group "host_vg" activity
lvscan -- getting VGDA of volume group "host_vg" from kernel
lvscan -- ACTIVE            "/dev/host_vg/lvol1" [1 GB]
lvscan -- ACTIVE            "/dev/host_vg/www" [2 GB]
lvscan -- ACTIVE            "/dev/host_vg/vpopmail" [4 GB]
lvscan -- ACTIVE            "/dev/host_vg/mysql" [1 GB]
Segmentation fault

Hmmm, something wicked really IS going on... Tools shouldn't
segfault.

The same program, with some more options:

icarus:~# lvscan -vb
lvscan -- checking volume group name "host_vg"
lvscan -- checking volume group "host_vg" existence
lvscan -- checking volume group "host_vg" activity
lvscan -- getting VGDA of volume group "host_vg" from kernel
lvscan -- ACTIVE            "/dev/host_vg/lvol1" [1 GB] 58:0
lvscan -- ACTIVE            "/dev/host_vg/www" [2 GB] 58:1
lvscan -- ACTIVE            "/dev/host_vg/vpopmail" [4 GB] 58:2
lvscan -- ACTIVE            "/dev/host_vg/mysql" [1 GB] 58:3
lvscan -- ACTIVE   Snapshot "/dev/host_vg/snap" [98.44 MB] 58:4
lvscan -- ACTIVE            "/dev/host_vg/log" [2 GB] 58:4
lvscan -- ACTIVE            "/dev/host_vg/log2" [2 GB] 58:4
lvscan -- 7 logical volumes with 12.1 GB total in 1 volume group
lvscan -- 7 active logical volumes

What? lvdisplay just told me the LV "log" it doesn't exist! What is
also interesting is that /dev/host_vg/snap is there, but that doesn't
exist in my /dev/host_vg/ . All 3 problematic LVs have 58:4 while the
others are unique. and if -b is just to show the major-minor numbers,
why doesn't this segfault?=20

More lvscan fun:
icarus:~# lvscan -vD
lvscan -- reading all physical volumes (this may take a while...)
lvscan -- checking volume group name "host_vg"
lvscan -- checking volume group "host_vg" existence
lvscan -- reading volume group data of host_vg from disk(s)
lvscan -- inactive          "/dev/host_vg/lvol1" [1 GB]
lvscan -- inactive          "/dev/host_vg/www" [2 GB]
lvscan -- inactive          "/dev/host_vg/vpopmail" [4 GB]
lvscan -- inactive          "/dev/host_vg/mysql" [1 GB]
lvscan -- inactive          "/dev/host_vg/log2" [2 GB]
lvscan -- 5 logical volumes with 10 GB total in 1 volume group
lvscan -- 5 inactive logical volumes

But they're not INACTIVE at all.

and as a finale:=20
icarus:~# vgdisplay -v
--- Volume group ---
VG Name               host_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               4
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               16.73 GB
PE Size               4 MB
Total PE              4282
Alloc PE / Size       3097 / 12.1 GB
Free  PE / Size       1185 / 4.63 GB
VG UUID               pTIjgu-WnnS-oLd3-jkhI-kGme-sSJN-7JGX5Y

--- Logical volume ---
LV Name                /dev/host_vg/www
VG Name                host_vg
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                2 GB
Current LE             512
Allocated LE           512
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/host_vg/vpopmail
VG Name                host_vg
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                4 GB
Current LE             1024
Allocated LE           1024
Allocation             next free
Read ahead sectors     120
Block device           58:2


--- Logical volume ---
LV Name                /dev/host_vg/mysql
VG Name                host_vg
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:3

--- Logical volume ---
LV Name                /dev/host_vg/snap
VG Name                host_vg
LV Write Access        read only
Segmentation fault

There's something stinky going on.. An other Segfault.

--=20
Get loaded from the source: Do Linux!
Marijn Vriens <marijn@sanity.dhs.org>=20
GPG/PGP: 6895 DF03 73E1 F671 C61D  45F4 5E83 8571 C529 5C15




--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7WTghXoOFccUpXBURApxaAJ49dMhDxOh486CX+k8F+z/cRQT4BgCfSrRF
lIRO0/E3XhRCLIV6txcqJoo=
=FM26
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
