Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWs0G010344
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:54 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWrOF017063
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:50 +0000
Message-Id: <1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 10/10] man: document --node option to lvchange
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Signed-off-by: Vladislav Bogdanov <bubble@hoster-ok.com>
---
 man/lvchange.8.in |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/man/lvchange.8.in b/man/lvchange.8.in
index c26a65c..e7ecf07 100644
--- a/man/lvchange.8.in
+++ b/man/lvchange.8.in
@@ -43,6 +43,9 @@ lvchange \- change attributes of a logical volume
 .RB [ \-Z | \-\-zero
 .RI { y | n }]
 .RB [ \-f | \-\-force ]
+.RB [ \-\-node
+.IR NodeID ]
+]
 .I LogicalVolumePath
 .RI [ LogicalVolumePath ...]
 .SH DESCRIPTION
@@ -166,6 +169,15 @@ Allows to do lock conversion (shared to exclusive and vice versa) on a
 logical volume in a clustered volume group (-aly and -aey commands).
 Also allows to deactivate logical volume locked exclusively on a remote node
 (but not open) when using -an command.
+.TP
+.B \-\-node \fINodeID
+Perform specified activation command on a remote cluster node (the same to running
+corresponding command on that node locally).
+Currently tested only for corosync clusters (\fB-I\fP \fIcorosync\fP option to clvmd)
+for corosync versions from 2.0.
+If corosync configuration has node names in a nodelist (nodelist.node.X.name = name
+in CMAP tems) or node names are used for ring0_addr (nodelist.node.X.ring0_addr = name),
+then that names may be used as NodeID. Otherwise numeric node IDs should be used.
 .SH Examples
 Changes the permission on volume lvol1 in volume group vg00 to be read-only:
 .sp
@@ -180,6 +192,20 @@ Convert lock on a exclusively-locked volume lvol1 in volume group vg00 to shared
 (f.e. in order to migrate virtual machine which uses that LV as a becking disk device):
 .sp
 .B lvchange -aly --force vg00/lvol1
+.sp
+Activate  volume lvol1 in clustered volume group vg00 locally (shared lock) on the
+cluster node with name node1:
+.sp
+.B lvchange -aly --node node1 vg00/lvol1
+.sp
+Convert lock on a shared-locked volume lvol1 in clustered volume group vg00 to
+exclusive (assuming no more nodes in a cluster hold shared lock) on a node node1:
+.sp
+.B lvchange -aey --force --node node1 vg00/lvol1
+.sp
+The same without node names configuration (assuming node has ID 4):
+.sp
+.B lvchange -aey --force --node 4 vg00/lvol1
 .SH SEE ALSO
 .BR lvm (8),
 .BR lvcreate (8),
-- 
1.7.1
