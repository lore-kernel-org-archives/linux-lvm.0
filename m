Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i61Dqn004277
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2004 09:52:49 -0400
Received: from gagarin.0x63.nu (mail@0x63.nu [62.65.122.157])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i61DqfXn018802
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2004 09:52:41 -0400
Received: from ganja by gagarin.0x63.nu with local (Exim 3.36 #1 (Debian))
	id 1Bg1zR-0003he-00
	for <linux-lvm@redhat.com>; Thu, 01 Jul 2004 15:52:37 +0200
From: Magnus =?ISO-8859-1?Q?M=E5nsson?= <ganja@0x63.nu>
Message-Id: <1088690081.4221.6.camel@freya>
Mime-Version: 1.0
Date: Thu, 01 Jul 2004 15:54:41 +0200
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pvmove - Can't expand LV: Mirror support missing from
	kernel?
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi,
I am having some trouble doing pvmove.

I did reduce the fs and resize the lv with these commands:
e2fsck -f /dev/mapper/vg00-data && resize2fs /dev/mapper/vg00-data
551000
lvresize -L 552000M /dev/vg00/data

So now pvdisplay says something like:
part    total   free    alloc
hdb1    1786    0       1786
hde1    1786    0       1786
hdf1    1786    0       1786
hdg1    2680    0       2680
hdh1    1190    603     587
sda1    3724    3724    0

Since I want to remove hdb1 and hde1 I tried to pvmove hdb1 with:
pvmove /dev/hdb1
My output follows:
thor:~# pvmove /dev/hdb1
  Can't expand LV: Mirror support missing from kernel?
  ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'vg00-pvmove0'.
thor:~# pvmove --abort=20
  Can't expand LV: Mirror support missing from kernel?
  Suspension of temporary mirror LV failed
  Can't expand LV: Mirror support missing from kernel?

I am running a clean 2.6.7-kernel, with device mapper, dm-crypt and raid
(including all raidlevels) as modules, the only thing I do not have
under RAID and LVM is Multipath I/O support.

Can anyone please tell me why I am getting this problem and how to solve
it?


Do CC me, I am not subscribed to the list.

Thanks in advance
--=20
Magnus M=EF=BF=BDnsson <ganja@0x63.nu>
