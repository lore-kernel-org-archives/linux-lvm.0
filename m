Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048CD22F03
	for <linux-lvm@lists.linux.dev>; Mon,  5 Feb 2024 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137211; cv=none; b=eXikIN5NqZdxKAU1FzqWyakB9pXQocCSUwxatpO4kkWAUkDM9vNrheF8w0rvufYmXVdMAO2oCY4CFjSnzlBVrRmrqfYWcyyn7RXbdJzTOGiC5p1199qjjkRebXdkpaV3g2S/EEBJE4qtNhpbgfxiELzPWUqhV1UyGI5SE/WwOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137211; c=relaxed/simple;
	bh=ldSQ/NSMgM2HZpZbAR9qbsuf81P8HLoTD1w+oSeT06s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrmteCjiCQsiY43LuH8Tu8di2XZT0+2IOTnaUDmDJqKemArdTnn1bOBlP+yaFQa+RCXFK7EVEsKYmtwbWFNUFaMswY4xxu1nPJZ3kSj+f1mchnU82FW36WU1nvIG0zX1f/jNlwyj/7aX/m2BX9giLDM1YNLX4QBOewT/uBGSlmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WBqEsil8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WBqEsil8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3394ca0c874so3037013f8f.2
        for <linux-lvm@lists.linux.dev>; Mon, 05 Feb 2024 04:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707137207; x=1707742007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlwHtHHIJe5vSwHMIayHU8mS2RiUdCohkN/ZANC9VA8=;
        b=WBqEsil8814XmzUNX2E2HTcvuEySLNhAFYtGuQq3AAne/3zeEwmReIkWOzobnfGOHy
         ZSrcxJT+wiWgwmP7X6Q1a1sL1yFZA72kUQaJH2h3UNYtkELAV2kBP7jkgTWZ6c/wcq5u
         MRuJwft1iLbrXe1fiaiY3usfwI2FdLN2tP2cTUQ9s/MrMrSfnLw4kxSU6+rkwXLV+zgB
         5+DkuSCcAi4+pw9xOnxFTnHoPwYt/4jBTkmjOcZNbTCitSgHEQr4e3bifiCSOPcROPSD
         YdWTL2X1wHTGGrA6ajbrMbfS4gWYzOfVhJ538guPaXNccxGAFalX0vydszGKgOW5TctH
         9fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137207; x=1707742007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlwHtHHIJe5vSwHMIayHU8mS2RiUdCohkN/ZANC9VA8=;
        b=JuhItqFpu3nAOXXb+syD66hO+TKt9GAF2Sw4uM9yjBJQjUjDZVT+Q0YK+8G6r1gtCE
         iz0/WzaNeCr2YphlMDCuXY18BdWtZCP7zx2tMpcGSUk7sKEcL6KpzW4etQSpo2j9Kbax
         r/Pnncunpv3VmBO+rGor9eKgBGBBQX9L/fmxSkJ9a7MgQ0aqaj5E9Y1me+VXf1j65JQ6
         gCttu6MYVlCF2V0yKCgGa7aJQ2Tvp7UDE4LPrRyoNeh8caZkSF4A0WpPVLPDhItDufsQ
         r423o5p8rQVWHcLlaKm5YKopGur1FeqY9o4KdeVo0mqYQtbLuQtHyw840q4yMZutqb17
         wl7A==
X-Gm-Message-State: AOJu0YzHw6r3ynXvIaaEjdT5XagiBIIaQn9DQu4bp0z8LQGfjMRITaMR
	LibUZA/3Gj8/r+r+UuX1pCHvf4jdrUEkJBPnCkL/BSzQaP+7YOkxk6eA/JvzLiI=
X-Google-Smtp-Source: AGHT+IE7W2AflU4qzeOTmDYCD4OJWKQWHhh8HJtTQ3Bxbimn6L3Hq4XqCM5S0KSUQ3ifq3U2SClOzA==
X-Received: by 2002:a5d:698e:0:b0:33b:14e4:6dfd with SMTP id g14-20020a5d698e000000b0033b14e46dfdmr6498808wru.12.1707137207235;
        Mon, 05 Feb 2024 04:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX6s8I1F8xkg2XPCKOBp+8BnZo58zR0pkfcfkb9d0cnU17xdr5mIvZU70L7HhoG73y0cdHNghWb/btIPWBgrZm71mDJXWqNSeE3C7jOmUfK683gDXI0G2GHFsoyHAwD8eUgFrg5/5zLH1iSszWqsZwNjctwnle4VM5roX+3Akst4YiDJfx2rKhM
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id x5-20020adfdd85000000b0033afe6968bfsm7997648wrl.64.2024.02.05.04.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 04:46:47 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH 1/6] 11-dm-mpath.rules: don't import properties that are already set
Date: Mon,  5 Feb 2024 13:46:33 +0100
Message-ID: <20240205124638.17877-2-mwilck@suse.com>
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

DM_UDEV_DISABLE_OTHER_RULES_FLAG and DM_NOSCAN may be already set
from previous rules, e.g. if the device is suspended. Make sure
we don't overwrite them.

DM_DISABLE_OTHER_RULES_FLAG_OLD and MPATH_DEVICE_READY are only
used in this file, and not used in the scan_import code path.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/11-dm-mpath.rules | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
index c339f52..2c4d006 100644
--- a/multipath/11-dm-mpath.rules
+++ b/multipath/11-dm-mpath.rules
@@ -2,12 +2,19 @@ ACTION!="add|change", GOTO="mpath_end"
 ENV{DM_UDEV_RULES_VSN}!="?*", GOTO="mpath_end"
 ENV{DM_UUID}!="mpath-?*", GOTO="mpath_end"
 
-IMPORT{db}="DM_DISABLE_OTHER_RULES_FLAG_OLD"
-IMPORT{db}="MPATH_DEVICE_READY"
-
 # If this uevent didn't come from dm, don't try to update the
 # device state
-ENV{DM_COOKIE}!="?*", ENV{DM_ACTION}!="PATH_*", IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG", IMPORT{db}="DM_NOSCAN", GOTO="scan_import"
+ENV{DM_COOKIE}=="?*", GOTO="check_ready"
+ENV{DM_ACTION}=="PATH_*", GOTO="check_ready"
+
+ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}!="?*", IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG"
+ENV{DM_NOSCAN}!="?*", IMPORT{db}="DM_NOSCAN"
+GOTO="scan_import"
+
+LABEL="check_ready"
+
+IMPORT{db}="DM_DISABLE_OTHER_RULES_FLAG_OLD"
+IMPORT{db}="MPATH_DEVICE_READY"
 
 ENV{.MPATH_DEVICE_READY_OLD}="$env{MPATH_DEVICE_READY}"
 
-- 
2.43.0

