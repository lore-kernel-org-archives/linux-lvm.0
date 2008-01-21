Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m0LDV7Al025647
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 08:31:07 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JGwjz-0003q5-Kt
	for linux-lvm@redhat.com; Mon, 21 Jan 2008 13:31:07 +0000
Date: Mon, 21 Jan 2008 13:31:07 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20080121133107.GZ24157@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 development release 2.02.31
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

We've just made a new development release of LVM2 with a few new features we'd
like people to test.

ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.31.tgz
  (Current stable release is 2.02.28)

ftp://sources.redhat.com/pub/dm/device-mapper.1.02.24.tgz
  (considered stable in its default configuration)


1. Setting readahead is now supported.
Use --readahead with lvchange or lvcreate.

       -r, --readahead ReadAheadSectors|auto|none
              Set read ahead sector count of this logical volume.  For  volume
              groups  with  metadata  in  lvm1  format,  this  must be a value
              between 2 and 120 sectors.  The default value  is  "auto"  which
              allows  the  kernel  to  choose  a suitable value automatically.
              "None" is equivalent to specifying zero.

We're particularly interested in comparisons between 'auto' and 'none' with
different configurations.


2. vgsplit now lets you split off PVs into a new VG, and accepts vgcreate
command line options to set properties of that VG.
  [a few known bugs in the validation still to fix here]


3. If you enable dmeventd (configure '--enable-dmeventd' on both packages)
it can now monitor snapshots and report to syslog if they are getting full.
  [further enhancements to this are planned]


4. The --resizefs argument to lvresize/lvextend/lvreduce now calls out
to a new script, fsadm, which attempts to resize the filesystem in
conjunction with the LV.
  [further enhancements to this are planned - only some cases supported 
   so far, and we want fsadm to become a new commandline entry point too,
   like e2fsadm used to be in LVM1 - it isn't yet]


5. pvs --segments will now also display LV segment fields so you can
see what is layered on each PV segment.


6. lvconvert now supports additional mirror reconfigurations (similar to the
way pvmove works).  E.g. convert from -m1 to -m2.


Alasdair
-- 
agk@redhat.com
