Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SCb3V21765
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 08:37:03 -0400
Received: from concorde.nesbitt.local (ns.nesbittengineering.com
	[64.191.130.42])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9SCaumT029394
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 08:36:56 -0400
Received: from concorde.nesbitt.local (localhost.localdomain [127.0.0.1])
	by concorde.nesbitt.local (8.13.1/8.13.1) with ESMTP id j9SCanas021722
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 08:36:49 -0400
Received: from concorde.nesbitt.local (root@localhost)
	by concorde.nesbitt.local (8.13.1/8.13.1/Submit) with ESMTP id
	j9SCanFu021721
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 08:36:49 -0400
Date: Fri, 28 Oct 2005 08:36:47 -0400
From: "Collins, Kevin" <kCollins@nesbittengineering.com>
Sender: "Collins, Kevin" <kCollins@nesbittengineering.com>
Message-ID: <1130503008.8617.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Uxwyp75I17qBMu44iNcJ"
Subject: [linux-lvm] Problems with LVM snapshots
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


--=-Uxwyp75I17qBMu44iNcJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

For the past two nights, my Scalix machine running RHEL 4 (update 2) has
failed during it backup process.  That process basically creates an LVM
snapshot, allows me to tar up the data and then removes the snapshot.  I
can attache the script if needed.

The important part about this is that both of the past two nights, as
the backup script goes to create the LVM Snapshot, it fails, which soon
causes Scalix to stop responding, which for all practical matters causes
the server to become useless.  In both cases, I've had to reboot the
server, enter maintenance mode, remove the snapshot and then reboot
again to get the machine back in service.  The good news to this point
is that the machine is not experienced any corruption or file system
failures whent he system "freezes", but I don't like the situtation.
Besides this the backups haven't worked.  Needless to say I need to get
this fixed ASAP.

