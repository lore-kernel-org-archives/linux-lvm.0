Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A459B76
	for <linux-lvm@lists.linux.dev>; Tue,  5 Mar 2024 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640375; cv=none; b=VnpBAs+DIAvE1YNC+EA11Ns2JTONsgEVa2sWT+7aiydJ97be5vyzd2Cz6EYXNlVzznY6Q1wAv5qf4jxA9QRtN91Kzl6XMdCDxvzL5bv0NvNmVH6U5n+1+//b0rJ6WoR88QRfsxJcNx1nFh6Uthrwra6YHYcTIwqYisIyqp3Kpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640375; c=relaxed/simple;
	bh=XwLouIOkyoFFCY/NijAavYEmB65ECJZxxV2Smeki4qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuKXys3YJ+CMntU4fuYdHl2YNC+kDnCSNaWp2K1BnmZcXbgyHmiRJ+9/5VqHTvPEZFSpG1eLzit04Z0yb9frkcGZKHwky8y67ocPy+KX+I6J+Hz/tBQ6ElK5fDIxTdkFGMOOUAAKMDAig24o/kXzJm0sUZVf/eoKFCLTf3Q1GQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UojizwN8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UojizwN8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412e66b801fso12535535e9.3
        for <linux-lvm@lists.linux.dev>; Tue, 05 Mar 2024 04:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709640372; x=1710245172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q7Z+JuTjKNCARoW6XoPy3jitO6RjQKV6tGuor3jKWM=;
        b=UojizwN8UQBpyoNSDrSg3B8hQ0queKKjihhjkl+U5elMV2P3zuCdYg54mZULYLZsoT
         tOATcQazQ1DHWh97jLBqwceQqJzQfdCpi0VYQkWXvHLteZKUutXbAbw1H0INXhCip7ac
         18ajoFqjdHGI/mI9vdAZgL6w5DcZJU0pf45K4roYgYbyS4YGh/Za4FMlwKx0LX8ntdv8
         jZAaMXaw3dg9v9allXGVvH6BuMJjjkpxEgzk2X5e+NjUZM7/9TN+uzzwVu6KmEeaAtYm
         25mdAcCgiLhD4DTpqRv0vmNP+5npSKU9X2bc665qfMMcla/iskYuwd4gtyM4a/VGaRTF
         ngpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640372; x=1710245172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q7Z+JuTjKNCARoW6XoPy3jitO6RjQKV6tGuor3jKWM=;
        b=Si1ywlBMXHjK2hkpfoX37nnenYIQjtlFM0Bl2z0xFHLJRSB8Dx8gkzXUDpiX+/Mtk0
         rtV9lqH5LlyNHBb2djGaRkBox1AMfk70MNgp+yXfEHTjpttO/uLvSnTnkm3403ygzBep
         65Tt6UrtwAYTtMn3t5vTwFr6zWi9eYJ6mXqWVnVUaEVdf4S/SeP05hWNU7LSo37/j+Ft
         X+d3Rc7F1d/guiy514pGG2UXfivtjw1Q12embmpWro4CUx4RqmBcUJbJf8N7vQ/1SRF7
         6dsGNE8zTUPjG0MI4/+V4fxbE8QMktalgwo2fpeMwyko66iGI1rAucd46UTwi6HNVORK
         Sa3A==
X-Gm-Message-State: AOJu0YzXi6duozIf7JAWZSFdIEn99W2As+smX3NdZn7XUkBn0v7aNe0Q
	Usan08frKsn5RbEF8PwAJff3O889PV1Swslklpgz5WWI6xz70mWI8xI3NB4EYP0=
X-Google-Smtp-Source: AGHT+IHwXUoVPl0c2/fvNQh3sNLnXRcBKhO3QXtsVMfmZLCCllwZh7hRcWRi1pNoRzIMPk/V3mNDCQ==
X-Received: by 2002:a05:600c:19d1:b0:412:c8cc:d9eb with SMTP id u17-20020a05600c19d100b00412c8ccd9ebmr8965632wmq.23.1709640372141;
        Tue, 05 Mar 2024 04:06:12 -0800 (PST)
Received: from localhost ([2001:470:6d:10f7:9114:d168:fb53:9a37])
        by smtp.gmail.com with UTF8SMTPSA id az23-20020adfe197000000b0033e4403c6a9sm3862656wrb.22.2024.03.05.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 04:06:12 -0800 (PST)
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
Subject: [PATCH v2 4/7] 11-dm-lvm.rules: don't restore DM_UDEV_DISABLE_OTHER_RULES_FLAG from db
Date: Tue,  5 Mar 2024 13:05:47 +0100
Message-ID: <20240305120550.11617-5-mwilck@suse.com>
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

DM_UDEV_DISABLE_OTHER_RULES_FLAG is used as the "output" flag of the
device-mapper rules, to be consumed by non-dm rules. It is a logical OR of
several conditions that might make dm devices inaccessible. 10-dm.rules
calculates it for every uevent, whether it's genuine or spurious.

DM_SUBSYSTEM_UDEV_FLAG0 is just another flag that needs to be or'd in. We
don't need to restore the previous state of DM_UDEV_DISABLE_OTHER_RULES_FLAG.
Actually, doing so is wrong if the flag has previously been set because the
device was suspended, and the device isn't suspended anymore.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 udev/11-dm-lvm.rules.in | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
index 7c58994..0b77fe2 100644
--- a/udev/11-dm-lvm.rules.in
+++ b/udev/11-dm-lvm.rules.in
@@ -26,14 +26,11 @@ IMPORT{program}="(DM_EXEC)/dmsetup splitname --nameprefixes --noheadings --rows
 # to zero any stale metadata found within the LV data area. Such stale
 # metadata could cause false claim of the LV device, keeping it open etc.
 #
-# If the NOSCAN flag is present, backup selected existing flags used to
-# disable rules, then set them firmly so those selected rules are surely skipped.
-# Restore these flags once the NOSCAN flag is dropped (which is normally any
-# uevent that follows for this LV, even an artificially generated one).
-ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", ENV{DM_NOSCAN}="1", ENV{DM_DISABLE_OTHER_RULES_FLAG_OLD}="$env{DM_UDEV_DISABLE_OTHER_RULES_FLAG}", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
-ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", IMPORT{db}="DM_NOSCAN", IMPORT{db}="DM_DISABLE_OTHER_RULES_FLAG_OLD"
-ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="$env{DM_DISABLE_OTHER_RULES_FLAG_OLD}", \
-				   ENV{DM_DISABLE_OTHER_RULES_FLAG_OLD}="", ENV{DM_NOSCAN}=""
+# If the NOSCAN flag is present, set DM_UDEV_DISABLE_OTHER_RULES_FLAG
+# so those selected rules are surely skipped.
+# We don't need to save and restore the previous of DM_UDEV_DISABLE_OTHER_RULES_FLAG,
+# that's taken care of in 10-dm.rules.
+ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", ENV{DM_NOSCAN}="1", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
 
 ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1", GOTO="lvm_end"
 
-- 
2.43.2

