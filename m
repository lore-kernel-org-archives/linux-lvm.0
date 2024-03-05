Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968459B44
	for <linux-lvm@lists.linux.dev>; Tue,  5 Mar 2024 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640368; cv=none; b=o4LyNoYSPPr7zKIBdX3CmHYTMm+zdXlgDwRONtamdSj411Z1wpH5Uzk9q1IUZdKOe9kP2K7B+vaNEqh7oZmjvY+rRBtS1aMhhfRSBh7cD/4FO6ikgE5n3ou9yublqh1b4dMmEsFKifQ5JLzypyjDEk5e2pyGBCjmNl/v3Xo6Bh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640368; c=relaxed/simple;
	bh=yTzY1xpzbxSGRCcokv7/eLnviPM1FiGbLtqSiqZh3nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIe5VJ/4CQRpJkA+hqd4Gq3sn8GmFNWSI7zrTGqXr1fDg8KdvGauuuWGwYHsW61p0htH7XbUrl+9f61lQg+7zgT+RnY8JlWheYHGJtyyJSxCmgcWB2rPK6RW1EmF6nkGXmu+4KW1RrCbM6DdToxl81/ukbC0WinCdbaEBz6f7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VmrUFhbQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VmrUFhbQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e27940554so2244094f8f.3
        for <linux-lvm@lists.linux.dev>; Tue, 05 Mar 2024 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709640364; x=1710245164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kZh7uLGQSho7Rt2DgmbosTZaAQU2EoNrSMPkA/kqfA=;
        b=VmrUFhbQlypXJlCeEKeXmJn52LAO+UDsU9AISKn2qNfxmJNObfvBv6/CU5BUn9oLRA
         Jf1F8k8XKn6An/KG/uyxs8JUQIPoXuIwS15QHDbJo9QJXa3cqCjuzbwoBDGlWkfATnAD
         y1xQSuy3AA6AQ5u2GhLc36vHB7K+qf2puOLdEsNPMBtcKF8f9v8o/fQhGE8rsCHy1cd2
         82UJJ/n9fWHJTLFGWhxQKTPd30wYAKVeNbmJYUSCZdp6UzoyiBXWfpJIL5j6HKEfdq0k
         kyeintVUc+v4L8OploJlniOMeU7xCWzP5Y/XFu5tTovA68aag11HgqJ2jW9PPmfEnI/T
         hudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640364; x=1710245164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kZh7uLGQSho7Rt2DgmbosTZaAQU2EoNrSMPkA/kqfA=;
        b=dCuk0Tq7h4UmCvdq6AacC37iBwejhlxSqEvK5qMjI9rOTys07LSke5FXpRiECLnP23
         eKcGzfGzqkyStswWJvCcNWLMfrSzeLjtW19d1V4VD3uUxh0UCaQYn/AxYRKAxbzs+Zkw
         OuEttfquRBU6ZPaV3JLX2+i0vibAoitiYfCilAItT6t3zgSfWa6CGQxyjHOYR2Y/sXN5
         JN59oOAsuDofTewQA64rGWt293wIBRXYP6g986aZ+il+CUtLl30yZ3biaMhQYqYdhjN+
         0VWdIevHIJ1zPBk4497ljP88TZCMaAkngvVIklnm0ximG1W1HlGoNIrAywIab5KG3Kd6
         +1fA==
X-Gm-Message-State: AOJu0YyAgL6BgDnTFINcd9i4ipvKC5yvW21EMwK9tjfd1rwJe4bU5QxA
	Tp14i7hyH8MJuOFlAtlSed/ByEpP49J53kCGajNVozl9zB/jXMJlxKTJVPwVrdM=
X-Google-Smtp-Source: AGHT+IFoI1Dp751Bg2vhqOMff5eS/u7euK2vKQ/vrF5lmMF9I0Xg5mGCt+cgp4blz9+t6c3WC8m8Jg==
X-Received: by 2002:adf:ea0c:0:b0:33d:5350:6700 with SMTP id q12-20020adfea0c000000b0033d53506700mr8513433wrm.6.1709640364529;
        Tue, 05 Mar 2024 04:06:04 -0800 (PST)
Received: from localhost ([2001:470:6d:10f7:9114:d168:fb53:9a37])
        by smtp.gmail.com with UTF8SMTPSA id cr14-20020a05600004ee00b0033dd06e628asm14810894wrb.27.2024.03.05.04.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 04:06:04 -0800 (PST)
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
Subject: [PATCH v2 0/7] device mapper udev rules rework
Date: Tue,  5 Mar 2024 13:05:43 +0100
Message-ID: <20240305120550.11617-1-mwilck@suse.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All,

here is a rewrite of the device mapper udev rules, as follow up
to the previous thread "About DM_UDEV_DISABLE_OTHER_RULES_FLAG and
DM_NOSCAN" [1]. While I have taken care to minimize the impact on
other udev rule sets, some changes to both the multipath-tools and
systemd rules will be necessary. Patches for these are in preparation.

In short, the effect of this patch set is as follows:

- As before, DM_UDEV_DISABLE_OTHER_RULES_FLAG is used as general flag to
  indicate to follow-up rules that they should avoid probing the device, and
  should import device properties from the udev db if necessary.  The flag
  does not imply that existing device stacks must be destructed.  -
- DM_UDEV_DISABLE_OTHER_RULES_FLAG represents the combination of multiple
  conditions that may make it impossible to probe the device just now.  As
  such, it isn't restored from the udev db, but determined anew for every
  uevent. For saving the DM_COOKIE variable of the same name in the udev db,
  a new variable DM_COOKIE_DISABLE_OTHER_RULES_FLAG is introduced.
- The properties DM_SUSPENDED and DM_NOSCAN, which have always been considered
  internal to device-mapper and its subsystems, are renamed to .DM_SUSPENDED
  and .DM_NOSCAN, respectively. Thus they aren't saved in the udev db any
  more, and it becomes more obvious that they are not supposed to be used
  by non-dm udev rules.
- ID_FS_TYPE is imported from the db for "spurious" events.
- Properties are imported for DISK_RO="?" events, too.

Changes from v1 ("RFC") patch set:

- Instead of removing the DISK_RO clause entirely, just moved it further down
  (after the property import), and apply it for DISK_RO==0, too.
- Updated comments about device properties at the top of 10-dm.rules.

[1] https://lore.kernel.org/linux-lvm/9d50edb0-baa4-4a01-a2f0-136dfdb79937@redhat.com/T/#t

Martin Wilck (7):
  13-dm-disk.rules: import ID_FS_TYPE
  10-dm.rules: test DISK_RO after importing properties
  10-dm-rules: don't restore DM_UDEV_DISABLE_OTHER_RULES_FLAG from db
  11-dm-lvm.rules: don't restore DM_UDEV_DISABLE_OTHER_RULES_FLAG from
    db
  dm udev rules: don't export and save DM_SUSPENDED
  dm udev rules: don't export and save DM_NOSCAN
  10-dm.rules: bump DM_UDEV_RULES_VSN to 3

 udev/10-dm.rules.in          | 43 +++++++++++++++++++++++++++---------
 udev/11-dm-lvm.rules.in      | 13 +++++------
 udev/12-dm-permissions.rules |  2 +-
 udev/13-dm-disk.rules.in     |  9 ++++----
 4 files changed, 43 insertions(+), 24 deletions(-)

-- 
2.43.2

