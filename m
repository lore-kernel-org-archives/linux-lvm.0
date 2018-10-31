Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC705D6A6
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2018 20:13:15 +0000 (UTC)
Date: Wed, 31 Oct 2018 15:13:14 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181031201314.GC14722@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] new releases with important bug fix
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Two new releases are available:

  2.02.182 (from the stable branch)
  https://sourceware.org/git/?p=lvm2.git;a=tag;h=d64377b5bbd2d170f1d6365157e2245d90a63c1a

  2.03.01 (from the development branch)
  https://sourceware.org/git/?p=lvm2.git;a=tag;h=1326762567c49c7305d83ac59dff819d7de964fd

These releases fix a bug that can potentially cause data corruption in a
rare situation described below.  The bug first appeared in version
2.02.178 (June 2018).  The subject of the fix is "metadata: prevent
writing beyond metadata area".

Bug details:

Most VGs will not be affected by this bug.  It can only happen when the
first physical extent (PE) in the VG is unaligned with 128KB.  By default
the first PE is at 1MB, so any VG using the default will be immune.  To
check the first PE offset, run:

$ vgs -o+pe_start --units k <vgname>

If the 1st PE field is 1024 KB, or another multiple of 128KB, then the VG
will be unaffected.

In cases where a command line or config option was used to create a VG
with an unaligned first PE, then the bug can potentially arise when:

1. An lvm command is being run and is updating the VG metadata,
   e.g. lvcreate, lvextend, vgextend.

2. The VG metadata is being updated at the tail end of the circular
   metadata buffer on disk.

3. A program (or file system) is writing changes to the 128KB of data
   that follows the lvm metadata, at the same time that lvm is writing
   its metadata.

Given this specific combination of updates, lvm could "undo" the change
made by the program/fs (lvm reads X, program writes X+1, lvm writes X.)

Apart from updating to a fixed version of lvm, the best way to avoid any
possible problem (in an unaligned VG) is to avoid running lvm commands
that change metadata while LVs in the VG are being used.
