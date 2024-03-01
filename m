Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5D5EE60
	for <linux-lvm@lists.linux.dev>; Fri,  1 Mar 2024 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332848; cv=none; b=qM9XJuwVuyeS48mlptTzEhwi9uwESatLo+6KXXOn9j2a5tvouZhpwm8+hwgfrvr7papt/iva3OAdQEYl8q+nXfUMn3wipryj1/b0NAmqmuiyT9RKYT3OQ5b1vbXA4hhAu8sVI62AlSohgEf27UK6tSLYLHoqlSd5enhhjnllTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332848; c=relaxed/simple;
	bh=q88AYD/alrtOPqwXRC5pFf8wi0MZs6r0G61o6jbCxtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rox1peq2SasPJyQYSHP+zEPn2o3Mb5GkTLEXgZMDDJeh8ZLJLyTlX6YPT7P2amK0MDYqJqedPhf63OsEzamWUnzyh4zUOrl+sM0DXAkzo20BU4HRvR+oOC2NhzhkVADwskPAE5+O4oWHSayg+M2+cr2LfxZSUfjNgfM3nZcBZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dmsjmWAv; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dmsjmWAv"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso4354447a12.2
        for <linux-lvm@lists.linux.dev>; Fri, 01 Mar 2024 14:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709332844; x=1709937644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrPpIRlMpe62OymWcz7BCmTnufGdGNbV1lkhPbWpNUM=;
        b=dmsjmWAvvwy8V8RNL1Esq+uwSB8OvsYN3lOWOI7zpRgOA/HMwBeN5zuCgl9zQMQF62
         bAdaY/tSbWpP92TVUo5o5zMSe2wzj9jNl8Y+CVWR/rPomwgGgpak4dTaD5NNo4c31Jmg
         04Rsdb8G1dYK2jsGVwDtr8UU3bIbeFD3T9nsfVHbQ0J4U+8kcpzvnJykNkp9BhrQavHf
         JwcT9AWa27hdOdfcaAgKQ1Bo6d44IlTfyhpUWqbnXJn4UbUVUFPFvDSuGPNI2WTc8NsR
         z8huoSSGfgRohKLGcLfyWTuGWtf8w7tYPhE8c2cSenA5jSdCTEVpHbPro0kGYn6auKuh
         /fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709332844; x=1709937644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrPpIRlMpe62OymWcz7BCmTnufGdGNbV1lkhPbWpNUM=;
        b=aXp8K4ljkHVton27llRTqFLfsPk1hI1Ln6o6h1UULQTUfgRofcurAlfrLI7h4QEXjB
         WKbZ4jMIjH+oVuBAHsuzFwcQQm32tEMN7quslwLZdCHWTjw0m0ySJtIG9DIrfoXzM4iP
         PEJRLd/x2wwXLxbloJf9F0W3nFMWrVV+fDmqCzxsSMMCNQp55l/N03oqFpdXidYjVyzG
         sr84a9v/T98I290iydX5FTNeO7G7Mr1u0T5rzXWVp1VqpgXS5sj9fF3WOi+ONYYg7GQj
         yjxAZ96x7Uv2U2Idm8RIjv4HVAKpe3vdoAGVcJIS0FUdOWnwhqPFkhv4rW+hintDJc2G
         eBtw==
X-Gm-Message-State: AOJu0Yxkq6TSvyPyjhyGGF3XcxaiBDc3iMXmekwVqFbqEx3+x6fy79gX
	jY9ZlhHyQZjHs62PKAT4akx3NWNQgWNo7bPsFejXocgPpskPuQ0PALLtYJijGAs=
X-Google-Smtp-Source: AGHT+IFpu02AY0yFKRA+TpYS9rUqT7pzUhOl7gOq07ej4d3VCJ36cpdCTa+2YXQdfAGbuMf1/1pBpQ==
X-Received: by 2002:a17:906:d296:b0:a43:7a77:abe5 with SMTP id ay22-20020a170906d29600b00a437a77abe5mr2305503ejb.75.1709332844280;
        Fri, 01 Mar 2024 14:40:44 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id s17-20020a170906355100b00a4305a452c3sm2103975eja.95.2024.03.01.14.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 14:40:44 -0800 (PST)
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
Subject: [RFC PATCH 1/7] 13-dm-disk.rules: import ID_FS_TYPE
Date: Fri,  1 Mar 2024 23:40:05 +0100
Message-ID: <20240301224011.11117-2-mwilck@suse.com>
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

