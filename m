Received: from bagheera.iewc.co.za (bagheera.iewc.co.za [154.73.34.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF68190490
	for <linux-lvm@lists.linux.dev>; Wed,  5 Jun 2024 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579316; cv=none; b=mhzlQjqyfXlqUAR3UqIUfiOlyeVIuZXEZlhJo1iOc3LVdzKr2dzc+eqrcZj96hZVtIgtsdHb/VoqJp1GEO3rl8mIJ9zvcfVRdL3eyLEwpC8/pyrC9W97kPXAOM95I/KPh/pOKra3p74LgOo78hopP3/3Tj1N5aUc128DuTFBpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579316; c=relaxed/simple;
	bh=PlEyPDYM0Q97P+NY3MWRMTaikTibrBEyrktfSOukTp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTf8izy64QJHuio+lCHnXoUzPcUEeug54qXtnYZLUJBPzhJaajPt1E7LUUixKHivIGjONkDwfRfWQSyWHVJ8rfb14U5/6GAms8VWKQBkjKH/JvPZfhDkemYG8ZMwIp1tqFmVj3frL/cwlJTem5wXD52KFzuPk8ghUZf+aEzJ148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=laEH1H/7; arc=none smtp.client-ip=154.73.34.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="laEH1H/7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MnY/DfI9pWhsuqZpK7FJsdD8fFWGBUXFIeG3GzFSd/U=; b=laEH1H/7s0abvG5Y5P/S91Rygt
	n+V7XEPN6jA0vuqvA4sT5jWGOMKUvdKLTB0Cjn5/iN5Z3HF9Av0szycrmdDdZvW9dfYeJWi7CAqd7
	J7b7CqEbATpCfy5V2VtMGTffBmlf/ZhL2u/tcIaxiitoOAYoVK1FF6eq5Xfd8/6D0CHpbIulZ9m8R
	IxeqXmE4zD95Qx4maojC4c3e5QR4faKyz4QBPaYAoY6ZJN+LjELTxxviUJOy+a9pJU8w7c+qsGB9m
	+hY6IS7HDtxu79XdyLDOyRfhC8lbtbIWtGNGwGqesUVz/IXNhtZE/4bqPjGJDdarDD8UscH7tFEZi
	hoMi63DA==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by bagheera.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sEmUW-000000001nT-2dgz;
	Wed, 05 Jun 2024 10:59:32 +0200
Received: from [192.168.42.196]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sEmUV-000000003zL-05qM;
	Wed, 05 Jun 2024 10:59:31 +0200
Message-ID: <77882d4d-91e4-4625-ab98-97738d13da8b@uls.co.za>
Date: Wed, 5 Jun 2024 10:59:29 +0200
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
In-Reply-To: <de91140b-d29b-4885-8d1f-be172babb4be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (bagheera.iewc.co.za).

Hi,

On 2024/06/04 18:07, Zdenek Kabelac wrote:
> Dne 04. 06. 24 v 13:52 Jaco Kroon napsal(a):
>> Hi,
>>
>> On 2024/06/04 12:48, Roger Heflin wrote:
>>
>>> Use the *_bytes values.  If they are non-zero then they are used and
>>> that allows setting even below 1% (quite large on anything with a lot
>>> of ram).
>>>
>>> I have been using this for quite a while:
>>> vm.dirty_background_bytes = 3000000
>>> vm.dirty_bytes = 5000000
>>
>>
>> What I am noticing immediately is that the "free" value as per "free 
>> -m" is definitely much higher, which to me is indicative that we're 
>> not caching as aggressively as can be done.  Will monitor this for 
>> the time being:
>>
>> crowsnest [13:50:09] ~ # free -m
>>                 total        used        free      shared buff/cache 
>> available
>> Mem:          257661        6911      105313           7 145436      
>> 248246
>> Swap:              0           0           0
>>
>> The Total DISK WRITE and Current DISK Write values in in iotop seems 
>> to have a tighter correlation now (no longer seeing constant Total 
>> DISK WRITE with spikes in current, seems to be more even now).
The free value how now dropped drastically anyway.  So looks like the 
increase of free was a temporary situation.
>
> Hi
>
> So now while we are solving various system setting - there are more 
> things to think through.
Yea.  Realised we derailed, but given that the theory is that "stuff" is 
blocking the complete (probably due to backlogged IO?), it's not 
completely unrelated is it?
>
> The big 'range' of unwritten data may put them in risk for the 'power' 
> failure.

I'd be more worried about host crash in this case to be honest (dual PSU 
and in several years we've not had a single phase or PDU failure).

> On the other hand large  'dirty pages'  allows system to 'optimize'  
> and even bypass storing them on disk if they are frequently changed - 
> so in this case 'lower' dirty ration may cause significant performance 
> impact - so please check whats the typical workload and what is result...

Based on observations from task timings last night I reckon workloads 
are around 25% faster on average.  Tasks that used to run just shy of 20 
hours (would still have been busy right now) completed last night in 
just under 15 .  This would need to be monitored over time though, as a 
single run is definitely not authoritative.  This was with the _bytes 
settings as suggested by Roger.

For the specific use-case I doubt "frequently changed" applies, and it's 
probably best to get the data persisted as soon as possible, allowing 
for improved "future IO capacity" (hope my wording makes sense).

>
> It's worth to mention lvm2 support  writecache target to kind of 
> offload dirty pages to fast storage...
We normally use raid controller battery backup for this in other 
environments, not relevant in this specific case though, we are using 
dm-cache in other environments mostly for a read-cache (ie, 
write-through strategy) on NVMe though because the raid controller 
whilst buffering writes really sucks at serving reads, which given the 
nature of spinning drives makes perfect sense, and given the amount of 
READ on those two hosts the NVMe setup more than quadrupled throughput 
there.
>
> Last but not least -  disk scheduling policies also do have impact - 
> to i.e. ensure better fairness - at the prices of lower throughput...
We normally use mq-deadline, in this setup I notice this has been 
updated to "none", the plan was to revert, this was done in 
collaboration with a discussion with Bart van Assche.  Happy to revert 
this to be honest. 
https://lore.kernel.org/all/07d8b189-9379-560b-3291-3feb66d98e5c@acm.org/ 
relates.
>
> So now let's get back to lvm2  'possible' deadlock - which I'm still 
> not fully certain we deciphered in this thread yet.
>
> So if you happen to 'spot' stuck  commands -  do you notice anything 
> strange in systemd journal -  usually when  systemd decides to kill 
> udevd worker task - it's briefly stated in journal - with this check 
> we would kind of know that reason of your problems was killed worked 
> that was not able to 'finalize' lvm command which is waiting for 
> confirmation from udev (currently without any timeout limits).

Not using systemd, but udev does come from the systemd package. Nothing 
in the logs at all for udev, as mentioned previously. Don't seem to be 
able to get normal logs working, but I have set up the debuglog now.  
This does log very detailed, except there are no timestamps.  So *if* 
this happens again hopefully we'll be able to look for some working that 
was killed rather than merely exited.  What I can see is that it looks 
like a single forked worker can perform multiple tasks and execute 
multiple other calls, so I believe that the three minute timeout is 
*overall*, not on just a single RUN command, which implies that the 
theory that udevcomplete is never signalled is very much valid.

>
> To unstuck such command  'udevcomplete_all' is a cure - but as said - 
> the system is already kind of 'damaged' since udev is failing and has 
> 'invalid' information about devices...
Agreed.  It gets things going again, which really just allows for a 
cleaner reboot rather than echo b > /proc/sysrq-trigger or remotely 
yanking the power (which is where we normally end up at if we don't 
catch it early enough).
>
> So maybe you could check whether your journal around date&time of 
> problem has some 'interesting'  'killing action' record ?

If we can get normal udev logging working correctly that would be great, 
but this is not your responsibility, so let me figure out how I can get 
udevd to log tot syslog (if that is even possible given the way things 
seems to be moving with systemd).

Kind regards,
Jaco

