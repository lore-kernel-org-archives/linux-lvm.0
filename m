Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1H62Mi02483
	for <linux-lvm@redhat.com>; Tue, 17 Feb 2004 01:02:22 -0500
From: esr@thyrsus.com
Message-Id: <200402170557.i1H5v4IG009199@snark.thyrsus.com>
Subject: [linux-lvm] problems in one or more man pages you maintain
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 10:27:01 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <Linux-LVM@Sistina.com>

This is automatically generated email about problems in a man page for which
you appear to be responsible.  If you are not the right person or list, tell
me and I will attempt to correct my database.

See http://catb.org/~esr/doclifter/problems.html for details on how and
why these patches were generated.  Feel free to email me with any questions.

Note: This patch does not change the mod date of the manual page.  You
may wish to do that by hand.

Problems with lvcreate.8:

1. Unbalanced option group in command synopis, You probably forgot
to open or close a [ ] group properly.

--- lvcreate.8	2003-02-16 14:39:48.000000000 -0500
+++ lvcreate.8	2003-02-16 14:40:22.000000000 -0500
@@ -8,7 +8,7 @@
 .RB [ \-d | \-\-debug]
 .RB [ \-h | \-\-help ]
 .RB [ \-i | \-\-stripes " " \fIStripes\fRI ]
-.RB [\-I | \-\-stripesize " " \fIStripeSize\fRI ]]
+.RB [\-I | \-\-stripesize " " \fIStripeSize\fRI ]
 .RB { \-l | \-\-extents " " \fILogicalExtentsNumber |
 .RB   \-L | \-\-size " " \fILogicalVolumeSize[kKmMgGtT] }
 .RB [ \-n | \-\-name " " \fILogicalVolumeName ]
Problems with lvreduce.8:

1. Unknown or invalid macro.  That is, one that does not fit in the
macro set that the man page seems to be using.  This is a serious
error; it often means part of your text is being lost or rendered
incorrectly.

--- lvreduce.8	2003-02-16 14:42:16.000000000 -0500
+++ lvreduce.8	2003-02-16 14:42:42.000000000 -0500
@@ -18,12 +18,12 @@
 .br 
 You should therefore ensure that the (eg) filesystem on the volume is 
 resized
-.i before
+.I before
 running lvreduce so that the extents that are to be removed are not in use.
 If the filesystem is ext2 then you can use the 
 .B e2fsadm(8)
 command to both resize the filesystem and the logical volume together.
-.br.
+.br
 Shrinking snapshot logical volumes (see
 .B lvcreate(8)
 for information to create snapshots) is supported as well.

--
                             Eric S. Raymond
