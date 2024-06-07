Received: from bagheera.iewc.co.za (bagheera.iewc.co.za [154.73.34.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5E1CA85
	for <linux-lvm@lists.linux.dev>; Fri,  7 Jun 2024 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752999; cv=none; b=cW63WVK3EFRG0U7P1aRjjEGvirh2e/yaqPo8LfPtNcHwVaTi5xWtQZPwdO/yqmFuUhvmRRcUt1qnR27IqTrzYLupHMu4E/QATO69+YIK2CYNShehgPB0srMPOl6IdrAgCvg/JRQ93Jtm26ldFIhqKLIrp4J/6PQnzSHjCb3RacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752999; c=relaxed/simple;
	bh=cUxdkTtZy8XuXYCdCf7QAxrJ5gKm9vP7PgboXDHwWeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d33t/sopmuOKeZEqd3HotUWnXSGrMfd7Fr+4BD5FUyJYziiELRqnj8TDrjEGV3XCuWSz3Skao6CNq7qdKbqSbvEc0ePJfvpuR2xz49y4si+oI29SpSAH+mcJNgY4f/Ztd1vI3Qd4JqfxJKbQYcHeG7PPJbTJd4LlOrbg+Y/shP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=XEr8dovq; arc=none smtp.client-ip=154.73.34.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="XEr8dovq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XSQxpQcJH8DUEYgMvUNvl15EfhqWN4yyW/UI8aLF+wY=; b=XEr8dovq0fGG5eWiq0/Qyz3GkZ
	F/X0vVI+29h9sgplBe6hpU0EyuKgKTXQLGzg+FVzkg3YF5V/RLT2jzEoqR+hY4KVo91Orbqni8dYf
	jITrPgfp50w+0lMn1uqapr0qn3G9/hA1FTJO9sjddhAV/IzAUmbkoE8idwiJppmFhKVD1HBP4S+PA
	nFTXMMban9v1CV7LFYMfvekWszNQfhty/8xbX2jGoDraO8L6j0VFL9uA+dYHvuqG028oV0mM5jQyG
	I6CINualwakDZvFaf86Xx0+/uu2leS79N3NuR2gwCcNCszy0mnq5Xttre/7QO6Tx3n3EdphC3AFWO
	vH+Zr33w==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by bagheera.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sFW1I-000000000iG-2L1r;
	Fri, 07 Jun 2024 11:36:24 +0200
Received: from [192.168.42.196]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sFW1G-00000000633-43zX;
	Fri, 07 Jun 2024 11:36:23 +0200
Message-ID: <3ef32ba1-ad5d-4236-8eed-22ec283ce74b@uls.co.za>
Date: Fri, 7 Jun 2024 11:36:21 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 Roger Heflin <rogerheflin@gmail.com>
Cc: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
 <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
 <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
 <67629722-b281-4ee9-b832-08e85c09efd5@gmail.com>
 <e15546bf-dd1c-4a54-92bc-b9604194ffcd@gmail.com>
 <8627b66a-1774-4828-aae6-e5d31356fe10@uls.co.za>
 <52f4696f-9c03-4fea-b265-97448fbab24d@gmail.com>
Content-Language: en-GB
From: Jaco Kroon <jaco@uls.co.za>
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
In-Reply-To: <52f4696f-9c03-4fea-b265-97448fbab24d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (bagheera.iewc.co.za).

Hi,

On 2024/06/07 11:26, Zdenek Kabelac wrote:
> Dne 07. 06. 24 v 11:03 Jaco Kroon napsal(a):
>> Hi,
>>
>> On 2024/06/07 00:17, Zdenek Kabelac wrote:
>>> Dne 07. 06. 24 v 0:14 Zdenek Kabelac napsal(a):
>>>> Dne 05. 06. 24 v 10:59 Jaco Kroon napsal(a):
>>>>> Hi,
>>>>
>>>
>> I'm guessing your "simple way" is workable for the generic case as 
>> well, towards that end, is a relatively simple change to the lvm2 
>> tools not perhaps to add an syncfs() call to lvcreate *just prior* to 
>> freezing? The hard part is probably to figure out if the LV is 
>> mounted somewhere, and if it is, to open() that path in order to have 
>> a file-descriptor to pass to syncfs()? Obviously if the LV isn't 
>> mounted none of this is a concern and we can just proceed.
>>
>
>
> Hi
>
> There is no simple answer here -
>
> a) 'sync' flushes all io for all disk in the system - user can play 
> with tools like hdparm -F /dev/xxxx  - so still everything in range of 
> 'admin's hand'...
Fair.  Or sync -f /path/to/mountpoint.
>
> b) it's about the definition of the 'snapshot' moment - do you want to 
> take snapshot as of 'now'  or after possibly X minutes where 
> everything has been flushed and meanwhile new data flown-in ??
Oh yea, that's very valid, so instead of just lvcreate the sysadmin 
should sync -f /path/to/mountpoint *before* issuing lvcreate in the case 
where "possibly X minutes from now" is acceptable.  Guessing this can be 
a --pre-sync argument for lvcreate but obviously the sysadmin is 
perfectly capable (if he's aware of this caveat) just run sync -f 
/path/to/mountpoint just before lvcreate.
>
> c) lvm2 needs some 'multi LV' atomic snapshot support...
>
> d) with thin-pool and out-of-space potential it gets more tricky....
>
>
>> What would be more interesting is if cluster-lvm is in play and the 
>> origin LV is active/open on an alternative node?  But that's well 
>> beyond the scope of our requirements (for now).
>
> Clearly in the cluster case user can use multi-node active LV only in 
> the case there is something that is able to 'manage' this storage - 
> i.g. gfs2.   Surely use of ext4/xfs this way is out of question...

Was referring to the case where an LV is only active on *one* node at a 
time, but it's on shared physical storage.  Not even sure if a thin pool 
can be active on more than one node at a time in such a case.  This is 
research I've not yet done.  We tried gfs2 a few years back and the 
sheer number of unresolvable failure scenarios at the time just had us 
switch to glusterfs instead.

I think this can be considered closed now.

Thanks again for all the help and insight, I thoroughly enjoyed the 
discussion too, it was most insightful and I learned a lot from it.

Kind regards,
Jaco

