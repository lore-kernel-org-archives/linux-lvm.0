Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1THXMPr029969
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:33:22 -0500
Received: from biscayne-one-station.mit.edu (BISCAYNE-ONE-STATION.MIT.EDU
	[18.7.7.80])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1THWmde011983
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:32:48 -0500
Received: from outgoing.mit.edu (OUTGOING-AUTH.MIT.EDU [18.7.22.103])
	by biscayne-one-station.mit.edu (8.13.6/8.9.2) with ESMTP id
	m1THWgxn011810
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:32:42 -0500 (EST)
Received: from localhost (EQUAL-RITES.MIT.EDU [18.18.1.59])
	(authenticated bits=0) (User authenticated as ghudson@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.13.6/8.12.4) with ESMTP id m1THWfD7013248
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:32:41 -0500 (EST)
Date: Fri, 29 Feb 2008 12:32:41 -0500 (EST)
From: ghudson@MIT.EDU
Message-Id: <200802291732.m1THWfD7013248@outgoing.mit.edu>
Subject: [linux-lvm] Page cache corruption when creating a snapshot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

We have observed an apparent kernel memory corruption bug when
creating an LVM snapshot.  This has been reproduced on two different
machines, so it does not appear to be a memory hardware issue.

The reproduction recipe looks like:

  rm -rf /tmp/test
  mkdir /tmp/test
  # Put around 60MB of files into /tmp/test
  find /tmp/test -type f | xargs md5sum > /tmp/sum.pre
  lvcreate --size 2G --snapshot /dev/dink/gutsy-i386-sbuild --name testsnapshot
  find /tmp/test -type f | xargs md5sum > /tmp/sum.post
  lvremove -f /dev/dink/testsnapshot
  diff -u /tmp/sum.pre /tmp/sum.post

Line 5 naturally needs to be adjusted for the LVM configuration of the
test machine.  On my machine, /dev/dink/gutsy-i386-sbuild is an
unmounted 2GB logical volume containing a build chroot; it lives in a
different volume group from the one /tmp's filesystem is located in.

Not all of the time, but some of the time when I do this, one of the
files in /tmp/test will have a different md5sum.  It's always a
one-byte difference at offset 156 within a 1K block (but a different
block each time), and the incorrect value of that byte is always one
less than the correct value.  For example:

@@ -471431,7 +471431,7 @@
 0731860: 4d46 6ae3 0252 6864 e634 15eb 7ac1 f0ee  MFj..Rhd.4..z...
 0731870: 9f2b 8d82 33e3 138b 31a2 8da5 4594 5648  .+..3...1...E.VH
 0731880: 74fd 00e0 bc48 fe09 d557 f501 70a8 7dfd  t....H...W..p.}.
-0731890: ea8f 5010 b963 e2ec 7b84 8ef7 e851 fdfa  ..P..c..{....Q..
+0731890: ea8f 5010 b963 e2ec 7b84 8ef7 e751 fdfa  ..P..c..{....Q..
 07318a0: 6031 670b cd54 fe01 20d6 f3fb c662 dfc3  `1g..T.. ....b..
 07318b0: 7605 acd2 1be6 3fee 54ff e15b bc60 77fa  v.....?.T..[.`w.
 07318c0: 368e 99f9 60a0 a1a2 fbdf ef0d 4bca a201  6...`.......K...

If the machine is rebooted (after moving /tmp/test to another location
so it doesn't get blown away by init scripts), the apparently modified
file reverts to the correct contents.  Thus, the issue appears to be
page cache corruption, not actual filesystem corruption.

Version information:

root@linux-build-10:~# uname -a
Linux linux-build-10 2.6.22-14-server #1 SMP Thu Jan 31 23:57:25 UTC 2008 x86_64 GNU/Linux
root@linux-build-10:~# lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 7.10
Release:        7.10
Codename:       gutsy
root@linux-build-10:~# dpkg -s lvm2 | grep Version
Version: 2.02.26-1ubuntu4
root@linux-build-10:~# pvscan
  PV /dev/sdb    VG dink                     lvm2 [136.73 GB / 110.73 GB free]
  PV /dev/sda5   VG LINUX-BUILD-10.mit.edu   lvm2 [68.12 GB / 0    free]
  Total: 2 [204.85 GB] / in use: 2 [204.85 GB] / in no VG: 0 [0   ]
root@linux-build-10:~# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "dink" using metadata type lvm2
  Found volume group "LINUX-BUILD-10.mit.edu" using metadata type lvm2

(I sent a slightly different variant of this yesterday without
subscribing to the list, which I think was black-holed.  Apologies if
this shows up twice.  Also, I filed a similar bug report with Ubuntu
which can be seen at:
https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.22/+bug/196784
)
