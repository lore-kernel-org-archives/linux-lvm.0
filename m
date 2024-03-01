Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D435EE6C
	for <linux-lvm@lists.linux.dev>; Fri,  1 Mar 2024 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332854; cv=none; b=TTmtAAAJrut/XsEVssh9ffig6T7eHsiWHAPx3M+wJIyglNod4trgWFvPdyOyytw1hHfn9UdoaTq2ZIZJLJmcC15L2bUgzd34PcWlq7e4BTkrkXtvGWZxJRUDWMtIaZar3Ad1WR4EXcjpt6P+WoHN3+D9vMH8/WvXTrE4nrpxEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332854; c=relaxed/simple;
	bh=ZV6E4CLPDk2EukFXwIpi27sxbLWDB5ZXkhqBEryg4JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAf7SPf1M0b1Js4+rzDmcgzw2pM8ALCxs/2xUPDqNoGc31v73ZkmmwMjyv4FnLi5W29ZFJJvb5SHkOOKHmJAzAUiGi+6c96Mio/o+94N456Fn9TmG+iync4YXNSlEKGPy2swPr47sVGAYaqBVEz5lQ7F0MZuxA+Cx+94iinYeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CR5W44Xx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CR5W44Xx"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so3452879a12.0
        for <linux-lvm@lists.linux.dev>; Fri, 01 Mar 2024 14:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709332851; x=1709937651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjX7L1hpwAL+jfR+2gxXb8+BTyRmg8ixtQJ2jnxejR8=;
        b=CR5W44XxvM0NCwP9iNDfORY38fRxlF9lRcQCgpatyBfb11qLB7NbUYJXnMZiuL3e3i
         RiVFHUuIb1RbbI50K0mwmWLa6C224v4vgrQbcxt5naJcVnSsKgcIcoC/RU8kl+6Hm7TJ
         FVRVhXv4WLWij6/pM/Z4BqrDos+FSoQHlbY59vAQlTo50q+abXC3AdJZS80IwxCYO+ez
         bDGe7O6rz3AvgURrZwFAdRnTFBuKHUDlula+v0b4Kzvlbo46NbRLgsQRFfDkq6ozUzng
         uEh3OSBCvPAXPEUYPrwQNb2e8MyiBSsWwp1A03Jitxm8IQt6JqjIafIGrx9/6f+oVf5g
         nVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709332851; x=1709937651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjX7L1hpwAL+jfR+2gxXb8+BTyRmg8ixtQJ2jnxejR8=;
        b=bwT/Sn9Wc7LhkG8xq7nxU9Za0uYbTV2zlQ7kc0IlDHtfun5kNhRsazVwnTuMVkRJ4S
         rMOgG12ksEVjFdiTLLaw4tgFgGrN9SWJ5Mnwjj8ooDuAN9DzVto4T7jL5IA5fIWgc3KT
         GufIr2U9g77CD3qIVG/PzXwAa95CmB9kuC8Br6Y+gnqmnfROTnKhbJoMTSPh+GKxUX37
         a/bEACLSb0iT4R5ImCF5td5DruQ1H7u6hBi4poOENhze5ams0BOphC1r4FNNyFVMk+5u
         kOLDA7+MBoE0IdakLjFhtWFEVEOi9cb4lo8kGnK142ffR0sYEoNF+n0vpQjyE3VbygvJ
         9c8w==
X-Gm-Message-State: AOJu0YyCU4ricIc7gd6xlEyNXxzo3jZNv7V++co8VhuoVoQP2gx2dQ9U
	FwDm4eSbuYrtw/XXmrWvpGvsL9iEjsQsll0lMs/dNd1Lmt02xLe06rvX72RX+go=
X-Google-Smtp-Source: AGHT+IEH16G+DS2mezlyjORY2/CQlH9B6Xr0t4pBsiXlXvWvgl+di7wDEXeL0l6Mnj2RV49Z+lmBWQ==
X-Received: by 2002:a17:906:a2cf:b0:a3f:33b2:5ce2 with SMTP id by15-20020a170906a2cf00b00a3f33b25ce2mr2347365ejb.35.1709332850860;
        Fri, 01 Mar 2024 14:40:50 -0800 (PST)
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id mf18-20020a170906cb9200b00a44729f4e31sm1282637ejb.26.2024.03.01.14.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 14:40:50 -0800 (PST)
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
Subject: [RFC PATCH 7/7] 10-dm.rules: bump DM_UDEV_RULES_VSN to 3
Date: Fri,  1 Mar 2024 23:40:11 +0100
Message-ID: <20240301224011.11117-8-mwilck@suse.com>
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

Bump the rules version in order to indicate that upper level rules
should consume DM_UDEV_DISABLE_OTHER_RULES_FLAG rather than DM_NOSCAN
and DM_SUSPENDED.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 udev/10-dm.rules.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/udev/10-dm.rules.in b/udev/10-dm.rules.in
index d30f663..21bbcb0 100644
--- a/udev/10-dm.rules.in
+++ b/udev/10-dm.rules.in
@@ -136,7 +136,9 @@ LABEL="dm_suspended_set"
 # possible future changes.
 # VSN 1 - original rules
 # VSN 2 - add support for synthesized events
-ENV{DM_UDEV_RULES_VSN}="2"
+# VSN 3 - use DM_UDEV_DISABLE_OTHER_RULES_FLAG as the only "API"
+#         to be consumed by non-dm rules.
+ENV{DM_UDEV_RULES_VSN}="3"
 
 ENV{DM_UDEV_DISABLE_DM_RULES_FLAG}!="1", ENV{DM_NAME}=="?*", SYMLINK+="(DM_DIR)/$env{DM_NAME}"
 
-- 
2.43.2

