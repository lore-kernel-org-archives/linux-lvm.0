Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAL455r30363
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2004 23:05:05 -0500
Date: Sat, 20 Nov 2004 23:03:02 -0500
From: esr@thyrsus.com
Message-Id: <200411210403.iAL432gD014546@snark.thyrsus.com>
Subject: [linux-lvm] problems in lvreduce.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <Linux-LVM@Sistina.com>

This is automatically generated email about problems in a man page for which
you appear to be responsible.  If you are not the right person or list, tell
me and I will attempt to correct my database.

See http://catb.org/~esr/doclifter/problems.html for details on how and
why these patches were generated.  Feel free to email me with any questions.
Note: These patches do not change the mod date of any manual page.  You
may wish to do that by hand.

Problems with lvreduce.8:

1. Unknown or invalid macro.  That is, one that does not fit in the
macro set that the man page seems to be using.  This is a serious
error; it often means part of your text is being lost or rendered
incorrectly.

--- lvreduce.8-orig	2004-11-11 23:44:09.875847056 -0500
+++ lvreduce.8	2004-11-11 23:44:18.373555208 -0500
@@ -15,7 +15,7 @@
 .br 
 You should therefore ensure that any filesystem on the volume is 
 resized
-.i before
+.I before
 running lvreduce so that the extents that are to be removed are not in use.
 .br
 Shrinking snapshot logical volumes (see
-----------------------------

--
                             Eric S. Raymond
