Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A056740
	for <linux-lvm@lists.linux.dev>; Mon,  8 Jan 2024 21:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="NK9jdGRe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d89446895so14042175e9.0
        for <linux-lvm@lists.linux.dev>; Mon, 08 Jan 2024 13:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1704751185; x=1705355985; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvpPofv+WaiCOJnUWWGEvK72RMEGgLfmYvDWZq/0ZyM=;
        b=NK9jdGReEMqLim86k8PTqX+/D9o5z/8oD6w30TM1lJai1lLhDktk8HHwKzkLLORuKA
         CxHAJg6g06fJfvO1J6k9jhUrrWK9uJVmG63UIlQhARUOOkD2JMiDidVYg0kyvK1oEevc
         O6dSZM/6CJCDushE3zIvCqxYnChD0tJ+Fcpv4OPNQRqIK/3JE/0lWcg3+zK9OW0m4UcF
         djNroYoSeN4yXBqqzooq2As72yU83kE1+XSVURD6PqQFcSEAUYIDIW7wWrSkGmtPAVe6
         UPprqX6Svb6K9cvoW/r6ljEYxA8EqMsIzaDtrVMESYsj8ds3nNdjsYUuXuhzEsAxVSha
         zuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704751185; x=1705355985;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bvpPofv+WaiCOJnUWWGEvK72RMEGgLfmYvDWZq/0ZyM=;
        b=S62HASPrC6smDfiQQNAtIXJ3HYCjO1rKemNeMz7wrAvprKiSP9+MOZ/KL9uzY/7Ypn
         lCbIc8ccwKTA91EPGnZmAg7gTLYMan+pP1Sc59KXue3qo3jYm5finpsIfhcm8SO6YC7J
         2Cr0CnMoxfKYRY4KrjQl+FmlZRTu8YaoVQWt9TxmYYmuQNgnmrZ2kov6yZPR1dVCw1rt
         Mqagw8cAcWJtfeRKzgA4Sp83hlpY+A7qZcPTdvZt1/YqKW5Be4ekV2FqDLJuCErqsi7e
         UHI+qATwcGW1LorxiQCEkhr4h3GdT1YOTrHgYBaXvLb0D8+XqX6gahnQHAObF6Ujd3xm
         ZcoA==
X-Gm-Message-State: AOJu0YyuquL6PHo9gQoWMC06rydRL3HIbiYpkUVeOp5zqnf5xBqw0mdu
	zmDM9D88wzaljBahCNwQjlouIAQlcG2DOFHMPjlL4LWDPrs=
X-Google-Smtp-Source: AGHT+IE28nxUA8L0huMLZl5tWhomiV0uPfy2zI3YsfIofjdvv8oRCucEr2+P7BCYtQurjlzxDxgmDw==
X-Received: by 2002:a05:600c:16ca:b0:40e:4832:9fc3 with SMTP id l10-20020a05600c16ca00b0040e48329fc3mr199062wmn.7.1704751185010;
        Mon, 08 Jan 2024 13:59:45 -0800 (PST)
Received: from [192.168.0.51] (67-1-187-146.tcso.qwest.net. [67.1.187.146])
        by smtp.gmail.com with ESMTPSA id i11-20020a05600c354b00b0040e47dc2e8fsm1145578wmq.6.2024.01.08.13.59.43
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 13:59:44 -0800 (PST)
Message-ID: <e1703bc0-682c-4776-b34d-c0697092aec7@linbit.com>
Date: Mon, 8 Jan 2024 13:59:41 -0800
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-lvm@lists.linux.dev
Content-Language: en-US
From: Devin Vance <devin@linbit.com>
Subject: pvmove stuck/hung
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greetings,

I have a 'pvmove' command that seems hung with no progress for over a week now. A 'pvmove --abort' errors out with the below:
---
Giving up waiting for lock.
Can't get lock for vg_linstor.
Cannot process volume group vg_linstor
---

Would it be safe to just kill the pvmove process? Maybe I could just delete the locks in /run/lock/lvm and try the abort again? What would be the safest option here? This is production data.

