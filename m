Received: from relay.herbolt.com (relay.herbolt.com [37.46.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99344D535
	for <linux-lvm@lists.linux.dev>; Wed,  6 Dec 2023 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herbolt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herbolt.com
Received: from mail.herbolt.com (ip-89-176-251-106.bb.vodafone.cz [89.176.251.106])
	by relay.herbolt.com (Postfix) with ESMTPSA id 8166D1034D15
	for <linux-lvm@lists.linux.dev>; Wed,  6 Dec 2023 10:26:20 +0100 (CET)
Received: from trufa.system.loc (ip-89-176-167-221.bb.vodafone.cz [89.176.167.221])
	by mail.herbolt.com (Postfix) with ESMTPSA id DA58A180E08B;
	Wed,  6 Dec 2023 10:26:19 +0100 (CET)
From: Lukas Herbolt <lukas@herbolt.com>
To: linux-lvm@lists.linux.dev
Cc: lukas@herbolt.com
Subject: [PATCH] man: add inte(g)rity to man lvs
Date: Wed,  6 Dec 2023 10:26:13 +0100
Message-ID: <20231206092618.281890-1-lukas@herbolt.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lvs man page is missing volume type inte(g)rity. This should be fixing it.

Signed-off-by: Lukas Herbolt <lukas@herbolt.com>
---
 man/lvs.8_end | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/lvs.8_end b/man/lvs.8_end
index dc3a27446..e9897b4fc 100644
--- a/man/lvs.8_end
+++ b/man/lvs.8_end
@@ -4,7 +4,7 @@
 The lv_attr bits are:
 .IP 1 3
 Volume type: (\fBC\fP)ache, (\fBm\fP)irrored, (\fBM\fP)irrored without initial sync, (\fBo\fP)rigin,
-(\fBO\fP)rigin with merging snapshot, (\fBr\fP)aid, (\fBR\fP)aid without initial sync,
+(\fBO\fP)rigin with merging snapshot, inte(\fBg\fP)rity, (\fBr\fP)aid, (\fBR\fP)aid without initial sync,
 (\fBs\fP)napshot, merging (\fBS\fP)napshot, (\fBp\fP)vmove, (\fBv\fP)irtual,
 mirror or raid (\fBi\fP)mage, mirror or raid (\fBI\fP)mage out-of-sync, mirror (\fBl\fP)og device,
 under (\fBc\fP)onversion, thin (\fBV\fP)olume, (\fBt\fP)hin pool, (\fBT\fP)hin pool data,
-- 
2.42.0

