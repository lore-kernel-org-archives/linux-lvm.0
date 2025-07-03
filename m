Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B42D4B7A
	for <linux-lvm@lists.linux.dev>; Thu,  3 Jul 2025 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533357; cv=none; b=dn+2IJGsCDlKvOSTiYoe1HFm3kgbfM/S1j+Du/yAvI/lWCEnCc51SD0mDg251AfJ1nJvVG8PexK+SHyz5Ivq3FPZGlOE2aeiVnQJyfHYr9eRjWmPZl3YCEJve7orggt8MjLwRthezjN9WftCLaflJtyg001hx+/VmvUQf617VFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533357; c=relaxed/simple;
	bh=Q7cs+0t+q2g6oA/ne/9TQjqwndVO0BwaOEU2gha3oaE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Qk2UmJziRWLNyhHZN/lphhLl4wRUT0C7NSfaQl8qHA6In0ZqZz4N3KxMzF1Z2ZyVQr5lnCtMbLRrc1yywq+ExrbfHjAUCUtEtmv1vC1V4srHFIy9vj9zTWwxGWtolwyUCqIrBlrAyHhgBJE58hu1wVp8+7ekZ2Y8W6YYh+UWqyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdxp0glz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdxp0glz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234f17910d8so75800625ad.3
        for <linux-lvm@lists.linux.dev>; Thu, 03 Jul 2025 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751533354; x=1752138154; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q7cs+0t+q2g6oA/ne/9TQjqwndVO0BwaOEU2gha3oaE=;
        b=cdxp0glzBd262QJSp/qD64G9iKfg0MuPQ8lfUFgdhsideZlasgFK7OT6tDRsME9Kc6
         pJEE4wmZ+giTOJwP5Cwcxl+UXPuYnNmQMSABM/Wedak4600JG1WCHyhxbPbKJJTmh4bp
         uuT3fZ6SWCHwQT6R07H4ZcEZF+r0QyLY8N+Nb67SG7vTc2c75Qi/5LZVqgJsuyJoH8yB
         myAYmHeEpmaD1Z6xjCK4h0fPlno5CogLWYKV8882JyHRm1qi9RYDOMcy1FI5Nzw2DpDU
         MqkOXRJHedv32fHuTRIhHcpx2MJvxRHOcew/3fQVvowyIHfmORnMu/qYVZ01MqGj0ijw
         /ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533354; x=1752138154;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7cs+0t+q2g6oA/ne/9TQjqwndVO0BwaOEU2gha3oaE=;
        b=k9C5GbGqGWiuzJdGl2w+xkiZOVF4Z5qG6uEuLFqeK6ijDtkTx5BtwMwmR5LJPtTAPy
         MRwi7C5CbcK3f7Y4gJnWGqrcsy5ggASoOiA2WFnEcsze6m/0dh7YfDLj9MnJzqqaPhRg
         Jbchm1lMC7V4tMugdytfzpN5Wg/w7jvmdN1+hOeOMyw17jsminyF2NFOF80AEdmZr2aK
         Bt3D57/lY6C3AnlDUxeNB3pod1VdzlBxFHojhmxQzyqG2z/AuUrnlQW6S7Z51aaerRs3
         JvPTYssjG2ehRrVEnuXOu7vURriYH5Mx71H9zHn0CbB0WGs1tc3uxui9esMFA4zQd451
         hbkw==
X-Gm-Message-State: AOJu0YzcVCa4JJ9soEwYsG/j9K7UNwu2xitgmaB5LbEBY0N5fZDWP1ev
	0sRlScY/RBJpKixZ2JhtTZ3dqV1i9uE1SWuTYhFM/u9i+NRHVR/Q+SkrFJG4mPmKEJSzYF5WjUf
	6aEaXJgLH9/Sjul4UnrDJ1c76vYs3h4FOdP/oxA==
X-Gm-Gg: ASbGncs2bRd0QcFzccEVx8qIhLdgFB0lCsYYCEiKCYM+BOIrBHzWfVMSylzjCEwJYCX
	K7U8OVhThW9bdSjpIT5Q2v+1TGnacjVrLf9jArT/j841pExPjZ3k3DxaEBs0xQZS052bJBVFUcg
	PkpL6e/G/1bNlrCQ0fsEbu0TXNpTBm0lZ4HCuEaSDs7QDqbwqlCqLPaZThOqdsxBC3x24jzhMc7
	Vs=
X-Google-Smtp-Source: AGHT+IEXv+E0nk0gHMeZ7IJN209xFGyXfDjpVtW62IH0+PoVnjDAH17imN33Sz5W1dllatS32SZZJsmo4Tthve2nXwI=
X-Received: by 2002:a17:90a:dfc4:b0:313:287e:f1e8 with SMTP id
 98e67ed59e1d1-31a9d58ece0mr3176721a91.8.1751533354276; Thu, 03 Jul 2025
 02:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Andrew Johnson <the.undercover.platypus@gmail.com>
Date: Thu, 3 Jul 2025 10:02:23 +0100
X-Gm-Features: Ac12FXyp3pFOtxl_1Ow7QwN_nt104ePivpSoYG0gZcKHFhgqWjJzMH3iUnzGum8
Message-ID: <CALX6RmYqj5ECZFJR3mtHVzKj1wiepfBDFChy9HKSg2_hCtXpoQ@mail.gmail.com>
Subject: Question regarding use of nosync with LVM mirrors/raid1 resizing
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a script which handles the setup of mirror/raid1 volumes with
LVM. My understanding is that the initial creation of the LV with
nosync is perfectly acceptable if there's no data to sync (In this
case there isn't as we haven't created the filesystem yet). However if
I were to resize these later, suppose I resized the first PV and then
the second and then the LV, would it be fine to set nosync when I
resize the LV as there should be no data used on the new blocks of
either of the resized PVs?
