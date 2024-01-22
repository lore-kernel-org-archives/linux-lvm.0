Received: from mail.service4.ru (mail.service4.ru [95.213.196.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7544397
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.213.196.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937200; cv=none; b=DP2wZ96yNDfgptxHxkunsTSEfItfSr0gyN4qYXNxTVaIfPMpay24WyIzWNxCz8EU7mI/ZjV3klWF462aznyXHkXGQt1+VPO5ZSkHNa32ot7y9XdHvRyfJrwGXUChkLUhmtuBXd2TXbMbkhr6Ly41HoJMBFtE8Yz3y6243KOsilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937200; c=relaxed/simple;
	bh=lDmzVlLuW1ksyhL5FAmbf8MNpqgyLMaqe+cjKrNqrgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5QhVy2YYhNNarqCIyxb8d8OB3K8Mr1cWcdgcrkGhHirfxeB1YctCDaKaQa2+1StkLeTLijFmGyqGuQHcskGJOm1dTtCgGvSHGsV3pAUMBZzvRw+4b9hd1gDBV0EXYiulRq1DaTqe41llHefAp7WnXr7ABRoay0GgvA3Kq3E09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=service4.ru; spf=pass smtp.mailfrom=service4.ru; dkim=pass (1024-bit key) header.d=service4.ru header.i=@service4.ru header.b=EmcQfsIg; arc=none smtp.client-ip=95.213.196.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=service4.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=service4.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=service4.ru header.i=@service4.ru header.b="EmcQfsIg"
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 6CF1040D55
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 18:26:26 +0300 (MSK)
Authentication-Results: mail.service4.ru (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=service4.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=service4.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:to:content-language:subject:subject
	:mime-version:date:date:message-id; s=dkim; t=1705937184; x=
	1706801185; bh=lDmzVlLuW1ksyhL5FAmbf8MNpqgyLMaqe+cjKrNqrgs=; b=E
	mcQfsIgPv3bzH/7OpVid+afJN3h1OUQM17rwMjnNjuDlil0SquPh08x7prFrGO0L
	Y8i3ks9jEBpfMoFqaIV3vhmQ3TUp09NRLWXIz54vK4aBtGNs3I++dj/TAMiGMl8P
	kSkbD2K3er/7eW9m4v91eDhw6Cp6PjwZA1Vf/16oRw=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.service4.ru
X-Virus-Scanned: amavisd-new at mail.service4.ru
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uNbshbdWaybb for <linux-lvm@lists.linux.dev>;
	Mon, 22 Jan 2024 18:26:24 +0300 (MSK)
Received: from ilia (beriz.izyk.ru [95.213.196.242])
	by mail.service4.ru (Postfix) with ESMTPSA id 77A384045E;
	Mon, 22 Jan 2024 18:26:22 +0300 (MSK)
Message-ID: <6af8f729-2766-c316-1f53-a7f89d79235c@service4.ru>
Date: Mon, 22 Jan 2024 18:26:20 +0300
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [Question] why not flush device cache at _vg_commit_raw
Content-Language: en-US
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 Anthony Iliopoulos <ailiop@suse.com>
Cc: Su Yue <glass.su@suse.com>, linux-lvm@lists.linux.dev,
 Heming Zhao <heming.zhao@suse.com>, Lidong Zhong <lidong.zhong@suse.com>,
 martin.wilck@suse.com
References: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
 <eb604d09-a713-4d61-a155-8e289cc5328a@gmail.com> <Za5xpeEStkITRMtc@technoir>
 <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
From: Ilia Zykov <mail@service4.ru>
In-Reply-To: <16a16fd6-d15d-4f92-bb79-fe3a4006258e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.01.2024 17:52, Zdenek Kabelac wrote:
> Dne 22. 01. 24 v 14:46 Anthony Iliopoulos napsal(a):
>> On Mon, Jan 22, 2024 at 01:48:41PM +0100, Zdenek Kabelac wrote:
>>> Dne 22. 01. 24 v 12:22 Su Yue napsal(a):
>>>> Hi lvm folks,
>>>> =C2=A0=C2=A0=C2=A0 Recently We received a report about the device ca=
che issue after=20
>>>> vgchange =E2=80=94deltag.
>>>> What confuses me is that lvm never calls fsync on block devices even=
=20
>>>> at the end of commit phase.
>>>>
>>>> IIRC, it=E2=80=99s common operations for userspace tools to call=20
>>>> fsync/O_SYNC/O_DSYNC while writing
>>>> critical data. Yes, lvm2 opens devices with O_DIRECT if they support=
=20
>>>> , but O_DIRECT doesn't
>>>> provide data was persistent to storage when write returns. The data=20
>>>> can still be in the device cache,
>>>> If power failure happens in the timing, such critical metadata/data=20
>>>> like vg metadata could be lost.
>>>>
>>>> Is there any particular reason not to flush data cache at VG commit=20
>>>> time?
>>>>
>>>
>>> Hi
>>>
>>> It seems the call to 'dev_flush()' function got somehow lost over the=
=20
>>> time
>>> of conversion to async aio usage - I'll investigate.
>>>
>>> On the other hand the chance here of losing any data this way would b=
e
>>> really really very specific to some oddly behaving device.
>>
>> There's no guarantee that data will be persisted to storage without
>> explicitly flushing the device data cache. Those are usually volatile
>> write-back caches, so the data aren't really protected against power
>> loss without fsyncing the blockdev.
>=20
> At technical level modern storage devices 'should' have enough energy=20
> held internally to be able to flush out all the caches in emergency=20
> cases to the persistent storage. So unless we deal with some 'virtual'=20
> storage that may fake various responses to IO handling - this should no=
t=20
> be causing major troubles.
>=20
> However it's clearly a problem which happened while the code has been=20
> shifted towards the use of libaio.
>=20
> Zdenek
>=20

More over. There is a very old post about fsync() lying.
https://brad.livejournal.com/2116715.html
I don=E2=80=99t know, maybe this is also a post-lie) Or now the devices h=
ave=20
become more truthful.
But many devices report that "Write cache" is enabled:

hdparm -I /dev/sda | grep 'Write cache'
              * Write cache

And in many cases fsync() flushes data to write cache only.
But this can be persistent (ssd, flash) cache. Or as Zdenek has wrote,
"devices 'should' have enough energy held internally to be able to flush=20
out all the caches in  in emergency cases".

However, in some cases, they may lose some data due to power failure and=20
large amount of dirty data in the cache, especially ordinary,=20
non-enterprise HDD. IMHO.

----
