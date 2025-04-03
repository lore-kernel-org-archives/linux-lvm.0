Received: from static-80-177-71-131.vodafonexdsl.co.uk (static-80-177-71-131.vodafonexdsl.co.uk [80.177.71.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68C33993
	for <linux-lvm@lists.linux.dev>; Thu,  3 Apr 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.177.71.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659967; cv=none; b=HIiBZFbmrU288YNc8r1rGf4qqqMl0VPZVqJDMx0q3Dsj/YlUV2zhRKDWy9vs1CrCfY1pgKxC8zbiticj+cBNSkhPyc4cKyCiMobqIlcK+ju1+8JIOKViIjeHcC1PIYRASAdvCh+zwosNTLBrSe4o3uDCJwB5yBN3RQk42/IJt9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659967; c=relaxed/simple;
	bh=7vM0Mez2P+Zkjw1Yt1dUPYCg8FXavvwcIyRSZINzwKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qPIssYbJBqqp1zVk00bwiDgtvjEcdks1Kdcct2bppSrhOA/jCXsibBaDa4Xqb7xgy/E1+mPojdeVLkv5AYGgAGUJmjxTzydBKvr8u9ItGmcr1QkeeMHdWUf0ZrLbtCJHN/6lwFyISqCsMdR0zi+egMGJm0HEKu6xDHO712tnMFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timedicer.co.uk; spf=pass smtp.mailfrom=let2.com; dkim=pass (1024-bit key) header.d=timedicer.co.uk header.i=@timedicer.co.uk header.b=CCCQqIiC; arc=none smtp.client-ip=80.177.71.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timedicer.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=let2.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=timedicer.co.uk header.i=@timedicer.co.uk header.b="CCCQqIiC"
Received: from localhost (localhost [127.0.0.1])
	by static-80-177-71-131.vodafonexdsl.co.uk (Postfix) with ESMTP id 27068204C4;
	Thu,  3 Apr 2025 06:59:13 +0100 (BST)
X-Virus-Scanned: amavis at let2.com
Received: from static-80-177-71-131.vodafonexdsl.co.uk ([127.0.0.1])
 by localhost (let2.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6Le6J5gyq_D; Thu,  3 Apr 2025 06:59:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timedicer.co.uk;
	s=mail; t=1743659953;
	bh=nG3jTO2sPCrLRgGpGiLu1od/qidnpwKkufhC/1QsSyQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CCCQqIiChyWVZ+THHAPBjOKy920gWJ2Swa/Ahiunz9tKQU6ccVsjPRUPEVNu6yqwR
	 p0jcDOIHF866nO5i+/2FePiu6ClzhKC0voNo+VN66J0BP0f5prHw+S1Emqu9ucvypS
	 MGTsG8iKHYdteuzfqDsPNi9Z3gpFMxcOI5eS4f+Y=
Received: from [192.168.101.16] (unknown [149.102.188.0])
	by static-80-177-71-131.vodafonexdsl.co.uk (Postfix) with ESMTPSA id EAD6520336;
	Thu,  3 Apr 2025 06:59:12 +0100 (BST)
Message-ID: <0599793e-0a10-408e-9644-3d39de69e166@timedicer.co.uk>
Date: Thu, 3 Apr 2025 06:59:12 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Duplicate pv, vg, lv after copying disk
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, linux-lvm@lists.linux.dev
References: <896f5f69-58a7-4b9f-a9b8-62a65f3f13a2@timedicer.co.uk>
 <6b90d809-e886-4367-b1b8-243712fa184a@gmail.com>
Content-Language: en-GB
From: Dominic Raferd <dominic@timedicer.co.uk>
In-Reply-To: <6b90d809-e886-4367-b1b8-243712fa184a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/03/2025 13:52, Zdenek Kabelac wrote:
> Dne 30. 03. 25 v 18:28 Dominic Raferd napsal(a):
>> My LVM is working great but lvm utilities show - only, when using -o 
>> devices, that I have multiple copies of the same pv, vg and lvs. See 
>> below, the first invocation is what I would expect (one PV 
>> 'nvme0n1p2', one VG 'vg1', four LVs 'home' 'log' 'rootfs' and 'swap') 
>> but in each case the second invocation (i.e. with -o +devices) shows 
>> multiple versions of the same thing.
>>
>> This may be because I copied my disk to another using clonezilla and 
>> subsequently copied the new disk back to the original using dd. I'm 
>> now only using the original disk. Although I am also seeing (not 
>> shown below) duplicate devices for a 2nd PV and VG and LVs which are 
>> on a second disk on the same machine - and this second disk was 
>> unchanged throughout the process.
>>
>> # pvs|grep -F nvme
>> # lvs -o +devices|grep -F vg1
>>    home   vg1 -wi-ao---- 600.00g /dev/nvme0n1p2(2048)
>>    home   vg1 -wi-ao---- 600.00g /dev/nvme0n1p2(91136)
>>    log    vg1 -wi-ao---- 4.00g /dev/nvme0n1p2(1024)
>>    rootfs vg1 -wi-ao---- 24.00g /dev/nvme0n1p2(78848)
>>    rootfs vg1 -wi-ao---- 24.00g /dev/nvme0n1p2(173056)
>>    swap   vg1 -wc-ao---- 32.00g /dev/nvme0n1p2(82944)
>>
>> As I say, this has not caused a problem so far, but it is certainly 
>> ugly and looks like it might cause problems in the future. Should I 
>> ignore it or any ideas how I can fix it?
>
> When you use '-o+devices' - you are asking for 'segmented' properties 
> of your LV. Every LV is composed for segments i.e. depends on how the 
> allocation engine manage to satisfy allocation request for physical size.
>
> In your case  'roorfs' is composed from 2 segments - one starts @78848 
> extent
> and second @173056 extens -  every extent has 4MiB in size.
>
> You can get more details with  'lvs -o+seg_le_ranges'
> that will show you extent layout and assignment in more details.
>
> If you want to just see a 'single line' per LV - avoid adding 
> 'segmented' properties to your 'lvs -o' command.
>
Ah I did not understand, thank you Zdenek for the explanation, I shall 
stop worrying about it.
