Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D43878F45
	for <linux-lvm@lists.linux.dev>; Sun, 16 Feb 2025 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739718691; cv=none; b=JoXL3LUu3Gvh1nbgxx3ijE8v/spwcuIaBehIBDTAwczbBUEYWHgvH4XB1YRuItbZXaFRxRlKR1WdG7eg7ol5HxJZlCrNHHXhEJgWf1wm0PWLNJOdS0FKS0KOEd8izP4iiUzUyAXYLZ7ypXGxeLll5a3OlpxoXxbKqcnrGkrWBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739718691; c=relaxed/simple;
	bh=xnQihFu8rYryDcwExb4LvnjW8cuNgflcWjfFaNE5r5I=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=GcjC2rsd11INfQzUcLLKOMbFiKPu+BeBZLxQC/rFfnmN5IeSBB2LACQkykfPFX1ddX+Br/n2tTg6y9Yjag9edoSzLnL9dbQbxQBnv2/HnMiekg/Xnt6Tri/lQKxMKlH7g4Am6RZ2EzPEL81YeNJegp4p2gqoFOJQXsmOgh5auto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEJyIzQc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEJyIzQc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so1965490f8f.0
        for <linux-lvm@lists.linux.dev>; Sun, 16 Feb 2025 07:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739718688; x=1740323488; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xnQihFu8rYryDcwExb4LvnjW8cuNgflcWjfFaNE5r5I=;
        b=IEJyIzQcNDtD9GgWJgJjWoHCc6X3Gu8D17WMe4pcb4gM+92v0xlj7SizATtr3u0G7N
         T+0ixt3p/PglQlYX7QeT+KQQXEg2D6okY1p0xkchOj1BNCZhAWoWwgPcPwH+PyazLGbH
         wYeTCVhOAKhHrCfL9Dn4u5HNVTpy8dqKZZWe/+Z4bm3xTRVEMBIRO4XSCz5cZX/7h7MV
         hanmVYfTIZw1dcz/zuvKQm1ZfIEqGKtvBaGdbW8S7RDxL1qTnOQdMKvsotvfA4oP/JO8
         89C8Pv1m4YcgpPr04qsqDI1Z4MHCh5CwPqtlVbameC+b8yx5laUkFUn3yX+sLSYZC3kk
         ihZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739718688; x=1740323488;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnQihFu8rYryDcwExb4LvnjW8cuNgflcWjfFaNE5r5I=;
        b=Klpo9FLOlPN1pl92Vfrdoh3MFSL48HDIQQfrRDcU7pSr+QSjED2o36hwaRiMDdl4sy
         Kgq+3dyNkyVPwNbHYUDhmylE4JJ3qDIvMfZiZPuPBzXl/zFtIBX4h7dTyF4v8cp9iVSj
         ZksJLgadXNW33oQqm/BJJ3LKvnPjLpggSIrWNQ5My49nrX1fq+HLcITlkt/saaRyaDW8
         CZWujqoJZm40b4xW+3YwQDzKHxfgjyy827K9lgmBceoEpyoiz6dFAuvt6mB9g/q3cz36
         aNmHZKknsfRgYT/p//jGo+x4iH6PpSBu39zLt+PvH17Qz3PWU10I8L87XvKPu7XQ2J7j
         d2Bg==
X-Gm-Message-State: AOJu0Yy34jK9mXeYeKPtKLiClIvkwMxtjlCTzmiBINPQS8yRdUxRiMRR
	hFAD0LmHIAv969hZd2MWh0BU44+qza5py6ruGuVWaULW50r3MmNsR9tuRgVoZhQ=
X-Gm-Gg: ASbGncvqm7Rx0T5pFIz1J42DFVDtzyCYTdVYMJWzfoW5VSYMPpWiBs3a3VHax1WP5dQ
	7ddjmHm/RDCYMGB+zAeAB6qPpwNqAEj9JbjLz5GbuUE4C3MUqgFViM5qx4GYbSjO+f+2RXUPkYh
	+H/rl+/kwobee0Rm7GEb/2wAaPpMTMlJfCCw6UpYlEhfIAVc94GwkPdEY0GMaxr0+oV5bShz8JE
	oB3DN1T5RuHN33qw8UGrTzdPrYYaM3vPJhxbOOq9MT3AFKk8qr0tYhh/ZTgtvuEGCU8etphv1jM
	WXtsMKR7Djhwdd2pbHb7ztT3mamEv0wsKtcWAWz3rLH0I/AAg12LsUkdNQ==
X-Google-Smtp-Source: AGHT+IHqFRvrixr1Gd7Yti9CF6We+8w0tFa6u3l9yDZTr1H5SrqQGdCwP6Kk7ZDVxW2m/AfHMP6ZkQ==
X-Received: by 2002:a5d:404d:0:b0:38d:cf33:31a1 with SMTP id ffacd0b85a97d-38f33f40a63mr4656863f8f.23.1739718687853;
        Sun, 16 Feb 2025 07:11:27 -0800 (PST)
Received: from ideapad.fritz.box (94.105.127.6.dyn.edpnet.net. [94.105.127.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7979sm9677234f8f.83.2025.02.16.07.11.27
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:11:27 -0800 (PST)
Message-ID: <fa068a4eabaece5fcddca5ea5adf0557f26387a2.camel@gmail.com>
Subject: lvm2 weirdness in Fedora 40
From: christophe.ochal@gmail.com
To: linux-lvm@lists.linux.dev
Date: Sun, 16 Feb 2025 16:11:26 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I'm at present fighting with LVM2, for some weird reason I can't get my
lvm volume
to be activated & mounted at boot resulting in me having to do
"vgchange -ay" at boot (after I'm dropped in a shell & prompted for my
root password,to make debugging even more troublesome I can only mess
with this over the weekends, i've included the lvmdump to this mail,
any more help would be very welcome, as i'm at a loss of how to
proceed. this might also have relevant information.

https://bugzilla.redhat.com/show_bug.cgi?id=3D2338735



