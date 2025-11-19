Received: from sonic322-26.consmr.mail.bf2.yahoo.com (sonic322-26.consmr.mail.bf2.yahoo.com [74.6.132.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29CC371DD6
	for <linux-lvm@lists.linux.dev>; Wed, 19 Nov 2025 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581317; cv=none; b=d9okvBR6akt42DaSfbCN66IqBcyPwaqp3z2dwqOBGGpFnV97tCn3K+CWGLA3JQJzWCUQrvCuS0rLIWuGPH5zg9dr54qp1TVBt0yM0gJ3pRaASxj5eYaf7TqjuZgs6R0UyY8b2S2j+TIdSaO4jt4Bgr/kwPs6/RLxF68V+H3ibbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581317; c=relaxed/simple;
	bh=kgxQSqN5I/cTVaDgsINk4j+on6jMfk/mmoAZBaVjjgk=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YVwtOjzxnpl34RI67Q0PaPI9zP7CUsE8t+4AGZPo8R+vJBrlZnAF/xugnQV4ZtYJpLF7PAeNR2HqnGmzUMnRDnqkzcrYNJtnlwMhL85U7afqUMmr1BxXJ7CZQ4lijqojhrY/wU2V9unqJYJd7xQlssZdBCU/+IUDE5mR5rYgEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=C6IcjgT1; arc=none smtp.client-ip=74.6.132.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="C6IcjgT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763581305; bh=kgxQSqN5I/cTVaDgsINk4j+on6jMfk/mmoAZBaVjjgk=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=C6IcjgT1LH+F8il7UirSW3nvEWLFgwq29KAjKJ+MPCbKAXHGKFUKEYee5QwR0TbN4hXred/H6tKzxxxs8n15VAXvl+WMIgGqINPTEV0m5gxJsB9Ihkn0GO1T1FVEZ2ybCfoUc5+h8NsKw3wMlS2+UVwXgccREMhxKIUYV4VCbk7oMm7HU/jl5C0Har8Dg+7NZeRmn/7z8sylRs+JzQ7JlKdIQqLvjkpa/8SQhxblsln8Il8hM3UWGzzMqwIU/+UtDONtnuHYsgS4lr5l6suHty2Tnesm/j+bzLdDsLaZ9sxcg45Kyc/c909COgtYZd7qQ+MX4VkCROJU+Tg+3D4kCA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763581305; bh=Pn7/3FVqWd280JpjCM0mECxdRekc/qMEW74zf4h7wGe=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Waqd6lI6pFW6Rwko7knNRWBL+SryBRzT6u19FGHivfrMW8AYmkOCZ2g7M9xyD1U8mGgRGtcmxHpTWa9A8fwWVgY+XwvWDa3y/fu8P9HUM/VAyRSwVDMbdSLOoTwruwAAKJ4VoA4Ho5/4gNRkBULqn8GC3QcPHABLGBOVrvLQjkdEMUaIkB53LKui2yYInt519NezxlKHHxInyXZko/podXKeois1cptBFukLM/5tReXywqzr83KKIUDRN9AVWICJ1snU//wnBPJE5BKOtlZSMDJI8vc6cOldaheIT53075XZsHIzgzF0/AB4ijvR5b8S3iHn/+Km47uZ3W3+06UYCQ==
X-YMail-OSG: 1llnVxIVM1lkYmzBtsOhHdXxP1En0NsLdkqATXrW0CCow5X9H4pEGA1VEmPKsV7
 wz.yKVwyWzFqw_JdVO0f5GPRXa7flJFgoeTx5FBQ2_OV.7hKm9_YRodlPiolpWQn8MowqiIi6pHX
 zxUMEikkKvMMegdgqYbHjW.OGUcOuv_HpVFYCUZ.ZHRAbVeLwDMdth2P71tnOzhbNfAmWCYrZnS0
 nyvkTcDgrMcZbTAuXUglq4rghR1vushNe7TH_UE9JLivzja2XttVUOLKMlb33uitMcqpdXIkfbA0
 zkeYce97pzG51D1WGKzoHHQMHX6khRmJ4zfPKRbhTpJ1UeVnuRNpi7n86u5ggobGKwGEO0MqBWPk
 Ynbn5qfuhokkYL7jYJgg6kVp4Zcy4DDyfQt4c_GHpLwt96nlIxgXt9NfdeDe0IUERjTRDp9tMWBL
 ZeT8oHBOSgFKXKKvlN_8Rn7b3pWu5_KLSwLq0RbYLc50wo3y6uHxdexq9.P7J0Z.3Tm1MV40ATMB
 XYM7xjHQR5KMwlq2DHcF5dHh1IcSr_pZTEbp9sl5ShcOcBhwNxbciTF4GY4.Y3rD3_olQRd3V5jl
 jYnhhFaQQoKINfvBoZ6SO20TdzOuGMUuBW19rIDkYkT9dzgtr6HrDAleKgMRZaWcY2mmrJNwAmSv
 59GB_Nwo9uFwYML22mhh7LzSKvF07RMFRliT_tsIWc6yVnLnUQ4895V7H6sdCJWI47k8ZzzlFaj7
 J9cv9COfyGH.N.P75o1brxmTtUArdZXvkMBTcCQcsEzNMkSaMrXfpWmsh_WOYPmttz50OO7UtB2z
 QAq5NqsIIykBX7fYiQI00D14qHLAqKcy5REYDbA3NV69iyr4rHmT_XPw7HlI6PY_eGp0zbIc.F55
 .INQYThzPc9bK.ScP2vwEHO5wX2ueXIASBg9aDJxHu8eSsLBNTDgKLP9esa8DEpckIeD0v8fZiHD
 8CVsLnaCHkzCIdhXuK3oF_R7TgQLsmpY1XeR0x9alNXJXS_tQr.Y45vVGQg_vAqh8nNvAfAYYGKv
 6cYWe39oOMw4FxEiAsxX0fqfnkKyepWJBFj30kVd8sbaxcVxdw_JhRT.DnSiFmWXzo1ZvxjBiuFH
 Jo9Y5IJJXvzQgpOHJsDC9qUYDjJkdW9w0K66zu8yKb7jDJM9Vy.Og0AEGgVxbeojcsbgxkXa5G3I
 vMCSjOKbHDtbYN9F9Ur3Z6ZYrR5gQnX2y5k.yRBPa0HwD2VfVXBieTY5I63nJwHR54dP_nWftuQp
 mFwqfsKK4_xqnFgD1aKkOfJkQ0GgwRSAMD9TgbmWW4E9BgBwdPWiym55u7KEcabyjblTukvwqo0Q
 DfFbmCYEXu.0qiuR1dZrzbApkas1rPFyKuFumoT7QLErSGccwvn44R75dNWQp34kSh.wTK2ttYHF
 qvgLqYA.31F3RFpJullgTowosKza.TYwJaBszJB3rZSiFZNhsoEPsz56CPL8ae58XhRT99vMGq1.
 aId1WNisUS84p2lN2SYZJ6S1O5WwDzpJIHvbCm1lMscoXhbapdGQ1Fbha5POgHrDI1xOAELt6YH9
 2T8bxIZo02g6whwsiq7OGtKtYcy9gCYqJkWmDnzSWUl_c_ZZ9NJYQdE4lb3uEAeFToUVcwheM2DN
 DsTAxgk_2qPsUW4bU3Oc9hCbaaiEp0G40LL29pKo4yd3Q1gM8q22nxIxnN70UemxtF0wEF5gMlQq
 .G5RxCqiCfZSMsMlwM5pMAXYg7NVStehwOBa4_ZC8vo_r.HEeUoLupbbEhZ17ywxAVIJUlDdsBAs
 kip8v_pJ8qL8RUj9LBNdU_PYneImZ3_m7wR9iA2maODR3D6IC4Vj45zgfvjqOWUP6UOfbK9DzDZM
 4t5_UASKM_MHL5He6kH_5kNsLO_BbNGh4eUUvwzavSNPqXzzRGalFK7JvfB1se20Ed0VR7hUEb46
 eYrDqOShnONMUJEmhssk_z8tNbQBoYurZxhg6QRjrFpL419nwDNUADkA_R.kY2fMu2mjTgppFioh
 J6cJ0zlCh3Jzm_Te8vfbnPJUFC3EBHRn_OEiaLp.6t32Evov2.KPe6Jgvcr_tUQFw85jqWMPR4ez
 SKp9QdtD8I1FdGJW.uMlnpTIDMfiOTGOSyyR43GNpNA.ec3TM7NzoV7JFmVmHs0VscrSbCb_BNV0
 H2BxYA2OMMeE1omtlqx6RTPThgahzKgwRp0DV0T.8UiZg3RVgQdP8JOHGW1FbHXLnBkska7Q.hpt
 wtz2jOuVcR91Ie7gXGEZg4ep1lPRsNg--
X-Sonic-MF: <pattonme@yahoo.com>
X-Sonic-ID: 07a9d71d-a6cc-4fdb-8485-6fed52b41968
Received: from sonic.gate.mail.ne1.yahoo.com by sonic322.consmr.mail.bf2.yahoo.com with HTTP; Wed, 19 Nov 2025 19:41:45 +0000
Date: Wed, 19 Nov 2025 19:41:44 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, 
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>, 
	Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <2068740993.5350374.1763581304153@mail.yahoo.com>
In-Reply-To: <51838d90-cdd7-4e1d-bc9c-9f1ae0e29caf@gmail.com>
References: <be9db13beb543be237fa069e3c72e22e1df2446c.camel@interlinx.bc.ca> <1b6fb117-7283-4ba9-91ee-7412a2d77b3d@gmail.com> <29209080-c09b-40df-86c3-f22c1d7f6520@interlinx.bc.ca> <5067ec8d-991b-4b90-ad3b-f9dbbb0472d5@gmail.com> <81e51a5ad8f9c32610b8262447af635da81d53c3.camel@interlinx.bc.ca> <3620fc27-e54b-472d-bc82-be01f7b2739b@gmail.com> <6D706D06-AB0F-4C55-9F68-E8E07926A511@yahoo.com> <9c2a15d0-0d7d-4462-af43-83221c2ecbdd@gmail.com> <94679191.5310372.1763572932545@mail.yahoo.com> <42516759-f09a-407a-9c2d-1f82d0db19af@gmail.com> <cd5a3a1b5560f8634b434220a828b535c7a5ebe6.camel@interlinx.bc.ca> <51838d90-cdd7-4e1d-bc9c-9f1ae0e29caf@gmail.com>
Subject: Re: pvmove thin volume doesn't move
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24652 YMailNorrin

> If the tool would have known 'which areas' are=C2=A0 mapped=C2=A0 (which =
knows thin-pool=20
> target internally) then it would need to copy only those blocks.

no doubt. but if lvmthin is basically a private implementation that LVM (ak=
a thick) doesn't actually know anything about and is just being used as a p=
ass-thru to thin API, I'm not sure we want to expose thin internals to the =
caller. I obviously haven't read the code implementing either thick or thin=
, but if thick does a thin_read(one 4MB extent) then thin should just retur=
n a buffer with 4mb populated with all the data converted into a thick+line=
ar representation that Thick is expecting. Then the traditional workflow ca=
n resume with the extent written out to its destination PV. In other words =
you're hydrating a thin representation into a thick representation. Could y=
ou take that buffer and thin_write(dest thin pool)? I don't see why not.

Or you could just punt and say pvmove() of a thin is necessarily a hydrate =
operation and can only be written out into a non-then PV, tough luck. Use o=
ffline `dd`if you want more.

I haven't been particularly impressed by LVM caching (it has it's uses don'=
t get me wrong) but I find layering open-cas to be more intuitive and gives=
 me a degree of freedom.

