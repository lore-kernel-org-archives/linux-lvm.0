Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775F5EE6C
	for <linux-lvm@lists.linux.dev>; Fri,  1 Mar 2024 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332851; cv=none; b=oN7l0WDqAGmo1uGw4csAnGh4/DdC+z7PTW/21agp8HkQOQHuKlq34A3aRS7B5ZDB8CHi3WAlNEmRlWMDHEruDMuMaekJu2+mtMt1nBljcG3YODrpp6DfeCbvNkFdpF5yKmHw8sDwFLFvWUkNZ+OWm622+pA78Ym6BNWQoK9P5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332851; c=relaxed/simple;
	bh=Ah0wwrQbOfb0DF3FLO3ZWWBYBsheiGMUZGVYdN6lKhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFVPpW0nFdw9pbmKr5FbAMGU89/aOWf46QwJDKSZ+VSwZEsjzj5BaRsjBQBJPE89bvBJ9kItQDjlFsigKTqctCOjZccf+tG4Rq/f8cIGcyMYy05tnEOaFSVWvgJS0bKiSe68RwshDPYSPF0fjL/zNN8V0fj9R6nR4Jxs9LRkwgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DxhD5db5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DxhD5db5"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a293f2280c7so500186566b.1
        for <linux-lvm@lists.linux.dev>; Fri, 01 Mar 2024 14:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709332846; x=1709937646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2ow6Gr56HWizluoYRmTkM1M2od1AQq+6bxnH60MW/U=;
        b=DxhD5db5Z2682uHx23ahE6gx7NP7EkoDz5sxHABRqPeVpppGjQqwia50TRQYPcpejY
         lWdthBAWHN/Ne5YQgTJ5bjs1ralUaZPOe+uS45Q+hXD1etuQoapXpXroa2F1cGiACtSu
         JJDMjOfb0xQncTkb2VYP/DwxooPZBXgEwd0YVXABIYJKafkbmITZDMHAZm33HZmw710P
         Brt7UAjsESkWbJkNqTBxBaUioChGxLH4ytraIxy+A5pyRUlFPloAH9Zn909CCanNeUKO
         n5gicpTy+8SbunQRZ7mNgLR7BIASeOM/0OVnGoSyBdmFaHaG8MKzis8ZOTXCNHbS0Nmi
         dc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709332846; x=1709937646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2ow6Gr56HWizluoYRmTkM1M2od1AQq+6bxnH60MW/U=;
        b=g8ANnd/zFRIOxhTDS44uZYwN07ndIY/1Et9PmGCWsAleblofzEz4D/9aFRVr9RGw1R
         LTFaF3r1BQIzVroW3kEveEvPq3tgMboO0cVZjOwa1niYf58awWDrfuepP5cenADwRcxA
         DJ0DRM3kvhaZ6ulBWks/2K9yAY86TSB2EdultcIqHeR38TicCLQRqID7HL/mASg9TGzP
         FkVb2ApNY1pM3X7O1rFc+ZsMvWXP1CW6eUww+Yu32UFwpADqGWFosoUoSzSL3BD3+rcm
         WQACKqXQB5CG2018FCoV1q++SZ19kGCqqugmFUYGMzAPR30PPfhORSyNMWM9NpFerfOF
         QeyA==
X-Gm-Message-State: AOJu0Yzt5192vCrQJ5YBxAmm/+RUls/axiGTslddI178T+XBV6WAFi6/
	hdF7lID3sBI8hnLwf01nELZCLEMemf1g98TdU1pGss2L019LT8DfUogRq42nmqo=
X-Google-Smtp-Source: AGHT+IEs9BSpKyibUXm8RRi8iHpfN9K6Q9egv7kLS6krZxdOPc9B8asrXq5a4g47vTsBvFs1BleHZg==
X-Received: by 2002:a17:906:7d6:b0:a43:88c0:7729 with SMTP id m22-20020a17090607d600b00a4388c07729mr2308729ejc.56.1709332846376;
        Fri, 01 Mar 2024 14:40:46 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id w26-20020a170906385a00b00a4394f052cesm2102987ejc.150.2024.03.01.14.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 14:40:46 -0800 (PST)
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
Subject: [RFC PATCH 3/7] 10-dm-rules: don't restore DM_UDEV_DISABLE_OTHER_RULES_FLAG from db
Date: Fri,  1 Mar 2024 23:40:07 +0100
Message-ID: <20240301224011.11117-4-mwilck@suse.com>
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

We use DM_UDEV_DISABLE_OTHER_RULES_FLAG to tell upper non-DM layers
to keep their hands off the device in question, for any reason.
One possible reason is that the device is supended; another is that
the cookie carries the flag of the same name.

DM_SUSPENDED is not restored from the db, but evaluated anew for every
uevent. Therefore DM_UDEV_DISABLE_OTHER_RULES_FLAG shouldn't be
restored, either. Use a new variable DM_COOKIE_DISABLE_OTHER_RULES_FLAG
to save and restore the original value from the cookie.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 udev/10-dm.rules.in | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
index c08d829..ef36209 100644
--- a/udev/10-dm.rules.in
+++ b/udev/10-dm.rules.in
@@ -48,7 +48,14 @@ ACTION!="add|change", GOTO="dm_end"
 # These flags are encoded in DM_COOKIE variable that was introduced in
 # kernel version 2.6.31. Therefore, we can use this feature with
 # kernels >= 2.6.31 only. Cookie is not decoded for remove event.
-ENV{DM_COOKIE}=="?*", IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
+ENV{DM_COOKIE}!="?*", GOTO="dm_no_cookie"
+IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
+
+# Store the original flag from the cookie as DM_COOKIE_DISABLE_OTHER_RULES_FLAG
+# in the udev db. DM_UDEV_DISABLE_OTHER_RULES_FLAG will be or'd with other
+# conditions for use by upper, non-dm layers.
+ENV{DM_COOKIE_DISABLE_OTHER_RULES_FLAG}="%E{DM_UDEV_DISABLE_OTHER_RULES_FLAG}"
+LABEL="dm_no_cookie"
 
 # There is no cookie set nor any flags encoded in events not originating
 # in libdevmapper so we need to detect this and try to behave correctly.
@@ -58,12 +65,13 @@ ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", ENV{DM_ACTIVATION}="1", GOTO="dm_flags_do
 IMPORT{db}="DM_UDEV_DISABLE_DM_RULES_FLAG"
 IMPORT{db}="DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG"
 IMPORT{db}="DM_UDEV_DISABLE_DISK_RULES_FLAG"
-IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG"
+IMPORT{db}="DM_COOKIE_DISABLE_OTHER_RULES_FLAG"
 IMPORT{db}="DM_UDEV_LOW_PRIORITY_FLAG"
 IMPORT{db}="DM_UDEV_DISABLE_LIBRARY_FALLBACK_FLAG"
 IMPORT{db}="DM_UDEV_PRIMARY_SOURCE_FLAG"
 IMPORT{db}="DM_UDEV_FLAG7"
 IMPORT{db}="DM_UDEV_RULES_VSN"
+ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="%E{DM_COOKIE_DISABLE_OTHER_RULES_FLAG}"
 LABEL="dm_flags_done"
 
 # Normally, we operate on "change" events. But when coldplugging, there's an
-- 
2.43.2

