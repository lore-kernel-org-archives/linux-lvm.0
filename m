Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k268m8109448
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 03:48:08 -0500
Received: from hades.smop.co.uk (smop.co.uk [81.5.177.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k268m4J7001893
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 03:48:04 -0500
Received: from adrian by hades.smop.co.uk with local (Exim 4.60)
	(envelope-from <adrian@smop.co.uk>) id 1FGBNf-0008Mm-U9
	for linux-lvm@redhat.com; Mon, 06 Mar 2006 08:47:51 +0000
Date: Mon, 6 Mar 2006 08:47:51 +0000
Message-ID: <20060306084751.GA32104@smop.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
From: adrian <adrian@smop.co.uk>
Subject: [linux-lvm] snapshots fail to create sometimes
Reply-To: adrian@smop.co.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Third attempt at posting - are only subscribers allowed to post (I
couldn't see any message to this effect)? This email is therefore a
concatenation of three emails but hopefully all the info is then included.

I'm using LVM snapshots and I'm having problems on one machine in
particular where the lvcreate sometimes fails saying the snapshot is
in use and that it couldn't deactivate it.  Sometimes it fails several
times in a row, sometimes it will work seven times and then fail. The
test I'm using is:

rc=0
while [ "$rc" = 0 ]; do
 lvremove -v -f /dev/rootvg/bcs-testsnap
  lvcreate --snapshot -L 200M -n bcs-testsnap -vv
/dev/rootvg/bcs-test_adrianhome
 rc=$?
  echo
  done
  
  I've attached a run below split into three loops - the first loop
can almost be ignored as it was run after a snapshot creation failure.
The next loop deletes the old snapshot and then creates a new
snapshot.  The third loop deletes the old snapshot and then fails on
the creation (it strikes me as odd that a create command tries to
delete the snapshot...).

Whereas loop 2 says:
  Found volume group "rootvg"
  Locking memory
  Removing rootvg-bcs--testsnap (253:7)
  Unlocking memory
  Removing link /dev/rootvg/bcs-testsnap
  ....
		       
Loop 3 says:
  Found volume group "rootvg"
  LV rootvg/bcs-testsnap in use: not deactivating
  Couldn't deactivate new snapshot.
				 
The first 80+ lines of loop2 and loop3 are near identical.

The machine is now running 2.6.16-rc5 (I saw a fair few LVM patches
had gone in so I thought I had better check) but also failed under
2.6.15.

Running Debian Linux with:
 dmsetup 1.02.03-1
 libdevmapper 1.02.03-1
 lvm2 2.02.02-1
 lvm-common 1.5.20
    
Same problem with:
 kernel 2.6.12-10
 dmsetup 1.01.04-2
 libdevmapper 1.01.04-2
 lvm2 2.01.04-5
 lvm-common 1.5.17
	 
I cannot reproduce this on two other machines one of which is Debian sarge:
 kernel 2.6.8-16sarge1
 dmsetup 1.01.00-4
 libdevmapper 1.01.00-4
 lvm2 2.01.04-5
 lvm-common 1.5.17
     
One of which is my laptop (Debian unstable):
 kernel 2.6.15
 dmsetup 1.02.03-1
 libdevmapper 1.02.03-1
 lvm2 2.02.02-1
 lvm-common 1.5.20 

I've done a bit more debugging and the difference is that in
lib/activate/activate.c line 737 ish -
info.open_count is set to 1 when the create fails and 0 when it
suceeds.  (lv->status is set to 832 in both cases).

... more hacking and I have a gross workaround - before the snapshot
is deactivated I've added a check which loops for upto 10ms until the
snapshot is not marked as open.   Debugging patch attached for people
to barf over  :-)

Obviously this is a really bad idea, but hopefully it's of use to an
LVM guru out there.

Many thanks,

Adrian

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=1

File descriptor 4 left open
    Using logical volume(s) on command line
    Archiving volume group "rootvg" metadata (seqno 465).
    Found volume group "rootvg"
    Removing rootvg-bcs--testsnap (253:7)
    Found volume group "rootvg"
    Releasing logical volume "bcs-testsnap"
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 466).
  Logical volume "bcs-testsnap" successfully removed
File descriptor 4 left open
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Setting chunksize to 16 sectors.
      Getting target version for snapshot
      Getting target version for snapshot-origin
      Setting activation/mirror_region_size to 512
      Locking /var/lock/lvm/V_rootvg WB
    Finding volume group "rootvg"
      /dev/ram0: No label detected
      /dev/sda: size is 35565080 sectors
      /dev/md0: No label detected
      /dev/rootvg/rootlv: No label detected
      /dev/ram1: No label detected
      /dev/sda1: size is 96327 sectors
      /dev/sda1: size is 96327 sectors
      /dev/md1: lvm2 label detected
      /dev/rootvg/swaplv: No label detected
      /dev/ram2: No label detected
      /dev/sda2: size is 35455455 sectors
      /dev/sda2: size is 35455455 sectors
      /dev/rootvg/xmdeb: No label detected
      /dev/ram3: No label detected
      /dev/rootvg/repolv: No label detected
      /dev/ram4: No label detected
      /dev/rootvg/bcs-test_oliver: No label detected
      /dev/ram5: No label detected
      /dev/rootvg/bcs-test_adrianhome: No label detected
      /dev/ram6: No label detected
      /dev/rootvg/bcs-test_oliver-snapshot: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/devvg/fileslv: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb: size is 71687372 sectors
      /dev/sdb1: size is 96327 sectors
      /dev/sdb1: size is 96327 sectors
      /dev/sdb2: size is 35551845 sectors
      /dev/sdb2: size is 35551845 sectors
      /dev/sdb3: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Archiving volume group "rootvg" metadata (seqno 466).
    Creating logical volume bcs-testsnap
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 467).
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCIRN03MTfrfdr
itaW7hwWjplBz6PqMYUt
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Locking memory
      Setting activation/missing_stripe_filler to /dev/ioerror
      Getting target version for linear
      Getting target version for striped
    Creating rootvg-bcs--testsnap
    Loading rootvg-bcs--testsnap table
    Resuming rootvg-bcs--testsnap (253:7)
      Unlocking memory
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
    Zeroing start of logical volume "bcs-testsnap"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCIRN03MTfrfdr
