Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8849D381B8
	for <linux-lvm@lists.linux.dev>; Fri,  9 Feb 2024 23:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707521274; cv=none; b=Uv4rROe5aQdDodtL+Tpv3vGqgJbXKpX1uCDgsdupQylI9ewZqce2aZMGEdNwQMwqbKdIe7iqNyX4XY9nO2mwiwx98ZcsSbImfnHgoTGkKhAab0STlofVxgCKcpM87cN3bNftr3uydsxzgura5cbXuy/0EdyLJ3DTcv8MlpO5MRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707521274; c=relaxed/simple;
	bh=9JhTyEY7xyHWHgL2v5AU/Txam2omxdPpwVoZQVdz0Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehlHaopJkjHbC2gZvSTF73e6UoeguJyOjKIGYCFhL2p7wPJZR3zPVStMk953dbatCVYLo/ygb5EqjgUNDGpdWuhLVkUnVxfP22qUA2yrrcehw2SVjcdYYRoDrMPR/edLXOrHUj1qyZBw9REW8pb2wQc4P2H5LKkxasqmG1laUWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cERT1M/M; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cERT1M/M"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so12231975e9.1
        for <linux-lvm@lists.linux.dev>; Fri, 09 Feb 2024 15:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707521270; x=1708126070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3fMdvnxDNyoJn0qP55t3+k8Zw8j30JNS+3y3grOE0s=;
        b=cERT1M/Mmdl/FBSNP/Sy7JfoDGZHDO2l4hHcb+uozvxRvW4dFr1NR2i7fmqu7hc29Y
         bCg3BK2TgtifKJ1hjtpF3++uLmCMpxPDkbnnVhndtsOFbErIcESBqesiqtyYLvcGe9MU
         MMbKDJkDTSKYc5mJgizqVftjaTsbWFV7JgWoYTx2VGmV+WRFqfpmGwOjrhHjtafJLT9k
         Q2yWmS6y/8+2yKa4/k4Aipw0WEuWZ8jN/leK/MwkKJKBnIdCHZTPRcfQMDjUF9+ATUVt
         +4y8MYTjKhtOIfpFDc9xNi/ebZBGiHmWM4OdlgGG1iqM8iB9kc6drxa/2Fhl+2BME9Xc
         8d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707521270; x=1708126070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3fMdvnxDNyoJn0qP55t3+k8Zw8j30JNS+3y3grOE0s=;
        b=atpUaPIlMZHVCs4Npd+8gwSTYfns7H3f27/e1oT5uLBhStUhDObWt5/SiF+0eQMgmS
         q+t2w59qJDqxBbB9fkdVOTVSiWXkTYMDlKiqOgOx8DgLBCLt/l7zdVYpkOnhbb9ObFUR
         in88nTCB8oQw9hNt6WkiFBsPE6M5xukdS3k7gSbozYJ4Q0y2qG4+YVkPDrFWM6aquINM
         DfEDEafX5L6GlsLjZmn8Tk6i3IWIQ2Lqwpa5u6wKdOtdOLHGvFzFv84LIAWCbhqNUsty
         Cq0KfXRaKEKEV0yTzG9K7qneLp9swpOUNd1VJsmZYG0+lKUvfkFTCPkskK9apXKWGvQ5
         AcEw==
X-Gm-Message-State: AOJu0Yzdj92tSDCAVMNkE2pIrk0uBVQHhicnx6+dFyu9+AB3rnD6H+GC
	KzGzZJnsRSVdmTnKbq8P+sgzNIaL28XWLTQMT6XBAREcPDqsFeHu7K+xkg95KoLGrIK+L1ivwIu
	g
X-Google-Smtp-Source: AGHT+IEPF2dgG3zjaoxzC24aL27ayKIIT5kgcqPnYqyPSZaxh76L+zQk883QIIuw7hQQREvkyYc83A==
X-Received: by 2002:a05:600c:548e:b0:410:676e:9edb with SMTP id iv14-20020a05600c548e00b00410676e9edbmr454387wmb.8.1707521269793;
        Fri, 09 Feb 2024 15:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXt9tZr1chphaxyNXtuWhSgm8pP5ojPBIFrIPBP/znnb79YhAAyYmOvxYDFdvwyW+fRNNW5NUEMC/u4rxgdjF3DPolu+09EFU0QDmVt6RWyqhNyC1UNzIWoQdZTnusivtBYv1qI+ogU3Nw4uHXsTsSDjNWN4PHVNnTU6GKzy6O4v/fJH/ZHaWLe
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id fb11-20020a05600c520b00b004109088e59csm4192wmb.31.2024.02.09.15.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 15:27:49 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH v2 1/7] 11-dm-mpath.rules: use import logic like 13-dm-disk.rules
Date: Sat, 10 Feb 2024 00:27:29 +0100
Message-ID: <20240209232735.9791-2-mwilck@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209232735.9791-1-mwilck@suse.com>
References: <20240209232735.9791-1-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have to import the properties if either DM_NOSCAN or
DM_DISABLE_OTHER_RULES_FLAG is set, because blkid will be skipped
in both cases. Also, if DM_UDEV_PRIMARY_SOURCE_FLAG is not set,
it makes no sense to try and import the properties.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/11-dm-mpath.rules.in | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/multipath/11-dm-mpath.rules.in b/multipath/11-dm-mpath.rules.in
index b3117f9..e7be12d 100644
--- a/multipath/11-dm-mpath.rules.in
+++ b/multipath/11-dm-mpath.rules.in
@@ -79,7 +79,14 @@ ENV{MPATH_DEVICE_READY}!="0", ENV{.MPATH_DEVICE_READY_OLD}=="0", \
 # not. If symlinks get lost, systemd may auto-unmount file systems.
 
 LABEL="scan_import"
-ENV{DM_NOSCAN}!="1", GOTO="import_end"
+
+# If DM_UDEV_PRIMARY_SOURCE_FLAG is not set, the properties below
+# have never been properly set. Don't import them.
+ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", GOTO="import_end"
+
+# Don't import the properties from db if we will run blkid later.
+ENV{DM_NOSCAN}!="1", ENV{DM_DISABLE_OTHER_RULES_FLAG}!="1", GOTO="import_end"
+
 IMPORT{db}="ID_FS_TYPE"
 IMPORT{db}="ID_FS_USAGE"
 IMPORT{db}="ID_FS_UUID_ENC"
-- 
2.43.0

