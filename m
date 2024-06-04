Received: from uriel.iewc.co.za (uriel.iewc.co.za [154.73.34.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D9149C4E
	for <linux-lvm@lists.linux.dev>; Tue,  4 Jun 2024 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.73.34.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512608; cv=none; b=uzQ3GKUMURNW4+xVQwZ8NQsG7lNtl0W1jAf++SgcitQqshIugIJxBsOBvlsTY96/nHPekXd7zasBckgV1Ifzc5S0Lg3GsHOe7M3UJ3uCaSWNxJyvLcYwQkd53OmiareH59q2Atz3GNxOFL7HNMn+QqDKcx3GCuGwYTtrqjZ0lPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512608; c=relaxed/simple;
	bh=MrPIIzfEQx+2v+vDdQclrK13FB2HDr+SNE9zZbIsWgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8rpx8xO749zY3M/ouGc+NaxOURpLkioAm+AgYQPQ97k4JhzZtFZyl1paBZ3D/LS8k0dGBUDEZzH5S/fC1d1eGTsP2L+ZKHMuK2xrtdxuS/boQchTHxoscRRFRAAS3U5RNlu3bs1r9jH5JviBFXpcpcmiOziePDANU4ZBw9xZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za; spf=pass smtp.mailfrom=uls.co.za; dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b=gdPifk/F; arc=none smtp.client-ip=154.73.34.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uls.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uls.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uls.co.za header.i=@uls.co.za header.b="gdPifk/F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uls.co.za;
	s=20240522.iewc; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=myrQbfWPP/fskWG+zcYPFWfFl8z333jyYe06ZQPYBpM=; b=gdPifk/FzlbhtLOT3EuuTBljov
	5fCMQejDuzyxELEH/HS3un1e983g3bXi63LoxxxudVewZgXGJRmQHZdk//D/sPPXph3xdCrnn8npi
	rGTlALIkT8VZCUODmL2ekPkb+7F0b8TCS4z0p9mWdPu7r7izelBlKd/Zl+97dQrHvJ2p5Uw2Mc18D
	DnQqHKWzwkT6/4vgSMKcHnArSf9Q9oGHs1UoGbb5mmVMbf313pDTnWebF2udYCpN9XCK7jynULo7P
	n2Otu2k15/aLmh9DmSqLhT3ZKC3VL28Oh9kVMXJed/6S3CrgTmFnZ4zfVdDkbDC3LuIhOHw5yu825
	VnlkVkNw==;
Received: from [154.73.32.4] (helo=tauri.dyndns.uls.co.za)
	by uriel.iewc.co.za with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sEVU7-000000002TE-42b2;
	Tue, 04 Jun 2024 16:50:00 +0200
Received: from [192.168.42.21]
	by tauri.dyndns.uls.co.za with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <jaco@uls.co.za>)
	id 1sEVU6-000000006ds-1S7O;
	Tue, 04 Jun 2024 16:49:58 +0200
Message-ID: <f5a7e819-f53b-4dd8-9ef4-afa9423baf60@uls.co.za>
Date: Tue, 4 Jun 2024 16:49:56 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lvm2 deadlock
To: Stuart D Gathman <stuart@gathman.org>,
 Roger Heflin <rogerheflin@gmail.com>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <c828486f-46d1-45b6-8477-ed390553f4dd@uls.co.za>
 <a6c24173-d138-49dc-afb0-f48d41128477@gmail.com>
 <9bac4556-bdf8-4034-9322-522277ff311e@uls.co.za>
 <b77c19de-48b4-4a7d-9174-0d42414ce920@gmail.com>
 <66d9e7cf-b654-4476-b1e2-e3bdf4444280@uls.co.za>
 <CAAMCDed2n+wvQTySx8GRsekfrsdeO+vdwXd289bWZ_sk1WbqXA@mail.gmail.com>
 <5aa7f229-aef5-4f63-acb5-1e130c6c5296@uls.co.za>
 <CAAMCDee7ea+x43vx8Q4jJwMyVXpV+NVcTMLHyTYar-ZXkV6mwg@mail.gmail.com>
 <58c4fae3-7944-916a-80fd-303b71e4120@gathman.org>
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
In-Reply-To: <58c4fae3-7944-916a-80fd-303b71e4120@gathman.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-report: Relay access (uriel.iewc.co.za).

Hi,

On 2024/06/04 15:46, Stuart D Gathman wrote:
> On Tue, 4 Jun 2024, Roger Heflin wrote:
>
>> My experience is that heavy disk io/batch disk io systems work better
>> with these values being smallish.
>
>> I don't see a use case for having large values.   It seems to have no
>> real upside and several downsides.  Get the buffer size small enough
>> and you will still get pauses to clear the writes the be pauses will
>> be short enough to not be a problem.
>
> Not a normal situation, but I should mention my recent experience.
> One of the disks in an underlying RAID was going bad.  It still worked,
> but the disk struggled manfully with multiple retries and recalibrates
> to complete many reads/writes - i.e. it was extremely slow.  I was
> running into all kinds of strange boundary conditions because of this.
> E.g. VMs were getting timeouts on their virtio disk devices, leading
> to file system corruption and other issues.
>
> I was not modifying any LVM volumes, so did not run into any problems
> with LVM - but that is a boundary condition to keep in mind.  You
> don't necessarily need to fully work under such conditions, but need
> to do something sane.

On SAS or NL-SAS drives?

I've seen this before on SATA drives, and is probably the single biggest 
reason why I have a major dislike for deploying SATA drives to any kind 
of high-reliability environment.

Regardless, we do monitor all cases using smartd and it *usually* picks 
up a bad drive before it gets to the above point of pain but with SATA 
drives this isn't always the case, and the drive will simply 
indefinitely keep retrying, blocking request slot numbers over time 
(SATA protocol handles 32 requests IIRC, but after how long can the 
Linux kernel re-use a number it has never received a response on kind of 
problem) and getting slower and slower until you power cycle the drive, 
after which it's fine again for a while.  Never had that crap with 
NL-SAS drives.

Specific host is all NL-SAS.  No VM involvement here.

Kind regards,
Jaco

