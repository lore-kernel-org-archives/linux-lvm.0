Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2A59B5C
	for <linux-lvm@lists.linux.dev>; Tue,  5 Mar 2024 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640370; cv=none; b=i9iKeG3mh3UaZyUJd7urjmUk6h8M6Ih1lv6BOzx2XBiTrgoJMV7vL3cr5NMKLMi/wsKbfcddTNq8xOvg18Oe6ElxiU1NtPKvfsLjd8A2jVKLybCtT6ypr/lZm0ggVtrH3Rx/rGM5Dc4eqaMnNfNgjz58+vp4PG9W8YilyiLnL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640370; c=relaxed/simple;
	bh=q88AYD/alrtOPqwXRC5pFf8wi0MZs6r0G61o6jbCxtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnZq8JVt3IWJVWqdC2YWR93kaBAMLtaOqPRCrPSTXIzmjYPdmqI34lxDmxe7r52tRN1p05CH/BRtmr1N5J2PE5/JJY2QgCzfAwZpK/H1jT3ENMCvGxKcJHhINuiscG73G5XtC+uqCDR25xMi3v896WIC2KWIcIKoSc16sTCDCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I68crrst; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I68crrst"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33d36736d4eso3526302f8f.1
        for <linux-lvm@lists.linux.dev>; Tue, 05 Mar 2024 04:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709640366; x=1710245166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrPpIRlMpe62OymWcz7BCmTnufGdGNbV1lkhPbWpNUM=;
        b=I68crrstmh0uNA/GyNvFfonMJ0MVCT0yckdoozP/smFvcgFwbtlHnQTxwZcxuI/T5/
         b4woTRpF5OZjNS563kYUvmyn0yHsbBUgmro3Adob92rIpVFY39b9GrakPaQS7KY9H0b/
         qidY8otqgkpxA92G0E/A8li4rBmV+lN13Ylka0xv456V9pjXVqIAz2nRRN08XuDQi44Z
         NUlOZ0AfuJnDyziBKZh2MeztiHQpa9282kABEV8NUmn2UAGLUljwoTSpSYq+lMak0TF8
         Dg09ZrhGXNe5LX+ytSZqO6/d+jqBLVJPeq+rxFtmT0zmlVOOF8+V5Us5IiLR9eMzY40X
         3g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640366; x=1710245166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrPpIRlMpe62OymWcz7BCmTnufGdGNbV1lkhPbWpNUM=;
        b=cCJEMQ7jh4U4YQdpU8Z4Av6ZzGmBkKZ1ilwBlezi9f+hiHJx7/EzzAfv673Qtabl6l
         G8e68TmXIbAX54lBCrlrIzjXHERYBr1dn9cnUXvXyiADhifA/PnHZhz77c7oGVdrs0qj
         YKC/7oCV0x8BReGOz0JhTuc2SZ+/1+HYa7JkVviorHilyoRUgCmKLHCfeUSoFyeZeWlV
         7VEil25t3Wjd1BFgPaB1ZS28XYZBliKcFPfuOpVxt21qNMnTN5Hb5ZkTBp4GpR0dD+o7
         VXE0F7cSZelWe20u7+WPGS41t8KnEmwIMD+c3lWaZdw7Ziml+9xOugR8p1+rGHFpA8oF
         X97A==
X-Gm-Message-State: AOJu0Yxyj6xpb5fVm5r7Z7S294RVGMZYCXcAmnAEwrlGRAZpRy/y6IKt
	Se0VOuSAb3SRW44b+UQE4t5mBXED1cS76R7SYacOuIA86H9Zhhre+M8k0yYenfaNPvmUCPUtrsA
	4
X-Google-Smtp-Source: AGHT+IGTQ/kTzjprM1YKCSlk90efqzFAUHsOTxtWSGkCHHeDdihwDjv28BcmF0yEJsaieVkyIAd3QQ==
X-Received: by 2002:a05:6000:4e9:b0:33d:f3c4:6002 with SMTP id cr9-20020a05600004e900b0033df3c46002mr8703086wrb.1.1709640366347;
        Tue, 05 Mar 2024 04:06:06 -0800 (PST)
Received: from localhost ([2001:470:6d:10f7:9114:d168:fb53:9a37])
        by smtp.gmail.com with UTF8SMTPSA id n13-20020a5d4c4d000000b0033cfa00e497sm14757266wrt.64.2024.03.05.04.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 04:06:06 -0800 (PST)
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
Subject: [PATCH v2 1/7] 13-dm-disk.rules: import ID_FS_TYPE
Date: Tue,  5 Mar 2024 13:05:44 +0100
Message-ID: <20240305120550.11617-2-mwilck@suse.com>
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

ID_FS_TYPE is the most important udev property for most follow-up
rules. It must be imported from the udev db if blkid can't be run.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 udev/13-dm-disk.rules.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/udev/13-dm-disk.rules.in b/udev/13-dm-disk.rules.in
index dca00bc..eaad972 100644
--- a/udev/13-dm-disk.rules.in
+++ b/udev/13-dm-disk.rules.in
@@ -26,6 +26,7 @@ ENV{DM_NOSCAN}=="1", GOTO="dm_watch"
 GOTO="dm_link"
 
 LABEL="dm_import"
+IMPORT{db}="ID_FS_TYPE"
 IMPORT{db}="ID_FS_USAGE"
 IMPORT{db}="ID_FS_UUID_ENC"
 IMPORT{db}="ID_FS_LABEL_ENC"
-- 
2.43.2