itaW7hwWjplBz6PqMYUt
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Locking memory
    Removing rootvg-bcs--testsnap (253:7)
      Unlocking memory
      Removing link /dev/rootvg/bcs-testsnap
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCIRN03MTfrfdr
itaW7hwWjplBz6PqMYUt
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCHL0eKJCBaSXQ
L7Ugrqu7aJrbBGzvnNOz
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCHL0eKJCBaSXQ
L7Ugrqu7aJrbBGzvnNOz
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
    Creating rootvg-bcs--test_adrianhome-real
    Loading rootvg-bcs--test_adrianhome-real table
    Resuming  (253:7)
    Loading rootvg-bcs--test_adrianhome table
    Creating rootvg-bcs--testsnap-cow
    Loading rootvg-bcs--testsnap-cow table
    Resuming  (253:9)
    Creating rootvg-bcs--testsnap
    Loading rootvg-bcs--testsnap table
      Removing /dev/rootvg/bcs-test_adrianhome
      Linking /dev/rootvg/bcs-test_adrianhome -> /dev/mapper/rootvg-bcs--test_ad
rianhome
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
      Locking memory
    Suspending rootvg-bcs--test_adrianhome (253:5)
    Suspending rootvg-bcs--test_adrianhome-real (253:7)
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCHL0eKJCBaSXQ
L7Ugrqu7aJrbBGzvnNOz
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
    Loading rootvg-bcs--test_adrianhome-real table
    Suppressed rootvg-bcs--test_adrianhome-real identical table reload.
    Resuming rootvg-bcs--test_adrianhome-real (253:7)
    Loading rootvg-bcs--testsnap-cow table
    Suppressed rootvg-bcs--testsnap-cow identical table reload.
    Resuming rootvg-bcs--testsnap (253:10)
    Resuming rootvg-bcs--test_adrianhome (253:5)
      Unlocking memory
      Removing /dev/rootvg/bcs-test_adrianhome
      Linking /dev/rootvg/bcs-test_adrianhome -> /dev/mapper/rootvg-bcs--test_ad
rianhome
      Removing /dev/rootvg/bcs-testsnap
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 468).
  Logical volume "bcs-testsnap" created
      Unlocking /var/lock/lvm/V_rootvg

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=2

File descriptor 4 left open
    Using logical volume(s) on command line
    Archiving volume group "rootvg" metadata (seqno 468).
    Found volume group "rootvg"
    Removing rootvg-bcs--testsnap (253:10)
    Removing rootvg-bcs--testsnap-cow (253:9)
    Found volume group "rootvg"
    Removing snapshot bcs-testsnap
    Releasing logical volume "bcs-testsnap"
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 469).
    Found volume group "rootvg"
    Found volume group "rootvg"
    Suspending rootvg-bcs--test_adrianhome (253:5)
    Suspending rootvg-bcs--test_adrianhome-real (253:7)
    Found volume group "rootvg"
    Resuming rootvg-bcs--test_adrianhome-real (253:7)
    Loading rootvg-bcs--test_adrianhome table
    Resuming rootvg-bcs--test_adrianhome (253:5)
    Removing rootvg-bcs--test_adrianhome-real (253:7)
  Logical volume "bcs-testsnap" successfully removed
