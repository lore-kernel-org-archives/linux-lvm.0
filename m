Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p646de40026318
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2011 02:39:40 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p646ddIL008060
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2011 02:39:39 -0400
From: Ross Boylan <ross@biostat.ucsf.edu>
Date: Sun, 03 Jul 2011 23:36:01 -0700
Message-Id: <1309761362.11383.35.camel@corn.betterworld.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM commands won't run w/failed PV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I have a VG made from several PV's, one of which (mostly) failed.
Anticipating this, I had moved all key LVs to be backed by other disks.
The system runs off those LVs.

When I try to run LVM commands, I get lots of errors, e.g.,
# lvs daisy
  /dev/dm-9: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-10: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-11: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-12: read failed after 0 of 4096 at 0: Input/output error
[etc]
  /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdb1: read failed after 0 of 2048 at 0: Input/output error
  /dev/sdb2: read failed after 0 of 2048 at 0: Input/output error
  /dev/sdb5: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'qqWQc6-Ucv9-8htm-TnOz-n1Va-9L0g-H3WA6o'.
  Couldn't find all physical volumes for volume group daisy.
  Volume group "daisy" not found

The last message in particular is weird, since many LVs from daisy are
successfully mounted.

How can I get LVM to overlook the problem, or access the setup enough to
remove the bad PV from the VG?  I believe sdb5 is the only PV from sdb
that is in the VG.

It may be relevant that the bad drive sort of comes up: during system
startup it was detected and some of its LVs were mounted.  This led to
an apparently successful replay of the log on one LV, and the start of
an fsck on another before errors apparently caused it to be dropped.

# vgs --version
  LVM version:     2.02.39 (2008-06-27)
  Library version: 1.02.27 (2008-06-25)
  Driver version:  4.13.0
The failed disk is SATA.  Running Debian Lenny with Linux 2.6.26-2-686
kernel.

Thanks.
Ross Boylan

P.S. Yes, I'm thinking about RAID.  No, there is no RAID in the current
system at any level (lvm, dm, hardware).
