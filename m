Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF9B1CD18
	for <linux-lvm@lists.linux.dev>; Mon,  5 Feb 2024 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137213; cv=none; b=HpJGNLNq5A4jtaK5roLSlHPTphmfB8+F3hjEkq/pI24q0A4RiHRaJTKtE4qfAD1RL4RAU/eqftXq1Sb0ftPPkkIgGOYravXLzJ/zfhOCDKPkEckeftZSdhLr8Rdvf6UCMqRKKTrgDMwaC515WUtVqOpvIrgshE0llVNfWfiWiFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137213; c=relaxed/simple;
	bh=CwLS1tCXQGaOMl4151yRpmTmM5aGbS5ECce8eIZx0EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enz994+e9djvybpmFi9wk24votSmRK/qzLmgsEXLO63drisFnOPIybJ9P7xLBr/IiI2vf5ahqwGcAMpTIMxyCCSOd5/THF2NHach8x1G8cc5G7PBLk2bseKqaL37D9LVwMS7siDo38weLnojLArw52mJ9Wv/fddKJI/DQx5aSYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XiBSmZgv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XiBSmZgv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40fcb4ef7bcso23600865e9.0
        for <linux-lvm@lists.linux.dev>; Mon, 05 Feb 2024 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707137210; x=1707742010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bD7Kg8XXkPr56bmFVSxt8Cn654XeP0exS5tfljsujs8=;
        b=XiBSmZgvGgkJZWytkyPVQAslZJHtpoj7L2ll6W3f2Ri7dmb8Ov+6i8azVAYJwBiGLK
         yHeXl0o+3USKsJMITlqXGen6jZ4BHGlRtEttWP0Pxkd99F5I/2JZVpGNGcKGrcsB9MRg
         o4i0dSISEhLpmIw2g0PZKMreD445+KbGE6qIXasIh7yemjjUmgInEAylOgz/tO6CguUJ
         fW6uLrj0FEDvFz2abYk/CjzOVYdOpUoSnt/B2+ypv/RoAXUhbIsfBUhUdTG1URM+Skq1
         Uvd72+XmlQPI8ONJSm6nsiZ9leHq7T9leroKPXufu8AdLWlEFoxKApbH5FKoRf1AdHlB
         gOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137210; x=1707742010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD7Kg8XXkPr56bmFVSxt8Cn654XeP0exS5tfljsujs8=;
        b=WbSQ6+lnBzaHEnYRboKeaW3UKy08zlmSp8o2smKopXgT33EF5ZZuqsePhytZ65JmVr
         CdHr1GYGPVHYtwJSaneLggu8t2m6N5keJBAzU8jJ7On4jXbIs3lYxz0rRbJZ4TEMvdYO
         GFxXoymd2zbDFQd7Foj2FlkZnPS7tgU9QuzKLz7VuynqNmI9SYi7gAR5Duc7pZYbsvkA
         PxLKy0hpVaq86E3TmdocIPAPry1v4eFk6/xf/23DZQZypEtQyOMACnd2Qzhn9oOkwm2k
         JWg2fJH/489wxgFoXNl2JDDIIIFpRlNKklkj1NnDemEV4Hwh3lhniKZTLnZKvTHqJhdE
         XXxA==
X-Gm-Message-State: AOJu0YxqAFYSbeYEm5E8a9LOd7NyQraSCwnPsIL8R0QI2c619T9YHws4
	l8HIUb4dmAGppEnnrwEzyHrJZ0fZV+GBesgeie5A+XlJ7f8i3GmQGjGKP0B53mY=
X-Google-Smtp-Source: AGHT+IFjOlAspad2BCbWKZoT4Ah66eV9BiwBiZ7ZB8Gl4vIMrbh5wG8EiZRAoW6Oco/vUhvv0+bk3A==
X-Received: by 2002:a05:600c:1da6:b0:40f:afd6:b266 with SMTP id p38-20020a05600c1da600b0040fafd6b266mr4453912wms.18.1707137209384;
        Mon, 05 Feb 2024 04:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVxl9iffdyznSF3r8Ml2twEkVZorAKlEg5vZA5aGnw9DrcLPEfNhs0GpwJDvU+XLWl2BrCYOvWynOk5Y5guG8a12dWGBCsB6d6ycrD+TNMyy6uC12cnYZBwWU5ghKFI1pxh/L6ye6UpU0gQsS7FNOnRlgTSEBjv63McKIAcujzWO443+oo9PQ+4
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id m21-20020a05600c3b1500b0040fd2f3dc0esm6652892wms.45.2024.02.05.04.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 04:46:49 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH 3/6] 11-dm-mpath.rules: use import logic like 13-dm-disk.rules
Date: Mon,  5 Feb 2024 13:46:35 +0100
Message-ID: <20240205124638.17877-4-mwilck@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205124638.17877-1-mwilck@suse.com>
References: <20240205124638.17877-1-mwilck@suse.com>
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
---
 multipath/11-dm-mpath.rules | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
index 43d227c..8fc4a6f 100644
--- a/multipath/11-dm-mpath.rules
+++ b/multipath/11-dm-mpath.rules
@@ -89,7 +89,8 @@ ENV{MPATH_DEVICE_READY}!="0", ENV{.MPATH_DEVICE_READY_OLD}=="0", \
 # not. If symlinks get lost, systemd may auto-unmount file systems.
 
 LABEL="scan_import"
-ENV{DM_NOSCAN}!="1", GOTO="import_end"
+ENV{DM_NOSCAN}!="1", ENV{DM_DISABLE_OTHER_RULES_FLAG}!="1", \
+	ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="import_end"
 IMPORT{db}="ID_FS_TYPE"
 IMPORT{db}="ID_FS_USAGE"
 IMPORT{db}="ID_FS_UUID_ENC"
-- 
2.43.0

