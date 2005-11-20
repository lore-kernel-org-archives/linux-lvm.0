Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAKHQ9V29373
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 12:26:09 -0500
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAKHQ35I029640
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 12:26:03 -0500
Received: from dagger.cc.vt.edu (IDENT:mirapoint@evil-dagger.cc.vt.edu
	[10.1.1.11])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id jAKHPudb017612
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 12:25:56 -0500
From: Bill Ranck <ranck@vt.edu>
Date: Sun, 20 Nov 2005 12:25:50 -0500
Message-Id: <1132507550.24931.29.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Hosed up arrays and LVM
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
Content-Type: text/plain; charset="us-ascii"
To: LVM discussion list <linux-lvm@redhat.com>

Hello folks,
   I have a system where I am using md based multipath arrays with LVM2.
There was some maintenance on the IBM Shark SAN and when I rebooted this
system I got errors when my little startup script tried to do a vgscan.
The mdadm assemble step seems to have worked just fine, but here is a
part of the error messages from vgscan 

[root@strongbad init.d]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "local" using metadata type lvm2
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Couldn't find device with uuid 'CAg9Sn-5Jpw-V9bq-w0zl-Cv2I-tBjP-
qyw7QQ'.
  Couldn't find all physical volumes for volume group HPPR.
  Volume group "HPPR" not found
  Found volume group "dbms" using metadata type lvm2

It continues on like that with another volume group and different uuids.
I have /dev/md0 through /dev/md11 defined with md and some of those seem
OK, but md1, md2, md3, md4, md8, md9, md11 are not seen by vgscan.  I
tried pvcreate on those missing arrays, which made them visible, but LVM
does not recognize them as part of the volume groups they belong to
anymore.  

Can anyone suggest a course of action here?

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
