Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC1B92166BA0
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 19:19:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2D9C811E79
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 19:19:20 +0000 (UTC)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 01E74541E9C
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 19:19:17 +0000 (UTC)
Received: from pdx1-sub0-mail-a18.g.dreamhost.com
	(100-98-64-6.trex.outbound.svc.cluster.local [100.98.64.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 507BB541E7F
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 19:19:16 +0000 (UTC)
Received: from pdx1-sub0-mail-a18.g.dreamhost.com (localhost [127.0.0.1])
	by pdx1-sub0-mail-a18.g.dreamhost.com (Postfix) with ESMTP id
	E05907F155
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 12:19:15 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: relay@brickies.net)
	by pdx1-sub0-mail-a18.g.dreamhost.com (Postfix) with ESMTPSA id
	7497182F22
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 12:19:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id a12so2859114ybg.9
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 12:19:15 -0700 (PDT)
MIME-Version: 1.0
From: Scott Moser <smoser@brickies.net>
Date: Tue, 20 Oct 2020 15:19:02 -0400
Message-ID: <CAKxE60wD76RnJ=Zk690C5vajHjg3xuLANOoRih42VRQKrCriPw@mail.gmail.com>
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
