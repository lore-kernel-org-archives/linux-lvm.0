Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8113F004
	for <linux-lvm@lists.linux.dev>; Wed, 14 Feb 2024 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707943885; cv=none; b=FzKNJ1RWmjXiSghDGbaB6GS2CRiVY5RF39cgUsh8Sfca3P/th4QgMg7xFGoHDIiD5czBCQ+k9LpfilJ4dASHmJC1RdlLUaMU0++Y3AM5Ku1kq3dBxFn1DMDiIz0w4gyLUzdILkiS8j3wi8854HLjFEKo4MpVDP110PoO2AdrsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707943885; c=relaxed/simple;
	bh=8ii43dcIOvaGlkTQI5a9x4SLyaKVdZcok+JcSQCq1v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=po38msBkafVALPW/BQKre4vNSPRLBgtLrIkhwTnJrkZhNrrGZjV07m1qs9t3c5+oy4IqLZXoBTL6fYPimyj9ipddmZWoip2PHQpn+1fTBE3yKuzeuQaRb5LVTTZbBCCLsPp+h1lx5MvZes6dBBkFlGU3tYeNd9UMFQAQYwAeoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XzBfWjEA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XzBfWjEA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-411d253098eso1110855e9.3
        for <linux-lvm@lists.linux.dev>; Wed, 14 Feb 2024 12:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707943882; x=1708548682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MvAnuyEhxa5f26HahF6d0WwkUZuummZ+wTGxjRyFuM=;
        b=XzBfWjEAzxJbGKrz30nvEYWBlROMaLHSDE/sdkw5SvJgTUweUKn1UBNDYZsVYOgy0d
         HjicRKP5+ZHq6aC9XwLlccL4cVc1LPmnCbs8V2DPcqUFeiZQ014C9eo3s4KLq72M3aRy
         1oZg/AbIsooKaIlw3r+bS78UB/TCuOc+08bW1wrWDGmwOysC0srzjxBK8RFbHaVZY68V
         nhtxTbNUfsvUSGd+kJXUd+cWwju7CuPBhdS6l9vX/QtRJrqujK9rHwwdxUdbHzZcFkI1
         hQ8fGpu295Q7aFtwNod2fiLtqPpR60q2uYdIhr+tHHh1+bOVBiMqks4pa9wJjxHha/vx
         In3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707943882; x=1708548682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MvAnuyEhxa5f26HahF6d0WwkUZuummZ+wTGxjRyFuM=;
        b=qFBRAMhRn+glxc4kTZ34X1dGlVaiX7ibYrHwbhkrwDyMFmoLP9cPZIUSEKFTwccSPu
         iKTf+ESYFStCnj69I9msvNkstCRQTv35GHgksCtqist0vptVKm8xIMXeBHx8fvJ2Y9x7
         w5/TuOon7zVa1cO9mNhHbT7ORwy3cwdCXYorRBnQvmZo8/DmIFYFM3Zko7d4TDXWpp7J
         9Oac0MkDbsmq2bOoC6F//9VlElrpmtpABPwYyyxrDEQucls7RV/IuAlpnv2htRI6zgWu
         dSh8MQSat/pSJ5eWMwJkCJkFi8n6SmZrhHvYq59zez/TUG3kltviaHOwfOywXkfl2aCH
         3S2w==
X-Forwarded-Encrypted: i=1; AJvYcCViC+5Opl1ghEPHq7UdxAbtr22OhQU68+zlBRsKr+XoWtjeEQmFlDEKjUnEFFtd2CyqYbBGu26P0n92bFFO4cE3uRS0fsFVxtnx
X-Gm-Message-State: AOJu0Yyry+zUA32JdVf142WNZc5pBsmw4LGbC1BYkV3S1KSEzzIjvffw
	pI6J0UvoVWCNBNS12PgJxFyAKgFN+HNhAsNnI/Gyx5SKRo3JTvhZwwbRXI5d4CM=
X-Google-Smtp-Source: AGHT+IEJwUcWLGznDej4XWnSNhUUxk7MyRzokFylrFYVZ7A+Le9dl+onvNlxC+bAleqI/hl//b99iQ==
X-Received: by 2002:a05:600c:4f48:b0:411:c3d3:94dd with SMTP id m8-20020a05600c4f4800b00411c3d394ddmr2667896wmq.28.1707943881789;
        Wed, 14 Feb 2024 12:51:21 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id jl24-20020a05600c6a9800b00410ac2d6b40sm2931135wmb.8.2024.02.14.12.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 12:51:21 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [PATCH v3 6/6] 11-dm-mpath.rules: Don't force activation while device is suspended
Date: Wed, 14 Feb 2024 21:51:07 +0100
Message-ID: <20240214205107.27409-7-mwilck@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214205107.27409-1-mwilck@suse.com>
References: <20240214205107.27409-1-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If paths become available while the device is suspended, don't
activate. Another uevent will arrive when the device is resumed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/11-dm-mpath.rules.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/multipath/11-dm-mpath.rules.in b/multipath/11-dm-mpath.rules.in
index 82b0204..d364f9b 100644
--- a/multipath/11-dm-mpath.rules.in
+++ b/multipath/11-dm-mpath.rules.in
@@ -94,10 +94,16 @@ ENV{MPATH_DEVICE_READY}=="0", ENV{DM_NOSCAN}="1"
 ENV{MPATH_DEVICE_READY}=="0", \
 	ENV{.MPATH_SAVE_DISABLE_OTHER_RULES_FLAG}="$env{DM_UDEV_DISABLE_OTHER_RULES_FLAG}", \
 	ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
+
 # If the device comes back online, set DM_ACTIVATION so that
-# upper layers do a rescan.
-ENV{MPATH_DEVICE_READY}!="0", ENV{.MPATH_DEVICE_READY_OLD}=="0", \
-	ENV{DM_ACTIVATION}="1", ENV{MPATH_UNCHANGED}="0"
+# upper layers do a rescan. If the device is currently suspended,
+# we have to postpone the activation until the next event.
+ENV{MPATH_DEVICE_READY}=="0", GOTO="dont_activate"
+ENV{.MPATH_DEVICE_READY_OLD}!="0", GOTO="dont_activate"
+ENV{DM_SUSPENDED}=="1", ENV{MPATH_DEVICE_READY}="0", GOTO="dont_activate"
+
+ENV{DM_ACTIVATION}="1", ENV{MPATH_UNCHANGED}="0"
+LABEL="dont_activate"
 
 # The code to check multipath state ends here. We need to set
 # properties and symlinks regardless whether the map is usable or
-- 
2.43.0

