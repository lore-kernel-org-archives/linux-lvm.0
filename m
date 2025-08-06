Received: from sonic.asd.mail.yahoo.com (sonic302-3.consmr.mail.bf2.yahoo.com [74.6.135.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD84C19DF6A
	for <linux-lvm@lists.linux.dev>; Wed,  6 Aug 2025 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754523785; cv=none; b=MWwcjbLAwY5/GKUKe8ctNGV2Ql30uQ3YKY9TkJoyMVXa2TNWUE1yXddNEKDrBPLNGlIVPnQhLRoEtou0x7pWZISOVyr/PA+jwcBs7zp5IsRivT6xFO4d7zlcs86V557L8/lPLwoh+kIi+CyNfminsFljc3rpX7Qs95IhEt1Zo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754523785; c=relaxed/simple;
	bh=lhHwBd3UoN1yPVCFp6DUT1NM6EZQhdmDxaFFi0Y3EmM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mrcKTxxZvIbKU9YPiPlDYR3iLXJ/8bINCO7uEk2fj/UGqYfCEKzdzhmmOXnQQBTTCg+iGu8DwUW1oAcq4CMnuWbgvID3eRJQAHNyRTk8wjtRvok86ehhbUeIqsbl4ha7avu1soULENsEE9w4WuAOOpq5CgG62I5mbls5yhaE4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ZJz0SA5g; arc=none smtp.client-ip=74.6.135.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ZJz0SA5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754523710; bh=lhHwBd3UoN1yPVCFp6DUT1NM6EZQhdmDxaFFi0Y3EmM=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=ZJz0SA5g2Q7sjqqcsG2PKIB7Cbhh84QzFfArXcSq1/OZGU4MTXBlWS27PIL0loSdO2BQMW0mgGklDkGWYWfxXcBqkJZe70kgavH5dB1HPPukCO4QyYYh48I0P0Ik1zv1+cSVFRnw3T6CM67DvueMRxoNAeFfw/6ZDTnKGwaiVKZpoXdnzy2qrOzRVG8rAL3uvaf0K0ugfEtZVFhMg4SHsJsWzf/jmjfKY0H8+lC7V1a7x+lA1iakC5I5VGwVy1/sbBuCID2p3AkJ84IlJeQ1huvfWkNr0sPhsiDFY4duBSLMrUqpaZprv+YjmzWg7PIXSzQo1ikX+b8AWamppHYzAw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1754523710; bh=jyZ0zupZtliKSh5k+AKxCC0f4vyQPTiGakd0GV4ZgPt=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=dVU9zXMC+3NZQZ5szebbO+B6EnCJZukCgmmKze5XAeIwJM7wJhPpbFYMHDerpP+FiGUhBmp/JF6eNCfVuK7yfSAiOg1dS1T30J7o2aE8UklNBpQw9xQ874NjgxshZaLg10m/YpWMQZTkt+J8tRJTjMrpVONt6dVsoSsS0d+p7xl9dIvN1da0zV/5B0oGS771ULI76NiEEv/e3zz6pffNSRQZ6+d0iaJaZ2ug7VPnX676B9tES7BlDaUqSng3+kqzcME5ailCk2ajqFvew9qkW0lo5cI1H8SNeh1Ppd7GAJ1ZpnmIrzbFsST9/6e9xBOc6QchRb3xfchjUo0j8WI9Ew==
X-YMail-OSG: VuZ_65YVM1kmqTAuFDg4HQ0zKlYTM8CE66y_10pLMNgDpHwUVHA.Yf7mbxfkxjX
 EseAR0xcpUxHQ0vm8FyWJ2hZo.3XHpbmpKTEtigj9QyvFB3sGZD_FEEt20wpYtEv4BeNz9xBbxsK
 D1FGKIOyaNZ0WpCpDrfGD4F.yTWOW3hestoBeaYwBSh2dZO3hkjMUcnuLvUpb11wgxbQLhgI4SZ.
 sqGXkM8E_ebzNZw4Cknc.UT87YV5H.CyjIzCvo_AuA912F8K6U621ddHh6MUjQVJTrlpESnew0bs
 DjY1RZqsDyoQztJCPlhNLoDo9S0KXmvvBOpXAXjxHUv25OCLxc5LmMwb8d5yeU7Iody2_IwfIWdj
 kQ7yJvm2a.yd6M.3LBT3f2PUTlvhcOpUwmsb1Xjl9987XTrIMY2UYgT0l3t.RfVDpeZEXaPKeCbE
 tDBGsmgepY0opOH6OTpHpSMrHdKWR1b5HNDWqfcY4tXB8KWvOEi07AeF54HI2Q.RNziUM3zRMISp
 waKXUxVUtKdTQ7FvObNygAC2aiXWGUrgBvuAeIrsC98V8ojgWvt1ule4eXahcA7jul8bSq7D6gXp
 723zGE8ZM8yRDAKxIjvmZvkF7ULF2BLRY5ldHoph2ilNhvSvco_6Se_VE8aCbuNkvtbj_IFDDRow
 uzCNFeEdQsk4JpoRwY0iVTaSjklkka9sabUtpj4JN4wbubgb4LgOa3s3hnW.Dzor2OBKs2.xFGyU
 LKdXbZzaQ92z9C6MliY2CdM__NsIldQnG9VSi56dvV_fuOkH4hKyiNJQ2.Vl41EtFaEMeONrQGqd
 YYRYGYxoTh0s1jzvtXA2bm3SfTFd5wfUSacCCfhOOnTJlXQ7yv94ydyH1IB2Fb51_B8Do8rIe_E2
 vwnRaf3sVrmfUjC2dXrPCCwjMxAFI3hp5bOIE98a64GwuzKtzGfk4_uo8YuyuD970ikrBv8XG6y4
 sFDRF1ZE76.wNrp3rHZp4yBq2AWsi9tfiYPcQAh4iXHWhWQivtlmD7yL4JPw4cFsKR8F5JUz46Hl
 2N9sD6C3IHA7STJmsy.xhM7oiTYM1nV3Kj2FknmijYdNfYXKsMv.IxPs_Vqn6LukeF45njewOQ62
 6Wl14v1yR1Ew.daPviaruRdzRy9MaUkQ8BkVACZz6G1VS96RJ_NZ601Uc0R3OJk5OhaCHaehWyKl
 zBMRlAyxbP8NBlz8X2esgd4sYoTknD8a0MXdOOxibirrbZY0tqwhJPGatLwG.RUOuPzTkFcBZAKZ
 3LbejyXjFI9H5dWqO2kzkLIS5I_aJgSM5EONsjksEsUtlPpOjTpKucKHDWsIUFaSzaYb.ZgHrvIp
 8sp8GypZBrFmQcd8dP7i_Y2YJHb_5F4NkxNLSksQoLuCeOMPAVGX.mcxO46pnOGJy__f_qCSopFg
 QkTfCBcWR3L3u_pkdS_1SjL2hjaLEdY.2Xzu5rnTj.MwAn.MPNuVe6cUjxBa5mCYmwJXakTBK_DT
 vrq_l6BILNLNhJT.UiNVP.FNCGHJnvZAVYjxq_9UXq2kiSoCJFUIzRbpYjtqsxegYuGJUe1feCul
 iWOj3nlNsGk74m59nhNu1wFkdi804t9h.Du_YGYo6GEEH7BEyJEZ3wGvQVENv_wyJu0RNtnlfv5e
 a2p8GZRBtDCSZOYgQNdfkPNL7BTmBC0nWWqOZHuTlSIs8tz3VYtMU6kRoIuhW2sq15QVyyMF7Far
 0EBC4nZqRTeje0NENrE14vJiDWCzc7BdBh670.0DQK4qlXHp8KXzI7V1J3LV31x1ro3d.pDV3809
 CYlbo5zRPRxQQCi49S3qrmcVnN_7cVva94dWDBbqlmOY2XSTBa2b5c6sLk6jnX2meqHl62wrMjFM
 PIr26PypOIBldAzIUrrX9LSSzc7x8tiRBgJ_OZ3Sy6finiPU9E7ToISN0KPhSQP7f3hvQT.CpItm
 mECZezXK3qld048SqjEq3UAexSG7oMzlC3Ee3X1YGgW25RFxIV4DE9BWz69J2QkiusLznNfjOWlj
 mt3nYZkbyfH2m07fd6XrMCvpuIL4PsHiesaGPe1XWvhoy2hPiRzqvoa2KuC.rmrH5MWI4RKqq.Ph
 _cQsjDyFkBUjiZnDySolrQgjxRGVIrdujH24zuppuFkONleb6_Dmwb8cJs_2wNqZaTiSZVj4UUIC
 dbyIPKMb315A0nv6EjplaD_ssGmg9GWOov4KokHLMh0iCPsswTHSJkwZcVgqM8VgqdUUNLHYWE1j
 ZlnpAHxvRO1eLmTd0o6rP
X-Sonic-MF: <pattonme@yahoo.com>
X-Sonic-ID: fa62377c-4fa2-4119-a4c6-458c7adc2296
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Wed, 6 Aug 2025 23:41:50 +0000
Date: Wed, 6 Aug 2025 23:25:26 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Cc: "lvm-devel@lists.linux.dev" <lvm-devel@lists.linux.dev>
Message-ID: <584283844.1499801.1754522726622@mail.yahoo.com>
In-Reply-To: <26771.51188.491376.658337@quad.stoffel.home>
References: <06d25902-7239-1fc7-ec3b-1798332c3315@redhat.com> <26771.51188.491376.658337@quad.stoffel.home>
Subject: Re: [PATCH] fix random failures in shell/integrity.sh
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24260 YMailNorrin

 > The problem is that the raid1 implementation may freely choose which leg
> to read from. If it chooses to read from the non-corrupted leg, the
> corruption is not detected,=C2=A0

which is why man invented ZFS. :)

I don't know what the probability 10^-X is of silent mismatch between halve=
s of a mirror, but it's a fatal weakness IMO of pretty much every RAID sche=
me out there that doesn't checksum each block be it at the "disk sector" (5=
12/4k) or "filesystem" (4k).

Would it make sense for LVM since it's a shim between disk device and files=
ystems to implement its own checksum scheme? Maybe do it at a "LVM page" no=
tion of 32 disk sectors followed by a couple of extra disk sectors in which=
 the checksum for each of the preceding 32 is strung together in one packed=
 value? /spit-ball

The *best* answer is for everyone to move to 520/528 byte sectors like seri=
ous storage vendors did 50 years ago, but I suspect that would be harder to=
 get past the gatekeepers than drivers written in RUST.

