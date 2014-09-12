Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8CFHEPF025731
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 11:17:14 -0400
Received: from mta31.charter.net (mta31.charter.net [216.33.127.82])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8CFHDR6002523
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 11:17:13 -0400
Received: from imp10 ([10.20.200.15]) by mta31.charter.net
	(InterMail vM.8.01.05.02 201-2260-151-103-20110920) with ESMTP
	id <20140912151712.KCAO6769.mta31.charter.net@imp10>
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 11:17:12 -0400
Received: from impout005 ([68.114.189.20]) by mtaout003.msg.strl.va.charter.net
	(InterMail vM.9.00.013.00 201-2473-140) with ESMTP id
	<20140912151712.KUCP25980.mtaout003.msg.strl.va.charter.net@impout005>
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 10:17:12 -0500
From: Tony Asleson <tasleson@redhat.com>
Date: Fri, 12 Sep 2014 10:17:12 -0500
Message-Id: <1410535032-6422-1-git-send-email-tasleson@redhat.com>
Subject: [linux-lvm] [PATCH] man: Include max PE size in vgcreate
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

Signed-off-by: Tony Asleson <tasleson@redhat.com>
---
 man/vgcreate.8.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/vgcreate.8.in b/man/vgcreate.8.in
index bcfbcfc..050c369 100644
--- a/man/vgcreate.8.in
+++ b/man/vgcreate.8.in
@@ -121,7 +121,8 @@ default of 4 MiB leads to a maximum logical volume size of around 256GiB.
 
 If the volume group metadata uses lvm2 format those restrictions do not apply,
 but having a large number of extents will slow down the tools but have no
-impact on I/O performance to the logical volume.  The smallest PE is 1KiB
+impact on I/O performance to the logical volume.  The smallest PE is 1KiB, the
+largest PE is 4GiB.
 
 The 2.4 kernel has a limitation of 2TiB per block device.
 
-- 
1.8.2.1
