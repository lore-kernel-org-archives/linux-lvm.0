Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1F12882A
	for <linux-lvm@lists.linux.dev>; Wed, 14 Feb 2024 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707943880; cv=none; b=Y6kPpgd0GE7KocoAjj5I6lGJSSQFXoXnywYr0sX7Hx/9zlkUzegzjDyVdaExh8Q/62sJXY3/9s+MgAVygOP56OQTQnFP3LlLZ+BwEAapuUh1M25s1cXM/MqQTrPYl8PbsImvOzeKodLa90HHVRLdrKtWWIuazclxmUPbkOOcc5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707943880; c=relaxed/simple;
	bh=9JhTyEY7xyHWHgL2v5AU/Txam2omxdPpwVoZQVdz0Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up9ftrHgStFNFqSmwwtJrqxzaQ2FORf8fSXE3s2aeCXpdDgV1VpzQNaSezLFVa1yNotkjWpd2M8AaycLBKFjS6XFXsCjkjEsqEXRfsY9KYOlUtMOO4bQHkQVQkV5qS7hRUROQH+NVIERmvD9ajKJSrMHaocrJ4cAg9NtLmMewm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L6F7o2lw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L6F7o2lw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-411e5f21c0bso1364235e9.0
        for <linux-lvm@lists.linux.dev>; Wed, 14 Feb 2024 12:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707943876; x=1708548676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3fMdvnxDNyoJn0qP55t3+k8Zw8j30JNS+3y3grOE0s=;
        b=L6F7o2lwutSTY7OwbTr1C/9Ut/zUegI/Mr1qtOVVD+VxT4fW4pnq7aE5fxReDavIX+
         lUp6Bkbm17dwzgqJuL6TLFap5MlSX8smpPbrRLgVVVaGEEcZh4eeg2joM6dVMAgLAaVt
         gVEn7HEwX0L7AMZJnUIY/0krMEeUnieAv2CKa89+0xocShDSUF7FgEMMWc9+laFU6QCA
         nB6vs68pN6p8wxkrtgmOcbxjYp3gLeORcOCLRUP7XfUQ0tdgEvUl3EDe465YS8PYk5u6
         Wz8V/SRbFxGHXjPCvAOiK7/gmosGPUO2+q/Gr3+Czu9Y+dJQIItfwKyJxKNHkLv0gLs6
         GS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707943876; x=1708548676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3fMdvnxDNyoJn0qP55t3+k8Zw8j30JNS+3y3grOE0s=;
        b=LgGRg2YXGgTt9YYvTkUBGGgKAyB9Wq2ZLpASj/6YwruM7fAoYYvkjiNo+dULcKEiJ7
         NTjpH0c0Qhc1BmKXuwI6Gql0ZKMdY9Dq3GVyoCGIKGuahnk1H0VcU66skCSN4cBoIPD+
         NGWFToZWao0UaWibP3H8HOoylApSwVLN69dxGv8QCaLyEvFrl4cKFnG1S5JiJLK2AyJ7
         mi3Nzsc5JycJJDI8+LdhFPk9uiToN7fEjKfOKtHS5S3R6S+s2DVSpp+4TO0BmI4MYkhf
         WaNM9aiQIbevj/hc4GAJ1dfApJ9+NKyYYdzQTCND4b7+Mk28buAx5AsKkS8M2nyOzeLz
         iCVg==
X-Forwarded-Encrypted: i=1; AJvYcCU4AHi5gXWpQ6vYIT1gEOOURZ8+BVObqyjvjJYlp89QyQ2wODhA3ocM2GPdBnm8OoheGofbgvyNepAiMNYBSJRrg501bQhTrmrD
X-Gm-Message-State: AOJu0YzkZ9x32mXZItxEkOFVyBUnRyK3rKKQljKqXoVCk3NZ2J0FoinN
	JxUxDzzqG2t8/99I42ofQj4vILjMNIjAiV+8WQhNZSCpsp04Td14wSdZKbGLHCz0W9AJvyr/+e0
	R
X-Google-Smtp-Source: AGHT+IFWZ3VwL7fXicmlkFfuIdGDWG21aH4eSIrnVxKd+mgir5EYGAmHsoSc9XEGyUP4lsddorox5g==
X-Received: by 2002:a05:600c:354c:b0:412:195:c00a with SMTP id i12-20020a05600c354c00b004120195c00amr954102wmq.4.1707943876675;
        Wed, 14 Feb 2024 12:51:16 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id 18-20020a05600c231200b00411a0477755sm2930654wmo.9.2024.02.14.12.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 12:51:16 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [PATCH v3 1/6] 11-dm-mpath.rules: use import logic like 13-dm-disk.rules
Date: Wed, 14 Feb 2024 21:51:02 +0100
Message-ID: <20240214205107.27409-2-mwilck@suse.com>
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

