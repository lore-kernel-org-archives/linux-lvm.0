Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7DD8BV10006
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 09:08:11 -0400
Received: from mail.astral.ro (mx3.astral.ro [193.226.99.11])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7DD82T3027161
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 09:08:03 -0400
Received: from 127.0.0.1 (localhost.localdomain [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id A1C5530537
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 16:07:42 +0300 (EEST)
Received: from [192.168.25.222] (dummy.cluj.astral.ro [193.230.240.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.astral.ro (Postfix) with ESMTP id 9D47C30514
	for <linux-lvm@redhat.com>; Sat, 13 Aug 2005 16:07:42 +0300 (EEST)
Message-ID: <42FDF09E.1020004@astral.ro>
Date: Sat, 13 Aug 2005 16:07:42 +0300
From: Imre Gergely <imre.gergely@astral.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots data
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
To: linux-lvm@redhat.com


hi

i created a snapshot of a lvm, like this:

lvcreate -s -L +50G -p r -n backup /dev/mail/mail /dev/sda2

that is, a 50gb, read-only snapshot for /dev/mail/mail to the PV sda2.
the i did a lvdisplay -v

  --- Logical volume ---
  LV Name                /dev/mail/mail
  VG Name                mail
  LV UUID                jhjDsx-FvKT-zJer-uSc3-2rrb-eHaC-Af7jBq
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/mail/backup [active]
  LV Status              available
  # open                 1
  LV Size                150.22 GB
  Current LE             4807
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:3

  --- Logical volume ---
  LV Name                /dev/mail/backup
  VG Name                mail
  LV UUID                nQrrrx-cTN8-4lqX-op9F-1vDO-VJ1V-hbQlTU
  LV Write Access        read only
  LV snapshot status     active destination for /dev/mail/mail
  LV Status              available
  # open                 0
  LV Size                150.22 GB
  Current LE             4807
  Segments               1
  Snapshot chunk size    8.00 KB
  Allocated to snapshot  0.13%
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:6

how can i tell, how big is that snapshot i created? i know that it's
50gb, but where can i see this information. and what is "Allocated to
snapshot"? that percentage is from the 50gb a allocated for the
snapshot? or from the origin LV ?

lvm> version
  LVM version:     2.00.15 (2004-04-19)
  Library version: 1.00.14-ioctl (2004-04-06)
  Driver version:  4.4.0


i installed lvm from CVS too, and i noticed the output of lvdisplay is a
bit different there. in fact, lvdisplay does not even show the snapshot
LV i created... if i do a vgdisplay -v, only then appears:

  --- Logical volume ---
  LV Name                /dev/test/root
  VG Name                test
  LV UUID                wqoG5m-X3Fn-Gsaj-8P9t-cSwS-AXi4-IJ5j2P
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/test/backup_root [active]
  LV Status              available
  # open                 1
  LV Size                976.00 MB
  Current LE             244
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3

  --- Logical volume ---
  LV Name                /dev/test/backup_root
  VG Name                test
  LV UUID                cHs3wn-EUJl-f1wq-R8SJ-kpxZ-u9CG-L9Qhy1
  LV Write Access        read only
  LV snapshot status     active destination for /dev/test/root
  LV Status              available
  # open                 0
  LV Size                976.00 MB
  Current LE             244
  COW-table size         1016.00 MB
  COW-table LE           254
  Allocated to snapshot  2.05%
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2

lvm> version
  LVM version:     2.01.13-cvs (2005-06-14)
  Library version: 1.01.01 (2005-03-29)
  Driver version:  4.4.0


what's COW? :)

thx.
