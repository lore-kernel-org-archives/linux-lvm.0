Message-Id: <200302101357.h1ADvVY2022211@joe.freakout.de>
From: Axel Reinhold <lvm@freakout.de>
Subject: [linux-lvm] vgchange -ay failed with "Bad address"
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
Date: Mon Feb 10 08:05:01 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

when I start up my home-server today I was shocked.
LVM didn't change my volgroup to available. The server
was shut down yesterday with a normal shutdown properly.

[root@bongo root]# vgck vg01
vgck -- VGDA of "vg01" in lvmtab is consistent
vgck -- VGDA of "vg01" on physical volume is consistent

vgchange tells me:

[root@bongo root]# vgchange -ay vg01
vgchange -- ERROR "Bad address" activating volume group "vg01"

the kernel says (dmesg):
lvm -- _pv_get_number failed for rdev = 65535
lvm -- lvm_snapshot_fill_COW_page failed<3>

I tried vgscan -> Ok.

I'm totally lost. It's my home-server.
I used snapshots (intensively) without problems for a couple of weeks.

Would you please help me to recover the data.
There is no hardware problem - I'm sure - The data is still there.

Used versions:
Linux 2.4.20
LVM version 1.0.5+(22/07/2002) module loaded
Logical Volume Manager 1.0.6
Heinz Mauelshagen, Sistina Software  25/10/2002 (IOP 10)

Axel Reinhold
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0-PB (GNU/Linux)

iD8DBQE+R6/NHQ9JwE2bDw0RAiILAKDW7i9Sscq0DV6NTUTB9hU5/kKbXwCggsAw
BzsrzfhlvA/i/LJt3wMZ8aI=
=W33o
-----END PGP SIGNATURE-----
