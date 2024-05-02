Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A369824A3
	for <linux-lvm@lists.linux.dev>; Thu,  2 May 2024 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714654760; cv=none; b=nIWfWioN9Oh1l0PAxm3KLW5XBnxW1yCVfv9wf60u3gb6UPjbtetIgZkLDOK0aIzCb0Uga9EHwe6choPd+2r0kFWhE+4zjuZ+ZlvEuya2hVrjPm2avvxoBSGHMqtyD8ZHneyeh8a40lARgKbbvXEjI+cT68VUveLa+x0mYPvcqZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714654760; c=relaxed/simple;
	bh=MS2p709rvf3owJclVy1m+fNA6hCeH3cPvanR9pXPyuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p2bnNmFfFN+yRI9GLDoLAf9l9mKjznjA0ZYV5X552Gq9dKeFVFgAYrnU/+9mFPQFRPUsZR78bJsJxfHLfH2Zhe1moZX2SLTFfvO02h9F0A1u7Y0pIDjRBVZByOwU1d4N/N6xMaJDc83Y09DK9fbvZg3zHiIVOofYLLjNI/wvG1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW4bKiRd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW4bKiRd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34dc9065606so991757f8f.1
        for <linux-lvm@lists.linux.dev>; Thu, 02 May 2024 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714654757; x=1715259557; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfikSaCaIdvpUrphbZcG16tAcHS6vkJlg5iJ5DNR+0U=;
        b=LW4bKiRdueGNSi8UsNIFEoZSPI1bOLS9QNO12yhTYVXdmlptin3vzZ/PfShLSuk5Mh
         q7i62ILf1FW36u5ORgSdERnNjcZUXOlmjSUoIkb5SKTn5CZxLKlkWjjg5DRVkzaCd5sl
         766rQ8viOB0RSV4G1Ul3tjb1xE3oBJ4f/JqlZJRhVk38Iom2hSrK0EA6FjVLgpCuSwlx
         pXLdcIrsHGEAOnUlem6pV2AKgTF81hPRW+qkiWhyWhoqM27meyJgexrjLXkjkBal1Pni
         mIdA3nhbKeyH4M9ZOXl2SQOd4qcqxSpKDhdhgoYGa5p5Hhsc1NZzVTUlNguQrOEUi/4V
         DZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714654757; x=1715259557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfikSaCaIdvpUrphbZcG16tAcHS6vkJlg5iJ5DNR+0U=;
        b=iVsNaLBQsdyExWjfFBXm9l57Q5trAOadflEO/G5Ax8yK/ZZ0YL1yW+w8zp5uBnO1Wc
         2bsVqQu1FmAXxJ24DRESUEt6Chyn9x5BYNUzKUaj6FJ7884kiu+CIRe4uw1HQ7ZL2Kzm
         FoxJN7J6J6jcUQIvpAWGi1fSWJDaip25CNClJXnbwNSt8SKvg9cP/sx2HfunF+3Wyix4
         dYnRgH09RzGleA8gk5dTAM6iCoWgrNl5fge9He03KRtlB0JTJ4/taE8yUVP2qgZvBC/N
         rEV4wq54eGBZ5HpgB7guA3HoBWa+i9UFyoEwzEvTnOVqM8MdQmMkxxWieH5Eupvx3+p6
         XbQA==
X-Forwarded-Encrypted: i=1; AJvYcCXAUuvY/GC8nLS6FAOSshnYeZTphHh4TtSHGkxIIQUJ+dCbOxOP6u9Dnd0D0XzLnLnHu7SRlwWO0+gD+AbzdeHP7R0wvA2fZgpq
X-Gm-Message-State: AOJu0YwUgxYQm6rIdvpQ3tsZrXpsEXbDFBmDOPLKQvChozva6SK3mhm5
	gJdwA2a2/syqukdq06u4l+bFmrcjejAJ6bWobT/+BrtH4Il9aQWvNUBNy9U4
X-Google-Smtp-Source: AGHT+IEwjmz5RCeEMtPhu6m/eFgICZhnKotIb6ZqzYurSA560RqjrIonlepkjYvQC55wb/kRHZeTww==
X-Received: by 2002:a05:6000:c02:b0:34e:2c1a:fcca with SMTP id dn2-20020a0560000c0200b0034e2c1afccamr1784134wrb.5.1714654756421;
        Thu, 02 May 2024 05:59:16 -0700 (PDT)
Received: from [10.43.17.8] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id j30-20020a5d6e5e000000b0034db5f648a8sm1221837wrz.77.2024.05.02.05.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 05:59:15 -0700 (PDT)
Message-ID: <f2039d09-9b87-4838-999a-8ed0ca47877a@gmail.com>
Date: Thu, 2 May 2024 14:59:14 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Repeated lvcreate&lvremove quickly increases page cache size
To: =?UTF-8?B?UnlvdGFybyBCYW5ubyAo5Ly06YeOIOiJr+WkqumDjik=?=
 <rbanno@cybozu.co.jp>, "linux-lvm@lists.linux.dev"
 <linux-lvm@lists.linux.dev>
