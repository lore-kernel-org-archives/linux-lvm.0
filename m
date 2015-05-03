Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t433dq2V014905
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 2 May 2015 23:39:52 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25]) by mx1.redhat.com (Postfix) with ESMTPS id 787595A
	for <linux-lvm@redhat.com>; Sun,  3 May 2015 03:39:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C490020C13
	for <linux-lvm@redhat.com>; Sat,  2 May 2015 23:39:50 -0400 (EDT)
Received: from kylemanna.com (unknown [24.7.58.50])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4B931680171
	for <linux-lvm@redhat.com>; Sat,  2 May 2015 23:39:50 -0400 (EDT)
Date: Sat, 2 May 2015 20:32:11 -0700
From: Kyle Manna <kyle@kylemanna.com>
Message-ID: <20150503033210.GA14087@kylemanna.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
Subject: [linux-lvm] lvchange seg faults after switching cache policy
	mq->cleaner->mq
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I (attempted to) change the cache policy on a LV to write the changes
out to the disk.

# lvchange --cachepolicy cleaner vg0/home

Verified the expected setting with:

# lvs -o +cache_policy,cache_settings vg0/home
  LV   VG   Attr       LSize Pool     Origin       Data%  Meta%  Move Log C=
py%Sync Convert Cache Policy Cache Settings
  home vg0  Cwi-aoC--- 2.61t [cache0] [home_corig] 100.00 13.25           0=
=2E00             cleaner

After doing some tasks (i.e. reflashing the firmware of my broken
Samsung 840 EVO), I wanted to re-enable the mq cache policy with:

# lvchange --cachepolicy mq vg0/home

However, now lvchange segmentation faults on me.  I started with lvm2 on
Arch Linux at version 2.02.116-1.  I just compiled the git head
(75aa3e951f2) and still have the seg fault.

Recompiled with debug flags and have this stack trace:

#0  0x00007ffff756c8ef in _clone_config_value (mem=3D0x5555559543a0, v=3D0x=
0) at libdm-config.c:1261
#1  0x00007ffff756cfde in _override_path (path=3D0x555555954330 "/policy_se=
ttings", node=3D0x555555983e18, baton=3D0x555555997420) at libdm-config.c:1=
343
#2  0x00007ffff756d1e3 in _enumerate (path=3D0x7ffff7580d2a "", cn=3D0x5555=
55983e18, cb=3D0x7ffff756cf08 <_override_path>, baton=3D0x555555997420) at =
libdm-config.c:1360
#3  0x00007ffff756d36b in dm_config_flatten (cft=3D0x55555594ae60) at libdm=
-config.c:1382
#4  0x00005555555f5bfc in lv_cache_setpolicy (lv=3D0x5555559830b0, policy=
=3D0x55555597a6d0) at metadata/cache_manip.c:417
#5  0x000055555557bb62 in _lvchange_cachepolicy (cmd=3D0x555555900000, lv=
=3D0x5555559830b0) at lvchange.c:685
#6  0x000055555557d736 in _lvchange_single (cmd=3D0x555555900000, lv=3D0x55=
55559830b0, handle=3D0x555555940558) at lvchange.c:1102
#7  0x00005555555aa61f in process_each_lv_in_vg (cmd=3D0x555555900000, vg=
=3D0x555555982b80, arg_lvnames=3D0x7fffffffdbd0, tags_in=3D0x7fffffffdcc0, =
stop_on_error=3D0,=20
    handle=3D0x555555940558, process_single_lv=3D0x55555557c836 <_lvchange_=
single>) at toollib.c:2072
#8  0x00005555555aaec0 in _process_lv_vgnameid_list (cmd=3D0x555555900000, =
flags=3D1048576, vgnameids_to_process=3D0x7fffffffdc80, arg_vgnames=3D0x7ff=
fffffdcb0,=20
    arg_lvnames=3D0x7fffffffdca0, arg_tags=3D0x7fffffffdcc0, handle=3D0x555=
555940558, process_single_lv=3D0x55555557c836 <_lvchange_single>) at toolli=
b.c:2280
#9  0x00005555555ab27b in process_each_lv (cmd=3D0x555555900000, argc=3D1, =
argv=3D0x7fffffffdee0, flags=3D1048576, handle=3D0x555555940558,=20
    process_single_lv=3D0x55555557c836 <_lvchange_single>) at toollib.c:2356
#10 0x000055555557e136 in lvchange (cmd=3D0x555555900000, argc=3D1, argv=3D=
0x7fffffffdee0) at lvchange.c:1260
#11 0x0000555555597bca in lvm_run_command (cmd=3D0x555555900000, argc=3D1, =
argv=3D0x7fffffffdee0) at lvmcmdline.c:1521
#12 0x000055555559921e in lvm2_main (argc=3D4, argv=3D0x7fffffffdec8) at lv=
mcmdline.c:1985
#13 0x00005555555b6cc0 in main (argc=3D4, argv=3D0x7fffffffdec8) at lvm.c:21
(gdb) frame 1
#1  0x00007ffff756cfde in _override_path (path=3D0x555555954330 "/policy_se=
ttings", node=3D0x555555983e18, baton=3D0x555555997420) at libdm-config.c:1=
343
1343            if (!(target->v =3D _clone_config_value(cft->mem, node->v)))

More readable @ https://gist.github.com/fb7a054e6c3f77332b85

I didn't have enough time to dig in deeper, but the v=3D0 in the
_clone_config_value() is where things appear to go off the rails.

Hoping this means more to someone who is more familiar with this code.


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVRZazAAoJEL173Gxf6G+LQi4P/R2ntwUGGVSXhp0kzsK4MQts
ZjFi+ehWndBMpzLQfgdc0WCtb2RD2iJ4gihaj7RwTrmJXWrOsCAi6zaSYZVCYl1Z
050AMRVUIzn+Y/CgDFGyG5ptb/J+E4lEIngHyVCXTzB4gc/eRlUV8PLqvZ2/l4po
lbXt6Dw+c1zdVyFiWiRwxnYljGzao0Y6OlHIaQNeMB5hehvTz+ULAwKKgO7YoSqD
ab/DlLFempCGWWxxtBKEg8pGbPVT0Yy3AEyEinZezzpcAILpz1/mMqMz6GSx4OHI
3x5BeeDk2shRMv1gXSPiiP6HvU0i3dm0BIMj3csJrBb5Uu1ofNNGajNzZPjGMvVp
aEbThYeWlis2VVLSc5wV+WdZdl4iJpU2FhdJ4XWMBdrUM7IWNJiiyQ7lkFhaB49L
DQXNRek2jnj/HghhrEuYvqaHYcVi89UTtP/DEjmezK7JI98LJ/oNLWuAR21nkBl5
x3ka5+a6mAD4Z9Yrdg+KnSU1i/+EvPrzAv4qCbZpWPk282B+vIteYDteiGuSjhjL
zAGpNoeXJQHSSf7OUvUAM+Cq/LJ/i0Q6vRdu8KssCJi2GUO/KPXePeA51t+y9Hpq
13f995Q8nlJyyAg2yA2IJHPXw3eBoi4ye8/f4TrSfT2LBHhEtvO5fIWvBONTDRua
OsRrtuibG7yzGMaZJKeb
=KxYf
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