Below is some dmsetup output, not sure if it's useful, but I know it's been asked for in an 18 year old mailing list article regarding a stuck pvmove I found in the archive (https://listman.redhat.com/archives/linux-lvm/2005-August/014775.html). Judging by that thread is this pvmove stuck on the last sector of the first segment?

# lvs -av

^C Interrupted...
Giving up waiting for lock.
Can't get lock for vg_linstor.
Cannot process volume group vg_linstor

# dmsetup info -c

Name                                                           Maj Min Stat Open Targ Event  UUID
vg_linstor-pvc--6bd68bb7--4cc1--4bd9--9a34--ae7fa10b82c9_00000 254   1 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkrbAOGKXR15cL1elmCpFvOmUlgx6vfa5l
vg_linstor-pvc--762d6fcd--6fa0--463d--9a3f--81004613bdfd_00000 254  29 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkYbSfVC0Eb9LuiYbhwtSdMXftdr4Xcdmj
vg_linstor-pvc--b35804d7--2f92--4630--83be--8360169e1fdb_00000 254   4 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkyJaarZaDp2EqliwjtBd8KiITmBkXXrcW
vg_linstor-pvc--d090ea4a--df22--4d4c--b1f8--d395943e113e_00000 254  22 L--w    0    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkXEZkzJhedoZoq9gxRMuNeh5PcZEVyfXZ
vg_linstor-pvc--86106845--452d--4c5a--8bd3--113156ee9ee7_00000 254  20 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkB2z1OlHTpRK9q0VFrXBmHfY70rWPefBa
vg_linstor-dummy                                               254  35 L--w    0    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkdejkpGJ9ScOOVq9CQ1Ojcwpdibh1mAS2
vg_linstor-pvc--e4cab256--3a45--4aa8--8efd--bd922484a684_00000 254  32 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zk3br1mOafh0xA2FSTpxtxTqy7Djbg3te4
vg_linstor-pvc--d71a60e4--6f5b--4c08--a920--ee499984859a_00000 254  30 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkkQcGTRANegRa5CeZV2JkVXb2p50B9I80
vg_linstor-pvc--ca3c953f--968d--4cb7--8fda--7699690f6576_00000 254  34 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkhYqTUCeq4vMOhqkBUeb7PlbfpeKQjF2l
vg_linstor-pvc--2aa91f52--0d84--436e--9e40--8beb8c29c9f6_00000 254  33 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkCa3JrDU7rpDP1ZteD2AkIb33G6KMhqp9
vg_linstor-pvc--555aa9dd--fecc--49d4--922c--31ba831de613_00000 254  26 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkQfpNYXVJ3b2X7SnYtspKlS590oIU7MvF
vg_linstor-pvc--4f950539--6002--40f5--881b--7f179812584b_00000 254  24 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zk8uJ7YiH7MC6AxkKofMfFjQ4Zf9JTCQEX
vg_linstor-pvc--cac899a0--d37a--470e--ae75--e5898c0699cf_00000 254  14 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkMd0YCa4j5nPLbFeXxQjegRK3xH8FMfIt
vg_linstor-pvc--b428a4c5--caa8--4527--80ad--9597255f91c7_00000 254  23 L--w    0    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkrKRJeEnbGW65lt5w1aGUh4XJWpnkCLBs
vg_linstor-pvc--0590f4ad--956b--40a3--857b--2815681c00a0_00000 254   3 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zk4J5dYbAukHhGUi0RTivsTsykzysAt35l
vg_linstor-pvc--dd9a568b--548e--48b9--a498--37771175de10_00000 254  17 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkck2qdZAahC2yqN3LnXu7gAm4d7isAsKx
vg_linstor-pvc--5452a81a--1eae--4c15--aca6--7f7a70b8eb6f_00000 254   5 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zk0e24rQZ0ltLfhLWPgqeZBbGbIGoUT7Df
vg_linstor-pvc--540bd197--6acd--4049--8ebd--956ae9574ef7_00000 254  19 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkuDmrveM9ncjx33hQ0mwLXeFDnyUUPHC0
vg_linstor-pvc--de4b4064--36df--4dec--8893--43d274631e60_00000 254  13 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkgS9fXxM6QvH5fon7a690rtTGZ7F45nTs
vg_linstor-pvc--f2d7bee2--1fdc--408f--b9c0--50a0a5194693_00000 254   2 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkndmBb7bvW24dDEs6vuJZ8naJGXLo6r9L
vg_linstor-pvc--e19d8991--2dab--41e7--aaee--0a056c799374_00000 254  12 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkw8P5r1ncM4hecU8Md60yUPSrAeN281FQ
vg_linstor-pvc--4e9b5775--e57b--444d--9569--faf9e239048e_00000 254  10 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkf7A0sCVEaSUN3BiUQlOZfF0LfE5FlwXS
vg_linstor-pvc--f31768c4--b090--45b8--ae26--f3657cbae471_00000 254   6 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zktCDkxwmI3cndT5ZO5EfsX0xzezLppTQp
vg_linstor-pvc--c10fe9cd--f25a--4ef6--913e--34225427c20e_00000 254  25 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkfP7mO4I2WhdN63J9GrAo6yzWGX85lfHz
vg_linstor-pvc--4157d7a7--b609--48fc--ae18--2f562d5dd48c_00000 254  16 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkHdCJkkyvzkM9MnFNplKRuv2D4RVvOr06
vg_linstor-pvc--d4f8a0f4--64c6--4f90--9be7--434c18729512_00000 254  28 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkG5Petvuj2FaHPJhsi6TT4VPE5hbPl0vs
vg_linstor-pvmove0                                             254  36 L--w   36   43      1 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkAIJgr2tJjookdIceBGvaywMH9KFt4g88
vg_linstor-pvc--a0d99645--53ed--43c5--a825--9b5260a05228_00000 254  18 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkpNdxsCATGWMcVaMPeNSjKJGlVWfGo8TM
vg_linstor-pvc--750d9469--f238--492d--b399--69e469eff0fd_00000 254  31 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zku303cp2i1WxTyP8ZaRdJ8y6LuAXPsGVD
vg_linstor-pvc--579227df--451c--438a--bf49--bacdd37ef4d2_00000 254   8 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkpzvBRl4J62UkGmmirCQB190ojkcVK6Lb
vg_linstor-pvc--8b1fc6b0--193c--430d--80c4--79b79351a142_00000 254   7 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zk4o0MtTD15Bzc1sw241LnfbtzV4Hh705u
vg_linstor-pvc--45301a70--220e--469f--abc3--0e9c980cb982_00000 254  27 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkvOTiqsFSfCDkp11okxZVfMJBz9s5Ctd2
vg_linstor-pvc--bf5368e3--2580--44fd--aa94--2210c9cc3f1e_00000 254  11 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkXa8JUaQTSvbuBqSA0j7BEuDfioyRcFeR
vg_linstor-pvc--af83fc91--1a0f--4eb8--a87f--d00410365e6e_00000 254   0 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkthAZ64YfecSQBloGaCE35eLzqk6XSuNV
vg_linstor-pvc--16c80b0c--340a--4b54--b710--b49c83777d64_00000 254   9 L--w    2    2      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkkS2u9Yc5Dewpjmdk7yzHBAxomYiLDYDX
vg_linstor-pvc--cbbd437b--29e0--43c4--ba6b--e7164877a38b_00000 254  21 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkSGlPNBGmyzMGb2N0n9WisVYMV5Rzi9V1
vg_linstor-pvc--44f4d3bb--9494--414a--b452--102a12f39652_00000 254  15 L--w    2    1      0 LVM-8sXHLPCjMj1KK6fKHx819uWZ1hWhe6zkimeILC0cwUU961lkgNF7qggNikE45t7c


# dmsetup table

vg_linstor-pvc--6bd68bb7--4cc1--4bd9--9a34--ae7fa10b82c9_00000: 0 6299648 linear 254:36 20979712
vg_linstor-pvc--6bd68bb7--4cc1--4bd9--9a34--ae7fa10b82c9_00000: 6299648 14680064 linear 254:36 27279360
vg_linstor-pvc--762d6fcd--6fa0--463d--9a3f--81004613bdfd_00000: 0 8192 linear 254:36 415555584
vg_linstor-pvc--b35804d7--2f92--4630--83be--8360169e1fdb_00000: 0 2105344 linear 254:36 50364416
vg_linstor-pvc--d090ea4a--df22--4d4c--b1f8--d395943e113e_00000: 0 24576 linear 254:36 415465472
vg_linstor-pvc--86106845--452d--4c5a--8bd3--113156ee9ee7_00000: 0 6299648 linear 254:36 398671872
vg_linstor-dummy: 0 8192 linear 254:36 419799040
vg_linstor-pvc--e4cab256--3a45--4aa8--8efd--bd922484a684_00000: 0 8192 linear 254:36 415580160
vg_linstor-pvc--d71a60e4--6f5b--4c08--a920--ee499984859a_00000: 0 8192 linear 254:36 415563776
vg_linstor-pvc--ca3c953f--968d--4cb7--8fda--7699690f6576_00000: 0 2105344 linear 254:36 417693696
vg_linstor-pvc--2aa91f52--0d84--436e--9e40--8beb8c29c9f6_00000: 0 2105344 linear 254:36 415588352
vg_linstor-pvc--555aa9dd--fecc--49d4--922c--31ba831de613_00000: 0 8192 linear 254:36 415531008
vg_linstor-pvc--4f950539--6002--40f5--881b--7f179812584b_00000: 0 8192 linear 254:36 415514624
vg_linstor-pvc--cac899a0--d37a--470e--ae75--e5898c0699cf_00000: 0 146833408 linear 254:36 79806464
vg_linstor-pvc--b428a4c5--caa8--4527--80ad--9597255f91c7_00000: 0 24576 linear 254:36 415490048
vg_linstor-pvc--0590f4ad--956b--40a3--857b--2815681c00a0_00000: 0 2105344 linear 254:36 46161920
vg_linstor-pvc--0590f4ad--956b--40a3--857b--2815681c00a0_00000: 2105344 2097152 linear 254:36 48267264
vg_linstor-pvc--dd9a568b--548e--48b9--a498--37771175de10_00000: 0 4202496 linear 254:36 243433472
vg_linstor-pvc--5452a81a--1eae--4c15--aca6--7f7a70b8eb6f_00000: 0 2105344 linear 254:36 52469760
vg_linstor-pvc--540bd197--6acd--4049--8ebd--956ae9574ef7_00000: 0 146833408 linear 254:36 251838464
vg_linstor-pvc--de4b4064--36df--4dec--8893--43d274631e60_00000: 0 4202496 linear 254:36 75603968
vg_linstor-pvc--f2d7bee2--1fdc--408f--b9c0--50a0a5194693_00000: 0 2105344 linear 254:36 41959424
vg_linstor-pvc--f2d7bee2--1fdc--408f--b9c0--50a0a5194693_00000: 2105344 2097152 linear 254:36 44064768
vg_linstor-pvc--e19d8991--2dab--41e7--aaee--0a056c799374_00000: 0 2105344 linear 254:36 71401472
vg_linstor-pvc--e19d8991--2dab--41e7--aaee--0a056c799374_00000: 2105344 2097152 linear 254:36 73506816
vg_linstor-pvc--4e9b5775--e57b--444d--9569--faf9e239048e_00000: 0 2105344 linear 254:36 67190784
vg_linstor-pvc--f31768c4--b090--45b8--ae26--f3657cbae471_00000: 0 2105344 linear 254:36 54575104
vg_linstor-pvc--c10fe9cd--f25a--4ef6--913e--34225427c20e_00000: 0 8192 linear 254:36 415522816
vg_linstor-pvc--4157d7a7--b609--48fc--ae18--2f562d5dd48c_00000: 0 10493952 linear 254:36 232939520
vg_linstor-pvc--d4f8a0f4--64c6--4f90--9be7--434c18729512_00000: 0 8192 linear 254:36 415547392
vg_linstor-pvmove0: 0 6299648 mirror core 1 4096 2 8:16 2048 8:32 2048
vg_linstor-pvmove0: 6299648 14680064 linear 8:16 405145600
vg_linstor-pvmove0: 20979712 6299648 linear 8:16 6301696
vg_linstor-pvmove0: 27279360 14680064 linear 8:16 390465536
vg_linstor-pvmove0: 41959424 2105344 linear 8:16 12601344
vg_linstor-pvmove0: 44064768 2097152 linear 8:16 384157696
vg_linstor-pvmove0: 46161920 2105344 linear 8:16 14706688
vg_linstor-pvmove0: 48267264 2097152 linear 8:16 382060544
vg_linstor-pvmove0: 50364416 2105344 linear 8:16 16812032
vg_linstor-pvmove0: 52469760 2105344 linear 8:16 18917376
vg_linstor-pvmove0: 54575104 2105344 linear 8:16 21022720
vg_linstor-pvmove0: 56680448 2105344 linear 8:16 23128064
vg_linstor-pvmove0: 58785792 2105344 linear 8:16 25233408
vg_linstor-pvmove0: 60891136 2097152 linear 8:16 42059776
vg_linstor-pvmove0: 62988288 2105344 linear 8:16 27338752
vg_linstor-pvmove0: 65093632 2097152 linear 8:16 44156928
vg_linstor-pvmove0: 67190784 2105344 linear 8:16 29444096
vg_linstor-pvmove0: 69296128 2105344 linear 8:16 31549440
vg_linstor-pvmove0: 71401472 2105344 linear 8:16 33654784
vg_linstor-pvmove0: 73506816 2097152 linear 8:16 39962624
vg_linstor-pvmove0: 75603968 4202496 linear 8:16 35760128
vg_linstor-pvmove0: 79806464 146833408 linear 8:16 46254080
vg_linstor-pvmove0: 226639872 6299648 linear 8:16 193087488
vg_linstor-pvmove0: 232939520 10493952 linear 8:16 199387136
vg_linstor-pvmove0: 243433472 4202496 linear 8:16 209881088
vg_linstor-pvmove0: 247635968 4202496 linear 8:16 214083584
vg_linstor-pvmove0: 251838464 146833408 linear 8:16 218286080
vg_linstor-pvmove0: 398671872 6299648 linear 8:16 365119488
vg_linstor-pvmove0: 404971520 10493952 linear 8:16 371419136
vg_linstor-pvmove0: 415465472 24576 linear 8:16 381913088
vg_linstor-pvmove0: 415490048 24576 linear 8:16 381962240
vg_linstor-pvmove0: 415514624 8192 linear 8:16 381995008
vg_linstor-pvmove0: 415522816 8192 linear 8:16 381986816
vg_linstor-pvmove0: 415531008 8192 linear 8:16 382003200
vg_linstor-pvmove0: 415539200 8192 linear 8:16 382011392
vg_linstor-pvmove0: 415547392 8192 linear 8:16 382019584
vg_linstor-pvmove0: 415555584 8192 linear 8:16 382027776
vg_linstor-pvmove0: 415563776 8192 linear 8:16 382035968
vg_linstor-pvmove0: 415571968 8192 linear 8:16 382044160
vg_linstor-pvmove0: 415580160 8192 linear 8:16 382052352
vg_linstor-pvmove0: 415588352 2105344 linear 8:16 386254848
vg_linstor-pvmove0: 417693696 2105344 linear 8:16 388360192
vg_linstor-pvmove0: 419799040 8192 linear 8:16 381937664
vg_linstor-pvc--a0d99645--53ed--43c5--a825--9b5260a05228_00000: 0 4202496 linear 254:36 247635968
vg_linstor-pvc--750d9469--f238--492d--b399--69e469eff0fd_00000: 0 8192 linear 254:36 415571968
vg_linstor-pvc--579227df--451c--438a--bf49--bacdd37ef4d2_00000: 0 2105344 linear 254:36 58785792
vg_linstor-pvc--579227df--451c--438a--bf49--bacdd37ef4d2_00000: 2105344 2097152 linear 254:36 60891136
vg_linstor-pvc--8b1fc6b0--193c--430d--80c4--79b79351a142_00000: 0 2105344 linear 254:36 56680448
vg_linstor-pvc--45301a70--220e--469f--abc3--0e9c980cb982_00000: 0 8192 linear 254:36 415539200
vg_linstor-pvc--bf5368e3--2580--44fd--aa94--2210c9cc3f1e_00000: 0 2105344 linear 254:36 69296128
vg_linstor-pvc--af83fc91--1a0f--4eb8--a87f--d00410365e6e_00000: 0 6299648 linear 254:36 0
vg_linstor-pvc--af83fc91--1a0f--4eb8--a87f--d00410365e6e_00000: 6299648 14680064 linear 254:36 6299648
vg_linstor-pvc--16c80b0c--340a--4b54--b710--b49c83777d64_00000: 0 2105344 linear 254:36 62988288
vg_linstor-pvc--16c80b0c--340a--4b54--b710--b49c83777d64_00000: 2105344 2097152 linear 254:36 65093632
vg_linstor-pvc--cbbd437b--29e0--43c4--ba6b--e7164877a38b_00000: 0 10493952 linear 254:36 404971520
vg_linstor-pvc--44f4d3bb--9494--414a--b452--102a12f39652_00000: 0 6299648 linear 254:36 226639872


# dmsetup status

vg_linstor-pvc--6bd68bb7--4cc1--4bd9--9a34--ae7fa10b82c9_00000: 0 6299648 linear
vg_linstor-pvc--6bd68bb7--4cc1--4bd9--9a34--ae7fa10b82c9_00000: 6299648 14680064 linear
vg_linstor-pvc--762d6fcd--6fa0--463d--9a3f--81004613bdfd_00000: 0 8192 linear
vg_linstor-pvc--b35804d7--2f92--4630--83be--8360169e1fdb_00000: 0 2105344 linear
vg_linstor-pvc--d090ea4a--df22--4d4c--b1f8--d395943e113e_00000: 0 24576 linear
vg_linstor-pvc--86106845--452d--4c5a--8bd3--113156ee9ee7_00000: 0 6299648 linear
vg_linstor-dummy: 0 8192 linear
vg_linstor-pvc--e4cab256--3a45--4aa8--8efd--bd922484a684_00000: 0 8192 linear
vg_linstor-pvc--d71a60e4--6f5b--4c08--a920--ee499984859a_00000: 0 8192 linear
vg_linstor-pvc--ca3c953f--968d--4cb7--8fda--7699690f6576_00000: 0 2105344 linear
vg_linstor-pvc--2aa91f52--0d84--436e--9e40--8beb8c29c9f6_00000: 0 2105344 linear
vg_linstor-pvc--555aa9dd--fecc--49d4--922c--31ba831de613_00000: 0 8192 linear
vg_linstor-pvc--4f950539--6002--40f5--881b--7f179812584b_00000: 0 8192 linear
vg_linstor-pvc--cac899a0--d37a--470e--ae75--e5898c0699cf_00000: 0 146833408 linear
vg_linstor-pvc--b428a4c5--caa8--4527--80ad--9597255f91c7_00000: 0 24576 linear
vg_linstor-pvc--0590f4ad--956b--40a3--857b--2815681c00a0_00000: 0 2105344 linear
vg_linstor-pvc--0590f4ad--956b--40a3--857b--2815681c00a0_00000: 2105344 2097152 linear
vg_linstor-pvc--dd9a568b--548e--48b9--a498--37771175de10_00000: 0 4202496 linear
vg_linstor-pvc--5452a81a--1eae--4c15--aca6--7f7a70b8eb6f_00000: 0 2105344 linear
vg_linstor-pvc--540bd197--6acd--4049--8ebd--956ae9574ef7_00000: 0 146833408 linear
vg_linstor-pvc--de4b4064--36df--4dec--8893--43d274631e60_00000: 0 4202496 linear
vg_linstor-pvc--f2d7bee2--1fdc--408f--b9c0--50a0a5194693_00000: 0 2105344 linear
vg_linstor-pvc--f2d7bee2--1fdc--408f--b9c0--50a0a5194693_00000: 2105344 2097152 linear
vg_linstor-pvc--e19d8991--2dab--41e7--aaee--0a056c799374_00000: 0 2105344 linear
vg_linstor-pvc--e19d8991--2dab--41e7--aaee--0a056c799374_00000: 2105344 2097152 linear
vg_linstor-pvc--4e9b5775--e57b--444d--9569--faf9e239048e_00000: 0 2105344 linear
vg_linstor-pvc--f31768c4--b090--45b8--ae26--f3657cbae471_00000: 0 2105344 linear
vg_linstor-pvc--c10fe9cd--f25a--4ef6--913e--34225427c20e_00000: 0 8192 linear
vg_linstor-pvc--4157d7a7--b609--48fc--ae18--2f562d5dd48c_00000: 0 10493952 linear
vg_linstor-pvc--d4f8a0f4--64c6--4f90--9be7--434c18729512_00000: 0 8192 linear
vg_linstor-pvmove0: 0 6299648 mirror 2 8:16 8:32 1538/1538 1 AA 1 core
vg_linstor-pvmove0: 6299648 14680064 linear
vg_linstor-pvmove0: 20979712 6299648 linear
vg_linstor-pvmove0: 27279360 14680064 linear
vg_linstor-pvmove0: 41959424 2105344 linear
vg_linstor-pvmove0: 44064768 2097152 linear
vg_linstor-pvmove0: 46161920 2105344 linear
vg_linstor-pvmove0: 48267264 2097152 linear
vg_linstor-pvmove0: 50364416 2105344 linear
vg_linstor-pvmove0: 52469760 2105344 linear
vg_linstor-pvmove0: 54575104 2105344 linear
vg_linstor-pvmove0: 56680448 2105344 linear
vg_linstor-pvmove0: 58785792 2105344 linear
vg_linstor-pvmove0: 60891136 2097152 linear
vg_linstor-pvmove0: 62988288 2105344 linear
vg_linstor-pvmove0: 65093632 2097152 linear
vg_linstor-pvmove0: 67190784 2105344 linear
vg_linstor-pvmove0: 69296128 2105344 linear
vg_linstor-pvmove0: 71401472 2105344 linear
vg_linstor-pvmove0: 73506816 2097152 linear
vg_linstor-pvmove0: 75603968 4202496 linear
vg_linstor-pvmove0: 79806464 146833408 linear
vg_linstor-pvmove0: 226639872 6299648 linear
vg_linstor-pvmove0: 232939520 10493952 linear
vg_linstor-pvmove0: 243433472 4202496 linear
vg_linstor-pvmove0: 247635968 4202496 linear
vg_linstor-pvmove0: 251838464 146833408 linear
vg_linstor-pvmove0: 398671872 6299648 linear
vg_linstor-pvmove0: 404971520 10493952 linear
vg_linstor-pvmove0: 415465472 24576 linear
vg_linstor-pvmove0: 415490048 24576 linear
vg_linstor-pvmove0: 415514624 8192 linear
vg_linstor-pvmove0: 415522816 8192 linear
vg_linstor-pvmove0: 415531008 8192 linear
vg_linstor-pvmove0: 415539200 8192 linear
vg_linstor-pvmove0: 415547392 8192 linear
vg_linstor-pvmove0: 415555584 8192 linear
vg_linstor-pvmove0: 415563776 8192 linear
vg_linstor-pvmove0: 415571968 8192 linear
vg_linstor-pvmove0: 415580160 8192 linear
vg_linstor-pvmove0: 415588352 2105344 linear
vg_linstor-pvmove0: 417693696 2105344 linear
vg_linstor-pvmove0: 419799040 8192 linear
vg_linstor-pvc--a0d99645--53ed--43c5--a825--9b5260a05228_00000: 0 4202496 linear
vg_linstor-pvc--750d9469--f238--492d--b399--69e469eff0fd_00000: 0 8192 linear
vg_linstor-pvc--579227df--451c--438a--bf49--bacdd37ef4d2_00000: 0 2105344 linear
vg_linstor-pvc--579227df--451c--438a--bf49--bacdd37ef4d2_00000: 2105344 2097152 linear
vg_linstor-pvc--8b1fc6b0--193c--430d--80c4--79b79351a142_00000: 0 2105344 linear
vg_linstor-pvc--45301a70--220e--469f--abc3--0e9c980cb982_00000: 0 8192 linear
vg_linstor-pvc--bf5368e3--2580--44fd--aa94--2210c9cc3f1e_00000: 0 2105344 linear
vg_linstor-pvc--af83fc91--1a0f--4eb8--a87f--d00410365e6e_00000: 0 6299648 linear
vg_linstor-pvc--af83fc91--1a0f--4eb8--a87f--d00410365e6e_00000: 6299648 14680064 linear
vg_linstor-pvc--16c80b0c--340a--4b54--b710--b49c83777d64_00000: 0 2105344 linear
vg_linstor-pvc--16c80b0c--340a--4b54--b710--b49c83777d64_00000: 2105344 2097152 linear
vg_linstor-pvc--cbbd437b--29e0--43c4--ba6b--e7164877a38b_00000: 0 10493952 linear
vg_linstor-pvc--44f4d3bb--9494--414a--b452--102a12f39652_00000: 0 6299648 linear



# ls -alh /run/lock/lvm

total 0
drwx------ 2 root root 80 Jan 4 00:20 .
drwxrwxrwt 4 root root 80 Oct 15 22:48 ..
-rwx------ 1 root root 0 Dec 24 15:32 P_global
-rwx------ 1 root root 0 Dec 24 15:32 V_vg_linstor
