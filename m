Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D8B28DD5
	for <linux-lvm@lists.linux.dev>; Mon,  5 Feb 2024 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137216; cv=none; b=eJQ2c2t1g/w+ZWle5cFQRQhxhyGbmTIIJwe0dtLUX9wjGjr9sV8TT6mrhqOu5yJFTnR9deEPu0YGree4y8V33r3QWB9DilAxTQ6WQv6EVdwVkVmcYk5FlsP1MvRjBrRxL1vsg56M8Lh7gKnkCKPj0Ku3RAv4csZoUv1GGEB5B2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137216; c=relaxed/simple;
	bh=uCHwYtcqJvKd0vl1r4shZl0zfIqS2AF7bW4iDLZRD6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIGmJBU+KdLEjpkB2e6f9NwgKZHfRZIfnG1EjG6RZfGUlrSAr3cuIHScIgqJPrngZHqszWbXnP9XFvWZqbPTQlEMP50RHKnoF10FaDlNP16e9jvphDZYNlk30DgrTFFi5S+7P6KIM4nR+ck+cSp1Nj/ICiJTjW/0igT0lb9ujhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vd2y5ggp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vd2y5ggp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fdd65a9bdso4294345e9.2
        for <linux-lvm@lists.linux.dev>; Mon, 05 Feb 2024 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707137212; x=1707742012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS6RPL1ziCGOnuiUbiIHJtHOa3zWHBq75Wkktv9HZ/k=;
        b=Vd2y5ggp3sko3tMrJUpDAuN2aGzfZCpriFe+OysYyq8tjZ/OUxICZkN0DDU8UT78H6
         nDTzoaFK3QnOhpdsYqPy4IAiN+n/OV2wKbBLeG8E8+QDpKrDu4CI3o+AnREx5ty9GGxl
         hDsnrCJTTy+qYAGz70vtCm/xWpDE+FtqR36Bn73lplenIUVEJxcuN+Xks4O8PucKEaGx
         0H2Zem1fGlHuNqEZvecIRxurgEe2o/cNmMQkhtwQw/Dz0ynylBP711qQXL3ODCiX3e7k
         hER45X2F+5HGvr/2ejQBhsQLd5p45z3A9dc0BZsnFr2yh9wI8t+8hZ43Enxjre6zU46A
         cNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137213; x=1707742013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS6RPL1ziCGOnuiUbiIHJtHOa3zWHBq75Wkktv9HZ/k=;
        b=N4cJs5bfK43nvALy88rRNl+ZkHhiwayYEA/lMla3/IYOsBD/+fLWWCfvzadVE9BGl6
         vK/OL+KSDIqbq4OULXA8pPeVjXrxaU5jdp2Y/IhKYDkHk5uIaNPRfhrJWNyqeolokOEC
         8dDJTykVoP3vTAA/MxEiRoB9bWbLYHBfiF7sHwn9dlKE30B7rtlWb0k5+Q9qmIy9vmGZ
         kw0KkNpwsH1Opn5w4sUbxB4VXJhgABprMEFtF6BYLI8o/b7nb58/zmNnapt1ZfXBQs1l
         vOLrmLQ1Lf2d0JgLRBJigZJp3Tc/djd+5u6L8s0yc4Lsf0Luzog/zKClG72KJ+EvH+HW
         qNYA==
X-Gm-Message-State: AOJu0YzpY4uBZY75g4T95hDI3DaHESh/fcmGubo1XQkJu4O/5WkfId58
	C7E4V9AsVhATjgPyb9fP9WlhqMkNqc81j99JUvYZ39g3FYICTyuaAGsdDHCzupM=
X-Google-Smtp-Source: AGHT+IEyBSh7/mcrMvtcAFb0iUUFQNfJAkDR9dHyjEisZ8h4ikt+VTBryf7aHog49AftJP4To04maA==
X-Received: by 2002:a05:600c:35c7:b0:40e:fc29:f527 with SMTP id r7-20020a05600c35c700b0040efc29f527mr4912104wmq.31.1707137212820;
        Mon, 05 Feb 2024 04:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+aDRcP0sy2EzKUgYgs8p4qL9EBmvPfsvTEu9dU5B4U0saWyjDNZ8BBGCGG6nsSTX2ekSEai6txJxm5lTsvfxNYZvC29D/8pOWxEhSI98RcKEMrCoyd4zHZWEowlX3Toxg+v06H8mqi5dUq5w5RqBePL7U/A9UVbmpRjb1ZSIOBwTUXBk/nZgENA2mjXQJTeDbbTp450fBTBOp2PSNndOhMsHiUDGHbFxhnAzg5RwjMA==
Received: from localhost (dslb-002-202-118-224.002.202.pools.vodafone-ip.de. [2.202.118.224])
        by smtp.gmail.com with UTF8SMTPSA id fm16-20020a05600c0c1000b0040ef67bd244sm8571313wmb.17.2024.02.05.04.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 04:46:52 -0800 (PST)
From: Martin Wilck <martin.wilck@suse.com>
X-Google-Original-From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-lvm@lists.linux.dev,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Peter Rajnoha <prajnoha@redhat.com>,
	Sergio Durigan Junior <sergiodj@sergiodj.net>,
	Chris Hofstaedtler <zeha@debian.org>
Subject: [PATCH 6/6] multipathd: don't activate socket activation by default
Date: Mon,  5 Feb 2024 13:46:38 +0100
Message-ID: <20240205124638.17877-7-mwilck@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205124638.17877-1-mwilck@suse.com>
References: <20240205124638.17877-1-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Socket activation will start multipathd on systems that don't have multipath
hardware. This is often not desired.  On systems that do have multipath
hardware, OTOH, it is highly recommended to enable multipathd.service directly
rather than have it started via socket activation.  Therefore don't activate
the socket by default.  multipathd still supports socket activation, so users
who find it useful can disable multipathd.service and activate the socket.

Fixes: https://github.com/opensvc/multipath-tools/issues/76
Signed-off-by: Martin Wilck <mwilck@suse.com>
Cc: Sergio Durigan Junior <sergiodj@sergiodj.net>
Cc: Chris Hofstaedtler <zeha@debian.org>
---
 multipathd/multipathd.socket | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/multipathd/multipathd.socket b/multipathd/multipathd.socket
index c777e5e..6a62f5f 100644
--- a/multipathd/multipathd.socket
+++ b/multipathd/multipathd.socket
@@ -10,4 +10,6 @@ Before=sockets.target
 ListenStream=@/org/kernel/linux/storage/multipathd
 
 [Install]
-WantedBy=sockets.target
+# Socket activation for multipathd is disabled by default.
+# Activate it here if you find it useful.
+# WantedBy=sockets.target
-- 
2.43.0

