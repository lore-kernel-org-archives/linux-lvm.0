Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02829322E
	for <linux-lvm@lists.linux.dev>; Fri, 11 Oct 2024 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728686800; cv=none; b=DmJ7YZPheig8mpj7Ol11AuZqh95W9MHTrATQiRq39QusN25v1RKq9mfQimWqo0BRgg7WfIet9ADguauzs1h+UUzWCz/XDEg3QDlX0z2O8AyEsLLkYkED5w1JyWQPPGsOwO6Mln9ojjDLmKYfCsoyzb5G1TaUZfbeMglphkIw93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728686800; c=relaxed/simple;
	bh=ulOpoC3d8eNQ+XNz1RzvmAbI5A/1LWblf71S/CyfmXY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hINDaA/eEBzeVBmF21TYDSbJDPbesKTjynmWzlXbcDeHthHRWRcqKAM8S9bxEp7VB1FlNOTYm0d1yYoaTdq7CvFhfQmxKv1f2ISLu+XOE9TekYsWVW598nchMg5Pjw0lCyGNvrn22ctSKVZjnP3Y4o1/L4feYmX58T9wXpoMElg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoUQk2Xv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoUQk2Xv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ce9644daaso1652515f8f.3
        for <linux-lvm@lists.linux.dev>; Fri, 11 Oct 2024 15:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728686797; x=1729291597; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ulOpoC3d8eNQ+XNz1RzvmAbI5A/1LWblf71S/CyfmXY=;
        b=ZoUQk2XvhUURgImwwmaDAMI3/bWTBe0S8d5IwfTt4gbRf+jj1JXeqGNWIhjpRFqRvZ
         FzpIHcPyNkFrHyS5OHXLH9kytxFxtlPVna5ssrk5wqjyiT+xQA/g+ktKJ5EpJe2uSxbW
         BsCyhxfwFSkSvi6+WPys3VvbFb3B8G1iHsVpDdTqLkPOo2SiZMVW51RUclXWKcW+P/Ka
         qp/PJjPofgTRdEsV0bulTXFHQoGHFTejogT7BNT9MYjJ/fj7IIHVcnMw+qoHzBcFAW7t
         HgTAyzkFURe/BygFAtaI3pxBT8YpQtndzSG4SdkCTAG/LLSLdoqIWP7Pyof2YU4ZEjFq
         lN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728686797; x=1729291597;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulOpoC3d8eNQ+XNz1RzvmAbI5A/1LWblf71S/CyfmXY=;
        b=C1p26To2MCVQaobBFaHdUCyWtWckOyIse5hrCCmUCJAAowHW4UooSws4ZwQfx5PLr3
         2ZJEE2pqaErlRGhadkyQJ1bMapE4njCWErFJzCxLpfWAIEpNrKgrQo8KNI4xj7Jyy0n/
         1VnLg/NMPo7IlVhNn8X1kdUn8OVrKmXohkZbY5i6xJ68xlLYRTaXuQ84TqiUvS8gtd6H
         ogwTbzDLPF81wF/nW9bnF573u9A4BdiHL0XmK0j94JO8pJnuaWZ69BqPlKMBh/x4ysmT
         JfXSimA8HMpVTfSZ3d8WqFS0r2pKrjd4Mc/0kh3Wf5QPGJChmc6hLenRwNKoQCfiaG0O
         WV+g==
X-Gm-Message-State: AOJu0YxCDxeiJYyBKecHyB749NQoOvUFTPiJUeSl+dyPPGHflCUqlZqA
	6tbOGyDvh9x8fAKVi6Yatisai1eFNo7E/pv2TiDwvZnDgA9WJHJmbsNrkSoOr7z4achNqH/8nnw
	frl5Y0IL3CeJHZxyszw4XmNFKRq3xIG2a
X-Google-Smtp-Source: AGHT+IFCRrG6Yy1aYNSg4EWW/wfCvw8oYwg7Tx6h1J08O2wCzOXKhXdTTBbS4d7f2Y9FBiJfi3pMHKZOszQK8Lefq5o=
X-Received: by 2002:adf:fccc:0:b0:37c:cd38:e7bd with SMTP id
 ffacd0b85a97d-37d5522bbd4mr2423534f8f.29.1728686796946; Fri, 11 Oct 2024
 15:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Drew Eckhardt <drew.eckhardt2@gmail.com>
Date: Fri, 11 Oct 2024 15:46:26 -0700
Message-ID: <CAFqQACz8umkccaKVfoECxeCwTghjFP_uVXKXByJ2TL8LEcHYgw@mail.gmail.com>
Subject: lvm2/dm-thin snapshot memory and disk overhead
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

What's the lvm2/dm-thin snapshot memory and disk overhead for each
chunk (default 64k) overwritten?
