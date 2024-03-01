Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03075E3D8
	for <linux-lvm@lists.linux.dev>; Fri,  1 Mar 2024 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332849; cv=none; b=brE2TMYp9+IYL0V0FbzKCD2kSkGRl2p7PwgFTf+R/DJCQcDV1y5PZoBEXi0Lj1cMDLM8/8kd6ZKBED11xRQxzcI/P63qjh1FkjaKUN5/GXG6x+6LAGZZ2eu1aRql/TCMdJJo52TKTGATTjtHfonKx3Ny+Y5zjFq6JtQcmIIFiaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332849; c=relaxed/simple;
	bh=Vra73cKaNGFXbDPM3vBz/khiM8m9mLcuFzu0yXvH/jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHo+B3f1dW3IzJEuzPG5VkwSADTAt/f3y6SsKitXRF7y7VWs4hRKL1ee7IOldVxf0s0mMiVKNrMMvuGJD4mHuHvFkUmwcPz1qAc4dMOhLQDVG+W4drEIBHW/X5RJndek4YRiq00YTXEQWXzqioxk+GC49BNxzVgBy/QIzYCmg/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VaGt9Eyc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VaGt9Eyc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a44cf608a39so15694366b.0
        for <linux-lvm@lists.linux.dev>; Fri, 01 Mar 2024 14:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709332845; x=1709937645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRmIeh+deA3MqkR3F81WFQB4zyejTZBdY4jWfd+c7FA=;
        b=VaGt9EycFlCpy1FS7t/wTmiATVJrqVRTRrMEMHDnMGmwCxoCstWvOWbNgvmgxCQqWN
         ky9PjMpqiWVAPnhoOtw1STSHB6TT5O/gy5ZnV4qzRViwT4nNayBHc5RCyOdUVF/I/G6/
         QRRT1rXZGFYY/OIOPEPHAeY7VYU6LMW5HGtE3MLOiOjYxAhQ2QI0in9el195fL9+Retu
         z5NH8g5VOu+6oyErsqD3lfVXmduzDJtdK3tBmsxD2ZoI84ENDNg5wrf//yU4dAAE72Rc
         8a7j365SrhdKRaVZqS4rWiVFRWgB2SeFFrTrBVbjTOwbBtBzngHN5kpGHFs9rn4Uaigw
         T3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709332845; x=1709937645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRmIeh+deA3MqkR3F81WFQB4zyejTZBdY4jWfd+c7FA=;
        b=K7xln/5hVsr0FKdN2viQJtyIoY+ut+edDqzbB2I9MBR7geHxQ1G+J8nWDPALlTBFLZ
         RjOBVbHsLEU0EMXB3HSNoAyUo855yR03UmhEN3e3M+ahEMXXZH0QLuNPAyWkeClf7+z4
         D0SXlq0qebqP20e+qJro3tbqNYqhjx94BS23zA1io2Py8KEWQQ4uK5PsbovKsEHofzAp
         Wji4Pq+byStdqfDwXVJiFMwCC8onMAvRag2n9fFvirexudOg+6AUvvfwPa5+b/5c5FUt
         jHBtKdaE41rq1KFF08VHUMaIGSh3pa1YSxd/9E7hFtcIyMJHI+orrQuPoWTreCzlfdGB
         FbtA==
X-Gm-Message-State: AOJu0YxLy+1HzNpF3ei24k4oPn+tj0XogXLmkskC7kphk7lR4S4e0UDk
	N5oKhaNnqVcQmT2G9lCVfj0TaIMI04SqOzGuA0429337YpFKqP/S+63+L1nmNtE=
X-Google-Smtp-Source: AGHT+IFJJ+GHnxW977jJpGtQlqB266yGtoDvAdtlcKX89cOGa3hE/GTDvk/7r4e2WYcBnB9S4NlXww==
X-Received: by 2002:a17:906:6813:b0:a44:51d8:7dd with SMTP id k19-20020a170906681300b00a4451d807ddmr2395725ejr.0.1709332845304;
        Fri, 01 Mar 2024 14:40:45 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id um9-20020a170906cf8900b00a44d01aff81sm86328ejb.97.2024.03.01.14.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 14:40:45 -0800 (PST)
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
Subject: [RFC PATCH 2/7] 10-dm.rules: don't deactivate devices for DISK_RO=1
Date: Fri,  1 Mar 2024 23:40:06 +0100
Message-ID: <20240301224011.11117-3-mwilck@suse.com>
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

DISK_RO=1 is set in the environment of a block-device uevent if and only if
the device has just been set read-only by a driver by calling set_disk_ro().
It is not synoymous with the "ro" sysfs attribute; the device could very well
be write-protected if DISK_RO is not set. Probing should be possible even if
this flag is set, because blkid and friends usually don't write to the
device. Upper-layer subsystems that do need to write would need to check the
"ro" sysfs attribute rather than DISK_RO.

Skip the DISK_RO check in 10-dm.rules.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 udev/10-dm.rules.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
index 4ffd3e2..c08d829 100644
--- a/udev/10-dm.rules.in
+++ b/udev/10-dm.rules.in
@@ -50,9 +50,6 @@ ACTION!="add|change", GOTO="dm_end"
 # kernels >= 2.6.31 only. Cookie is not decoded for remove event.
 ENV{DM_COOKIE}=="?*", IMPORT{program}="(DM_EXEC)/dmsetup udevflags $env{DM_COOKIE}"
 
-# Rule out easy-to-detect inappropriate events first.
-ENV{DISK_RO}=="1", GOTO="dm_disable"
-
 # There is no cookie set nor any flags encoded in events not originating
 # in libdevmapper so we need to detect this and try to behave correctly.
 # For such spurious events, regenerate all flags from current udev database content
-- 
2.43.2

