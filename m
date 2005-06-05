Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j55JhKO09771
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:43:20 -0400
Received: from mail.cybermesa.com (mail.cybermesa.com [198.59.109.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j55JhJKn018374
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 15:43:19 -0400
Received: from esp-dsl114.cybermesa.com (esp-dsl114.cybermesa.com
	[65.19.30.114])
	by mail.cybermesa.com (8.12.11/8.12.10) with ESMTP id j55JhIBS020510
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2005 13:43:19 -0600
From: Neil <nnc@newmexico.com>
Date: Sun, 05 Jun 2005 13:45:34 -0600
Message-Id: <1118000735.5018.21.camel@erdelyi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM help needed: conflicting names
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

[Sorry about the dup; sent this to redhat-list earlier but just
 discovered this list which the more appropriate place.]

Hi-

I lost a machine (bad PS or MB -- disk is fine) and am trying to
bring up the disk in a second machine in order to access certain
filesystems from it.  The second machine's disk has a single
volume group 'vg0' containing several logical volumes, 'root',
'usr', 'home', etc (/boot is its own primary partition).
Unfortunately the disk from the dead machine is configured almost
identically, with a single 'vg0' volume group and some logical
partitions of the same name.

Booting with both disks in the machine fails; it gets totally
confused about which /dev/vg0/root (for example) it is supposed
to be using.  I think I can configure lvm.conf so that the second
disk is ignored by pvscan/vgscan during bootup, but I'm still
stuck on how to actually mount any of the second disk's LVM 
filesystems because of the name clashes.  Somehow I'd like to
rename the volume group on the second disk to 'vg1', for example.

Anybody have any ideas?

Thanks!
  Neil <nnc@newmexico.com>
