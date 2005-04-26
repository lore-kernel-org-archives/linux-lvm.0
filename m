Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3Q9K6O05200
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2005 05:20:06 -0400
Received: from mail.cluj.astral.ro (mx0.astral.ro [193.226.99.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3Q9K477011416
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2005 05:20:05 -0400
Message-ID: <426E07BE.6030606@nextra.ro>
Date: Tue, 26 Apr 2005 12:19:58 +0300
From: Gergely Imre <gimre@nextra.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove hangs
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

i have a LV with two PVs in it, like this:

 --- Logical volume ---
  LV Name                /dev/watchdog/watchdog_var
  VG Name                watchdog
  LV UUID                v6U2JY-PBMf-snpJ-IXX5-ZzcV-y4fk-PchoQg
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                72.22 GB
  Current LE             2311
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:6

  --- Physical volumes ---
  PV Name               /dev/sdb2
  PV UUID               5v23aD-mkO0-I9Ur-zUKG-sGd2-8iCP-zhgfJe
  PV Status             allocatable
  Total PE / Free PE    2500 / 189

  PV Name               /dev/sda1
  PV UUID               7mzLEZ-Va0c-sdiW-8KAV-lyjo-a5yI-GBORGS
  PV Status             allocatable
  Total PE / Free PE    2941 / 2753

i want to remove sdb2, so i wanted to make a pvmove /dev/sdb2, so it
would move everything to sda1. the strange thing is, pvmove starts, and
after, say, 20% (about an hour or so) the whole system hangs somehow. i
can ping the box, but any command i try to run, fails. it's like it's
waiting for the disk to read/write, or something like that.
the distrib is Fedora Core 2.

lvm> version
  LVM version:     2.00.15 (2004-04-19)
  Library version: 1.00.14-ioctl (2004-04-06)
  Driver version:  4.4.0

filesystem is ext3.
the system has 2GB RAM, dual Intel Xeon 3GHz.

i tried with kernel 2.6.11.7, after a while it gives me kernel panic
during pvmove. then i tried with 2.6.9, it didn't panic, but it hung,
and i had to reboot.

it's kinda urgent, thanks.