References: <KL1PR0302MB54117B460DB76D8BAF2140DDEA182@KL1PR0302MB5411.apcprd03.prod.outlook.com>
Content-Language: en-US, cs
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <KL1PR0302MB54117B460DB76D8BAF2140DDEA182@KL1PR0302MB5411.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 02. 05. 24 v 7:47 Ryotaro Banno (伴野 良太郎) napsal(a):
> Hi all,
> 
> When I run repeatedly `lvm lvcreate` and `lvm lvremove`, I have noticed that
> the page cache size increases gradually. For example, when I used the following
> commands:
> 
> ```
> while :; do
>    sudo lvm lvcreate -n 7ee0d142-bffe-459f-87cb-56a355d24d2c -L 104857600b -W y -y ubuntu-vg;
>    sudo lvm lvremove -f ubuntu-vg/7ee0d142-bffe-459f-87cb-56a355d24d2c;
>    sleep 0.1;
> done
> ```
> 
> free(1)'s buff/cache increased by about 50KiB/s on average.
> 
> This phenomenon would not be a problem if I ran LVM on the host.  In fact, I
> run the same commands in a Docker container with relatively small RAM limited
> by cgroup.  Then, the container is killed by OOM some time after startup,
> presumably due to the increased page cache. Does anyone know how to work around
> this problem?  This behavior can be reproduced as follows:
> 
> ```
> # Assume a VG named "ubuntu-vg" is already set up on the host.
> docker run --privileged --pid=host --memory=15m -it ubuntu:22.04 bash -c '
> while :; do
>    /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvcreate -n 7ee0d142-bffe-459f-87cb-56a355d24d2c -L 104857600b -W y -y ubuntu-vg
>    /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvremove -f ubuntu-vg/7ee0d142-bffe-459f-87cb-56a355d24d2c
>    sleep 0.1
> done'
> 
> # After a while, lvcreate gets OOM killed like:
> #   bash: line 6: 4099016 Killed                  /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvremove -f ubuntu-vg/7ee0d142-bffe-459f-87cb-56a355d24d2c
> ```
> 
> The same thing happens on a Kubernetes container.  For some unknown reason, the
> increase in the page cache size is faster on Kubernetes than on others (host
> and docker); it only increases, never decreases.  This can be reproduced using
> Minikube with KVM2 as follows:
> 
> ```
> # Set up Minikube and LVM
> minikube start --driver=kvm2
> minikube ssh -- sudo truncate --size=10G backing_store
> minikube ssh -- sudo losetup -f backing_store
> minikube ssh -- sudo vgcreate vg1 $(minikube ssh -n minikube -- sudo losetup -j backing_store | cut -d':' -f1)
> 
> # Create a pod that repeatedly run lvcreate&lvremove
> cat <<EOS | minikube kubectl -- apply -f -
> apiVersion: v1
> kind: Pod
> metadata:
>    name: test-pod
> spec:
>    hostPID: true
>    containers:
>    - command:
>      - bash
>      - -cex
>      - |
>        # Run lvcreate&lvremove repeatedly
>        while :; do
>            /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvcreate -n 7ee0d142-bffe-459f-87cb-56a355d24d2c -L 104857600b -W y -y vg1
>            /usr/bin/nsenter -m -u -i -n -p -t 1 /sbin/lvm lvremove -f vg1/7ee0d142-bffe-459f-87cb-56a355d24d2c
>            sleep 0.1
>        done
>      image: ubuntu:22.04
>      name: lvm
>      securityContext:
>        privileged: true
> 
>      # Limit memory usage upto 15Mi
>      resources:
>        limits:
>          memory: 15Mi
> EOS
> 
> # Watch the pod status. It will get OOM killed continuously.
> minikube kubectl -- get pod test-pod -w
> 
> # Check the memory usage statistics exposed by cgroup. The field `total_cache` should be huge.
> minikube ssh -- cat /sys/fs/cgroup/memory/kubepods/burstable/pod$(minikube kubectl -- get pod test-pod -o jsonpath='{.metadata.uid}')/memory.stat
> 
> # Clean up
> minikube delete --all --purge
> ```
> 
> Does anyone know how to work around this problem?
> 
> My environment is as follows:
> 
> - OS: Ubuntu 22.04.4 LTS
>    - `uname -a`: Linux _ 5.15.0-78-generic #85-Ubuntu SMP Fri Jul 7 15:25:09 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
> - Docker version: 26.0.1
> - minikube version: v1.32.0 (commit: 8220a6eb95f0a4d75f7f2d7b14cef975f050512d)
> 

Hello

Well you could eventually try to use kernel with 'memory leak' enabled 
detector to see whether there is some kernel leak.

There can't be leak in lvm2 code - since the binary 'exits' - and kernel is 
responsible for any leaks here.

However I'd first start reproducing your issue with  newer kernel 6.8, 6.9-rcX
As there is nothing more boring than chasing some old possibly already fixed 
kernel bugs.

You should also probably flush all your page cache between your memory size 
sampling with:   'echo  3 >/proc/sys/vm/drop_caches'

And final note:  lvm2  is NOT designed and should NOT be used within Docker 
(or any other container) software - it's tightly integrated with your kernel 
API - while containers are more or less 'virtual machines' for user-space 
apps.   So problems caused by misbehaving udev (which doesn't exists/runs) in 
your Docker are quite normal and it requires some level of expertise to know 
how to deal with those issues...



Regards

Zdenek