File descriptor 4 left open
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Setting chunksize to 16 sectors.
      Getting target version for snapshot
      Getting target version for snapshot-origin
      Setting activation/mirror_region_size to 512
      Locking /var/lock/lvm/V_rootvg WB
    Finding volume group "rootvg"
      /dev/ram0: No label detected
      /dev/sda: size is 35565080 sectors
      /dev/md0: No label detected
      /dev/rootvg/rootlv: No label detected
      /dev/ram1: No label detected
      /dev/sda1: size is 96327 sectors
      /dev/sda1: size is 96327 sectors
      /dev/md1: lvm2 label detected
      /dev/rootvg/swaplv: No label detected
      /dev/ram2: No label detected
      /dev/sda2: size is 35455455 sectors
      /dev/sda2: size is 35455455 sectors
      /dev/rootvg/xmdeb: No label detected
      /dev/ram3: No label detected
      /dev/rootvg/repolv: No label detected
      /dev/ram4: No label detected
      /dev/rootvg/bcs-test_oliver: No label detected
      /dev/ram5: No label detected
      /dev/rootvg/bcs-test_adrianhome: No label detected
      /dev/ram6: No label detected
      /dev/rootvg/bcs-test_oliver-snapshot: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/devvg/fileslv: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb: size is 71687372 sectors
      /dev/sdb1: size is 96327 sectors
      /dev/sdb1: size is 96327 sectors
      /dev/sdb2: size is 35551845 sectors
      /dev/sdb2: size is 35551845 sectors
      /dev/sdb3: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Archiving volume group "rootvg" metadata (seqno 469).
    Creating logical volume bcs-testsnap
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 470).
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCGShJAynDWbaB
l0n5Bj3fa7pCf37wDy7m
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Locking memory
      Setting activation/missing_stripe_filler to /dev/ioerror
      Getting target version for linear
      Getting target version for striped
    Creating rootvg-bcs--testsnap
    Loading rootvg-bcs--testsnap table
    Resuming rootvg-bcs--testsnap (253:7)
      Unlocking memory
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
    Zeroing start of logical volume "bcs-testsnap"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCGShJAynDWbaB
l0n5Bj3fa7pCf37wDy7m
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Locking memory
    Removing rootvg-bcs--testsnap (253:7)
      Unlocking memory
      Removing link /dev/rootvg/bcs-testsnap
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCGShJAynDWbaB
l0n5Bj3fa7pCf37wDy7m
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCHL0eKJCBaSXQ
L7Ugrqu7aJrbBGzvnNOz
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCHL0eKJCBaSXQ
L7Ugrqu7aJrbBGzvnNOz
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
    Creating rootvg-bcs--test_adrianhome-real
    Loading rootvg-bcs--test_adrianhome-real table
    Resuming  (253:7)
    Loading rootvg-bcs--test_adrianhome table
    Creating rootvg-bcs--testsnap-cow
    Loading rootvg-bcs--testsnap-cow table
    Resuming  (253:9)
    Creating rootvg-bcs--testsnap
    Loading rootvg-bcs--testsnap table
      Removing /dev/rootvg/bcs-test_adrianhome
      Linking /dev/rootvg/bcs-test_adrianhome -> /dev/mapper/rootvg-bcs--test_ad
rianhome
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
      Locking memory
    Suspending rootvg-bcs--test_adrianhome (253:5)
    Suspending rootvg-bcs--test_adrianhome-real (253:7)
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCHL0eKJCBaSXQ
L7Ugrqu7aJrbBGzvnNOz
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
    Loading rootvg-bcs--test_adrianhome-real table
    Suppressed rootvg-bcs--test_adrianhome-real identical table reload.
    Resuming rootvg-bcs--test_adrianhome-real (253:7)
    Loading rootvg-bcs--testsnap-cow table
    Suppressed rootvg-bcs--testsnap-cow identical table reload.
    Resuming rootvg-bcs--testsnap (253:10)
    Resuming rootvg-bcs--test_adrianhome (253:5)
      Unlocking memory
      Removing /dev/rootvg/bcs-test_adrianhome
      Linking /dev/rootvg/bcs-test_adrianhome -> /dev/mapper/rootvg-bcs--test_ad
rianhome
      Removing /dev/rootvg/bcs-testsnap
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 471).
  Logical volume "bcs-testsnap" created
      Unlocking /var/lock/lvm/V_rootvg

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=3

