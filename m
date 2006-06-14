Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5EE7w44029049
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 10:07:58 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5EE7pZw004232
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 10:07:52 -0400
Received: from wolverine (unknown [192.168.1.71])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 616D712EDA
	for <linux-lvm@redhat.com>; Wed, 14 Jun 2006 15:07:46 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Wed, 14 Jun 2006 15:09:38 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20060614140746.616D712EDA@bluewhale.planbit.co.uk>
Subject: [linux-lvm] Unexpected write access to LV
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,

I have been testing my system and had expected to be able to use the
"lvchange -pr" and "lvchange -prw" options to enable/disable the write
access to a logical volume.  It seems that although "lvs" reports the
read/write status according to the most recent command, this does not
reflect the true read/write access to the logical volume.  It seems that you
have to perform a "lvchange -an" then "lvchange -ay" to apply the read/write
access rights to the logical volume.

You can see an example below...

This doesn't make sense and it doesn't match the man page for the lvchange
command.

Can anyone shed light on this ?

Thanks,

Roger

NewWombat:~# uname -a
Linux NewWombat 2.6.16.20.rwl1 #1 Fri Jun 9 15:23:04 BST 2006 i686 GNU/Linux
NewWombat:~# lvm --version
  No such command.  Try 'help'.
NewWombat:~# lvs --version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.5.0
NewWombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -ri-a- 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
NewWombat:~# dd if=/dev/zero of=/dev/clientstore/backupimage bs=64K count=1
dd: writing `/dev/clientstore/backupimage': Operation not permitted
1+0 records in
0+0 records out
0 bytes transferred in 0.015371 seconds (0 bytes/sec)
NewWombat:~# lvchange -prw /dev/clientstore/backupimage
  Logical volume "backupimage" changed
NewWombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -wi-a- 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
NewWombat:~# dd if=/dev/zero of=/dev/clientstore/backupimage bs=64K count=1
dd: writing `/dev/clientstore/backupimage': Operation not permitted
1+0 records in
0+0 records out
0 bytes transferred in 0.004415 seconds (0 bytes/sec)
NewWombat:~# lvchange -an /dev/clientstore/backupimage
NewWombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -wi--- 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
NewWombat:~# lvchange -ay /dev/clientstore/backupimage
NewWombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -wi-a- 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
NewWombat:~# dd if=/dev/zero of=/dev/clientstore/backupimage bs=64K count=1
1+0 records in
1+0 records out
65536 bytes transferred in 0.000942 seconds (69568756 bytes/sec)
NewWombat:~# lvchange -pr /dev/clientstore/backupimage
  Logical volume "backupimage" changed
NewWombat:~# dd if=/dev/zero of=/dev/clientstore/backupimage bs=64K count=1
1+0 records in
1+0 records out
65536 bytes transferred in 0.000962 seconds (68118616 bytes/sec)
NewWombat:~# lvchange -an /dev/clientstore/backupimage
NewWombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -ri--- 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
NewWombat:~# lvchange -ay /dev/clientstore/backupimage
NewWombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -ri-a- 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
NewWombat:~# dd if=/dev/zero of=/dev/clientstore/backupimage bs=64K count=1
dd: writing `/dev/clientstore/backupimage': Operation not permitted
1+0 records in
0+0 records out
0 bytes transferred in 0.004422 seconds (0 bytes/sec)
NewWombat:~#
