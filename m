Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552E7C6C0
	for <linux-lvm@lists.linux.dev>; Fri,  9 Feb 2024 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497729; cv=none; b=UHoLgpHFekuMQwAPz/cO5whr0prCbqaWLlRgoNaympi4EGN4g+5tuU50lKaDSgaZzNQo0BkNuDpilFMSTKEyOQQpNc6XJ/6gQHLQoRxdTsb+V0d7U5rcAKjow5Ppv2UGgiPnKdUcVb9UiMnmKkI/oiGP6YyR72659gRkgOgPCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497729; c=relaxed/simple;
	bh=OTMO5pAk1lH2WLVvL3IIz0M7+IYcDuWACtRciFPIros=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6pJTd5oz3cHdsiCeDPg8Tv96nuYrxj2bC3rCA6EDjWe7A4T78G38+O1ANRyF+KceX5A7GUthbMUliI/jQ9WOdthtxgOrfJ16r1CFKNWNPquZW1zxIH8B8PX/nWtXiDQevdsuy9Ep5afWdKsYDH/gIqTBNh4vgnZFn4seNG6Urw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ol/CfWt6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ol/CfWt6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b6a7b24dfso8072f8f.0
        for <linux-lvm@lists.linux.dev>; Fri, 09 Feb 2024 08:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707497725; x=1708102525; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VYB2KssSF4+eXuIqiXomrk8wK960twQgqDzbRGZw/U=;
        b=Ol/CfWt6Rke004mduONx/GXbOZ7/pQLdoRjvtl9aIpfRNqJNHXlm8M4MdkDPPH35su
         7bh7sOrW0Vm7zUZljMt04kzK/ANf6ICNfLD3ioBLhy7IFMSBNjzwwsPsnCzbnwD1x2Rk
         5T7pw+zllTH6C86ztXRULoURfIhHIreNb3ETYKTMt4qusxCLBttIe3+8Eaz7vul61Cqp
         v5l3zmGiLqPhR2EcePoO6MnY/6eNYB16rz1GlfloeQ8qvjVa4BCPSq7O1qoeKbsyd7xj
         lQ0MRrlX0lqH7Gol1mHkEuVSYjq9VL0MW6boofJW5FaSk4kQgUIaoq3+W2LynH26Qr0e
         UtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707497725; x=1708102525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VYB2KssSF4+eXuIqiXomrk8wK960twQgqDzbRGZw/U=;
        b=j+oFS1djlr2Jwyb6G8DFayqcqmXnbUYY7h6h9XdrWN/ydJJC06qbmLxBEdZQrN4lYt
         YEwgTSeIoSi2dc2gD9tIAHcX5oOk6o9nSzEhtAzrjNk2FC797Gc202tOjg7WENze8FQL
         ZnoUHwThlYx6EKfKm/J5NnqVB0FTKYaSiuJ9iW+vDELwEnfv9BKb/MV0XZ0kUyz57C9P
         KeD1ks9nzZkMXRPjKiK+w1hR5lWp3Lr7ijVjQM+dX8sFpb/bb7Gwhk6xO3AK334TVl/d
         2Xk6FaniNzm/4E265XhlTQw6ZcKbRXR5+iZ33xr16Tm4ySNKWiEV8RqWMBEcS8gqoSx7
         7cWg==
X-Gm-Message-State: AOJu0YyaJgYkQ/ue3BDGAalYsOIdmFMMh6k/Goe7M84pPKNn5Qyd/w0C
	8zTSbdWQNhJ0Ychkd5rYtGhr4mtQplg8RMBoHnSEYkCb+5PpxEk86irOLgNA1RQ=
X-Google-Smtp-Source: AGHT+IE7HryLd0eMaLKB8aIE2i9GaaNVjDH73W0teTDsDqwUQf7onodwqK4w8aqpLx9RXXA9izVfAQ==
X-Received: by 2002:a5d:608e:0:b0:33b:1c2a:dd75 with SMTP id w14-20020a5d608e000000b0033b1c2add75mr1550960wrt.19.1707497724920;
        Fri, 09 Feb 2024 08:55:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWd0Br9oFV3rrM+X8lEmTEPrXm/6qfitH52H2ynsx1JhtW1f64gzcj2nTRed0t92FnTsnqYmOsDX3BPWMye/p7U0LhHevhwlVR9CzNPrbLhuxaftVUcdaW7KDXqLFXgEiM4jrwTI8IWXON0ZaaB64dp9fG5/ReXLmdnw35ePJXFQF2A4pPPMIvi
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id a17-20020a5d4571000000b0033af5716a7fsm2226906wrc.61.2024.02.09.08.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 08:55:24 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH 0/6] udev rule and CI improvements
Date: Fri,  9 Feb 2024 17:55:07 +0100
Message-ID: <20240209165513.7661-1-mwilck@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1-3 of this series are a v2 of my previous series "multipath-tools:
udev rules and service improvements" posted on Feb 5th.

Changes wrt v1:
 1/6: fix logic as pointed out by Ben Marzinski
 2/6: Keep importing MPATH_DEVICE_READY as suggested by Ben Marzinski.
      Don't import DM_UDEV_DISABLE_OTHER_RULES_FLAG any more.

Patch 4-6 are new. 4/6 implements new logic for setting
DM_UDEV_DISABLE_OTHER_RULES_FLAG_OLD, as discussed in the thread about 1/6
of the v1 series. 5/6 fixes a variant of the race condition that 3/6
addresses. Meanwhile I got positive test feedback about these patches; the
partner isn't observing any more errors with these patches applied. Thus
while certain types of race conditions (reload happening between
DM_SUSPENDED test in 10-dm.rules and blkid or pvscan calls in later rules)
are still possible, they seem to be rare enough to be handled in a separate
patch set.

6/6 is an unrelated new patch which is necessary to make CI for arm/v7
environments work.

Martin Wilck (6):
  11-dm-mpath.rules: use import logic like 13-dm-disk.rules
  11-dm-mpath.rules: don't import properties that are already set
  11-dm-mpath.rules: handle reloads during coldplug events
  11-dm-mpath.rules: don't save DM_UDEV_DISABLE_OTHER_RULES_FLAG_OLD
  11-dm-mpath.rules: clear DM_DISABLE_OTHER_RULES_FLAG for coldplug
    events
  multipath-tools: Makefile.inc: set _FILE_OFFSET_BITS=64

 Makefile.inc                     |  1 +
 multipath/11-dm-mpath.rules.in   | 50 ++++++++++++++++++++++++----
 multipath/Makefile               |  2 ++
 multipath/z0-dm-mpath-late.rules |  4 +++
 tests/Makefile                   |  5 ++-
 tests/alias.c                    |  4 +--
 tests/directio.c                 |  7 ++--
 tests/dmevents.c                 |  8 ++---
 tests/sysfs.c                    | 57 ++++++++++++++++----------------
 tests/test-lib.c                 |  9 +++--
 tests/wrap64.h                   | 48 +++++++++++++++++++++++++++
 11 files changed, 147 insertions(+), 48 deletions(-)
 create mode 100644 multipath/z0-dm-mpath-late.rules
 create mode 100644 tests/wrap64.h

-- 
2.43.0