File descriptor 4 left open
    Using logical volume(s) on command line
    Archiving volume group "rootvg" metadata (seqno 471).
    Found volume group "rootvg"
    Removing rootvg-bcs--testsnap (253:10)
    Removing rootvg-bcs--testsnap-cow (253:9)
    Found volume group "rootvg"
    Removing snapshot bcs-testsnap
    Releasing logical volume "bcs-testsnap"
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 472).
    Found volume group "rootvg"
    Found volume group "rootvg"
    Suspending rootvg-bcs--test_adrianhome (253:5)
    Suspending rootvg-bcs--test_adrianhome-real (253:7)
    Found volume group "rootvg"
    Resuming rootvg-bcs--test_adrianhome-real (253:7)
    Loading rootvg-bcs--test_adrianhome table
    Resuming rootvg-bcs--test_adrianhome (253:5)
    Removing rootvg-bcs--test_adrianhome-real (253:7)
  Logical volume "bcs-testsnap" successfully removed
File descriptor 4 left open
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Setting chunksize to 16 sectors.
      Getting target version for snapshot
      Getting target version for snapshot-origin
      Setting activation/mirror_region_size to 512
      Locking /var/lock/lvm/V_rootvg WB
    Finding volume group "rootvg"
      /dev/ram0: No label detected
      /dev/sda: size is 35565080 sectors
      /dev/md0: No label detected
      /dev/rootvg/rootlv: No label detected
      /dev/ram1: No label detected
      /dev/sda1: size is 96327 sectors
      /dev/sda1: size is 96327 sectors
      /dev/md1: lvm2 label detected
      /dev/rootvg/swaplv: No label detected
      /dev/ram2: No label detected
      /dev/sda2: size is 35455455 sectors
      /dev/sda2: size is 35455455 sectors
      /dev/rootvg/xmdeb: No label detected
      /dev/ram3: No label detected
      /dev/rootvg/repolv: No label detected
      /dev/ram4: No label detected
      /dev/rootvg/bcs-test_oliver: No label detected
      /dev/ram5: No label detected
      /dev/rootvg/bcs-test_adrianhome: No label detected
      /dev/ram6: No label detected
      /dev/rootvg/bcs-test_oliver-snapshot: No label detected
      /dev/ram7: No label detected
      /dev/ram8: No label detected
      /dev/devvg/fileslv: No label detected
      /dev/ram9: No label detected
      /dev/ram10: No label detected
      /dev/ram11: No label detected
      /dev/ram12: No label detected
      /dev/ram13: No label detected
      /dev/ram14: No label detected
      /dev/ram15: No label detected
      /dev/sdb: size is 71687372 sectors
      /dev/sdb1: size is 96327 sectors
      /dev/sdb1: size is 96327 sectors
      /dev/sdb2: size is 35551845 sectors
      /dev/sdb2: size is 35551845 sectors
      /dev/sdb3: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Archiving volume group "rootvg" metadata (seqno 472).
    Creating logical volume bcs-testsnap
    Creating volume group backup "/etc/lvm/backup/rootvg" (seqno 473).
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCdqaEYorixOXQ
fEBesZL98DSkH57rvYh4
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
      Locking memory
      Setting activation/missing_stripe_filler to /dev/ioerror
      Getting target version for linear
      Getting target version for striped
    Creating rootvg-bcs--testsnap
    Loading rootvg-bcs--testsnap table
    Resuming rootvg-bcs--testsnap (253:7)
      Unlocking memory
      Linking /dev/rootvg/bcs-testsnap -> /dev/mapper/rootvg-bcs--testsnap
    Zeroing start of logical volume "bcs-testsnap"
      Finding volume group for uuid B7JETuqns4Gzv0l94YoUxVUZxSFj93CCdqaEYorixOXQ
fEBesZL98DSkH57rvYh4
      /dev/md1: lvm2 label detected
      /dev/md1: lvm2 label detected
    Found volume group "rootvg"
  LV rootvg/bcs-testsnap in use: not deactivating
  Couldn't deactivate new snapshot.
      Unlocking /var/lock/lvm/V_rootvg


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="snapshot-hack.diff"

--- tools/lvcreate.c.orig	2006-03-01 13:59:01.000000000 +0000
+++ tools/lvcreate.c	2006-03-01 13:49:07.000000000 +0000
@@ -698,6 +698,20 @@
 		/* FIXME Remove the failed lv we just added */
 	}
 
+	{
+	  struct logical_volume *apblv;
+	  struct lvinfo apbinfo;
+	  int i;
+	  for (i=0; i<10; i++)
+          {
+	    apblv = lv_from_lvid(cmd, lv, 0);
+	    lv_info(cmd, apblv, &apbinfo,1);
+	    log_error ("APB1 %d (%s)",apbinfo.open_count, apblv->name);
+	    usleep(1);
+	    if (! apbinfo.open_count)
+	      break;
+	  }
+	}
 	if (lp->snapshot) {
 		/* Reset permission after zeroing */
 		if (!(lp->permission & LVM_WRITE))

--8t9RHnE3ZwKMSgU+--
