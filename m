Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB2HmBr08223
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 12:48:11 -0500
Received: from ns.bj-ig.de (ns1.bj-ig.de [217.119.193.11])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB2Hm5AE029022
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 12:48:05 -0500
Received: from tower.bj-ig.de (bjgate.bj-ig.de [194.127.182.253])
	by ns.bj-ig.de (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	iB2Hm3iE026429
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 18:48:03 +0100
Received: from ralf.bj-ig.de (ralf.bj-ig.de [194.127.182.13])
	by tower.bj-ig.de (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	iB2Hm23E024159
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2004 18:48:02 +0100
From: Ralf =?iso-8859-1?q?M=FCller?= <ralf@bj-ig.de>
Date: Thu, 2 Dec 2004 18:47:55 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_RV1rBdRruNZmvB1";
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200412021848.01813@bj-ig.de>
Subject: [linux-lvm] Problem with pvmove of system installation volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--Boundary-02=_RV1rBdRruNZmvB1
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi there,

the day before I started to do my first tests with lvm on Linux. I=20
installed a fresh SuSE 9.2 on a machine with two identical disks,=20
created 3 RAID 1 partitions and created on top of all this my first=20
logical volume on Linux. Actually I created this "root" volume first,=20
and installed SuSE on it. No problems so far. I was able to increase=20
the "root" volume, I was able to create another "test" volume and=20
shrink it when it was not mounted ... cool stuff - really.

The next thing I wanted to test was moving a logical volume from one=20
physical volume to another. Usecase: replacement of an old/too=20
small/for whatever reason unwanted disk by another. This was perfectly=20
ok with the "test" volume - the one that I was able to shrink before.=20
But when I tried the same with the "root" volume pvmove locked and I=20
had to reset the machine. On the next boot the machine reported=20
problems with the volume group on which the root volume is located and=20
entered a recovery shell. There I had to call "lvm pvmove --abort" and=20
after another restart the machine booted again. After this first=20
experience I tried to upgrade the pached SuSE 2.6.8 kernel to a vanilla=20
2.6.9 from kernel.org, I upgraded the lvm2 binaries from version 2.0.25=20
to 2.0.29 - no changes. I googled around ... I found some reports about=20
problems with pvmove - but nothing that matched my actual problem (as=20
far as I can see it). So my hope is that someone here can help me a=20
step further with this problem.

There were no messages in syslog when the machine stopped. The visible=20
output of "pvmove -vv -n Root /dev/md0 /dev/md2" was:
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      /dev/md0: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md2: lvm2 label detected
      /dev/hda3: No label detected
      /dev/hdc3: No label detected
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
    Finding volume group "system"
      Locking /var/lock/lvm/V_system WB
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
    Archiving volume group "system" metadata.
    Creating logical volume pvmove0
      Getting target version for mirror
      Moving /dev/md0:0-1023 of system/Root
      Moving /dev/md0:1610-1737 of system/Root
    Moving 1152 extents of logical volume system/Root
      Finding volume group for uuid=20
Qo3GHB44Twwv7MYsUjJtWUCuPH5P2vviIikXQlamoffNvHYy5DUCF66jqwCCepYC
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
    Found volume group "system"
      Setting activation/missing_stripe_filler to /dev/ioerror
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/system"
      Finding volume group for uuid=20
Qo3GHB44Twwv7MYsUjJtWUCuPH5P2vviIikXQlamoffNvHYy5DUCF66jqwCCepYC
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
    Found volume group "system"
      Locking memory
      Suspending system-Root
      Finding volume group for uuid=20
Qo3GHB44Twwv7MYsUjJtWUCuPH5P2vviK1M7zT9n1b350JWv5oYIL2CJuiUVy1iz
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md2: lvm2 label detected
    Found volume group "system"
    Loading system-pvmove0
      Setting activation/mirror_region_size to 512

=2D-=20
Van Roy's Law: -------------------------------------------------------
       An unbreakable toy is useful for breaking other toys.

--Boundary-02=_RV1rBdRruNZmvB1
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBr1VRZcF+4X5mWz8RArU0AKDpcVLLMux7EwhgAu/g4ggKzPCJ2QCgnXPT
5b92dKeCdlkIqgtyYwcGFJo=
=dhjB
-----END PGP SIGNATURE-----

--Boundary-02=_RV1rBdRruNZmvB1--
