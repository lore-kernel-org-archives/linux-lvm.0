Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306EA17E8FF
	for <linux-lvm@lists.linux.dev>; Wed, 17 Jul 2024 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216576; cv=none; b=FudTvG29RrDBis3cqr0q3Iz+FIKb7tixOgg708NmdvbTXmKV5FRzY0lxuaV6DrQD1rGoxU7M2rKI6qK3TFwmgIdmnXjRtA6+P+ma83O5c6gQbr0vuPhdIN2NiFloxqV1x+oC/4QlnSWgdcDYRp01Jr+0kasNyKr4M610PNt3WD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216576; c=relaxed/simple;
	bh=y3acGudrK/HL4pobdWvJ1mjAonZEguPRYCS/KW3Lz8A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FBgQhd/eIULc1htsm+mhm2jYBHKzvurxYni4OsTdT+NDbpXngzdGsn9IDz2g8BevbNuwJYiS6ZehSV632P6F35t+ttGFb9b4lZaP5AqEW5OBIIpJ78ciNn+ZVsWJxc1yUn3KMIwkN74RXv8xMUHjBnH5IcGiRCCvWtLbXu1Xs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOsDccSs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOsDccSs"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b88cso2018234a12.3
        for <linux-lvm@lists.linux.dev>; Wed, 17 Jul 2024 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721216573; x=1721821373; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y3acGudrK/HL4pobdWvJ1mjAonZEguPRYCS/KW3Lz8A=;
        b=UOsDccSsMA2YjNMQh1LGZpXk6RIUorf6JCZkygBMqzTJN877L8SCTCAdSOl3VYUlXO
         3jfwKRYwu58HhUaLHvp9hEx6D8/SaCQzJ5ImPIl+jbUvJqWwdOFycc6oKaH5Yb4vSQgj
         oq7FN+4fypBnoqaRMajmYUHSweAU3bISNHll4b05zhiC/vv9TAyo5fivg8R1RgUyCJjg
         j8eT5mmSHk5oy0Qic7V2/acLZODiHx4WgJGuDABEThD6HdncRFtsTb+prC7bJAX9hCg+
         PdnGyXkaaFBRjcGwJQy6DZSnzHcrIAloGj1vzNxZhjJokxbYY6+2vsBMUyLZF3JKp9Mu
         nU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216573; x=1721821373;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y3acGudrK/HL4pobdWvJ1mjAonZEguPRYCS/KW3Lz8A=;
        b=OZTcQXBlxg5gBFj+ZBpPWoOvvdUbmrk+B5yNS/O0BJnDez/0r58fP2XxtQtOo0Byfj
         UCbLB38msfbN2dLpY2mjuOK5fTa/5vY776LgJRkH18gQuz4olAlkfJbNO8qXY8dd+Mnb
         0hLLSJKNXDbGmqmxQK21heNPocuc5jVSINAuJzMOugMaI/iMB6WrvOy4QA9pjXrhWplB
         9Lwc2U3tp0tR2JflZVsTkH9FLwXzawrNKwFF3B895d8h9F/J59VqGJjWeJe4j8fx/wgk
         VJmiFIvg0uZTgFi8R3pG4Akg4CiBD82UuBcQfFizsrM/JuOI5D+gB/QVRr3iqx/8FBt+
         LVLw==
X-Gm-Message-State: AOJu0YxrE/xXMzeUAomHbrgD06CBRLnZvy04axiaivyabKuoelruPs3k
	nDBTrpfvVLV/jDN2fN/d7Wl4FzNkajC/pOfBkLioBJZy2/I2e5GsNcKA4JWt/nsSQXeNklOB9r7
	6ui9qNdT0/4kZMKggWJ1JmeG2rAGpflhb
X-Google-Smtp-Source: AGHT+IG+Vpwd9ei3dkJSfIokDEE5PJn890OArvqEK3Se0U9susoxZ7+gEO6QX8WMhiZAgsQGIXNMVpnaQb1+NE5xOXE=
X-Received: by 2002:a50:cd1c:0:b0:58c:2a57:b1e7 with SMTP id
 4fb4d7f45d1cf-5a05b4160b6mr1055600a12.8.1721216573345; Wed, 17 Jul 2024
 04:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Pickles Creator <picklesthecreator@gmail.com>
Date: Wed, 17 Jul 2024 12:42:42 +0100
Message-ID: <CAF2YDE6gvhs3o4QD4Y_CrDuQb7icHYOpNrgEiGcrwq5-Pe8qNw@mail.gmail.com>
Subject: Guidance on increasing cache_pool_max_chunks for lvmcache
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm currently evaluating using lvmcache with a local disk as a cache
for a slower network attached disk, both of these are SSDs. The
default value for `cache_pool_max_chunks` is 1,000,000 and I'm
wondering the about the reasoning behind this. Is there degradation if
the value is increased or has it not been tested?

With the current limit, a larger cache will be fairly inefficient with
smaller random reads due to large chunk size being allocated, and the
warmup of such a cache would take some time.

Thanks
