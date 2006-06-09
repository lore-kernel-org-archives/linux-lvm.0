Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59DhdWh005282
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 09:43:39 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59Dhb6I024998
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 09:43:37 -0400
Received: from wolverine (unknown [192.168.1.71])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id B1AAE12EDD
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 14:43:26 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Fri, 9 Jun 2006 14:43:14 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20060609134326.B1AAE12EDD@bluewhale.planbit.co.uk>
Subject: [linux-lvm] Problem creating snapshots with 2.6.16.9 and LVM 2.02.06
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

I am running what was Debian Sarge but has the new 2.6.16.9 kernel.  I have
made a few patches to the kernel (to add an Areca RAID driver and a few
hardware sensors) but nothing in the device-mapper areas.  I use the
snapshots capability in LVM to snapshot the client's userdisk volume when
backing it up.

Until a couple days ago, I was running:

Wombat:~# uname -a
Linux Wombat 2.6.16.9.rwl7 #1 Tue May 16 20:25:14 BST 2006 i686 GNU/Linux
Wombat:~# lvm version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.4.0
Wombat:~#

and everything ran fine.

A few days ago, I saw an e-mail from Alasdair on this mailing list saying
that kernels 2.6.16 onwards should be using the later userspace tools.
Following this, I downloaded and compiled the latest device mapper library
(libdevmapper 1.02) and LVM tools (2.02.06).  When I installed them on the
machine and re-ran the backup script, I got an error from lvcreate when I
tried to make the snapshot which I did not get before.  I saw that Patrick
Honing also reported this error on 29/5/06 on this mailing list, but
couldn't see any reply.

For me, this failure is 100% repeatable.

Can anyone help shed light on this?

If you need any more information then please let me know and I will send it
in.  My current option seems to be to drop back to the older 2.01.04 lvm and
1.01 dmapper but given Alasdair's mail, this seems to be risky.

The full shell trace is below.

Wombat:~# uname -a
Linux Wombat 2.6.16.9.rwl7 #1 Tue May 16 20:25:14 BST 2006 i686 GNU/Linux
Wombat:~# lvm version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.5.0
Wombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -ri-ao 60.00G
  root        clientstore -wi-ao  5.00G
  userdisk    clientstore -wi-ao 60.00G
Wombat:~# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  clientstore   1   3   0 wz--n- 148.98G 23.98G
Wombat:~# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda2  clientstore lvm2 a-   148.98G 23.98G
Wombat:~# lvcreate -L10G -n snapdisk -s /dev/clientstore/userdisk
  LV clientstore/snapdisk in use: not deactivating
  Couldn't deactivate new snapshot.
Wombat:~# lvs
  LV          VG          Attr   LSize  Origin Snap%  Move Log Copy%
  backupimage clientstore -ri-ao 60.00G
  root        clientstore -wi-ao  5.00G
  snapdisk    clientstore -wi-a- 10.00G
  userdisk    clientstore -wi-ao 60.00G
Wombat:~#


Many thanks in advance,

Roger
