Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2JDWsbr020063
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:54 -0400
Received: from c6-x64-devel.vds-ok.com (r02-ge0-SH.prague.vds-ok.com
	[88.86.97.52] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JDWrkS026537
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 09:32:53 -0400
From: Vladislav Bogdanov <bubble@hoster-ok.com>
Date: Tue, 19 Mar 2013 13:32:49 +0000
Message-Id: <1363699970-10002-10-git-send-email-bubble@hoster-ok.com>
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: [linux-lvm] [PATCH 09/10] man: document --force option to lvchange,
	provide examples
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
 man/lvchange.8.in |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/man/lvchange.8.in b/man/lvchange.8.in
index 32a0580..c26a65c 100644
--- a/man/lvchange.8.in
+++ b/man/lvchange.8.in
@@ -42,6 +42,7 @@ lvchange \- change attributes of a logical volume
 .RB [ \-v | \-\-verbose ]
 .RB [ \-Z | \-\-zero
 .RI { y | n }]
+.RB [ \-f | \-\-force ]
 .I LogicalVolumePath
 .RI [ LogicalVolumePath ...]
 .SH DESCRIPTION
@@ -159,10 +160,26 @@ manually without a clustered lock manager.
 Set zeroing mode for thin pool. Note: already provisioned blocks from pool
 in non-zero mode are not cleared in unwritten parts when setting zero to
 \fIy\fP.
+.TP
+.B \-\-force
+Allows to do lock conversion (shared to exclusive and vice versa) on a
+logical volume in a clustered volume group (-aly and -aey commands).
+Also allows to deactivate logical volume locked exclusively on a remote node
+(but not open) when using -an command.
 .SH Examples
 Changes the permission on volume lvol1 in volume group vg00 to be read-only:
 .sp
 .B lvchange -pr vg00/lvol1
+.sp
+Convert lock on a shared-locked volume lvol1 in clustered volume group vg00 to
+exclusive (assuming no more nodes in a cluster hold shared lock):
+.sp
+.B lvchange -aey --force vg00/lvol1
+.sp
+Convert lock on a exclusively-locked volume lvol1 in volume group vg00 to shared
+(f.e. in order to migrate virtual machine which uses that LV as a becking disk device):
+.sp
+.B lvchange -aly --force vg00/lvol1
 .SH SEE ALSO
 .BR lvm (8),
 .BR lvcreate (8),
-- 
1.7.1
