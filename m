Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468A39ACB
	for <linux-lvm@lists.linux.dev>; Fri,  9 Feb 2024 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707521278; cv=none; b=feajbe60SElJGwHToSXztlQ8B0aRIzeChV3SBf6r80O0IrDQHTJjMVTXufz1bRIOW96tAQ/4vzC3VwdYeP4uC3BU2UOezYOT747syF3+SLtc6CTlegABKxFVbQ4zECtI63BNufNo9tZcIFwLYI9QNKJVPorzHeL2M3aUUanne1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707521278; c=relaxed/simple;
	bh=K/nxda3XSG7QtmtMAv/yQX+YIgqIK2tjc55oSeJFPS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZupoLs0G2zwKqVrK83JAdV8e3ctrohuc8dzQDAZ88U8run3gLxq2xxUmFDFJUzp6rZ/oAsZmKrVZl2jGKCSQNHduEWAf8SEqGZ0LZiaCNdxRKsZ86wDUzR6vG/iW30I0meHg6OC6vP+fl3DyFJO7tuIB8++OXK4SR369/g1paBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cQM0EdeV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cQM0EdeV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40fe03cd1caso13437055e9.0
        for <linux-lvm@lists.linux.dev>; Fri, 09 Feb 2024 15:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707521275; x=1708126075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3nB9e2byooXR+GdNIK3rReu3YzHbGIrVFFG/ndgqM4=;
        b=cQM0EdeV6uHtddvpqAIwELw1trLGZmL+Nzx4/0ZIyXbsPfChc2DYYgbGGapr6yOOJO
         WwasQgObt75tNTD825UyeIh5VorF/rkxApLowoofBMcRWz3MDyuYxmErtldEDxBQXe/0
         TS79zyVUPoDTfI+YRJrZWoHYve9XkAirCu9ZjeyphDSXsYVbXAvYJEXycTlaKNmp9emY
         bl+/pl+e9K1W9/OxaVmvc3dSuwcwUKzyxmsM+h7Oz7X9YCGbYq7igIXWF4l7w8zzIUYj
         uCLlbVxGHYly4gH3nWuHNgLk+97In7ivPTk4Ld3YsiHmgyW9kIcAlDsVXinsHUeNwt5F
         fm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707521275; x=1708126075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3nB9e2byooXR+GdNIK3rReu3YzHbGIrVFFG/ndgqM4=;
        b=hQrHaCCIFP/mObMf5xzqhlbpjI4D13mwucKpUtEROd0OQsie+JvNBALRAp69K57MMT
         kwY7j/uLKlhqE68CKpRRpD7KylbsRRqGD/K9xlW76fYNrGxQmqsg/q+7dPIkg2C4GaX0
         NjPFr9yCQ+ouyjuep5/L2UA99a2no2i47FPEv/I1Xzucw0WNE8ayShDtnNZGBp250WrG
         WyHKsfnNO1pR0jXuQvlKH3CRQ079QUWiafgL+HAC66mPq/wgDprJdO7khMAAPmepSzrI
         eLTi9ZQqeDB4JWwif3QxTMkLsBYz+g1vpsADIhE93Kyz7Q3ONmwoQeGTc+tnSrY+Q4+z
         Xr1g==
X-Forwarded-Encrypted: i=1; AJvYcCU+tfaKbgFwxGp8k4XI4Rx/0CBgM4bDdYC0tmf/625qdUuoAcWl7CY7jzVyNl/yqK06MKdXwE6YfshS6XKPcL+lTf1mkFRheMho
X-Gm-Message-State: AOJu0YwQzDLn3smGrHPfLM0Sk3PNmQZfjdgZsaGmbsm/vfpeK4xIKwUv
	BQOGN9stPjy4EDaN1pziKNkocg04TzTq/ENUF5vlIznfHFnpsPZlohlNVABpRUE=
X-Google-Smtp-Source: AGHT+IEd2LqqzidXq6iai1eeL5UJ8j5iJ1r5CX7aHdlgaHCMUfyjl4kmEdMpnSMHsGSNKwAnikn/VQ==
X-Received: by 2002:a05:600c:4f48:b0:410:27e7:f6e with SMTP id m8-20020a05600c4f4800b0041027e70f6emr512079wmq.39.1707521274821;
        Fri, 09 Feb 2024 15:27:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAf4eJiCF5NLA8r5xXRd1AiC3X51JRSkja9HwF6/W0/ZgrKp2pnhEzkhLYZ26y8iUjvmNfcOUrrplGqUFwvJCjqMKCL6xaZdt8KzCi5PK3QvwyKc0e9/FGhOF7wE5Exaz4nW8qJltSKmt8Vj9kat/3ZZOkWJtJPUeCj0/K74AW4Ygq03mTDa/R
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id v8-20020a5d43c8000000b0033b512b2031sm375375wrr.114.2024.02.09.15.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 15:27:54 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH v2 6/7] 11-dm-mpath.rules: Don't force activation while device is suspended
Date: Sat, 10 Feb 2024 00:27:34 +0100
Message-ID: <20240209232735.9791-7-mwilck@suse.com>
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

If paths become available while the device is suspended, don't
activate. Another uevent will arrive when the device is resumed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/11-dm-mpath.rules.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/multipath/11-dm-mpath.rules.in b/multipath/11-dm-mpath.rules.in
index 8e8741a..4141833 100644
--- a/multipath/11-dm-mpath.rules.in
+++ b/multipath/11-dm-mpath.rules.in
@@ -92,10 +92,16 @@ ENV{MPATH_DEVICE_READY}=="0", ENV{DM_NOSCAN}="1"
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
+ENV{DM_SUSPENDED}==1, ENV{MPATH_DEVICE_READY}="0", GOTO="dont_activate"
+
+ENV{DM_ACTIVATION}="1", ENV{MPATH_UNCHANGED}="0"
+LABEL="dont_activate"
 
 # The code to check multipath state ends here. We need to set
 # properties and symlinks regardless whether the map is usable or
-- 
2.43.0