Outside of what I've described, I have this snippet
from /var/log/messages which shows the event:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Oct 27 18:00:01 concorde crond(pam_unix)[21037]: session opened for user
root by (uid=3D0)
Oct 27 18:00:02 concorde kernel: lvcreate: page allocation failure.
order:1, mode:0xd0
Oct 27 18:00:02 concorde kernel:  [<c013fa77>] __alloc_pages+0x28b/0x29d
Oct 27 18:00:02 concorde kernel:  [<c013faa1>] __get_free_pages
+0x18/0x24
Oct 27 18:00:02 concorde kernel:  [<c01423f8>] kmem_getpages+0x1c/0xbb
Oct 27 18:00:02 concorde kernel:  [<c0142f46>] cache_grow+0xab/0x138
Oct 27 18:00:02 concorde kernel:  [<c0143138>] cache_alloc_refill
+0x165/0x19d
Oct 27 18:00:02 concorde kernel:  [<c014350c>] __kmalloc+0x76/0x88
Oct 27 18:00:02 concorde kernel:  [<c013e709>] mempool_resize+0x86/0x13f
Oct 27 18:00:02 concorde kernel:  [<f8bb1322>] resize_pool+0x3a/0xa2
[dm_mod]
Oct 27 18:00:02 concorde kernel:  [<f8bb24c3>] kcopyd_client_create
+0x71/0x9f [dm_mod]
Oct 27 18:00:02 concorde kernel:  [<f8c73697>] snapshot_ctr+0x231/0x2b8
[dm_snapshot]
Oct 27 18:00:02 concorde kernel:  [<f8bae185>] dm_table_add_target
+0xfc/0x169 [dm_mod]
Oct 27 18:00:02 concorde kernel:  [<f8bb020c>] populate_table+0x8a/0xaf
[dm_mod]
Oct 27 18:00:02 concorde kernel:  [<f8bb0268>] table_load+0x37/0x123
[dm_mod]
Oct 27 18:00:02 concorde kernel:  [<f8bb0ce3>] ctl_ioctl+0xd1/0x144
[dm_mod]
Oct 27 18:00:02 concorde kernel:  [<f8bb0231>] table_load+0x0/0x123
[dm_mod]
Oct 27 18:00:02 concorde kernel:  [<c0165b5e>] sys_ioctl+0x227/0x269
Oct 27 18:00:02 concorde kernel:  [<c02c7377>] syscall_call+0x7/0xb
Oct 27 18:00:02 concorde kernel: Mem-info:
Oct 27 18:00:02 concorde kernel: DMA per-cpu:
Oct 27 18:00:02 concorde kernel: cpu 0 hot: low 2, high 6, batch 1
Oct 27 18:00:02 concorde kernel: cpu 0 cold: low 0, high 2, batch 1
Oct 27 18:00:03 concorde kernel: cpu 1 hot: low 2, high 6, batch 1
Oct 27 18:00:03 concorde kernel: cpu 1 cold: low 0, high 2, batch 1
Oct 27 18:00:03 concorde kernel: Normal per-cpu:
Oct 27 18:00:03 concorde kernel: cpu 0 hot: low 32, high 96, batch 16
Oct 27 18:00:03 concorde kernel: cpu 0 cold: low 0, high 32, batch 16
Oct 27 18:00:03 concorde kernel: cpu 1 hot: low 32, high 96, batch 16
Oct 27 18:00:03 concorde kernel: cpu 1 cold: low 0, high 32, batch 16
Oct 27 18:00:03 concorde kernel: HighMem per-cpu:
Oct 27 18:00:03 concorde kernel: cpu 0 hot: low 14, high 42, batch 7
Oct 27 18:00:03 concorde kernel: cpu 0 cold: low 0, high 14, batch 7
Oct 27 18:00:03 concorde kernel: cpu 1 hot: low 14, high 42, batch 7
Oct 27 18:00:03 concorde kernel: cpu 1 cold: low 0, high 14, batch 7
Oct 27 18:00:03 concorde kernel:=20
Oct 27 18:00:03 concorde kernel: Free pages:       16132kB (364kB
HighMem)
Oct 27 18:00:03 concorde kernel: Active:163817 inactive:73927 dirty:26
writeback:0 unstable:0 free:4033 slab:12358 mapped:63944 pagetables:1818
Oct 27 18:00:03 concorde kernel: DMA free:12632kB min:16kB low:32kB
high:48kB active:0kB inactive:0kB present:16384kB pages_scanned:56
all_unreclaimable? yes
Oct 27 18:00:03 concorde kernel: protections[]: 0 0 0
Oct 27 18:00:03 concorde kernel: Normal free:3136kB min:928kB low:1856kB
high:2784kB active:578536kB inactive:245936kB present:901120kB
pages_scanned:0 all_unreclaimable? no
Oct 27 18:00:03 concorde kernel: protections[]: 0 0 0
Oct 27 18:00:03 concorde kernel: HighMem free:364kB min:128kB low:256kB
high:384kB active:76732kB inactive:49772kB present:131008kB
pages_scanned:0 all_unreclaimable? no
Oct 27 18:00:03 concorde kernel: protections[]: 0 0 0
Oct 27 18:00:03 concorde kernel: DMA: 2*4kB 4*8kB 3*16kB 4*32kB 4*64kB
1*128kB 1*256kB 1*512kB 1*1024kB 1*2048kB 2*4096kB =3D 12632kB
Oct 27 18:00:03 concorde kernel: Normal: 636*4kB 50*8kB 4*16kB 4*32kB
0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 3136kB
Oct 27 18:00:03 concorde kernel: HighMem: 1*4kB 1*8kB 0*16kB 1*32kB
1*64kB 2*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 364kB
Oct 27 18:00:03 concorde kernel: Swap cache: add 2, delete 0, find 0/0,
race 0+0
Oct 27 18:00:03 concorde kernel: Free swap:       2096432kB
Oct 27 18:00:03 concorde kernel: 262128 pages of RAM
Oct 27 18:00:03 concorde kernel: 32752 pages of HIGHMEM
Oct 27 18:00:04 concorde kernel: 3458 reserved pages
Oct 27 18:00:04 concorde kernel: 176132 pages shared
Oct 27 18:00:04 concorde kernel: 2 pages swap cached
Oct 27 18:00:04 concorde kernel: device-mapper: Could not create kcopyd
client
Oct 27 18:00:04 concorde kernel: device-mapper: error adding target to
table
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

As of right now, that's all the info I have except for the backup script
and maybe some hardware information.  If anything else is needed please
let me know.

--=20
Kevin L. Collins, MCSE
Systems Manager
Nesbitt Engineering, Inc.

--=-Uxwyp75I17qBMu44iNcJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDYhtfBJfVkRK/55oRAl0tAJ9zoNtVamrdkpD26yUCWS4wRLUHNgCgvjvs
dNpfWwidbkCwrCUV6oU0J0Q=
=sj59
-----END PGP SIGNATURE-----

--=-Uxwyp75I17qBMu44iNcJ--
