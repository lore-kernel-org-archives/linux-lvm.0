Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231630F82
	for <linux-lvm@lists.linux.dev>; Thu, 19 Oct 2023 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="sYbaCgLe"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5079f3f3d7aso9441603e87.1
        for <linux-lvm@lists.linux.dev>; Thu, 19 Oct 2023 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1697735000; x=1698339800; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=sYbaCgLeOcPk0fEHB+LslU8tMtf2ZQiQaJICNAGaSPBFTFXKIg5jlkv0iWEo3ffP3S
         tHoVWsUIauXEVUaroikXrn9iGjPidEiGLMd7GeqcX/mrKLeK4pagvfJd23gCyKGLXlIX
         KiWjkAUhLhEgmCTZEYLfSrPLwyexejjNvWRKFF2gqWsb2/Xm522+BEXWUZGL9QB3EoKl
         d+CepZJhjewog8wzhdI/de02mCCw0++BMdUHyvcL7sZ6tQdCQj2dBfuUNIV+Q/ywDrQk
         QhK1z9YhcWahdr9m89LRpO+tTUPf3CRQoEKC+AAoFACoKq2/ps/ZgZknlbh1zUZkRTN3
         ydpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697735000; x=1698339800;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=mJXR0SU4/hq1hrvBFvzw0UKJR+PBNcSQfX4IT82IYsUzlCNzm0mR4KKMEqWcD1gRJs
         zV/naUeagRSLql9tu2VzciLuz+ifrleyh/DfNYAVdyS53HtNlHxaYV3we724TCcGJ5tC
         C0uj2evD9uGTh3uhh5Zip+blYHc0pNJZpTaXA5iclO5vG06WxZjPF1x/bZmgPTsry8xW
         z7ayL1MqK9gn9ceqtig/dZqRCuPwcCKj7zCet98OucduTBQ4gnn+w4P82vCtwGOiKMWI
         Zx0eaVPk0oHbmWnzngkan7WuuspHRClxiA9/yYVLcSoOn+OS9caX/JoPAuty3m0/KGf5
         nJAw==
X-Gm-Message-State: AOJu0Ywop1ldBwXGxQpQCtmKqGKViZ8KWNKIjNL/pXx2tROOrgsV+5ng
	lupn87c6WiYUTCqvTK7FIiETfa343LlaKxuFW0hKRc6FjMrljqsSiuQ=
X-Google-Smtp-Source: AGHT+IEq7aQa7yLGU0RntmpBcRbAjew4JUFSWPSydS+28jWZb8JRvJO8EsiHl+nGlgW8/stUXQ2rvBe3hKOMgpHJnYI=
X-Received: by 2002:ac2:4a6c:0:b0:500:aed0:cb1b with SMTP id
 q12-20020ac24a6c000000b00500aed0cb1bmr1907958lfp.24.1697734999993; Thu, 19
 Oct 2023 10:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 19 Oct 2023 22:33:09 +0530
Message-ID: <CAH=dH99oXX5xzgGa_woD6=PMHuRBrSVSNv49KkvPyi4fRjn=NA@mail.gmail.com>
Subject: Test Mail
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
