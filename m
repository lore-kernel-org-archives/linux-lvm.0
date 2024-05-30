Received: from uriel.iewc.co.za (uriel.iewc.co.za [154.73.34.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD114D71B
	for <linux-lvm@lists.linux.dev>; Thu, 30 May 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717066048; cv=none; b=dIXlC8pCQ2l/MClT95GGYrPZY9baj0GFqzxUUcwVyDNIeVhZc+PX1LfayDIm5sDJvwcSVkGmaLLazSZrhdBYLaMTrqT3teYQXrESaxCAGGFYg4tp+7EZjBjLUdJf0FvF/Mx2o6GGgJWBL9ZfCyzYP0AZ2OK5S0PIbl01JNSLC/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717066048; c=relaxed/simple;
	bh=Azug0JtPWo7HVe38ncgDkgUsRDbItBBvJQahjR1uAbA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=l4t1lWIIiu3J+VasgEHEPFrM/JCtmQhEOsIIIvjMCTEnMY7oOusr/j1vGHYVOZ4SWjcsFrDiN7viZZ4GNMqwuSEJIOgHZOjXf0FMRJG5zX9HNGnufWcuxZUJYTM0FUE6fvlUOrLkoF0KS8KdmThozSi3mntqt1rmyo76i9WKvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=iSA1f6N8; arc=none smtp.client-ip=154.73.34.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="iSA1f6N8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p2soTlRqFAaZCrCid8F2MOHjSnzO/r0b9JyFgbWQC5g=; b=iSA1f6N8Zlq2ThBnFeK5bIvB70
	mQUQu2WYi5x8G+1zEN2pyNU6pwh7FXYIJh9EDhq+p/YzvxvDXTsfDEKy04dbyoW/3uDO9wbvg2lu3
	yE+3ssuctAvuhSedVbHogRxtXV/Mky0pKFTvouYoYWw22XIt/VrhwpcEQxqVUUGyREKbdS4gkTIWC
	fy18U+89TK74cDvUwlbbotxBo2lDg92xJ/DWNS398KGAjT78QcsNzaEGL1DIwCxzmrY+JZC2uiVRE
	oJQ6YzsinPs7KRAoj8qeFugfaBEQyjQ22sH9RgmouyvLoIDuIIk5SESVKI25IMsFOYqs8fEv8xJH0
	VjshTQmw==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by uriel.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sCcuk-0000000060I-0z8V
	for linux-lvm@lists.linux.dev;
	Thu, 30 May 2024 12:21:42 +0200
Received: from [192.168.1.104]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sCcui-000000004i7-2oY6
	for linux-lvm@lists.linux.dev;
	Thu, 30 May 2024 12:21:40 +0200
Message-ID: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
Date: Thu, 30 May 2024 12:21:39 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-lvm@lists.linux.dev
From: Jaco Kroon <jaco@uls.co.za>
Subject: lvm2 deadlock
Autocrypt: addr=jaco@uls.co.za; keydata=
 xsBNBFXtplYBCADM6RTLCOSPiclevkn/gdf8h9l+kKA6N+WGIIFuUtoc9Gaf8QhXWW/fvUq2
 a3eo4ULVFT1jJ56Vfm4MssGA97NZtlOe3cg8QJMZZhsoN5wetG9SrJvT9Rlltwo5nFmXY3ZY
 gXsdwkpDr9Y5TqBizx7DGxMd/mrOfXeql57FWFeOc2GuJBnHPZQMJsQ66l2obPn36hWEtHYN
 gcUSPH3OOusSEGZg/oX/8WSDQ/b8xz1JKTEgcnu/JR0FxzjY19zSHmbnyVU+/gF3oeJFcEUk
 HvZu776LRVdcZ0lb1bHQB2K9rTZBVeZLitgAefPVH2uERVSO8EZO1I5M7afV0Kd/Vyn9ABEB
 AAHNG0phY28gS3Jvb24gPGphY29AdWxzLmNvLnphPsLAdwQTAQgAIQUCVe2mVgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAILcSxr/fungCPB/sHrfufpRbrVTtHUjpbY4bTQLQE
 bVrh4/yMiKprALRYy0nsMivl16Q/3rNWXJuQ0gR/faC3yNlDgtEoXx8noXOhva9GGHPGTaPT
 hhpcp/1E4C9Ghcaxw3MRapVnSKnSYL+zOOpkGwye2+fbqwCkCYCM7Vu6ws3+pMzJNFK/UOgW
 Tj8O5eBa3DiU4U26/jUHEIg74U+ypYPcj5qXG0xNXmmoDpZweW41Cfo6FMmgjQBTEGzo9e5R
 kjc7MH3+IyJvP4bzE5Paq0q0b5zZ8DUJFtT7pVb3FQTz1v3CutLlF1elFZzd9sZrg+mLA5PM
 o8PG9FLw9ZtTE314vgMWJ+TTYX0kzsBNBFXtplYBCADedX9HSSJozh4YIBT+PuLWCTJRLTLu
 jXU7HobdK1EljPAi1ahCUXJR+NHvpJLSq/N5rtL12ejJJ4EMMp2UUK0IHz4kx26FeAJuOQMe
 GEzoEkiiR15ufkApBCRssIj5B8OA/351Y9PFore5KJzQf1psrCnMSZoJ89KLfU7C5S+ooX9e
 re2aWgu5jqKgKDLa07/UVHyxDTtQKRZSFibFCHbMELYKDr3tUdUfCDqVjipCzHmLZ+xMisfn
 yX9aTVI3FUIs8UiqM5xlxqfuCnDrKBJjQs3uvmd6cyhPRmnsjase48RoO84Ckjbp/HVu0+1+
 6vgiPjbe4xk7Ehkw1mfSxb79ABEBAAHCwF8EGAEIAAkFAlXtplYCGwwACgkQCC3Esa/37p7u
 XwgAjpFzUj+GMmo8ZeYwHH6YfNZQV+hfesr7tqlZn5DhQXJgT2NF6qh5Vn8TcFPR4JZiVIkF
 o0je7c8FJe34Aqex/H9R8LxvhENX/YOtq5+PqZj59y9G9+0FFZ1CyguTDC845zuJnnR5A0lw
 FARZaL8T7e6UGphtiT0NdR7EXnJ/alvtsnsNudtvFnKtigYvtw2wthW6CLvwrFjsuiXPjVUX
 825zQUnBHnrED6vG67UG4z5cQ4uY/LcSNsqBsoj6/wsT0pnqdibhCWmgFimOsSRgaF7qsVtg
 TWyQDTjH643+qYbJJdH91LASRLrenRCgpCXgzNWAMX6PJlqLrNX1Ye4CQw==
Organization: Ultimate Linux Solutions (Pty) Ltd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (uriel.iewc.co.za).

Hi,

Possible lvm2 command deadlock scenario:

crowsnest [12:15:47] /run/lvm # fuser //run/lock/lvm/*
/run/lock/lvm/P_global: 17231
/run/lock/lvm/V_lvm: 16087 17231

crowsnest [12:15:54] /run/lvm # ps axf | grep -E '16087|17231'
24437 pts/1    S+     0:00  |       \_ grep --colour=auto -E 16087|17231
16087 ?        S      0:00  |       |       \_ /sbin/lvcreate -kn -An -s 
-n fsck_cerberus /dev/lvm/backup_cerberus
17231 ?        S      0:00  |           \_ /sbin/lvs --noheadings 
--nameprefixes

crowsnest [12:17:40] /run/lvm # dmsetup udevcookies
Cookie       Semid      Value      Last semop time           Last change 
time
0xd4d2051    10         1          Thu May 30 02:34:05 2024  Thu May 30 
02:32:22 2024

This was almost 10 hours ago.

crowsnest [12:17:44] /run/lvm # dmsetup udevcomplete 0xd4d2051
DM_COOKIE_COMPLETED=0xd4d2051
crowsnest [12:18:43] /run/lvm # ps axf | grep -E '16087|17231'
27252 pts/1    S+     0:00  |       \_ grep --colour=auto -E 16087|17231
crowsnest [12:18:45] /run/lvm #

Allows progress again.

I do not know how to troubleshoot this.

Kernel version 6.4.12 (in process of upgrading to 6.9.3).

crowsnest [12:19:47] /run/lvm # udevadm --version
254

aka systemd-utils-254.10

lvm2-2.03.22

Kind regards,
Jaco

