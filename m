Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7BKVaa21336
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 16:31:36 -0400
Received: from famine.peeron.com (h-64-105-205-12.cmbrmaor.covad.net
	[64.105.205.12])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7BKVUXn014747
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 16:31:31 -0400
Received: from famine.peeron.com (localhost.localdomain [127.0.0.1])
	by famine.peeron.com (8.12.11/8.12.11) with ESMTP id i7BJVQDD005878
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 15:31:27 -0400
Received: (from dan@localhost)
	by famine.peeron.com (8.12.11/8.12.11/Submit) id i7BJVQUV005877
	for linux-lvm@redhat.com; Wed, 11 Aug 2004 15:31:26 -0400
Date: Wed, 11 Aug 2004 15:31:26 -0400
From: Dan Boger <lvm@peeron.com>
Message-ID: <20040811193126.GT32074@peeron.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] more pvmove problems
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've tried to search online, and found some mentions of a patch, but I
can't be sure if it applies to my case.

Setup:
Redhat 7.2
LVM 1.0.8 from source

One of my drives started reporting read errors, so I got a new one, and
wanted to replace it.  Since I was replacing a 200G drive with a 250G, I
too the chance to get rid of the 30G drive in there too.

Added the new drive, created a PV on it, added it to the VG and moved
the 30G drive to it with pvmove, no problem.  Then I started moving the
200G drive over.  

Had an error early in the process, so I had to retry with the -i flag.
It kept failing, so after reading up in the man page, I was able to copy
the rest of the PV using the -n flag:

  pvmove -v -i -n medialv:61-6076 /dev/hde /dev/hdh

36 hours later, the process finished.  Now I figured I still need to
move the first 60 PEs.  But whatever I try, I can't get pvmove to work.

Here's what pvscan reports (hde is the drive I'm trying to retire):
  pvscan -- reading all physical volumes (this may take a while...)
  pvscan -- ACTIVE   PV "/dev/hdg" of VG "mediavg" [189.88 GB / 0 free]
  pvscan -- ACTIVE   PV "/dev/hdh" of VG "mediavg" [233.72 GB / 17.84 GB free]
  pvscan -- ACTIVE   PV "/dev/hde" of VG "mediavg" [189.88 GB / 187.97 GB free]
  pvscan -- inactive PV "/dev/hdd" is in no VG  [27.96 GB]
  pvscan -- ACTIVE   PV "/dev/hdb" of VG "mediavg" [74.47 GB / 0 free]
  pvscan -- total: 5 [716.10 GB] / in use: 4 [688.14 GB] / in no VG: 1 [27.96 GB]

And here's what I get when I try "pvmove -vv /dev/hde":
  pvmove -- checking name of source physical volume "/dev/hde"
  pvmove -- locking logical volume manager
  pvmove -- reading data of source physical volume from "/dev/hde"
  pvmove -- checking volume group existence
  pvmove -- reading data of volume group "mediavg" from lvmtab
  pvmove -- checking volume group consistency of "mediavg"
  pvmove -- searching for source physical volume "/dev/hde" in volume group "mediavg"
  pvmove -- building list of possible destination physical volumes
  pvmove -- checking volume group activity
  pvmove -- moving physical extents in active volume group "mediavg"
  pvmove -- WARNING: if you lose power during the move you may need
          to restore your LVM metadata from backup!
  pvmove -- do you want to continue? [y/n] y
  pvmove -- starting to move extents away from physical volume "/dev/hde"
  pvmove -- checking for enough free physical extents in "mediavg"
  lv: /dev/mediavg/medialv[1]  old_dev: 33:00  new_dev: 34:64  old_pe_sector: 65920  new_pe_sector: 452788608
  pvmove -- opening output physical volume "/dev/hdh"
  pvmove -- llseeking input physical volume "/dev/hde"
  pvmove -- llseeking output physical volume "/dev/hdh"
  pvmove -- /dev/hde [PE 0 [medialv [LE 0]]] -> /dev/hdh [PE 6908] [1/61]
  pvmove -- locking physical extent 0 of "/dev/hde" in kernel
  pvmove -- about to read input physical volume "/dev/hde" and to write output physical volume "/dev/hdh"
  pvmove -- remapping physical extent in VGDA of kernel
  pvmove -- ERROR "Invalid argument" remapping
  pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents

  zsh: exit 23    sudo pvmove -vv /dev/hde

Any suggestions?  At this point, I'm willing to lose some data off the
drive, just so I can remove it and remount my partition.

If there's any other information I can provide, I'd be happy to.

Thanks!

Dan

-- 
Dan Boger
lvm@peeron.com
