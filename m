Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE525E3D8
	for <linux-lvm@lists.linux.dev>; Fri,  1 Mar 2024 22:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332852; cv=none; b=U01kzxnRQXlb8OxMwRoAG1ylyVM5kSpAhYdm/tVZpWDSVPHdqnsHe9rIUiGuqVlMkIKqxb4oSasAwUD3eNZKZQgKw7icN8jc2aNu7AswRmucKxluVP+6cSMcqudfbu+4pIfJZHVoEkuJWcdPB3lSEM49kHmfRcymruimaIviatk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332852; c=relaxed/simple;
	bh=BH2Mff6eMxJxa8uiy8bILawJnuPt/8OqM8H2fSVLxP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaXyxV0bbBJdWa1o+s2i+95BD61//hYDvj1UsjkWsBADIqIe9fHHmI2ER4/XEdb9MmEii3BVP1jIJPnWcqSl447kFAe/wWSM8y6rjrRrvXFwZTfPRHLxmyU7fFJB56Dsoxem/BjEkLq6vV/C77CXXHTTy4WrZYo5alJ3JNoNIlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qw5Sho6I; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qw5Sho6I"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so629219466b.0
        for <linux-lvm@lists.linux.dev>; Fri, 01 Mar 2024 14:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709332849; x=1709937649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfBHQaU0uiX0Tda2C5yW1m1OiRNeG08zo8vwLv7hkzw=;
        b=Qw5Sho6IicNEviE0z+YM8YwTfth0FGPOST1TBOuAwaPClXpUqtqk3qL3T9SrlNQ8ZH
         Mydrl+UQfiPQnBmF67Fomw1/kAwSwYnTVVm97/jauLPOn1wcPe1wmKzGNElxFGOliy/k
         c/pBtPyCn5wrATf8beKGj5F+2xJd7hTkVARiLxrSstxT/OnJT0izybojHD/9lCsW7t6H
         +dnuFCj8jxyKCMl9hdi7sAylQ+GCAEwPFaUqp/hBMJSbmw7jxWeRuHWcNRoE4p04AOuz
         JuUFND3upbqksicXsK/aJdcDFnOJtxh6/7wlONU3iROB7xfzjp1zIdAnOzYOP5iP3dzJ
         je5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709332849; x=1709937649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfBHQaU0uiX0Tda2C5yW1m1OiRNeG08zo8vwLv7hkzw=;
        b=MMLoj3DTlgzVMbzwXt18hkfm2F0j3k+B17GsafRjRg3AX2TxFJ+0jKMG6jJhtx9VXw
         nx+Wx23HkcmCah29WBvKebXKNihJImpiS/QrjXx1ErYdjLsEJyaGUGmBEzhuZVe/RVin
         kcmoqY2AbdB4O/pbYy7FagR+xY4TUMFQy8RAYBRhN3Iq2yvPg3SXU1RgUmdTulYqPRy0
         1K2v9UnPDq38OdmvsWB3eCyd6/CcUvmyEK6ygEoQ56fVGDpBundDj3QPTqdhOwCojsH4
         BmcTTzNmy5jNmiNyyIsc5FOnFU4J2omffESevm33KnaUCX2yK+Fs02PfIHv+Fcg8T57/
         QT0w==
X-Gm-Message-State: AOJu0YzgkUTuK6TQ8G7MqqNbWnOO9tciD3SrEfFDG/AeA4z186yrjYSj
	0femcR9WD2u5X0bst5oNmmuiqS0OH5MjkRSduQ9Xil4r/BcTFJ/agGZ1wyqZjPU=
X-Google-Smtp-Source: AGHT+IHytUdgyA48m2/0YOiPB5H582ieRSDU62traNJdDXo8Bd/NMAZm2Q2DeOF03YzY+Qsof6/z5w==
X-Received: by 2002:a17:906:b75a:b0:a44:8abd:7b41 with SMTP id fx26-20020a170906b75a00b00a448abd7b41mr2282850ejb.37.1709332849565;
        Fri, 01 Mar 2024 14:40:49 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id k3-20020a1709061c0300b00a3e0b7e7217sm2103045ejg.48.2024.03.01.14.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 14:40:49 -0800 (PST)
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
Subject: [RFC PATCH 6/7] dm udev rules: don't export and save DM_NOSCAN
Date: Fri,  1 Mar 2024 23:40:10 +0100
Message-ID: <20240301224011.11117-7-mwilck@suse.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301224011.11117-1-mwilck@suse.com>
References: <20240301224011.11117-1-mwilck@suse.com>
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

