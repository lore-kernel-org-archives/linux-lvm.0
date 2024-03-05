Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559925917C
	for <linux-lvm@lists.linux.dev>; Tue,  5 Mar 2024 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640379; cv=none; b=ZMI8qX1HATbLfWlx+QFdMSs8IUzsdBcntLelOvTXYKWLtpxQPGqccY2/tFSx9uhx6X3X+A09VDEkv9Yb9sIUN1+7PhJy+Hz7c0E9iMkze03YBzqLWXIfO8FaIGCmJwMcSiJd/0CoaRCP0SQ2h9m9qnCt7gs0sVZSmlsJPAQggtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640379; c=relaxed/simple;
	bh=BH2Mff6eMxJxa8uiy8bILawJnuPt/8OqM8H2fSVLxP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDenKcdKWFDClhgROHcg+PkTdf+nWReGb7OkTXBAxi5ND4ovszxs6Vilgvz2R7gGqweBubuIz2H+gLcwDd06aHF+QOIsIJ6I3lEL3zV9Cn29quSbwwEcGh8dtygPd2aYtVw7ZGF5qZA24Rgj52XyaLUpofdsuqaA/CVkiVcmZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fNgHtBw5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fNgHtBw5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e2774bdc5so2692795f8f.2
        for <linux-lvm@lists.linux.dev>; Tue, 05 Mar 2024 04:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709640376; x=1710245176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfBHQaU0uiX0Tda2C5yW1m1OiRNeG08zo8vwLv7hkzw=;
        b=fNgHtBw5hiSrsGx4BxzjJO/x8ujZi+c1nyf2EZ1nRa4/qiNgnPcQuqDTmxQ74Hm9R/
         30+AghxdFH9XzxJ4iCSRBYum5JGxtrFHlrRriGqvwCn9kt2gyBrYIxMy1oyggAZI7eHA
         pR68bO/8l6oR5dqwnG9IIti3OLfLANBuJEW9rERAsDL9rtkqgJl8hcLPKBIuwfsrLhWe
         bPe93+OauOUNDIt6vtnU4dTOncHszldb8OXe4LRzGKMboeHHF5GabUojhPt8DTt+9vl8
         tHTgpZzeJr5l5vKUS1aXP3rc56chmQFtuyCWx7zp58KjjMUceFakl2ODA/4DrkscXpxN
         +8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640376; x=1710245176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfBHQaU0uiX0Tda2C5yW1m1OiRNeG08zo8vwLv7hkzw=;
        b=YMEzPv5fBOC3GCyY14GREoYmgDePcHpvM4JMjY4m0M2U8MOtDK0+YCjkhJnglwbWN5
         Ywz7gWsLOnC9KW3VTVdb5pTLq965hBUncSrLFREJ0z/hk1SHWDZCsiZjCOq93FNrD/oT
         8RM1zMYj7DLto2BlR15vV55aXE7z/5sc+9PO5XkrLAr3NnwqAXCM8NjN8+INEf7NWFUt
         i9jlmMz5gI2LhbI1pNVoKy7dDwPkPj6w3bFk5I6nvRjtU+dbFdAM3uGb2XV/lDhFTk4z
         M2oI7nhBnCvnoQS0n5yWe/7vHMrohO+vINVNdg+mK0rMeRExNq7u0w98mJyKuvaybKwR
         pd4A==
X-Gm-Message-State: AOJu0YylnMJ2E+Fo0wLFsijdU5rhm7r7gziZcEk8rFOixRPhB4Np3Mz/
	ylznFNqDMgmzx/dOfVMVJ7hUsaPgFxcA8bANbqnbfOdeAlensNPX6hgYN3mbiDs=
X-Google-Smtp-Source: AGHT+IG52EWb26ZxrSg+0ueqss7ujEQNGD6/6lKKp1enlXf/nneM7+wtnDCwaAwRr0kLFwxLzndUPw==
X-Received: by 2002:a5d:4b07:0:b0:33d:7d88:cae5 with SMTP id v7-20020a5d4b07000000b0033d7d88cae5mr8647957wrq.69.1709640375944;
        Tue, 05 Mar 2024 04:06:15 -0800 (PST)
Received: from localhost ([2001:470:6d:10f7:9114:d168:fb53:9a37])
        by smtp.gmail.com with UTF8SMTPSA id l15-20020adfa38f000000b0033e03d37685sm14881556wrb.55.2024.03.05.04.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 04:06:15 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Peter Rajnoha <prajnoha@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev,
	dm-devel@lists.linux.dev,
	Martin Wilck <mwilck@suse.com>,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v2 6/7] dm udev rules: don't export and save DM_NOSCAN
Date: Tue,  5 Mar 2024 13:05:49 +0100
Message-ID: <20240305120550.11617-7-mwilck@suse.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240305120550.11617-1-mwilck@suse.com>
References: <20240305120550.11617-1-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DM_NOSCAN is not an official API any more and doesn't have to be
restored from the udev db. Rename it to .DM_NOSCAN.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 udev/11-dm-lvm.rules.in  | 2 +-
 udev/13-dm-disk.rules.in | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
index 0b77fe2..d0a5637 100644
--- a/udev/11-dm-lvm.rules.in
+++ b/udev/11-dm-lvm.rules.in
@@ -30,7 +30,7 @@ IMPORT{program}="(DM_EXEC)/dmsetup splitname --nameprefixes --noheadings --rows
 # so those selected rules are surely skipped.
 # We don't need to save and restore the previous of DM_UDEV_DISABLE_OTHER_RULES_FLAG,
 # that's taken care of in 10-dm.rules.
-ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", ENV{DM_NOSCAN}="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
+ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", ENV{.DM_NOSCAN}="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
 
 ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1", GOTO="lvm_end"
 
diff --git a/udev/13-dm-disk.rules.in b/udev/13-dm-disk.rules.in
index cb2ce2d..7989871 100644
--- a/udev/13-dm-disk.rules.in
+++ b/udev/13-dm-disk.rules.in
@@ -18,9 +18,9 @@ SYMLINK+="disk/by-id/dm-name-$env{DM_NAME}"
 ENV{DM_UUID}=="?*", SYMLINK+="disk/by-id/dm-uuid-$env{DM_UUID}"
 
 ENV{.DM_SUSPENDED}=="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="dm_import"
-ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="dm_import"
+ENV{.DM_NOSCAN}=="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="dm_import"
 ENV{.DM_SUSPENDED}=="1", GOTO="dm_end"
-ENV{DM_NOSCAN}=="1", GOTO="dm_watch"
+ENV{.DM_NOSCAN}=="1", GOTO="dm_watch"
 
 (BLKID_RULE)
 GOTO="dm_link"
-- 
2.43.2

