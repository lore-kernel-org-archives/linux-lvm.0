Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8CD22F07
	for <linux-lvm@lists.linux.dev>; Mon,  5 Feb 2024 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137211; cv=none; b=SkA11T3QFGQ3LXVTXO7/s7ejyJMolwVrjvtHp+qtrXPws2yvA+FAkmCVoneLW9JpL57OSks3771DZszY83PU482Se3jAqBHyqDkGjPtAhFwsAZ/Kz7/NU/pfWY3AdABjR7VTTeTzBSYorErm45ArjAjja+tPGj3WvcV8lBIz118=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137211; c=relaxed/simple;
	bh=C6j1GOtK/b4SZynpfqmg+CPFzh/76smc05t7/E0NIX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYHX6pPwOg+vBsoMK4gQcsiv1mHqfLC6OgDrXz2Sqn/qzh/XFLpwgE2w+ghzcY9w/Xgfw5FgdUBIAedz47upn1F/2VbNvF6tnp+7QEHBFdx2dripwzZOhHxHPOiGRU/deOcnpuHwDOY3FsFcIvkZvoQns1UL5n3q3CNcAlfj7qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O/Yo/rT+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O/Yo/rT+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5112d5ab492so5793269e87.0
        for <linux-lvm@lists.linux.dev>; Mon, 05 Feb 2024 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707137206; x=1707742006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ioQdq1v4nm5awpqcrNZUpLmq1a65Z05XymoIOU6TeXw=;
        b=O/Yo/rT+ipfcTZue/AFOhoJttUJ1mu/rluPfG1XVoFkC9a7K4KTZxNXskFHwIaMRXZ
         IvdIp+9OINy0H09jCCQK7ZMQPNROpjk2tcEw0gxUNN3lGJ1GmQqRoqfKtt0QZ6vBbUTV
         miImQ3jVNuTqbELu42GhwYrhuCUqRlYmEG29XSmWCfc91RffOdoH3kZHc6UcVQoyfYOV
         Qxs6lCb6ydgRyfIT6Q5E92D7UKWzlv86y3quoT5pE6rHeFfTLBZ7nmQDmGYhL0Whl60+
         4BGgepXKdAvK6a8O963Asji/YyGcnN0p51uE9Bl7jqul7Ejernr7Yp6aZM1269WSVd91
         AqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137206; x=1707742006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioQdq1v4nm5awpqcrNZUpLmq1a65Z05XymoIOU6TeXw=;
        b=hYx4HRz6S0gnXckk0skZkBIfUK6KkWbNUg8qyUH7M9hr3FylqvsUWu7NccPPMFsq5l
         fb1NuoNzS1YWh/K9rIeE/s11p5PNTSZT3MQkdq7MTX1zdcIT5lmaRasw42xMIv4qho2g
         Z9k5SL+48umF5nmthM0pXRnTrvc7KscKM+wOTi2RHnUehZHwrDiPEk+BYMIHOaiFkwfl
         Ma2+7kgqXEl/fDGzq3Bk9TSP68TmPym8MKSIanRJZyZ3zFATMFYKFsqeMZWYlhoQTpai
         6f5otpENUAwwWwJ8ZilFjyKVeaUNA9C2tPt7yKLQPXIQ2aqaan2drT6NtS5wKl+jdQGx
         aZVg==
X-Gm-Message-State: AOJu0YwSMvgxhF2w7UKtCRoZqM6nGwCR8S3KBTgNe/kVyJSBnty9KcRg
	v71USj0du7UN1cFJTJ1nVbzoBcIX5dkjGxz9Eat4nWjbWNmpbIcnN+eEdiEZvms=
X-Google-Smtp-Source: AGHT+IEmzSbuI4VsJhZwguwPXEJso4yzM/cR+a1FEjpiQazB1JLgAD/aYhGTRgRxeevENp0M4Q2nfg==
X-Received: by 2002:a05:6512:508:b0:511:3a96:e385 with SMTP id o8-20020a056512050800b005113a96e385mr4730965lfb.30.1707137206185;
        Mon, 05 Feb 2024 04:46:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVCTauppcN+fLqy0/e0TEySvGs9DNuWSHqvads6hHwTUXgYyEnVxSKGC7ox9I8PbE6Pp0JZxqwWVQSZ+By6a+ZMzHQMnNVXSvI8DLsqswX6xYNqO7DpHBZ+R+lfKiUNUHJH4gVUN5FXDC+iDC6u4o4seVe//lWHYwgBExkxsCI8eZKSLibUihf0
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id bh11-20020a05600c3d0b00b0040fd24653d4sm7018323wmb.36.2024.02.05.04.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 04:46:45 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>
Subject: [PATCH 0/6] multipath-tools: udev rules and service improvements
Date: Mon,  5 Feb 2024 13:46:32 +0100
Message-ID: <20240205124638.17877-1-mwilck@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 3 patches and patch 5 are minor fixes for the udev rules.

Patch 4 fixes an issue that was observed in partner tests. Since we dropped
the dependency on systemd-udev-settle.service, it's more common that
multipath sees paths being added to existing maps during boot and reloads
the maps. If this happens while udev is executing rules for an uevent
related to the map in question (most importantly, a coldplug event),
the rules may see the map as suspended, and will refrain from scanning
the device content.

https://systemd.io/BLOCK_DEVICE_LOCKING/ doesn't help us here. We would need
to take an exclusive lock an lock_multipath() to achieve that, but since
5ec07b3 ("libmultipath: use a shared lock to co-operate with udev") we
don't. We _might_ consider re-introducing exclusive locking, because the main
reason we don't was that udev would discard events for which it couldn't
obtain the lock. Since systemd 250, udev has a retry logic for such events
which would avoid this problem. We would also need to implement similar retry
logic in multipathd, though. For now, and because we need to support systemd
< 250 anyway, I've come up with the workaround in patch 4 (first tests went
well, but more testing is still needed).

Patch 5 is a partial fix for the the problem that multipathd socket activation
starts multipathd also on systems that don't need it. See
https://github.com/opensvc/multipath-tools/issues/76. More far-reaching
approaches have been discussed to avoid that the user needs to enable
multipathd explicitly if multipath hardware is present
(https://github.com/opensvc/multipath-tools/pull/78) but no solid solution
for that has emerged yet.

Reviews and comments welcome.

Martin Wilck (6):
  11-dm-mpath.rules: don't import properties that are already set
  11-dm-mpath.rules: fix list of imported properties
  11-dm-mpath.rules: use import logic like 13-dm-disk.rules
  11-dm-mpath.rules: handle reloads during coldplug events
  multipath: udev rules: use configured $(bindir) in udev rules
  multipathd: don't activate socket activation by default

 .gitignore                                    |  1 +
 Makefile.inc                                  |  2 +-
 ...11-dm-mpath.rules => 11-dm-mpath.rules.in} | 49 ++++++++++++++-----
 multipath/Makefile                            |  2 +-
 multipath/multipath.rules.in                  |  5 +-
 multipathd/multipathd.socket                  |  4 +-
 6 files changed, 45 insertions(+), 18 deletions(-)
 rename multipath/{11-dm-mpath.rules => 11-dm-mpath.rules.in} (73%)

-- 
2.43.0

