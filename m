Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A6AE2166B27
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 18:26:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D29102F1E0
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 18:26:07 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id d15so2725154ybl.10
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 11:26:04 -0700 (PDT)
MIME-Version: 1.0
From: Scott Moser <ssmoser@gmail.com>
Date: Tue, 20 Oct 2020 14:25:53 -0400
Message-ID: <CAKxE60yKcNFwaUHTEDyL62O1EKNo3o0wwEYBA+Z66tsx86S2xQ@mail.gmail.com>
Subject: [linux-lvm] [PATCH] man: document that 2 times poolmetadatasize is
	allocated for lvmthin
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

diff --git a/man/lvmthin.7_main b/man/lvmthin.7_main
index ce2343183..e21e516c9 100644
--- a/man/lvmthin.7_main
+++ b/man/lvmthin.7_main
@@ -1101,6 +1101,11 @@ specified with the --poolmetadatasize option.
When this option is not
 given, LVM automatically chooses a size based on the data size and chunk
 size.

+The space allocated by creation of a thinpool will include
+a spare metadata LV by default (see "Spare metadata LV").  As a result,
+the VG must have enough space for the --size option plus twice
+the specified (or calculated) --poolmetadata value.
+
 It can be hard to predict the amount of metadata space that will be
 needed, so it is recommended to start with a size of 1GiB which should be
 enough for all practical purposes.  A thin pool metadata LV can later be
