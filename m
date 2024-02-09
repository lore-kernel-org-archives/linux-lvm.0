Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7356A21360
	for <linux-lvm@lists.linux.dev>; Fri,  9 Feb 2024 23:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707521274; cv=none; b=MtCZPb4SDBkb60DHuvnriVnzejg6u03yzhh8t3eRG+2FS9VXiHzYePuYUBOjxfgwwDgFltZUCqndjOffyEIaPpQNaLG5EwGHPxypK2PeaLCDZw7aGu58Weefa9W2oIVSODdRoRzjPst87eYsRytA8j9xm4zjpHB2cqfOF4Ja8VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707521274; c=relaxed/simple;
	bh=xWMUkip/o9IM+HB9Pj2gacXg6ZHJiXlP4nEQhjzSL7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaMflnW55+gXkTNU73ldv8Up3reyWRqhNJnVu5y+uAr1AZiVsa/A/G1kNXQuPrb0blOxXkTzgOEVVlBz84W23D9zPwq7zkCmYaZ3bUm+fYeal9AHrJBHsVW/oufQ/fNdMtftEUiAH7bpyfHchLUp154N7t9RK7lpHJN6D58OuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VJCtcM3J; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VJCtcM3J"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b401fd72bso861751f8f.3
        for <linux-lvm@lists.linux.dev>; Fri, 09 Feb 2024 15:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707521271; x=1708126071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXnlxkG4SsENEEA0l4Ob08V3J/FRJmdSfGWtF8Wxryk=;
        b=VJCtcM3J4MdSstqZljPFRzr8QtSPMUYBQOL2GShyMT9hZ9MwzJB5tz1PJnrT19+0nO
         LAsDWHa6kLwqtyHOBCvys9FQ02YbK+pEKw2tt+bT85ULO5gWPQQvMCjOUT/Az3O9X4+N
         ZSJg9Yfrwm/tfjg2z2g59WaHbAzJf0FyepB2o6k9s5wx3df+mjfbXPzyD8CrUHdmEudY
         IS/eHnrrszSvVgtwoOE9+hethsbP1cMxrxklqQqiUdPa9o9tcnQBCNoXXRbmIwcA6B7i
         vvTLOFVZp1IZxlqAR4BQDMkeFmJcy+EyzTdKAQYZ14HFhGbqoZawCXNWFate5PIZeig6
         Gx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707521271; x=1708126071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXnlxkG4SsENEEA0l4Ob08V3J/FRJmdSfGWtF8Wxryk=;
        b=lNylJHIRNc0kgUkIk0QYc4yr0JBj6jSbJlIyjqfRK3flNYGQa02yUwXQVB4PG2ciC9
         svxCrZX0SUb6yg+pWc36R9m22yvC3QksFg0WUxFJ2bg2nilsCsxf4io4qcbQ+E5NJo3I
         b1vtY7Pmm6Vg0aR03e90/S1nVXSXSQfgmEn2RDWkfpo3np1MeMI8vPU6JAQLra0OAc7v
         RvItG4AWgaKkSvJj342jtoPVP8b2SGin9Eel0AnCqBqryznwxX1+iAa4qqFxbGZ3VU3p
         8R79+6Dsx/e+aBnVlkTdLPm9fJTnkHdTJqQt0Ttyk6vSmeLKQuZIQB4T1mCoZV9F1VFb
         QA1A==
X-Gm-Message-State: AOJu0YyYVPV0sz9nBuNjRN/TV5A3WRLKZ79B8oR6aa/Bpmd1XXZQGy47
	s30VbnM/QLt/FnPMkzC7bgT9Pfwq/P86SSv0caZoosRwKFijU5eJCIdBJdL8P+s=
X-Google-Smtp-Source: AGHT+IEnmzt87ASIdMgYS21qhXy6JoN2gZbbHlZF0oPH3oENC5Kjgf5tmpoS/mb30cRpPmrWEOLwHA==
X-Received: by 2002:adf:a1db:0:b0:33a:ec79:f923 with SMTP id v27-20020adfa1db000000b0033aec79f923mr274776wrv.54.1707521270890;
        Fri, 09 Feb 2024 15:27:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+bHZXL9Zjk5PyYHQwUTfbqzkLW+bMRF5jiiTub68Aps2LkNyqPyNPLc3DueujSOJpoFRRdUXRhYx7V2BZXM0w/z06hT9MPgWpnnQhL98lXOGATexwRVBMKvQ1P8+LmdRlPVy5npSCKs1mJb6pRB4cXApjGAzzSzTVMdvRnulLBmvb7LFYMfpY
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id y2-20020a056000108200b0033b5afd7f4dsm370886wrw.91.2024.02.09.15.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 15:27:50 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH v2 2/7] 11-dm-mpath.rules: don't import DM_UDEV_DISABLE_OTHER_RULES_FLAG
Date: Sat, 10 Feb 2024 00:27:30 +0100
Message-ID: <20240209232735.9791-3-mwilck@suse.com>
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

DM_UDEV_DISABLE_OTHER_RULES_FLAG is handled by 10-dm.rules, which imports
it from db if necessary. There is no need to do this again here.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/11-dm-mpath.rules.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multipath/11-dm-mpath.rules.in b/multipath/11-dm-mpath.rules.in
index e7be12d..fd8d202 100644
--- a/multipath/11-dm-mpath.rules.in
+++ b/multipath/11-dm-mpath.rules.in
@@ -7,7 +7,7 @@ IMPORT{db}="MPATH_DEVICE_READY"
 
 # If this uevent didn't come from dm, don't try to update the
 # device state
-ENV{DM_COOKIE}!="?*", ENV{DM_ACTION}!="PATH_*", IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG", IMPORT{db}="DM_NOSCAN", GOTO="scan_import"
+ENV{DM_COOKIE}!="?*", ENV{DM_ACTION}!="PATH_*", IMPORT{db}="DM_NOSCAN", GOTO="scan_import"
 
 ENV{.MPATH_DEVICE_READY_OLD}="$env{MPATH_DEVICE_READY}"
 
-- 
2.43.0

